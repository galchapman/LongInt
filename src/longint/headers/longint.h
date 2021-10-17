#ifndef LONG_INT_H
#define LONG_INT_H

#include <stddef.h>

typedef struct long_int LONGINT; 

#ifdef __cplusplus
extern "C" {
#endif

LONGINT* newLongInt();
LONGINT* _allocLongInt(size_t);
LONGINT* _reallocLongInt(LONGINT*, size_t);

__cdecl size_t len(LONGINT*);
__cdecl void inc(LONGINT*);

#ifdef __cplusplus
}
#endif

#endif // !LONG_INT_H