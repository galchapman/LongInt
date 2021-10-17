#include <stdio.h>
#include <stdlib.h>

#include "longint.h"

int main(void) {
	LONGINT* n = newLongInt();
	
	// inc(n);
	_reallocLongInt(n, 2);

	printf("size: %llx\n", *(size_t*)n);

	if ((size_t)n > 1 << 8)
		free(n);
	return 0;
}