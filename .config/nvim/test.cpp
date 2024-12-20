#include <iostream>
using std::cout;
using std::endl;

class Test {
public:
  Test();
  Test(Test &&) = default;
  Test(const Test &) = default;
  Test &operator=(Test &&) = default;
  Test &operator=(const Test &) = default;
  ~Test();

private:
};

Test::Test() {}

Test::~Test() {}

class Test2 {
public:
  Test2();
  Test2(Test2 &&) = default;
  Test2(const Test2 &) = default;
  Test2 &operator=(Test2 &&) = default;
  Test2 &operator=(const Test2 &) = default;
  ~Test2();

private:
};

Test2::Test2() {}

Test2::~Test2() {}

int main() {
  Test x{};
  cout << "HELLO WORLD" << endl;
}
