#include "ac_int.h"


#define M 2
#define N 2
#define K 3
#define INPUT_BITS 16
#define OUTPUT_BITS (2*INPUT_BITS+ac::log2_ceil<K>::val)

#define INPUT_WIDTH INPUT_BITS

#pragma design top
void matrix_mult(ac_int<INPUT_WIDTH,false> input_matrix1[N][K], ac_int<INPUT_WIDTH,false> input_matrix2[K][M],
                 ac_int<OUTPUT_BITS,false> output[N*M], ac_int<1,false> *output_valid) {
    *output_valid = 0; 
    loop1:for (int i = 0; i < N; i++) {
        loop2:for (int j = 0; j < M; j++) {
            int partial_out = 0; // accumulator
            loop3:for (int k = 0; k < K; k++) {
                partial_out += input_matrix1[i][k] * input_matrix2[k][j];
            }
                            
            output[i*M+j] = partial_out;
        }
    }
    *output_valid = 1; 
}

