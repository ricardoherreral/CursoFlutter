void main() {
  bool didEatBreakfast = false;
  bool didGoToGym = false;
  if (didEatBreakfast && didGoToGym) {
    print('2x :)');
  } else if (didGoToGym || didEatBreakfast) {
    print('1x :)');
  } else {
    print(':*');
  }
}
