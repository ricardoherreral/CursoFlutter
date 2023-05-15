void main() {
  var ateBreakfast = "Ice Cream";
  switch (ateBreakfast) {
    case "Eggs":
      {
        print("Eggs");
      }
      break;
    case "Milk":
      {
        print(':|');
      }
      break;
    default:
      {
        print(":(");
      }
  }

  for (var i = 1; i <= 10; i++) {
    print(i);
  }

  var list1 = ['a', 'b', 'c', 'd'];
  for (var char in list1) {
    print(char);
    if (char == 'c') {
      break;
    }
  }
  for (var char in list1) {
    if (char == 'c') {
      continue;
    }
    print(char);
  }

  var x = 0;
  while (x < 10) {
    print(x);
    x++;
  }

  var n = -1;
  do {
    print(n);
    n--;
  } while (n >= 0);
}
