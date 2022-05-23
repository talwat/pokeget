from PIL import Image
import os
import os.path
from shutil import rmtree

path = input("What is the path to the images? ")

files = [f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]
if os.path.isdir(path + "/output"):
    rmtree(path + "/output")
os.mkdir(path + "/output")

for file in files:
    splitFile = file.split(".")
    if splitFile[1] == "png":
        img = Image.open(path + "/" + file)
        size = img.width, img.height
        left = 0
        top = 0
        right = size[0]/2
        bottom = size[1]
        img = img.crop((left, top, right, bottom))
        img.save(path + "/output/" + file)
        print(file + " CROPPED!")