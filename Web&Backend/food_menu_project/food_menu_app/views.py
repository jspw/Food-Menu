from django.shortcuts import render
from django.urls import reverse_lazy
from django.http import HttpResponse
from django.views.generic import (View,TemplateView,
                                ListView,DetailView,
                                CreateView,DeleteView,
                                UpdateView)
from . import models

from rest_framework import viewsets
from rest_framework.response import Response
from .serializers import RestaurantSerializer,MenuSerializer,MiniSerializer

from .models import Restaurant,Menu

# Create your views here.

class IndexView(TemplateView):
    # Just set this Class Object Attribute to the template page.
    # template_name = 'app_name/site.html'
    template_name = 'index.html'


    def get_context_data(self,**kwargs):
        context  = super().get_context_data(**kwargs)
        context['title'] = "Admin Panel"
        return context


class RestaurantListView(ListView):
    context_object_name = 'restaurants'
    template_name = "index.html"
    model = models.Restaurant


class RestaurantDetailView(DetailView):
    context_object_name = 'restaurant'
    model = models.Restaurant
    template_name = 'restaurant_detail.html'


class CreateRestaurantView(CreateView):
    template_name = 'restaurant_form.html'
    success_url = '/'
    fields = ("name","location")
    model = models.Restaurant


class RestaurantUpdateView(UpdateView):
    template_name = 'restaurant_form.html'
    success_url = '/'
    fields = ("name","location")
    model = models.Restaurant

class RestaurantDeleteView(DeleteView):
    template_name = 'restaurant_confirm.html'
    success_url = reverse_lazy('index')
    model = models.Restaurant


# Menu 


class CreateMenuView(CreateView):
    template_name = 'menu_form.html'
    success_url = reverse_lazy("menu")
    fields = ("name","price",'restaurant')
    model = models.Menu
    

class MenuListView(ListView):
    context_object_name = 'menus'
    template_name = "menu.html"
    model = models.Menu


class MenuUpdateView(UpdateView):
    template_name = 'menu_form.html'
    success_url = reverse_lazy('menu')
    fields = ("name","price","restaurant")
    model = models.Menu

class MenuDeleteView(DeleteView):
    model = models.Menu
    template_name = 'menu_confirm.html'
    success_url = reverse_lazy("menu")


class ApiView(viewsets.ModelViewSet):
    # serializer_class = VarsitySerializer
    serializer_class = MiniSerializer

    queryset = Restaurant.objects.all()

    def retrieve(self,request,*args ,**kwargs):
        instance=self.get_object()
        serializer=RestaurantSerializer(instance)
        return Response(serializer.data)