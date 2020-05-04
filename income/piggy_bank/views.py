from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from piggy_bank.models import YearDB, IncomDB, DebtsDB, FundPoolDB
from pyecharts.options import global_options as global_opts
from pyecharts import globals as glbs
from pyecharts.charts import  WordCloud
import time
import numpy as np
import os
from pyecharts.charts import Bar, Grid, Liquid, Page, Pie, Line, Bar3D
from pyecharts import options as opts
from pyecharts.commons.utils import JsCode
from pyecharts.globals import ThemeType


year_str = "ALL"

# Create your views here.
def login(request):
    next_key = request.GET.get('next', '')
    if request.POST:
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = auth.authenticate(username=username, password=password) # 认证
        if user is not None and user.is_active:
            auth.login(request, user) # 登录
            request.session["user"] = username # 传入username到本次会话
            if next_key == "":
                response = HttpResponseRedirect('/')
            else:
                response = HttpResponseRedirect(next_key)  # 跳转逻辑，但是必须得保证template中post方法可以继承next参数，否则一直进入/home/
            return response
        else:
            if next_key == "":
                return render(request, 'login.html', {"error": "username or password error"})
            else:
                return render(request, 'login.html', {"next": next_key, "error": "username or password error"})
    if next_key == "":
        return render(request, "login.html")  #如果不包含next参数，则一直不包含
    else:
        return render(request, "login.html", {"next": next_key}) # 如果包含next参数，则一直包含在url中

@login_required(login_url="/login/")  # 装饰器，必须先登录才能跳转
def home(request):
    debts_list = DebtsDB.objects.all()
    income_list = IncomDB.objects.all()
    data = []
    for debt in debts_list:
        if debt.money != 0:
            data.append((debt.debtee, float(debt.money)))
    for income in income_list:
        data.append(("%s年%s"%(income.Year.year, income.monthly), float(income.actual_balance))) 
    data = data*2
    word_cloud = (WordCloud(global_opts.InitOpts(width="900px",height="300px", renderer=glbs.RenderType.SVG))
                  .add(series_name="词云图", data_pair=data)
                  )
    abs = os.path.dirname(__file__)
    word_cloud.render(abs+"/static/word_cloud.html")
    #make_a_snapshot(abs+'/static/word_cloud.html', abs+'/static/word_cloud.svg')
    url = "https:////" + request.get_host()+request.get_full_path()
    # qr = qrcode.QRCode(
    # version=1,
    # error_correction=qrcode.constants.ERROR_CORRECT_L,
    # box_size=4,
    # border=1,
    # image_factory=svg.SvgImage
    # )
    # qr.add_data(url)
    # qr.make(fit=True)
    # img = qr.make_image()
    # img.save(abs+'/static/qrcode.svg')
    return render(request, 'home.html')

def logout(request):
    auth.logout(request)
    return render(request, 'login.html')

@login_required(login_url="/login/")
def income_manage(request):
    print(request.GET.get("time"))
    #username = request.session.get("user", '')
    income_list = IncomDB.objects.all()
    year_list = YearDB.objects.all()
    print(year_list)
    return render(request, "income_manage.html", {"years": year_list,
                                                  "incomes": income_list})

@login_required(login_url="/login/")
def account(request):
    return render(request, "account.html")

@login_required(login_url="/login/")
def income(request):
    if request.POST:
        income_list = IncomDB.objects.all()
        year = None
        if income_list:
            last_balance = float(income_list[income_list.count()-1].actual_balance)
        else:
            last_balance = 100
        year_str = str(time.localtime().tm_year)
        year_list = YearDB.objects.all()
        for each in year_list:
            if each.year == year_str:
                year = each.id
                break
        else:
            yeardb = YearDB(year=year_str)
            yeardb.save()
            year_list = YearDB.objects.all()
            for each in year_list:
                if each.year == year_str:
                    year = each.id
                    break
        monthly = "%s月"%(time.localtime().tm_mon)
        try:
            salary = float(request.POST.get("salary"))
            other_income = float(request.POST.get("other_income"))
            payments = float(request.POST.get("payments"))
            actual_balance =float(request.POST.get("actual_balance"))
        except:
            return render(request, "income.html", {"error": "请输入数字"})
        expected_balance = float(last_balance+salary+other_income-payments)
        balance_diff = float(expected_balance-actual_balance)
        actual_income = float(actual_balance-last_balance)
        data = IncomDB(Year_id=year,
                       monthly=monthly,
                       last_balance=last_balance,
                       salary=salary,
                       other_income=other_income,
                       payments=payments,
                       expected_balance=expected_balance,
                       actual_balance=actual_balance,
                       balance_diff=balance_diff,
                       actual_income=actual_income
                       )
        data.save()
        return render(request, "home.html")
    return render(request, "income.html")

