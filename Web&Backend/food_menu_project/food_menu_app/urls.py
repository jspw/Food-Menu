from django.urls import path
from django.conf.urls import url,include
from .views import RestaurantListView,RestaurantDetailView,CreateRestaurantView,CreateMenuView,MenuListView,RestaurantDeleteView,RestaurantUpdateView,MenuDeleteView,MenuUpdateView,ApiView

from rest_framework import routers


router = routers.DefaultRouter()
router.register("info",ApiView)

urlpatterns = [
    path('',RestaurantListView.as_view(),name="index"),

    # Restaurant Stuffs

    # url(r'^(?P<pk>\d+)/$',RestaurantDetailView.as_view(),name="detail"),
    url(r'^create_restaurant/$',CreateRestaurantView.as_view(),name='create_restaurant'),
    url(r'^restaurant_update/(?P<pk>\d+)/$',RestaurantUpdateView.as_view(),name='restaurant_update'),
    url(r'^restaurant_delete/(?P<pk>\d+)/$',RestaurantDeleteView.as_view(),name='restaurant_delete'),


    # Menu Stuffs

    url(r'^add_menu/$',CreateMenuView.as_view(),name='add_menu'),
    url(r'^menu/$',MenuListView.as_view(),name="menu"),
    url(r'^menu_update/(?P<pk>\d+)/$',MenuUpdateView.as_view(),name='menu_update'),
    url(r'^,menu_delete/(?P<pk>\d+)/$',MenuDeleteView.as_view(),name='menu_delete'),


    # RESR API

    path('rest/',include(router.urls)), #this is for the database


]
