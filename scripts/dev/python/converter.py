from posixpath import split
from PIL import Image
import os
import os.path
from shutil import rmtree

character = "██"

def get_color_escape(r, g, b, background=False):
    return '\033[{};2;{};{};{}m'.format(48 if background else 38, r, g, b)

path = input("What is the path to the images? ")

files = [f for f in os.listdir(path) if os.path.isfile(os.path.join(path, f))]
if os.path.isdir(path + "/output"):
    rmtree(path + "/output")
os.mkdir(path + "/output")

for file in files:
    splitFile = file.split(".")
    if splitFile[1] == "png":
        os.system("convert " + path + "/" + file + " -trim " + "trimmed.png")
        img = Image.open("trimmed.png")
        img = img.convert("RGBA")
        width, height = img.size
        result = ""
        for i in range(height):
            line = ""
            for j in range(width):
                pixel = img.getpixel((j, i))
                if pixel[3] == 0:
                    line = line + "  "
                else:
                    line = line + get_color_escape(pixel[0], pixel[1], pixel[2]) + character
            result = result + line + "\n"
        img.close()
        os.remove("trimmed.png")
        f = open(path + "/output/" + splitFile[0] + ".txt","w+")
        f.write(result)
        f.close
        print(file + " HAS BEEN CONVERTED!")