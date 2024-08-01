#include <iostream>
#include <vector>

int sum_to(int n) {
  std::vector<int> A(n);
  A[0] = 0;
  for (int i = 1; i < n; ++i) {
    A[i] = A[i - 1] + i;
  }
  return A[n - 1];
}

int main() {
  std::cout << sum_to(4) << std::endl;
  return 0;
}
