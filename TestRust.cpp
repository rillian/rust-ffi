#include <stdint.h>
#include <stdio.h>

extern uint8_t* test_rust();

bool
test_rust_wrapper() {
  auto greeting = test_rust();
  fprintf(stdout, "rust said: %s", greeting);
  return greeting;
}

int main() {
  return test_rust_wrapper();
}
