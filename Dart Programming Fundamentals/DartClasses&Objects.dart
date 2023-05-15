void main() {
  Vehicle car1 = new Vehicle("V6");
  Vehicle car2 = new Vehicle("V12");
  SuperCar car3 = new SuperCar("V16");
  car3.display();
  car1.display();
  car2.display();
}

class Vehicle {
  String? engine;

  Vehicle(this.engine) {}

  void display() {
    print(engine);
  }
}

class SuperCar extends Vehicle {
  SuperCar(String engine) : super(engine);
}
