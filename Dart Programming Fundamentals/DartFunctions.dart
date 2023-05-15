void main() {
  printToConsole('Ricardo', extraString: 'Herrera');
  print(multiply(3, 5));
}

void printToConsole(String string1, {String? extraString}) {
  print(string1);
  print(extraString);
}

int multiply(int i, int j) {
  return i * j;
}
