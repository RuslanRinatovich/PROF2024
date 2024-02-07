import requests

for i in range(1, 101):
    url = "https://thispersondoesnotexist.com/"
    response = requests.get(url)
    with open(f"images/{i}.jpg", "wb") as f:
        f.write(response.content)
    print(f"images/{i}.jpg saved")

import qrcode

for i in range(1001, 1101):
    img = qrcode.make(i)
    type(img) # qrcode.image.pil.PilImage
    img.save(f"MedCard/QRcard{i}.jpg")