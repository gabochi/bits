#include <stdio.h>

int main() {
  int t = 0;

  while(1) {
    t++;
    putchar(t&t>>8);
  }
}