@login_required(login_url="/login/")
def debts(request):
    if request.POST:
        debtee = request.POST.get("debtee")
        print(debtee)
        debt_list = DebtsDB.objects.all()
        all_money = 0
        all_paid = 0
        if debt_list:
            for each in debt_list:
                if each.debtee == debtee:
                    all_money = float(each.all_money)
                    all_paid = float(each.all_paid)
        money = float(request.POST.get("money"))
        all_money += money
        paid = float(request.POST.get("paid"))
        all_paid += paid
        remaining = all_money-all_paid
        data = DebtsDB(debtee=debtee,
                       money=money,
                       all_money=all_money,
                       paid=paid,
                       all_paid=all_paid,
                       remaining=remaining)
        data.save()
        return render(request, "home.html")
    return render(request, "debts.html")


@login_required(login_url="/login/")
def fund(request):
    if request.POST:
        year = ""
        year_str = str(time.localtime().tm_year)
        year_list = YearDB.objects.all()
        for each in year_list:
            if each.year == year_str:
                year = each.id
                break
        else:
            yeardb = YearDB(year=year_str)
            yeardb.save()
            year_list = YearDB.objects.all()
            for each in year_list:
                if each.year == year_str:
                    year = each.id
                    break
        monthly = "%s月" % (time.localtime().tm_mon)
        try:
            cash_pool = float(request.POST.get("cash_pool"))
            goal_pool = float(request.POST.get("goal_pool"))
            insurance_pool = float(request.POST.get("insurance_pool"))
            invest_pool = float(request.POST.get("invest_pool"))
            invest_income = float(request.POST.get("invest_income"))
        except Exception as e:
            print(e)
            return render(request, "fund.html", {"error": e})
        data = FundPoolDB(Year_id=year,
                       monthly=monthly,
                       cash_pool=cash_pool,
                       goal_pool=goal_pool,
                       insurance_pool=insurance_pool,
                       invest_pool=invest_pool,
                       invest_income=invest_income
                       )
        data.save()
        return render(request, "home.html")
    return render(request, "fund.html")


@login_required(login_url="/login/")
def debts_manage(request):
    debt_list = DebtsDB.objects.all()
    return render(request, "debts_manage.html", {"debts": debt_list})


@login_required(login_url="/login/")
def debts_plot(request):
    debtee_list = []
    all_money_list = []
    all_paid_list = []
    debt_list = DebtsDB.objects.all()
    for debt in debt_list:
        if debt.debtee not in debtee_list:
            debtee_list.append(debt.debtee)
            all_money_list.append(debt.all_money)
            all_paid_list.append(debt.all_paid)
        else:
            idx = debtee_list.index(debt.debtee)
            if debt.all_money:
                all_money_list[idx] = debt.all_money
            if debt.all_paid:
                all_paid_list[idx] = debt.all_paid
    bar_stack = (
        Bar()
            .add_xaxis(debtee_list)
            .add_yaxis("欠债", all_money_list, stack="stack1")
            .add_yaxis("偿还", all_paid_list, stack="stack1")
            .set_series_opts(label_opts=opts.LabelOpts(is_show=False))
            .set_global_opts(title_opts=opts.TitleOpts(title="欠债&偿还"))
    )
    abs = os.path.dirname(__file__)
    bar_stack.render(abs + "/static/debt.html")
    return render(request, "debts_plot.html")


def plot_line_chart(xaxis, yaxis, y_title, title):
    line = (
        Line()
        .add_xaxis(xaxis)
        .add_yaxis(y_title, yaxis)
        .set_global_opts(title_opts=opts.TitleOpts(title=title, subtitle=year_str),
                         xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate="45")),
                         toolbox_opts=opts.ToolboxOpts(feature=opts.global_options.ToolBoxFeatureOpts()))
    )
    if len(yaxis) >= 3:
        max_x, max_y = yaxis.index(max(yaxis)), max(yaxis)
        min_x, min_y = yaxis.index(min(yaxis)), min(yaxis)
        avg = np.mean(yaxis)
        max_point = opts.series_options.MarkPointItem(name="Maximum", coord=(max_x, max_y), value=max_y)
        min_point = opts.series_options.MarkPointItem(name="Maximum", coord=(min_x, min_y), value=min_y)
        avg_line = opts.series_options.MarkLineItem(name="mean_Value", y=avg)
        line.set_series_opts(markpoint_opts=opts.MarkPointOpts(data=[min_point, max_point]))
        line.set_series_opts(markline_opts=opts.MarkLineOpts(data=[avg_line]))
    abs = os.path.dirname(__file__)
    line.render(abs+"/static/plot.html")

