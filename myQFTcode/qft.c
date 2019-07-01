#include "config.h"
#define QUBIT 3

int create_qft_matrix (COMPLEX_MATRIX *Fw)
{
	int i,j,temp, N;
	float index_exp, index_temp;
	N = pow(2, QUBIT);
	index_exp = (2*PI) / (float) N;
	COMPLEX_MATRIX wi;
	wi.rows = N;	wi.cols = 1;
	wi.t =(COMPLEX_NUM*) malloc ((wi.rows*wi.cols) * sizeof(COMPLEX_NUM)); 

	for (i=0; i<N; i++)
	{
		index_temp = index_exp * (i);
		wi.t[i].r = cos(index_temp);
		wi.t[i].i = sin(index_temp);	
	}
	
	//Fourier Matrix Construction
	for (i=0; i<Fw->cols; i++)
		for (j=0; j<Fw->rows; j++)
		{
			temp = i*j;	temp %= N;
			Fw->t[i*Fw->rows + j].r = wi.t[temp].r;
			Fw->t[i*Fw->rows + j].i = wi.t[temp].i;
		}
	return 0;
}

int main ()
{
	printf("\t~Modelling of %u-qubit QFT~\n", QUBIT);

	float rad_angle; int i, j, k, N, num_unitary;
	N = pow(2, QUBIT);
	
	
	printf("\nFourier Matrix:\n");
	COMPLEX_MATRIX Fw; Fw.rows = N; Fw.cols = N;
	Fw.t =(COMPLEX_NUM*) malloc ((Fw.rows*Fw.cols) * sizeof(COMPLEX_NUM)); 
	create_qft_matrix (&Fw);
	matrix_print(Fw);
	//Applying QFT on normalized discrete signal samples
	float mag;
	COMPLEX_MATRIX sig; sig.rows = N; sig.cols = 1;
	sig.t =(COMPLEX_NUM*) malloc ((sig.rows*sig.cols) * sizeof(COMPLEX_NUM)); 

	for(i=0;i<N;i++)
	{
		scanf("%f\n",&sig.t[i].r);
		sig.t[i].i = 0;
	}
        printf("\nUnormalized Input Samples:\n");
	matrix_print(sig);
	printf("\nNormalized Input Samples:\n");
	matrix_normalize (sig, &sig, &mag);
	matrix_print(sig);

	printf("\nQFT Output Samples :\n");
	COMPLEX_NUM factor_norm;
	factor_norm.r = mag; factor_norm.i = 0;
        matrix_mul (Fw, sig, &sig);
	matrix_scalar_mul (sig, factor_norm, &sig);
	matrix_print(sig);		

	return 0;
}

