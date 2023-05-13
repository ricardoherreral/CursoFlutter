void main() {
  int num1 = 10;
  double num2 = 10.11; //Numeros decimales

  // num num3 = 20;
  // num num4 = 20.22;

  var num5 = num1 + num2; //Las operaciones son igual "+ - * / %"
  print(num5);

  var num6 = num.parse('12'); //De string a numero
  print('${num6 + 4}');
  print('12' == num6);

  double num7 = 0.01;
  print(num7.isInfinite);
  print(num7.isFinite);
  print(num7.isNaN);
  print(num7.isNegative);
  print(num7.sign); // Ver si es positivo, negativo o cero

  double num8 = 100.5;
  print(num8.toInt());
  print(num8.toDouble());
  print(num8.toString());
  print(num8.abs()); //Regresa el valor absoluto
  print(num8.round()); //Redonde el numero
}
