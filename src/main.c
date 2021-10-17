#include <stdio.h>
#include <stdlib.h>

#include "longint.h"

int main(void) {
	LONGINT* n = newLongInt();
	
	inc(n);
	((size_t*)n)[1] = -1;
	inc(n);
	inc(n);

	printf("size: %llx, value: %lld\n", *(size_t*)n, cast_uint64(n));

	if ((size_t)n > 1 << 8)
		free(n);
	return 0;
}