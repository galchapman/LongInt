#include <stdio.h>
#include <stdlib.h>

#include "longint.h"

int main(void) {
	LONGINT* num = newLongInt();

	free(num);
	return 0;
}