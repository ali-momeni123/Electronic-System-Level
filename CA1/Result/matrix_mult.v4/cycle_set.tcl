
# Loop constraints
directive set /matrix_mult/core/main CSTEPS_FROM {{. == 2}}
directive set /matrix_mult/core/main/loop1 CSTEPS_FROM {{. == 1} {.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2 CSTEPS_FROM {{. == 14} {.. == 0}}

# IO operation constraints
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(output:rsc.d) CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(addr:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:io_write(output_valid:rsc.d) CSTEPS_FROM {{.. == 0}}

# Real operation constraints
directive set /matrix_mult/core/main/loop1/loop2/loop3-1:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#21 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#22 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-9:acc#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#12 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-5:mul#2 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-6:mul#2 CSTEPS_FROM {{.. == 12}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#26 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#13 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#6 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-7:mul#2 CSTEPS_FROM {{.. == 11}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#7 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#14 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#7 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-8:mul#2 CSTEPS_FROM {{.. == 10}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#25 CSTEPS_FROM {{.. == 11}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#30 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#8 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-9:mul#2 CSTEPS_FROM {{.. == 9}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-10:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-10:mul#2 CSTEPS_FROM {{.. == 8}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#24 CSTEPS_FROM {{.. == 9}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#16 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-11:mul#2 CSTEPS_FROM {{.. == 7}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#17 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#11 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-12:mul#2 CSTEPS_FROM {{.. == 6}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#23 CSTEPS_FROM {{.. == 7}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#29 CSTEPS_FROM {{.. == 9}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#32 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d) CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d) CSTEPS_FROM {{.. == 0}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-1:mul#2 CSTEPS_FROM {{.. == 5}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-2:acc#9 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-2:mul#2 CSTEPS_FROM {{.. == 4}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#28 CSTEPS_FROM {{.. == 5}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#27 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#2 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-3:mul#2 CSTEPS_FROM {{.. == 3}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix1:rsc.d)#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#10 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:read_mem(input_matrix2:rsc.d)#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-4:mul#2 CSTEPS_FROM {{.. == 2}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc#31 CSTEPS_FROM {{.. == 3}}
directive set /matrix_mult/core/main/loop1/loop2/loop3:acc CSTEPS_FROM {{.. == 5}}
directive set /matrix_mult/core/main/loop1/loop2/loop3-12:acc#5 CSTEPS_FROM {{.. == 13}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#4 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#5 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc#3 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop2/loop2:acc CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop1:acc#1 CSTEPS_FROM {{.. == 1}}
directive set /matrix_mult/core/main/loop1/loop1:acc CSTEPS_FROM {{.. == 1}}
