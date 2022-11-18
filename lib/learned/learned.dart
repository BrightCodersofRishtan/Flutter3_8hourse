// typedef f-yani ozgaruvchi, field yoki parametr sifatida ishlatishni istasak typedef bn tanitishkerak

// typedef void FunctionName(String par1);

typedef IntOperation<int> = int Function(int a, int b);
// IntOperation<int> intOperation -bu yerda funksiyani parametr sifatida ishlatik
int processTwoInts(IntOperation<int> intOperation, int a, int b) {
  return intOperation(a, b);
  // intOperation(a, b)= int Function(int a, int b) shunga teng sababi typedef bn chaqirdik
}

class MyClass {
  // String a;
  IntOperation<int> intOperation;
  MyClass(this.intOperation);
  // doIntOperation -bu bir method
  int doIntOperation(int a, int b) {
    return this.intOperation(a, b);
  }
}

void main() {
  IntOperation<int> sumTwoNumbers = (int a, int b) => a + b;
  print(sumTwoNumbers(1, 1));
  print(processTwoInts(sumTwoNumbers, 1, 2));
  MyClass myClass = MyClass(sumTwoNumbers);
  print(myClass.doIntOperation(3, 4));
}
