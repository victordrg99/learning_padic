print('PROGRAMA PARA DETERMINAR EL DOMINIO DE APRENDIZAJE DE UNA RED NEURONAL LINEAL P-ÁDICA.')
print('-------------------------------------------------------------------------------------')
#El siguiente programa se basa en el algoritmo descrito por Andrei Yu. Khrennikov en su libro "P-adic deterministic and random dynamics" Pagina 139
#para encontrar el domino de aprendizaje de una función del tipo y = wx, con "y=0" y "x= (x_i)", donde x_i son números 2-ádicos con i = 0, ..., N-1.

#NOTA: AQUI SE ESTA CONSIDERANDO EL CASO EN QUE y=0, ES DECIR, QUE EL DOMINIO DE APRENDIZAJE ESTA DADO POR W= X_alpha^{-1} (V) DONDE V ES LA BOLA CON CENTRO
#EN 0 Y RADIO 1/2^K, NO FUNCIONA EN EL CASO DE QUE y=1.

#Definimos los valores preliminares.
import time
inicio = time.time()
time.sleep(1) #Se empieza a medir el tiempo.

N=11 #Se asigna la cantidad de valores de entrada con los que se va a trabajar.
k=11 #Se asigna la precisión del número 2-ádico.
Nk = Zp(2, prec=k, type = "fixed-mod", print_mode = 'series') #Se define el campo 2-ádico con la presición k.
NkN = Nk^N #Se define Z_2^N.
x=[1,2,3,4,5,6,7,8,9,10,11] #Se asignan los estados de entrada de las neuronas.
y=1
counted =[] #Se asina un contador de puntos que ya han sido revisados
corrects = [] #Se asigna un contador de puntos que están en el dominio de aprendizaje.
print('Valores de entrada: x =', NkN(x), 'con longitud', N, ' y y=', y )
print('Consideramos como V a la bola con centro en 0 y radio 1/2^k donde k =', k)

#Definimos la funcion X_alpha: Esta función calcula el producto punto de los estados de entrada y un punto aleatorio en NkN.
def funcionx(w, x):
    z = w[0] * x[0]
    for i in range (1,N):
        z= z + w[i] * x[i];
    return z #Devuelve un 2-ádico


#Paso 1: Se elige un punto aleatorio y se verifica que satisfaga la condición de la función X_alpha. El proceso se detiene hasta que se encuentre un punto que lo haga

print('-------------------------------------------------------------------------------------')
w = NkN.random_element() #Elegimos nuestro primer w aleatorio
z = 0
n=0
if y==0:
    zabs = 1
    while zabs > 0: #Como se quiere probar que z=0 entonces basta con probar que |z|_2=0
        w = NkN.random_element()
        z = funcionx(w,x)
        zabs =z.abs()
        n= n+1
else:
    zabs = -1
    while zabs < 0: #Como se quiere probar que z=0 entonces basta con probar que |z|_2=0
        w = NkN.random_element()
        z = funcionx(w,x)
        zabs =z.abs()
        n= n+1
print('Se realizaron', n, 'operaciones para encontrar el primer w deseado')

print('El w tal que X(w) esta en V es ', w)

#NOTA: ESTE CICLO WHITE PUEDE ESTAR PASANDO VARIAS VECES POR EL MISMO PUNTO PERO ESTA PROBABILIDAD SE REDUCE MIENTRAS MAYOR SEA EL VALOR DE N O k.


#Paso 2. Se busca extender el dominio de aprendizaje; ahora eligiendo nuevamente puntos aleatorios en la esfera con centro en el punto "w" encontrado y radio 1/2^{k-1}. Se puede reducir a 2^N puntos en la búsqueda aleatoria si consideramos que las entradas de los elementos de la esfera coinciden con w, excepto por la  k-ésima entrada en la expansión p-ádica.
print('-------------------------------------------------------------------------------------')


#Definimos una funcion que tranforme un punto aleatorio a un punto en la esfera.
def aleatorioesf(wn, w0): #z= wx= \sum_i=0^N w_i x_i
    for i in range(0, N): #For para quitar reducir a modulo 2^(k-1)
        wn[i] = wn[i] % 2^(k-1)
    for i in range (0, N): #For para quitar toda potencia menor a 2^(k-1)
        for j in range (0, k):
            w0[i] = w0[i] - w0[i] % 2^j
    w0 = w0 + wn; w0
    return w0


wn = w

counted.append(wn) #Agregamos w a la lista de contados.
corrects.append(wn) #Agregamos w a la lista de correctos.
w0 = NkN.random_element()
w1 = aleatorioesf(wn, w0) #Elegimos un punto aleatorio en la esfera de radio 1/2^(k-1) y centro en w.
n=0
m=0
while len(counted) < 2^N: #Se dentendra hasta revisar todos los puntos de la esfera de radio 1/2^(k-1) y centro en w.
    if y == 0:
        zabs=1 #Iniciamos el valor absoluto en 1.
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
            n= n+1
        corrects.append(w1)
        m+=n
        n=0
        zabs = 1
    else:
        zabs=-1 #Iniciamos el valor absoluto en 1.
        while zabs < 0:
            if len(counted) == 2^N:
                break #Detendra la busqueda si ya completó los 2^N puntos a evalular.
            w0 = NkN.random_element()
            w1 = aleatorioesf(wn, w0)
            if w1 in counted:
                continue #Omitira revisar ese punto si esta en la lista de contados.
            counted.append(w1)
            z = funcionx(w1,x)
            zabs =z.abs()
            n= n+1
        corrects.append(w1)
        m+=n
        n=0
        zabs = -1
print('En la esfera se encontraron', len(corrects), 'puntos cuya imagen bajo X está en V.')


print('-------------------------------------------------------------------------------------')

print('Verificación')
#Probaremos que la imagen bajo X de estos puntos está en V.
vabs=[]
z=0
for i in range(0, len(corrects)):
    for j in range(0, N):
        z = z+ corrects[i][j] * x[j]
    zabs= z.abs()
    vabs.append(zabs)
    z=0

print('Valor absoluto de los puntos encontrados', vabs)


fin = time.time()
print('Tiempo de demorar en buscar', fin-inicio)
