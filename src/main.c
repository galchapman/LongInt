#include <stdio.h>
#include <stdlib.h>

#include "longint.h"

void dump_longint(const LONGINT* n) {
	if (*(size_t*)n) {
		for (int i = 0; i < *(size_t*)n; i++) {
			printf("%p ", ((size_t*)n)[i+1]);
		}
		printf("\n");
	} else {
		printf("<none>\n");
	}
}

int main(void) {
	LONGINT* n = newLongInt();

	dump_longint(n);

	if ((size_t)n > 1 << 8)
		free(n);
	return 0;
}