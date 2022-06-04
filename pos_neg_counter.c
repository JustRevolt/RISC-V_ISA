#include <stdio.h>

#define N 5
#define M 6

void process(int n, int m, int matrix [M][N], int *pos, int *neg)
{
    for (int i = 0; i < m; ++i) {
        for (int j = 0; j < n; ++j) {
            if (matrix[i][j] > 0) {
                *pos += 1;
            } else if (matrix[i][j] < 0) {
                *neg += 1;
            }
        }
    }

}

int main(int argc, char** argv)
{
    int matrix[M][N];
    int positive_amount = 0;
    int negative_amount = 0;
    
    for (int i = 0; i < M; ++i) {
        for (int j = 0; j < N; ++j) {
            scanf("%d", &matrix[i][j]);
        }
    }

    process(N, M, matrix, &positive_amount, &negative_amount);

    printf("%d %d\n", positive_amount, negative_amount);

    return 0;
}
