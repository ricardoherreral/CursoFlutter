void main(){
 	var name = "Ricardo";
  print(name);
  String lastName = "Herrera";
  print(lastName);
  final num1 = 2; // El valor esta asignado y no va a cambiar
  const num2 = 4; // Igual que final
  double? firstName; // Puede estar o no ahoram es declararla vacia
  
  int num3 = 10;
  double num4 = 10.2;
  print(num3);
  print(num4);
  
  print(name + lastName);
  var fullName = "$name $lastName";
  print(fullName);
  
  bool isTuesday = false;
  print(isTuesday);
  
  List list1 = ['a', 'b', 'c']; //Mismo que un array
  print(list1);
	
  Map map1 = {"firstName": "Ricardo", "lastName": "Herrera",
             "email": "dummy@email.com",};
  print(map1);
}
