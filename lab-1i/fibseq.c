#include <stdio.h>
#include <time.h>


extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;
  FILE * output;
  clock_t start_time, end_time;
  float total_time = 0;
  
  output = fopen("output.txt", "a+");

  scanf("%d",&number);
  start_time = clock();
  result = fibonacci(number);
  end_time = clock();   
  total_time = (float)(end_time - start_time)/CLOCKS_PER_SEC;
  fprintf(output, "%d %f\n", number, total_time);
  printf("%d %d %f \n", number, result, total_time);
  return result;
}

