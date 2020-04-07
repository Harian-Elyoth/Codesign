#include <stdio.h>
#include <stdlib.h>

int dumpFile(char *fname)
{
    FILE *fp = NULL;
    size_t bytes_counter = 0;
    size_t nb_received_bytes;
    unsigned char byte;
    int err_num = 0;

    fp = fopen(fname, "rb");
    FILE *ftext = fopen("lw3.txt", "w");
    if (fp == NULL)
        return 2;
    while (1)
    {
        nb_received_bytes = fread(&byte, 1, 1, fp);
        if (nb_received_bytes == 0)
            break;
        if ((bytes_counter & 0x0f) == 0)
            fprintf(ftext, "\n");
        //printf("%02x ", byte);
        fprintf(ftext, "%d", byte);
        bytes_counter++;
    }
    if (fp != NULL)
        fclose(fp);
    printf("\n");
    return err_num;
}

int main(int argc, char **argv)
{
    if (argc < 2)
        return 1;
    return dumpFile(argv[1]);
}