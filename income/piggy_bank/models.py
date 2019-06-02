from django.db import models

# Create your models here.
class YearDB(models.Model):
    year = models.CharField("年份", max_length=20)

    class Meta:
        verbose_name = "年份管理"
        verbose_name_plural = "年份管理"

    def __str__(self):
        return self.year

class IncomDB(models.Model):
    MONTH_CHOICE = (("1月", "1月"), ("2月", "2月"), ("3月", "3月"), ("4月", "4月"), ("5月", "5月"),
                    ("6月", "6月"), ("7月", "7月"), ("8月", "8月"), ("9月", "9月"), ("10月", "10月"),
                    ("11月", "11月"), ("12月", "12月"),)
    Year = models.ForeignKey(YearDB, on_delete=models.CASCADE, null=True)
    monthly = models.CharField(verbose_name="月份", choices=MONTH_CHOICE, default='1月',
                               max_length=20, null=True)
    last_balance = models.DecimalField("上月余额", max_digits=10, decimal_places=2)
    salary = models.DecimalField("工资收入", max_digits=10, decimal_places=2)
    other_income = models.DecimalField("其他收入", max_digits=10, decimal_places=2)
    payments = models.DecimalField("支出", max_digits=10, decimal_places=2)
    expected_balance = models.DecimalField("预计余额", max_digits=10, decimal_places=2)
    actual_balance = models.DecimalField("实际余额", max_digits=10, decimal_places=2)
    balance_diff = models.DecimalField("余额误差", max_digits=10, decimal_places=2)
    actual_income = models.DecimalField("实际存入", max_digits=10, decimal_places=2)
    create_time = models.DateTimeField("创建时间", auto_now=True)
    comment = models.CharField("备注", max_length=500, blank=True)

    class Meta:
        verbose_name = "收入管理"
        verbose_name_plural = "收入管理"

    def __str__(self):
        return self.Year.year + ' '+ self.monthly

class DebtsDB(models.Model):
    debtee = models.CharField("债权人", max_length=20)
    money = models.DecimalField("借款", max_digits=10, decimal_places=2)
    all_money = models.DecimalField("总借款", max_digits=10, decimal_places=2)
    paid = models.DecimalField("还款", max_digits=10, decimal_places=2)
    all_paid = models.DecimalField("已还", max_digits=10, decimal_places=2)
    remaining = models.DecimalField("剩余", max_digits=10, decimal_places=2)
    create_time = models.DateTimeField("记录时间", auto_now=True)

    class Meta:
        verbose_name = "债务管理"
        verbose_name_plural = "债务管理"

    def __str__(self):
        return self.debtee

