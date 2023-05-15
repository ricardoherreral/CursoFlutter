void main() {
  late Car car;
  car = Car("BMW");
  if (car != null) {
    print(car!.name);
  }
}

class Car {
  late final String name;
  Car(this.name);
}

// Diferencia entre late y NOMBRE_VARIABLE?
//es que late si se tiene que asignar a un valor antes de ser usada
//y ? no, con ? puede ser valor nulo
