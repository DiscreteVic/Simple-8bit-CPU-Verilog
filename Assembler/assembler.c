#include <stdio.h>
#include <stdlib.h>

#define MAX_MEMORY_SIZE 256

char* opsCmd[] = {"add", "sub", "sta", "stb", "stz", "lsd", "lsu", "sty", "srn", "srr", "lzr", "jpi"};

int strCmp(char* strA, char* strB, int len){
    int i;
    for(i = 0; i < len; i++)
        if(strA[i] != strB[i])
            return -1;
    return 0;
}


int getOpCmd(char *line){
    int i;
    for(i = 0; *opsCmd[i] != '\0'; i++){
        if(strCmp(line,opsCmd[i],3) == 0)
            return i;            
    }
    return -1;
}

int getParam(char *line){
    int i, param;
    param = atoi(line);
    if(param >= 0x0 && param <= 0xF){
        return param;
    }
    else return -1;
}




int main(int argc, char *argv[]){
    int i;
    int op, param;
    if(argc < 2){
        printf("File input needed\n");
        return -1;
    }
    FILE *fin, *fout;
    char buff[255];

    fin = fopen(argv[1], "r");

    if(argc == 3)
        fout = fopen(argv[2], "w");
    else
        fout = fopen("a.mem", "w");

    for(i = 0; i < MAX_MEMORY_SIZE; i++){
        if(fscanf(fin, "%s", buff) == 1){      
            op = getOpCmd(buff);
            if(getOpCmd(buff) != -1){
                if(op == 0x5 || op == 0x6){
                    fscanf(fin, "%s", buff);
                    param = getParam(buff);
                    
                    if(param == -1){
                        printf("Parameter error at line %d\n", i+1);
                        return -1;
                    }
                }
                else
                    param = 0xF;
            }
            else{
                printf("Command error at line %d\n", i+1);
                return -1;
            }
            //printf( "%02X\n", (op<<4)|(param));
            fprintf(fout, "%02X\n", (op<<4)|(param));
        }
        else{
            //printf("FF\n");
            fprintf(fout, "FF\n");
        }    
        
    }
    fclose(fin);
    fclose(fout);   

    return 0;
}