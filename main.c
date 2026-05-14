#include <ctype.h>
#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

int main() {
    // Open file to dump
    FILE* file = fopen("binary.out", "rb");

    // If file couldn't be opened, return error
    if (file == NULL) {
        printf("Unable to open file");
        return 1;
    }

    // Otherwise read file
    uint8_t buffer[16]; // 16 bytes per line
    // Read 16 bytes until no bytes left to read
    for (
        size_t addr = 0, bytes_read;
        (bytes_read = fread(&buffer, sizeof(uint8_t), 16, file));
        addr += bytes_read
    ) {
        // Print line address
        printf("%08zx ", addr);

        // Print each byte as hex, and replace bytes beyond file bounds with spaces
        for (int i = 0; i < 16; i++) {
            if (i >= bytes_read) {
                printf("   ");
            } else {
                printf("%02x ", buffer[i]);
            }
        }

        // Print each byte as ASCII, replacing non-ASCII with '.' and bytes beyond file bounds with spaces
        printf("|");
        for (int i = 0; i < 16; i++) {
            if (i >= bytes_read) {
                printf(" ");
            } else if (isprint(buffer[i])) {
                printf("%c", buffer[i]);
            } else {
                printf(".");
            }
        }
        printf("|\n");
    }

    // Close file
    fclose(file);

    return 0;
}