#!/usr/bin/env python3
# Resize images to max width
from PIL import Image
import sys

if len(sys.argv) < 3:
    print("usage: img-resize.py input.jpg max_width")
    sys.exit(1)

img = Image.open(sys.argv[1])
w, h = img.size
max_w = int(sys.argv[2])
if w > max_w:
    new_h = int(h * (max_w / w))
    img = img.resize((max_w, new_h), Image.LANCZOS)
    img.save("resized_" + sys.argv[1])
    print("saved resized_" + sys.argv[1])
else:
    print("image smaller than max width")
