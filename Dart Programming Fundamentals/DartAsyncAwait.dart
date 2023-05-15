void main() async {
  await futureFunction(); // Sin await se ejecuta al final
  print("Hello");
}

Future futureFunction() async {
  await Future.delayed(Duration(seconds: 2))
      .whenComplete(() => print("Future Done!"));
}
