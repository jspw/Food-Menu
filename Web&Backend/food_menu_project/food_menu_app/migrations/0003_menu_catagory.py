# Generated by Django 3.1 on 2020-08-21 06:25

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('food_menu_app', '0002_auto_20200812_1948'),
    ]

    operations = [
        migrations.AddField(
            model_name='menu',
            name='catagory',
            field=models.CharField(max_length=256, null=True),
        ),
    ]
