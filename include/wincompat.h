#ifndef WINCOMPAT_H
#define WINCOMPAT_H

#include <windows.h>
#include <ws2tcpip.h>

/* Windows API fonksiyonları */
#ifndef WINAPI
#define WINAPI __stdcall
#endif

BOOL WINAPI SetDllDirectoryA(LPCSTR lpPathName);
BOOL WINAPI SetSearchPathMode(DWORD Flags);

#ifdef _MSC_VER
#include <BaseTsd.h>
typedef SSIZE_T ssize_t;
#else
#ifndef ssize_t
#ifdef _WIN64
typedef long long ssize_t;
#else
typedef long ssize_t;
#endif
#endif
#endif

#ifndef strdup
#define strdup _strdup
#endif

#ifndef BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE
#define BASE_SEARCH_PATH_ENABLE_SAFE_SEARCHMODE 0x00000001
#endif

#ifndef BASE_SEARCH_PATH_PERMANENT
#define BASE_SEARCH_PATH_PERMANENT 0x00008000
#endif

#define sleep(x) Sleep((x) * 1000)

#endif /* WINCOMPAT_H */