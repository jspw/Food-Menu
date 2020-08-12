from rest_framework import serializers
from .models import Restaurant,Menu
from rest_framework.response import Response
from rest_framework import viewsets


class MenuSerializer(serializers.ModelSerializer):
    class Meta:
        model=Menu
        fields = ['name','price']


class MiniSerializer(serializers.ModelSerializer):
    class Meta:
        model = Restaurant
        fields = ["id","name"]

class RestaurantSerializer(serializers.ModelSerializer):
    menu = MenuSerializer(many=True)
    class Meta:
        model= Restaurant
        fields = ['name','location','menu']



