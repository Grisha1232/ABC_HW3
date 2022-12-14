#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <string.h>
#include <errno.h>


long double realTh(double x) {
    return tanh(x);
}

long double checkPrecision(long double x, long double curr) {
    long double result = (100 - (curr * 100 / x));
    return  result > 0 ? result : result * -1;
}

extern long double th(double x);

int main(int argc, char *argv[]) {
    if (argc == 1) {
        // Users amount random values
        // Get from console
        int n;
        srand(time(NULL));
        printf("How many of random values do you wanna get: ");
        scanf("%d", &n);
        for (int i = 0; i < n; i++) {
            double x = rand() % 2;
            x += (rand() % 5707) / 10000.;
            printf("x = %f\n", x);
            long double result = th(x);
            printf("result for th(x) = %Lf\n", result);
            printf("result for real th(x) = %Lf\n", realTh(x));
            printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
        }
    } else if (argc == 2) {
        if (strcmp(argv[1], "measuring") == 0) {
            double x = 1.39;
            printf("Testing with x = %f\n", x);
            long double result;
            time_t t_start = clock();
            for (int i = 0; i < 2000000; i++) {
                result = th(x);
            }
            time_t t_end = clock();
            printf("result for th(x) = %Lf\n", result);
            printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
            printf("\nThe task is done 2000000 times in %f sec\n", (difftime(t_end, t_start)) / 1000000);
            return 0;
        }
        double pi = 3.1415926535;
        // Get for x (argv[1])
        /* Convert the provided value to a double */
        char* eptr;
        double x = strtod(argv[1], &eptr);

        /* If the result is 0, test for an error */
        if (x == 0) {
            /* If the value provided was out of range, display a warning message */
            if (errno == ERANGE)
                printf("The value provided was out of range\n");
        }
        if (x < -pi/2 || x > pi/2) {
            printf("Incorrect value given\n");
            return 1;
        }
        long double result = th(x);
        printf("result for th(x) = %Lf\n", result);
        printf("result for real th(x) = %Lf\n", realTh(x));
        printf("precision: %Lf\n\n", checkPrecision(realTh(x), result));
    } else if (argc == 3) {
        // Get from file all Xies and out results to another file
        FILE* input;
        if ((input = fopen(argv[1], "r"))!= NULL) {
            fclose(input);
            printf("The input file doesn't exist\n");
            return 1;
        }
        FILE* output;
        if ((output = fopen(argv[2], "w")) != NULL) {
            fclose(output);
            printf("The output file doesn't exist\n");
            return 1;
        }
        while (!feof(input)) {
            double x;
            fscanf(input, "%lf", &x);
            long double result = th(x);
            fprintf(output, "result for th(x) = %Lf\n", result);
            fprintf(output, "result for real th(x) = %Lf\n", realTh(x));
            fprintf(output, "precision: %Lf\n\n", checkPrecision(realTh(x), result));
        }
        fclose(input);
        fclose(output);
    }
    return 0;
}
