#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>
#include <stdio.h>

char* readFile(char * in_file_name) {
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


int writeFile(char * file_name, char * out_content){
  FILE *fp;
  fp = fopen(file_name, "wb");
  if(fp == NULL) {
    perror("failed to open file");
    return 0;
  }
  int num_out = fwrite(out_content, 1, strlen(out_content), fp);
  fclose(fp);
  return num_out;
}

char* concat(char * str1, char* str2) {
        int size_for_str = (strlen(str1) + strlen(str2) + 1);
        char* return_str = (char *) malloc(size_for_str);
        strcpy(return_str, str1);
        strcat(return_str, str2);
        return(return_str);
}
