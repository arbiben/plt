#include <iostream>

using namespace std;

template <class T> T f(T a){ 
    return a + a;
}

int main() {
    cout << f<int>(5);
    cout << f<double>(6.6);
}
