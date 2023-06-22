#include <stdio.h>
#include <stdlib.h>
#include <string.h>

unsigned char W32_SALITY[] = {0xE8};
unsigned char W32_VIRUT[] = {0x4D, 0x5A};
unsigned char W32_ALMAN[] = {0x55, 0x8B, 0xEC, 0x6A, 0xFF};
unsigned char W32_SASSER[] = {0x33, 0xC0, 0x55, 0x50, 0x53, 0x55};
unsigned char Nimda[] = {0x4E, 0x69, 0x6D, 0x64, 0x61};
unsigned char Mydoom[] = {0x44, 0x61, 0x6E, 0x67, 0x65, 0x72, 0x6F, 0x75, 0x73, 0x20, 0x4D, 0x79, 0x73};
unsigned char CodeRed[] = {0x80};
unsigned char Slammer[] = {0x02};
unsigned char Conficker[] = {0xE1};

unsigned char TEST_VIRUS[] = {0x56, 0x49, 0x52, 0x55, 0x53}; // STRING VIRUS IN COD

unsigned char TEST_VIRUS_2[] = {0x56, 0x49, 0x52, 0x55, 0x53, 0x52, 0x4F, 0x54, 0x41}; // STRING VIRUS IN COD

int checkPatternMatch(const unsigned char *readData, const unsigned char *pattern, size_t patternSize, size_t readDataSize)
{
    for (size_t i = 0; i < readDataSize - patternSize - 1; i++)
        if (memcmp(readData + i, pattern, patternSize) == 0)
            return 1;
    return 0;
}

int main(int argc, char *argv[])
{
    FILE *out = fopen("out.txt", "w");

    FILE *file = fopen(argv[1], "rb"); // Open the executable file in binary mode
    if (file == NULL)
    {
        printf("Failed to open the file.\n");
        return 1;
    }

    // Get the file size
    fseek(file, 0, SEEK_END);
    long fileSize = ftell(file);
    rewind(file);

    // Allocate memory for the file contents
    unsigned char *fileData = (unsigned char *)malloc(fileSize);
    if (fileData == NULL)
    {
        printf("Failed to allocate memory.\n");
        fclose(file);
        return 1;
    }

    // Read the entire file into the memory buffer
    if (fread(fileData, 1, fileSize, file) != fileSize)
    {
        printf("Failed to read the file.\n");
        free(fileData);
        fclose(file);
        return 1;
    }

    for (int i = 0; i < fileSize; i++)
    {
        fprintf(out, "%02X ", fileData[i]);
    }
    printf("%ld", fileSize);

    // Check for pattern matches
    if (checkPatternMatch(fileData, W32_SALITY, sizeof(W32_SALITY), fileSize))
    {
        // Pattern matches W32.Sality
        // Do something
        printf("W32.Sality pattern matched.\n");
    }
    if (checkPatternMatch(fileData, W32_VIRUT, sizeof(W32_VIRUT), fileSize))
    {
        // Pattern matches Win32.Virut
        // Do something else
        printf("Win32.Virut pattern matched.\n");
    }
    if (checkPatternMatch(fileData, W32_ALMAN, sizeof(W32_ALMAN), fileSize))
    {
        // Pattern matches W32.Alman
        // Do something else
        printf("W32.Alman pattern matched.\n");
    }
    if (checkPatternMatch(fileData, W32_SASSER, sizeof(W32_SASSER), fileSize))
    {
        // Pattern matches Win32.Sasser
        // Do something else
        printf("Win32.Sasser pattern matched.\n");
    }
    if (checkPatternMatch(fileData, TEST_VIRUS, sizeof(TEST_VIRUS), fileSize))
    {
        // Pattern matches Win32.Sasser
        // Do something else
        printf("The test virus was matched.\n");
    }
    if (checkPatternMatch(fileData, Nimda, sizeof(Nimda), fileSize))
    {
        // Pattern matches Nimda
        // Do something else
        printf("Nimda pattern matched.\n");
    }
    if (checkPatternMatch(fileData, Mydoom, sizeof(Mydoom), fileSize))
    {
        // Pattern matches Mydoom
        // Do something else
        printf("Mydoom pattern matched.\n");
    }
    if (checkPatternMatch(fileData, CodeRed, sizeof(CodeRed), fileSize))
    {
        // Pattern matches CodeRed
        // Do something else
        printf("CodeRed pattern matched.\n");
    }
    if (checkPatternMatch(fileData, Slammer, sizeof(Slammer), fileSize))
    {
        // Pattern matches Slammer
        // Do something else
        printf("Slammer pattern matched.\n");
    }
    if (checkPatternMatch(fileData, Conficker, sizeof(Conficker), fileSize))
    {
        // Pattern matches Conficker
        // Do something else
        printf("Conficker pattern matched.\n");
    }
    if (checkPatternMatch(fileData, TEST_VIRUS_2, sizeof(TEST_VIRUS_2), fileSize))
    {
        // Pattern matches Conficker
        // Do something else
        printf("Virus 2 pattern matched.\n");
    }

    // Clean up
    free(fileData);
    fclose(file);
}