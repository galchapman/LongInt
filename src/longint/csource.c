#include "headers/longint.h"

#include <stdint.h>
#include <stdlib.h>

struct long_int {
	size_t size;
	uint64_t data[];
};

LONGINT* newLongInt() {
	return _allocLongInt(0);
}

LONGINT* _allocLongInt(size_t length) {
	LONGINT* ptr = (LONGINT*)malloc(sizeof(size_t) + sizeof(uint64_t) * length);
	ptr->size = 0;
	return ptr;
}

LONGINT* _reallocLongInt(LONGINT* old, size_t length) {
	LONGINT* ptr = realloc(old, sizeof(size_t) + sizeof(uint64_t) * length);
	ptr->size = length;
	return ptr;
}