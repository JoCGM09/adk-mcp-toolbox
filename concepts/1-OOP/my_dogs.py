# Se importa la clase Dog desde el módulo (o archivo) dog.py

from dog import Dog

# Se crea un objeto de la clase Dog, con sus respectivos atributos.

Bobby = Dog(
    nombre="Bobby", 
    año=5,
    juguetes=["pelota", "hueso"]
)

print(Bobby.bark())  # Output: Bobby dice Woof!

print(Bobby.juguetes)  # Output: ['pelota', 'hueso']
