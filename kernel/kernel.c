#include <stdio.h>

int kernel(void)
{
    printf("%s\r\n", __func__);
}
