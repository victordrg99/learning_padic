︠8301b7f8-06c7-4d61-ae62-7e417c8f37f7︠
print('PROGRAMA PARA DETERMINAR EL DOMINIO DE APRENDIZAJE DE UNA RED NEURONAL LINEAL P-ÁDICA.')
print('-------------------------------------------------------------------------------------')

import time
import random
inicio = time.time()
time.sleep(1)

N=7 #Se asigna la cantidad de valores de entrada con los que se va a trabajar.
k=7 #Se asigna la precisión del número 2-ádico.
Nk = Zp(2, prec=k, type = "fixed-mod", print_mode = 'series') #Se define el campo 2-ádico con la presición k.
NkN = Nk^N #Se define Z_2^N.
counted =[] #Se asina un contador de puntos que ya han sido revisados
corrects = [] #Se asigna un contador de puntos que están en el dominio de aprendizaje.


#Definimos la funcion X_alpha: Esta función calcula el producto punto de los estados de entrada y un punto aleatorio en NkN.
def funcionx(w, x):
    z = w[0] * x[0]
    for i in range (1,N):
        z= z + w[i] * x[i];
    return z #Devuelve un 2-ádico

#Definimos una funcion que tranforme un punto aleatorio a un punto en la esfera.
def aleatorioesf(wn, w0):
    for i in range(0, N): #For para quitar reducir a modulo 2^(k-1)
        wn[i] = wn[i] % 2^(k-1)
    for i in range (0, N): #For para quitar toda potencia menor a 2^(k-1)
        for j in range (0, k):
            w0[i] = w0[i] - w0[i] % 2^j
    w0 = w0 + wn; w0
    return w0

#ALgoritmo de aprendizaje
def aprendizaje(x): #Agregar definir "y"
    w = NkN.random_element() #Elegimos nuestro primer w aleatorio
    z = 0
    zabs = 1
    while zabs > 0: #Como se quiere probar que z=0 entonces basta con probar que |z|_2=0
        w = NkN.random_element()
        z = funcionx(w,x)
        zabs =z.abs()

    wn = w
    zabs=1 #Iniciamos el valor absoluto en 1.
    counted.append(wn) #Agregamos w a la lista de contados.
    corrects.append(wn) #Agregamos w a la lista de correctos.
    w0 = NkN.random_element()
    w1 = aleatorioesf(wn, w0) #Elegimos un punto aleatorio en la esfera de radio 1/2^(k-1) y centro en w.
    n=0
    while len(counted) < 2^N: #Se dentendra hasta revisar todos los puntos de la esfera de radio 1/2^(k-1) y centro en w.
        while zabs > 0:
            if len(counted) == 2^N:
                break #Detendra la busqueda si ya completó los 2^N puntos a evalular.
            w0 = NkN.random_element()
            w1 = aleatorioesf(wn, w0)
            if w1 in counted:
                continue #Omitira revisar ese punto si esta en la lista de contados.
            counted.append(w1)
            z = funcionx(w1,x)
            zabs =z.abs()
        corrects.append(w1)
        zabs = 1
    return corrects #Regresa el dominio de aprendizaje para x
fin = time.time()
print('Tiempo de demorar en buscar', fin-inicio)

x1=(1,2,3,4,5,6,7); NkN(x1)
x2=(7,6,5,4,3,2,1); NkN(x2)
x3=(1,2,3,0,0,0,0); NkN(x3)
x4=(0,1,2,3,4,5,6); NkN(x4)

ax1 = aprendizaje(x1)
ax2 = aprendizaje(x2)
ax3 = aprendizaje(x3)
ax4 = aprendizaje(x4)

uni

r=10 %Veces a repetir
s=[]
sl=0
for i in range(0,r):
        for k in range(0, len(ax1)):
            if ax1[k] in ax2:
                
####################
alx2 = random.choice(list(ax2))
alx3 = random.choice(list(ax3))
alx4 = random.choice(list(ax4))
︡########
len(ay)

def intersec(ax,by):
    inter= []
    for x in ax:
        if x in by:
            inter.append(x)
            by.remove(x)
    return inter
len(ax)
len(ay)
len(by)


i1= intersec(ax, ay)
len(i1)

#by
#print(inter)
