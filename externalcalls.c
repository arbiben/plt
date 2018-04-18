#include <math.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

struct string {
  int size;
  char *array;
};

int write(struct string out_file_name, struct string string_to_write) {
  FILE *fp;
  fp = fopen(out_file_name.array, "wb");
  if(fp == NULL) {
    perror("failed to open file");
    return 0;
  }
  int chars_written = fwrite(string_to_write.array, 1, string_to_write.size, fp);
  fclose(fp);
  return chars_written;
}

struct string read(struct string in_file_name) {
  FILE *fp;
  int len;
  char *buffer;
  fp = fopen(in_file_name.array, "rb");
  if(fp == NULL) {
    perror("failed to open file");
    return (struct string) {0, ""};
  }
  fseek(fp, 0, SEEK_END);
  len = ftell(fp);
  buffer = malloc(sizeof(char) * (len + 1));
  if(buffer == NULL) {
    perror("malloc failed");
    return (struct string) {0, ""};
  }
  fseek(fp, 0, SEEK_SET);
  fread(buffer, len + 1, sizeof(char), fp);
  fclose(fp);
  return (struct string) {len, buffer};
}

double __exp_int(int x, int y)
{
  return pow(x, y);
}

double __exp_dbl(double x, double y)
{
  return pow(x, y);
}

#ifdef BUILD_TEST
int main()
{
  printf("5 ^ -2 == %f\n", __exp_int(5, -2));
  printf("5 ^ 0.5 == %f\n", __exp_dbl(5.0, 0.5));
  return 0;
}
#endif



