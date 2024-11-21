#ifndef GETLINE_H
#define GETLINE_H

#include <stdio.h>
#include "../include/wincompat.h"

#if !HAVE_GETDELIM
ssize_t getdelim(char **lineptr, size_t *n, int delim, FILE *stream);
#endif

#if !HAVE_GETLINE
ssize_t getline(char **lineptr, size_t *n, FILE *stream);
#endif

#endif /* GETLINE_H */
