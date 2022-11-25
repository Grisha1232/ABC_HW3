#include "math.h"

long double Ber[60] = {1., -1. / 2, 1. / 6, 0, -1. / 30, 0, 1. / 42, 0, -1. / 30,
                       0, 5. / 66, 0, -691. / 2730, 0, 7. / 6, 0, -3617. / 510,
                       0, 43867. / 798, 0, -174611. / 330, 0, 854513. / 138, 0,
                       -236364091. / 2730, 0, 8553103. / 6, 0, -23749461029. / 870, 0,
                       8615841276005. / 14322, 0, -7709321041217. / 510, 0, 2577687858367. / 6,
                       0, -26315271553053477373. / 1919190, 0, 2929993913841559. / 6, 0,
                       -261082718496449122051. / 13530, 0};

int sizeBer = 41;
long double fact(unsigned long long n) {
    if (n == 0) return 1;
    return n * fact(n - 1);
}

unsigned long long int pow2(unsigned long long int n) {
    return 1 << n;
}

long double bink(unsigned long long n, unsigned long long k) {
    return 1.0 * fact(n) / (fact(k) * fact(n - k));
}

long double bernolli(unsigned long long n) {
    if (n <= sizeBer) return Ber[n];
    if (n % 2 == 1) {
        Ber[n] = 0;
        sizeBer++;
        return 0;
    }
    long double s = 0;
    for (long k = 1; k < n; k++) {
        s += bink(n + 1, k + 1) * bernolli(n - k);
    }
    Ber[n] = (-1. / (n + 1.)) * s;
    sizeBer++;
    return Ber[n];
}

long double ABS(long double x) {
    if (x < 0) return x * -1;
    return x;
}

long double th(double x) {
    int countMemb = 1;
    long double powX2 = pow(x, 2);
    long double curr = x;
    long double result = curr;
    unsigned long long int del = 2;
    unsigned long long int p2 = pow2(2 * countMemb);
    long double ber = bernolli(2 * countMemb);
    while (ABS(curr) > 0.0005) {
        countMemb++;

        curr *= powX2;
        del = (2 * countMemb) * (2 * countMemb - 1);
        curr = curr / del;

        curr = (curr / (p2 - 1)) * 4;
        p2 *= 4;
        curr = curr * (p2 - 1);


        curr = curr / ber;
        ber = bernolli(2 * countMemb);
        curr = curr * ber;

        if (countMemb % 2 == 0) {
            curr = ABS(curr) * -1;
        } else {
            curr = ABS(curr);
        }
        if (p2 == 0) {
            return result;
        }

        result += curr;
    }
    return result;
}
