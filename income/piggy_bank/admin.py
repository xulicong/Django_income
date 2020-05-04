from django.contrib import admin
from piggy_bank.models import YearDB
from piggy_bank.models import IncomDB
from piggy_bank.models import DebtsDB
from piggy_bank.models import FundPoolDB

# Register your models here.
class YearDBAdmin(admin.ModelAdmin):
    list_display = ["year"]

class IncomDBAdmin(admin.ModelAdmin):
    list_display = ["Year", "monthly", "last_balance", "salary", "other_income",
                    "payments","actual_balance","create_time", "comment"]

class DebtsDBAdmin(admin.ModelAdmin):
    list_display = ["debtee", "money", "all_money", "paid", "all_paid", "remaining",
                    "create_time"]

class FundPoolDBAdmin(admin.ModelAdmin):
    list_display = ["Year", "monthly", "cash_pool", "insurance_pool", "goal_pool",
                    "invest_pool"]
admin.site.register(YearDB)
admin.site.register(IncomDB, IncomDBAdmin)
admin.site.register(DebtsDB, DebtsDBAdmin)
admin.site.register(FundPoolDB, FundPoolDBAdmin)