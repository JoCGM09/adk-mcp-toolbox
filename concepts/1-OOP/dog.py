# Clase: Es la plantilla o molde para crear objetos.

class Dog: 

# Constructor: Es un método especial que se llama cuando se crea un objeto de la clase.

    def __init__(self, nombre, año, juguetes=None):

        # Atributos: Son las características o propiedades del objeto.
    
        self.nombre = nombre
        self.año = año
        self.juguetes = juguetes if juguetes is not None else []

# Métodos: Son las acciones que el objeto puede realizar.
    def bark(self):
        return f"{self.nombre} dice Woof!"


