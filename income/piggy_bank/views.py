from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.contrib.auth.decorators import login_required
from django.contrib import auth
from piggy_bank.models import YearDB, IncomDB, DebtsDB
from pyecharts.charts import Line
from pyecharts import options as opts
from pyecharts.options import global_options as global_opts
from pyecharts import globals as glbs
from pyecharts.charts import  WordCloud
from pyecharts_snapshot.main import make_a_snapshot
import time
import numpy as np
import os
import qrcode
import qrcode.image.svg as svg

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
    qr = qrcode.QRCode(     
    version=1,     
    error_correction=qrcode.constants.ERROR_CORRECT_L,     
    box_size=4,
    border=1,
    image_factory=svg.SvgImage
    ) 
    qr.add_data(url) 
    qr.make(fit=True)  
    img = qr.make_image()
    img.save(abs+'/static/qrcode.svg')
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
        if debt_list:
            for each in debt_list:
                if each.debtee == debtee:
                    all_money = float(each.all_money)
                    all_paid = float(each.all_paid)
                else:
                    all_money = 0
                    all_paid = 0
        else:
            all_money = 0
            all_paid = 0
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
def debts_manage(request):
    debt_list = DebtsDB.objects.all()
    return render(request, "debts_manage.html", {"debts": debt_list})

@login_required(login_url="/login/")
def plot(request):
    income_list = []
    month_list = []
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

    line = (
        Line()
        .add_xaxis(month_list)
        .add_yaxis("每月实际存款", income_list)
        .set_global_opts(title_opts=opts.TitleOpts(title="储蓄-折线图", subtitle=year_str),
                         xaxis_opts=opts.AxisOpts(axislabel_opts=opts.LabelOpts(rotate="60")),
                         toolbox_opts=opts.ToolboxOpts(feature=opts.global_options.ToolBoxFeatureOpts()))
    )
    if len(income_list) >= 3:
        max_x, max_y = income_list.index(max(income_list)), max(income_list)
        min_x, min_y = income_list.index(min(income_list)), min(income_list)
        avg = np.mean(income_list)
        max_point = opts.series_options.MarkPointItem(name="Maximum", coord=(max_x, max_y), value=max_y)
        min_point = opts.series_options.MarkPointItem(name="Maximum", coord=(min_x, min_y), value=min_y)
        avg_line = opts.series_options.MarkLineItem(name="mean_Value", y=avg)
        line.set_series_opts(markpoint_opts=opts.MarkPointOpts(data=[min_point, max_point]))
        line.set_series_opts(markline_opts=opts.MarkLineOpts(data=[avg_line]))
    abs = os.path.dirname(__file__)
    line.render(abs+"/static/plot.html")
    return render(request, "income_plot.html")
