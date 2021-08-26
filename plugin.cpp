// PlugIn.cpp - demonstration plugin for TCC 26

#define UNICODE 1
#define _UNICODE 1

#define _ATL_ALLOW_CHAR_UNSIGNED 1

#include <stdio.h>
#include <tchar.h>

#include <windows.h>

#include "PlugIn.h"

BOOL APIENTRY DllMain( HANDLE hModule, DWORD  dwReason, LPVOID lpReserved )
{
	UNREFERENCED_PARAMETER(hModule);
	UNREFERENCED_PARAMETER(lpReserved);
	switch( (int)dwReason )	{
		case DLL_PROCESS_ATTACH:
		case DLL_THREAD_ATTACH:
		case DLL_THREAD_DETACH:
		case DLL_PROCESS_DETACH:
			break;
	}
	return TRUE;
}


DLLExports LPPLUGININFO WINAPI GetPluginInfo( void )
{
	static PLUGININFO piInfo;

	piInfo.pszDll = (LPTSTR)L"Plugin";
	piInfo.pszAuthor = (LPTSTR)L"JP Software";
	piInfo.pszEmail = (LPTSTR)L"support@jpsoft.com";
	piInfo.pszWWW = (LPTSTR)L"https://jpsoft.com";
	piInfo.pszDescription = (LPTSTR)L"Plugin Demo";
	piInfo.pszFunctions = (LPTSTR)L"@reverse,_hello,remark,UNKNOWN_CMD";
	piInfo.nMajor = 1;
	piInfo.nMinor = 0;
	piInfo.nBuild = 1;

	return &piInfo;
}


DLLExports BOOL WINAPI InitializePlugin( void )
{
	return 0;
}


DLLExports BOOL WINAPI ShutdownPlugin( BOOL bEndProcess )
{
	return 0;
}


// this is a variable function called from TCC; it reverses the string argument
DLLExports INT WINAPI f_reverse( LPTSTR lpszString )
{
	if ( lpszString == NULL )
		return 1;

	_wcsrev( lpszString );
	return 0;
}


// this is an internal variable called from TCC
DLLExports INT WINAPI _hello( LPTSTR lpszString )
{
	if ( lpszString == NULL )
		return 1;

	lstrcpy( lpszString, L"Hello, PlugIn World!" );
	return 0;
}


// this is an internal command called from TCC
DLLExports INT WINAPI remark( LPTSTR lpszString )
{
	wprintf( L"What a trivial sample PlugIn!\r\n" );
	return 0;
}


// this is an internal command called from TCC
DLLExports INT WINAPI UNKNOWN_CMD( LPTSTR lpszString )
{
	wprintf( L"What the heck are you doing now?\r\n" );
	return 0;
}
