# DE1_Servo_Controller
# PWM-Based-Servo-Motor-Controller

Karol Nový, Marek Michalica, Martin Matyska

# Teorie
Naším úkolem bylo vytvořit ovladač pro několik servo motorů, který funguje na bázi modulace šířky impulzů. Pro ovladač je použita Nexys A7 deska a 4 servo motory. Cílem je zkonstruovat algoritmus pro PWM modulaci a jeho výstupem ovládat pozice 4 na sobě nezávislých servo motorů. Volba konkrétního serva je realizována pomocí 4 switchů (1 switch = 1 servo). Úhel otočení se nastaví pomocí 7 switchů a to tak, že když je sepnutý poslední switch, servo se otočí o 90°, následující switch znamená otočení o 45° atd. Sepnutí všech switchů tedy znamená otočení o 180°, ovšem u takového způsobu nemusí být pozicování přesné. Pro zpětnou vazbu jsou u každého switche LED diody indikující, který motor a která pozice je právě zvolena. Je použito i resest tlačítko, které přeruší pwm signál a zastaví tak otáčení serva.

Když počítame s tím, že máme 7 switchů (128 pozic) a rozsah pro modulaci je 2 ms, získáme frekvenci pro náš clock signál pomocí následující rovnice: f=1/(2ms:128)=64kHz.
S frekvencí 64kHz budeme mít 1ms každých 64 opakování a pro frekvenci 20ms to stačí vynásobit 20 (20*64=1280). Hodnotu 1280 použijeme pro vnitřní počítadlo k zajištění periody 20ms.

![image](https://github.com/Karlos1235/DE1_Servo_Controller/assets/119747404/dbb2524c-d320-42eb-ae5b-d5e59c72b764)



# Popis hardwaru
Pro náš projekt jsme použili desku Nexys A7-50T a 4 servo motory SG90.

![image](https://github.com/Karlos1235/DE1_Servo_Controller/assets/119747404/5fe81187-b2b5-4fc5-8c01-e516c1b39681)
![image](https://github.com/Karlos1235/DE1_Servo_Controller/assets/119747404/240b3b54-c7f7-426e-8255-d13676f31501)





# Popis softwaru
![image](https://github.com/Karlos1235/DE1_Servo_Controller/assets/119747404/6a5330cb-7856-4963-9c98-223564a507bf)
Simulace komponent.

# Ovládání

# Zdroje
https://www.codeproject.com/Articles/513169/Servomotor-Control-with-PWM-and-VHDL
