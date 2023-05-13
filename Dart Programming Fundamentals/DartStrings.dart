void main() {
  var firstName = 'Ricardo';
  String lastName = 'Herrera';

  print(firstName + lastName);

  String fullName = firstName + ' ' + lastName;
  print(fullName);

  String fullname2 = "$firstName $lastName";
  print(fullname2);

  String add = ' ${2 + 2} Ricas $firstName ';
  print(add);

  print(add.length);
  print(add.isEmpty);
  print(add.trim());
  print(add.substring(5, 13));

  String name = 'Ri/car/do / Herr/e/ra';
  print(name.split('/')); //Devuelve un List
}
