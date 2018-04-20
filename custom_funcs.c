#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <memory.h>
#include <string.h>
#include <stdio.h>
#include <ctype.h>
#include <assert.h>

//opens a file, reads its contents into a string, closes the file
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

//opens a file, writes to it (replacing rather than appending) and close it
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

//takes two strings, adds them together, returns a concat string
char* concat(char * str1, char* str2) {
        int size_for_str = (strlen(str1) + strlen(str2) + 1);
        char* return_str = (char *) malloc(size_for_str);
        strcpy(return_str, str1);
        strcat(return_str, str2);
        return(return_str);
}

//convert a string to lower case
char* getLow(char *c){
    int len = strlen(c);
    char* final = (char *) malloc(len);
    int i = 0; 
    while (i < len - 1){
        final[i] = tolower(c[i]); 
        i = i + 1;
    }
    final[i] = c[i];
    return final;
}

//convert a string to upper case
char* getUp(char *c){
    int len = strlen(c);
    char* final = (char *) malloc(len);
    int i = 0; 
    while (i < len - 1){
        final[i] = toupper(c[i]); 
        i = i + 1;
    }
    final[i] = c[i];
    if(strcmp("hello", "word") == 0){
        printf("1");
    }
    return final;
}

//split a string by delimieter and returns a c array from which fi takes only one string at index
char* split(char* a_str, char* a_delim, int choice)
{

    char** result    = 0;
    size_t count     = 0;
    char* tmp        = a_str;
     
    char* last_comma = 0;
    char delim[2];
    
    /* Count how many elements will be extracted. */
    while (*tmp)
    {
        if (delim[0] == *tmp)
        {
            count++;
            last_comma = tmp;
        }
        tmp++;
    }

    /* Add space for trailing token. */
    count += last_comma < (a_str + strlen(a_str) - 1);
    /* Add space for terminating null string so caller knows where the list of returned strings ends. */
    count++;
    result = malloc(sizeof(char*) * count);
    
    if (result)
    {
        size_t idx  = 0;
        printf("delimiter is: %s\n", a_delim);
        printf("string is: %s\n", a_str);
        char* token;
        token = strtok(a_delim, a_str);
    }
    /*
        while (token)
        {
            assert(idx < count);
            *(result + idx++) = strdup(token);
            token = strtok(0, delim);
        }
        assert(idx == count - 1);
        *(result + idx) = 0;
    }
    return result[choice];
    */
    return a_str;
}
/*
int main()
{
        char months[] = "JAN,FEB,MAR,APR,MAY,JUN,JUL,AUG,SEP,OCT,NOV,DEC";
        char** tokens;

        printf("months=[%s]\n\n", months);
        printf("chosen index = 4 (may)\n" );

        tokens = split(months, ',', 4);        
        if (tokens)
        {
            printf("month=[%s]\n", *tokens);
        }
        return 0;
}*/
