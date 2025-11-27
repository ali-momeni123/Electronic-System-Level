
# Loop constraints
directive set /matrix_mult/core/main CSTEPS_FROM {{. == 2}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3 CSTEPS_FROM {{. == 2} {.. == 1}}

# IO operation constraints
directive set /matrix_mult/core/main/loop2:io_write(output:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop2:io_write(addr:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop2:io_write(output_valid:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop1-10:loop2-13:loop3:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop3:read_mem(input_matrix1:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop3:acc#17 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop3:acc CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop1-10:loop3:acc#15 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop3:read_mem(input_matrix2:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop1-10:loop2-13:loop3:mul#2 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop1-10:loop2-13:loop3:acc#5 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop1-10:loop2-13:loop3:acc#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1-10:loop2-13:loop3/loop1-10:loop2-13:loop3:acc CSTEPS_FROM {{.. == 1}}
