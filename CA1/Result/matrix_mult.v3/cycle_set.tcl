
# Loop constraints
directive set /matrix_mult/core/main CSTEPS_FROM {{. == 2}}
directive set /matrix_mult/core/main/loop1 CSTEPS_FROM {{. == 1} {.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2 CSTEPS_FROM {{. == 14} {.. == 0}}

# IO operation constraints
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(output:rsc.d) CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(addr:rsc.d) CSTEPS_FROM {{.. == 1}}

# Real operation constraints
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#73 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#65 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#69 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#28 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#66 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#14 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#17 CSTEPS_FROM {{.. == 12}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#85 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#68 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#20 CSTEPS_FROM {{.. == 11}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#7 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#38 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#7 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#23 CSTEPS_FROM {{.. == 10}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#84 CSTEPS_FROM {{.. == 11}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#89 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#26 CSTEPS_FROM {{.. == 9}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#48 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#29 CSTEPS_FROM {{.. == 8}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#83 CSTEPS_FROM {{.. == 9}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#72 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#32 CSTEPS_FROM {{.. == 7}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#58 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#35 CSTEPS_FROM {{.. == 6}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#82 CSTEPS_FROM {{.. == 7}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#88 CSTEPS_FROM {{.. == 9}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#91 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d) CSTEPS_FROM {{.. == 0}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#2 CSTEPS_FROM {{.. == 5}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#5 CSTEPS_FROM {{.. == 4}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#87 CSTEPS_FROM {{.. == 5}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#64 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#8 CSTEPS_FROM {{.. == 3}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix1:rsc.d)#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#18 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:read_mem(input_matrix2:rsc.d)#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:mul#11 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#86 CSTEPS_FROM {{.. == 3}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#90 CSTEPS_FROM {{.. == 5}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#81 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#92 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#93 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#80 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop1:acc CSTEPS_FROM {{.. == 1}}
