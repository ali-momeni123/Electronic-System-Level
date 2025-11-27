
# Loop constraints
directive set /matrix_mult/core/main CSTEPS_FROM {{. == 1}}
directive set /matrix_mult/core/main/loop1 CSTEPS_FROM {{. == 1} {.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2 CSTEPS_FROM {{. == 3} {.. == 0}}

# IO operation constraints
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(output:rsc.d) CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(addr:rsc.d) CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(output_valid:rsc.d) CSTEPS_FROM {{.. == 2}}

# Real operation constraints
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:mul#2 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:and#1 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:and#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:mux#4 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:mux CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:mux#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop1:acc CSTEPS_FROM {{.. == 1}}
