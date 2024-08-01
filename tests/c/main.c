#include <stdio.h>
#include <stdlib.h>

int sum_to(int n) {
  int *A = malloc(sizeof(int) * n);
  A[0] = 0;
  for (int i = 1; i < n; ++i) {
    A[i] = A[i - 1] + i;
  }
  return A[n - 1];
}

int main() {
  printf("%d\n", sum_to(4));
  return 0;
}
