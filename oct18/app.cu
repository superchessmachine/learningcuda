//I am going to write something that will add vectors together

#include <stdio.h>

__global__ void add(int* a, int* b, int* c) {
	int i = threadIdx.x + blockDim.x * blockIdx.x;
	c[i] = a[i] + b[i];
}

__managed__ int vector_a[257], vector_b[257], vector_c[257];

int main() {

	for(int i=0; i<257; i++) {
	
		vector_a[i]=i;

		vector_b[i]=256-i;

	}

	add<<<1,257>>>(vector_a, vector_b, vector_c);

	cudaDeviceSynchronize();

	int result_sum=0;

	for (int i =0; i <257; i++) {
	
		result_sum += vector_c[i];
	}

	printf("Added vector\n");
	printf("Result: sum = %d\n", result_sum);

}
