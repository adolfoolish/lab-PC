#Practica 1 de Laboratorio de Ciberseguridad

import requests
import json

output = []
def call(url):
    r = requests.get(url)
    return (json.loads(r.content))

output.append(call("https://api.openweathermap.org/data/2.5/weather?q=London&units=metric&appid=4c35b48c9218dc4d08cd6eede31f455d"))
output.append(call("https://api.openweathermap.org/data/2.5/weather?id=2172797&appid=4c35b48c9218dc4d08cd6eede31f455d"))
output.append(call("https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=4c35b48c9218dc4d08cd6eede31f455d"))

with open("practica1.txt","w+") as txt:
    for i in output:
        txt.write(str(i)+"\n")