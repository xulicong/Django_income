"""income URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from piggy_bank import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', views.login),
    path('', views.home),
    path('logout/', views.logout),
    path('income_manage/', views.income_manage),
    path('income/', views.income),
    path('debts/', views.debts),
    path('debts_manage/', views.debts_manage),
    path('debts_plot/', views.debts_plot),
    path('plot/', views.plot),
    path('select_plot/', views.select_plot),
    path('analysis/', views.analysis),
    path('fund/', views.fund),
]
