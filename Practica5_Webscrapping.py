import requests
from bs4 import *
import os
from PIL.ExifTags import TAGS, GPSTAGS
from PIL import Image

#Este programa se encarga de descargar todas las imagenes de un sitio web
#Se ejecuta en la consola y de la forma >python Practica4_Webscrapping -link "link de la pagina"

def get_images(url):
    r=requests.get('http://www.'+url)
    soup= BeautifulSoup(r.text, 'html.parser')
    urls=list()
    images=soup.select('img[src]')
    for img in images:
        urls.append(img['src'])
    global ruta
    ruta= input('Introduce la ruta y selecciona el nombre del directorio a crear: ')
    os.mkdir(ruta)
    i=1
    for index, img_link in enumerate(urls):
        if i<=len(urls):
            img_data=requests.get(img_link).content
            with open(ruta+'\\'+str(index+1)+'.jpg', 'wb+') as f:
                f.write(img_data)
            i+=1
        else:
            f.close()
            break

if __name__=="__main__":
    import argparse
    parser = argparse.ArgumentParser(description='Este script descarga todas las imagenes del sitio que introduzcas e imprime la metadata de cada una')
    parser.add_argument('-link', '--url', help='El URL de donde quieras descargar las imagenes')
    args = parser.parse_args()
    url = args.url
    get_images(url)
           

