
#include "cuda_runtime.h"
#include "device_launch_parameters.h"

#include <stdio.h>

__global__ void compute(double a, double b, double c, double e, double f, double g, double h, double* res)
{
    *res = a+b+c+e+f+g/h;
}

int main()
{
    double cpu_res;
    double* gpu_res;
    
    cudaMalloc((void**)&gpu_res, sizeof(double));
    compute << <1, 1>>>(1, 2, 3, 4, 5, 8., 3., gpu_res);
    cudaMemcpy(&cpu_res, gpu_res, sizeof(double), cudaMemcpyDeviceToHost);
    printf("1+2+3+4+5+8/3=%lf\n", cpu_res);
    cudaFree(gpu_res);



    return 0;
}

