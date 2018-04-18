#include <string.h>
#include <stdlib.h>

int write(char * file_name, char * out_content) {
  FILE *fp;
  fp = fopen(file_name, "wb");
  if(fp == NULL) {
    perror("failed to open file");
    return 0;
  }
  int num_out = fwrite(out_content, 1, strlen(file_name), fp);
  fclose(fp);
  return num_out;
}

char* read(char * in_file_name) {
  FILE *fp;
  int len;
  char *buffer;
  fp = fopen(in_file_name, "rb");
  if(fp == NULL) {
    perror("failed to open file");
    return "failed to open file";
  }
  fseek(fp, 0, SEEK_END);
  len = ftell(fp);
  buffer = malloc(sizeof(char) * (len + 1));
  if(buffer == NULL) {
    perror("malloc failed");
    return  "malloc failed";
  }
  fseek(fp, 0, SEEK_SET);
  fread(buffer, len + 1, sizeof(char), fp);
  fclose(fp);
  return buffer;
}




