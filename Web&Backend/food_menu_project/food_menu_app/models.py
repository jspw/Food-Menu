from django.db import models
from django.urls import reverse

# Create your models here.

class Restaurant(models.Model):
    name = models.CharField(max_length=256)
    location = models.CharField(max_length=256)


    def __str__(self):
        return self.name

    def get_absolute_url(self):
        return reverse("food_menu_app:detail", kwargs={"pk": self.pk})
    

class Menu(models.Model):
    name = models.CharField(max_length=256)
    price = models.IntegerField()
    restaurant = models.ForeignKey(Restaurant,related_name='menu',on_delete=models.CASCADE)

    def __str__(self):
        return self.name