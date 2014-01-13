from django.db import models

class Poll(models.Model):
    question = models.CharField(max_lenght=200)
    pub_date = models.DateTimeField('date published')

class Choice(models.Model):
    poll = models.ForeingKey(Poll)
    choice = models.CharField(max_lenght=200)
    votes = models.IntegerField()

# Create your models here.
