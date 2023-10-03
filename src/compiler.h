#ifndef clox_compiler_h
#define clox_compiler_h

#include "vm.h"

/*
 * compiles a lox source to a chunk ( bite code for the vm)
 */
bool compile(const char* source, Chunk* chunk);

#endif