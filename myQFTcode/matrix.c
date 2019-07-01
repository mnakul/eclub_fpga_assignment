void matrix_print (COMPLEX_MATRIX a)
{
	unsigned int i,j;
	for(i=0;i<a.rows;i++)
	{
		for(j=0;j<a.cols;j++)
			printf("%10f + %8fi\t", a.t[(i*a.cols) + j].r, a.t[(i*a.cols) + j].i);
		printf("\n");
	}
	return;
}

void matrix_magnitude (COMPLEX_MATRIX a, float *mag)
{
	unsigned int i;
	float sum=0,temp;
	
	//Compute magnitude
	for(i=0;i<(a.rows*a.cols);i++)
	{
                temp = (a.t[i].r*a.t[i].r) + (a.t[i].i*a.t[i].i);
		sum += temp;
	}
	*mag = sqrt(sum);	

	return;
}

void matrix_normalize (COMPLEX_MATRIX a, COMPLEX_MATRIX *b, float *mag)
{
	unsigned int i;
	float temp;
	
	//Compute magnitude
	matrix_magnitude (a, &temp);

	//Normalize the matrix by dividing the magnitude
	b->rows = a.rows;
	b->cols = a.cols;
	b->t =(COMPLEX_NUM*) malloc ((b->rows*b->cols) * sizeof(COMPLEX_NUM)); 
	for(i=0;i<(a.rows*a.cols);i++)
	{
		b->t[i].r = a.t[i].r / temp;
		b->t[i].i = a.t[i].i / temp;
	}	
	*mag = temp;
	return;
}


void matrix_scalar_mul (COMPLEX_MATRIX a, COMPLEX_NUM scalar, COMPLEX_MATRIX* b)
{
	unsigned int i,j;
	b->rows = a.rows;
	b->cols = a.cols;
	b->t =(COMPLEX_NUM*) malloc ((b->rows*b->cols) * sizeof(COMPLEX_NUM));

	for(i=0;i<a.rows;i++)
		for(j=0;j<a.cols;j++){
                        b->t[(i*a.cols) + j].r = (a.t[(i*a.cols) + j].r * scalar.r) - (a.t[(i*a.cols) + j].i * scalar.i);
                        b->t[(i*a.cols) + j].i = (a.t[(i*a.cols) + j].i * scalar.r) + (a.t[(i*a.cols) + j].r * scalar.i);
                 }          
	return;
}

void matrix_mul (COMPLEX_MATRIX a, COMPLEX_MATRIX b , COMPLEX_MATRIX* c)
{
	if(a.cols != b.rows)
	{
		printf("--Error!: Different matrix dimensions. Matrix multiplication failed.--\n");
		return;
	}
	c->rows = a.rows;
	c->cols = b.cols;	

	unsigned int i,j,k,l;
	COMPLEX_NUM sum,temp;
	c->t =(COMPLEX_NUM*) malloc ((c->rows*c->cols) * sizeof(COMPLEX_NUM)); 

	for(i=0;i<c->rows;i++)
	{
		for(j=0;j<c->cols;j++)
		{
			sum.r = 0;
			sum.i = 0;
			for(k=0;k<a.cols;k++)
			{
                                temp.r = (a.t[(i*a.cols) + k].r * b.t[(k*b.cols) + j].r) - (a.t[(i*a.cols) + k].i * b.t[(k*b.cols) + j].i);
                                temp.i = (a.t[(i*a.cols) + k].i * b.t[(k*b.cols) + j].r) + (a.t[(i*a.cols) + k].r * b.t[(k*b.cols) + j].i);
				sum.r += temp.r;
				sum.i += temp.i;
			}
			c->t[(i*c->cols) + j].r = sum.r;
			c->t[(i*c->cols) + j].i = sum.i;
		}
	}
	return;
}


