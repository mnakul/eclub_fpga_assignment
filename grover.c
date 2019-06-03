#include<stdio.h>
#include<math.h>
float average(int n,float * amp){
  float sum=0.0,mean;
  for(int i=0;i<n;i++)
    sum = sum + *(amp+i) ;
  mean = sum/n;
  return mean;
}
int main(){
  int n;
  scanf("%d\n",&n);
  float a[n];float amp[n];float mean,k;                            //array a stores the values to be searched through
  for(int i=0;i<n;i++)
    scanf("%f\n",&a[i]);
  for(int i=0;i<n;i++)                                             //array amp stores the corresponding amplitudes
    scanf("%f\n",&amp[i]);
  scanf("%f",&k);
  for(int i=1;i<=n;i++){
    for(int j=0;j<n;j++){
      if(a[j]==k)                                                  //inversion of target
        amp[j]=-amp[j];
    }
    mean=fabs(average(n,amp));
    for(int k=0;k<n;k++){
       amp[k] = fabs(-amp[k] + 2 * mean);                         //inversion about mean
    }
    for(int p=0;p<n;p++)                                           //this for loop prints corresponding amplitude
      printf("%f\t",amp[p]);                                            
    printf("\n");
  }
  mean = average(n,amp);
 
  return 0;
}
