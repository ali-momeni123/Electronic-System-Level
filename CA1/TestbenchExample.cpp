#include "ac_int.h"
#include <mc_scverify.h>
#include <iostream>

#define DATA_WIDTH 16
#define COUNT_WIDTH ac::log2_ceil<SIZE>::val
#define TEST_SIZE 5

#pragma design top
void MostFrequentFinder(ac_int<DATA_WIDTH, false> input_data, ac_int<DATA_WIDTH*3, false> *most_frequent) {
    *(most_frequent) = input_data*input_data*input_data;
}

// Testbench


CCS_MAIN(int argc, char **argv) {
    ac_int<DATA_WIDTH, false> arr[TEST_SIZE] = {5,8,132,43,97};
    ac_int<DATA_WIDTH*3, false> result;

    for(int i = 0;i<TEST_SIZE;i++)
    {
        CCS_DESIGN(MostFrequentFinder)(arr[i], &result);
        std::cout << result << std::endl;
    }

    CCS_RETURN(0);
}
