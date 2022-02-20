#!/usr/bin/env python
from cdk8s import App

from myexamplechart.myexamplechart import MyExampleChart

app = App()
MyExampleChart(app, "my-example-chart")
app.synth()