def plot_bar_chart(xaxis, yaxis, y_title, title, theme):
    bar = (
        Bar()
        .add_xaxis(xaxis)
        .add_yaxis(y_title, yaxis, itemstyle_opts=opts.ItemStyleOpts(theme))
        .set_global_opts(title_opts=opts.TitleOpts(title=title, subtitle=year_str),
                         xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate="45")),
                         toolbox_opts=opts.ToolboxOpts(feature=opts.global_options.ToolBoxFeatureOpts()))
    )
    if len(yaxis) >= 3:
        max_x, max_y = yaxis.index(max(yaxis)), max(yaxis)
        min_x, min_y = yaxis.index(min(yaxis)), min(yaxis)
        avg = np.mean(yaxis)
        max_point = opts.series_options.MarkPointItem(name="Maximum", coord=(max_x, max_y), value=max_y)
        min_point = opts.series_options.MarkPointItem(name="Maximum", coord=(min_x, min_y), value=min_y)
        avg_line = opts.series_options.MarkLineItem(name="mean_Value", y=avg)
        bar.set_series_opts(markline_opts=opts.MarkLineOpts(data=[avg_line]))
    abs = os.path.dirname(__file__)
    bar.render(abs+"/static/plot.html")


@login_required(login_url="/login/")
def plot(request):
    income_list = []
    month_list = []
    global year_str
    year_str = request.POST.get("time", "All")
    print(year_str)
    if year_str == "All":
        for each in IncomDB.objects.all():
            income_list.append(float(each.actual_balance))
            month_list.append("%s年%s"%(each.Year.year, each.monthly))
    else:
        for each in IncomDB.objects.all():
            if each.Year.year == year_str:
                income_list.append(float(each.actual_balance))
                month_list.append(each.monthly)
    plot_line_chart(month_list, income_list, "每月实际存款", "储蓄-折线图")
    return render(request, "income_plot.html", {"choice_list": ["储蓄", "收入", "支出"], "web_choice": "储蓄"})

@login_required(login_url="/login/")
def select_plot(request):
    salary_list = []
    other_income_list = []
    balance_list = []
    pay_list = []
    month_list = []
    choice = request.POST.get("plots")
    print(choice)
    global year_str
    if year_str == "All":
        for each in IncomDB.objects.all():
            balance_list.append(round(float(each.actual_balance), 2))
            salary_list.append(round(float(each.salary), 2))
            other_income_list.append(round(float(each.other_income), 2))
            pay_list.append(float(each.payments))
            month_list.append("%s年%s"%(each.Year.year, each.monthly))
    else:
        for each in IncomDB.objects.all():
            if each.Year.year == year_str:
                balance_list.append(round(float(each.actual_balance), 2))
                salary_list.append(round(float(each.salary), 2))
                other_income_list.append(round(float(each.other_income), 2))
                pay_list.append(float(each.payments))
                month_list.append(each.monthly)
    income_list = [x+other_income_list[idx] for idx, x in enumerate(salary_list)]
    if choice == "储蓄":
        plot_line_chart(month_list, balance_list, "每月实际存款", "储蓄-折线图")
        return render(request, "income_plot.html", {"choice_list": ["储蓄", "收入", "支出"], "web_choice": "储蓄"})
    elif choice == "收入":
        plot_bar_chart(month_list, income_list, "每月实际收入", "收入-柱形图", "#33cc33")
        return render(request, "income_plot.html", {"choice_list": ["储蓄", "收入", "支出"], "web_choice": "收入"})
    elif choice == "支出":
        plot_bar_chart(month_list, pay_list, "每月实际支出", "支出-柱形图", None)
        return render(request, "income_plot.html", {"choice_list": ["储蓄", "收入", "支出"], "web_choice": "支出"})
    elif choice == "分布":
        plot_asset_distribution()
        return render(request, "analysis_plot.html", {"choice_list": ["分布", "分析"], "web_choice": "分布"})
    elif choice == "分析":
        plot_asset_analysis()
        return render(request, "analysis_plot.html", {"choice_list": ["分布", "分析"], "web_choice": "分析"})


