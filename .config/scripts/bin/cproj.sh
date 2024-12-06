#!/bin/env bash

mk=$"CC=gcc
TARGET=build
SRC=src
C_FILES=\$(shell fd .c \$(SRC)/ -t f --color=never)

all: target main

main: \$(SRC)/main.c
	\$(CC) -o \$(TARGET)/main \$(C_FILES)

target:
	mkdir -p \$(TARGET)"

mainc=$"#include <stdio.h>

int main() {
    printf(\"Hello World!\");
    return 0;
}"

mkdir -p src
touch src/main.c
echo -e "$mainc" > src/main.c

touch Makefile
echo -e "$mk" > Makefile