def plot_asset_distribution():
    months = [
        "1月", "2月", "3月", "4月", "5月", "6月", "7月", "8月", "9月", "10月", "11月", "12月"
    ]
    years = [str(x.year) for x in YearDB.objects.all()]
    years = years[::-1]
    data = []
    for idx1, month in enumerate(months):
        for idx2, year in enumerate(years):
            data.append([idx1, idx2, 0])
    for each in IncomDB.objects.all():
        each_year = each.Year.year
        each_month = each.monthly
        if each_year in years and each_month in months:
            idx = years.index(each_year) + months.index(each_month) * len(years)
            data[idx] = [months.index(each_month), years.index(each_year), float(each.actual_balance)]

    bar_3d = (
        Bar3D(init_opts=opts.InitOpts(width="1400px", height="700px"))
            .add(
            series_name="存款",
            data=data,
            xaxis3d_opts=opts.Axis3DOpts(type_="category", data=months),
            yaxis3d_opts=opts.Axis3DOpts(type_="category", data=years),
            zaxis3d_opts=opts.Axis3DOpts(type_="value"),
        )
            .set_global_opts(
            visualmap_opts=opts.VisualMapOpts(
                max_=100000,
                range_color=[
                    "#313695",
                    "#4575b4",
                    "#74add1",
                    "#abd9e9",
                    "#e0f3f8",
                    "#ffffbf",
                    "#fee090",
                    "#fdae61",
                    "#f46d43",
                    "#d73027",
                    "#a50026",
                ]
            )
        )
    )
    abs = os.path.dirname(__file__)
    bar_3d.render(abs + "/static/analysis.html")


def plot_asset_analysis():
    last_fund = FundPoolDB.objects.last()
    cash_pool = last_fund.cash_pool
    goal_pool = last_fund.goal_pool
    insurance_pool = last_fund.insurance_pool
    invest_pool = last_fund.invest_pool
    invest_income = last_fund.invest_income
    last_income = IncomDB.objects.last()
    payments = last_income.payments
    wealth_freedom = float(invest_income)/float(payments)
    liquid = (
        Liquid()
            .add("lq", [wealth_freedom, wealth_freedom+0.1, wealth_freedom+0.2,], is_outline_show=False,
                 label_opts=opts.LabelOpts(
                     font_size=50,
                     formatter=JsCode(
                         """function (param) {
                                 return (Math.floor(param.value * 10000) / 100) + '%';
                             }"""
                     ),
                     position="inside",
                 )
                 )
            .set_global_opts(title_opts=opts.TitleOpts(title="财富自由度"))

    )

    pie = (
        Pie({"theme": ThemeType.MACARONS})
            .add(
            "",
            [["现金池", cash_pool], ["目标池", goal_pool], ["保险池", insurance_pool], ["金鹅池", invest_pool]],
            radius=["40%", "55%"],
            label_opts=opts.LabelOpts(
                position="outside",
                formatter="  {b|{b}: }{c}  {per|{d}%}  ",
                background_color="#eee",
                border_color="#aaa",
                border_width=1,
                border_radius=4,
                rich={
                    "a": {"color": "#999", "lineHeight": 22, "align": "center"},
                    "abg": {
                        "backgroundColor": "#e3e3e3",
                        "width": "100%",
                        "align": "right",
                        "height": 22,
                        "borderRadius": [4, 4, 0, 0],
                    },
                    "hr": {
                        "borderColor": "#aaa",
                        "width": "100%",
                        "borderWidth": 0.5,
                        "height": 0,
                    },
                    "b": {"fontSize": 16, "lineHeight": 33},
                    "per": {
                        "color": "#eee",
                        "backgroundColor": "#334455",
                        "padding": [2, 4],
                        "borderRadius": 2,
                    },
                },
            ),
        )
            .set_global_opts(title_opts=opts.TitleOpts(title="资金池"))
    )
    page = Page(layout=Page.DraggablePageLayout)
    page.add(
        liquid,
        pie
    )
    abs = os.path.dirname(__file__)
    page.render(abs + "/static/analysis.html")

@login_required(login_url="/login/")
def analysis(request):
    plot_asset_distribution()
    return render(request, "analysis_plot.html", {"choice_list": ["分布", "分析"], "web_choice": "分布"})
