; EnableExplicit

Import ""
  wprintf.i(format.s)
EndImport

Structure PLUGININFO_STRUCT
  pszDll.l
	pszAuthor.l
	pszEmail.l
	pszWWW.l
	pszDescription.l
	pszFunctions.l
	nMajor.l
	nMinor.l
	nBuild.l
	hModule.i
	pszModule.s
EndStructure

ProcedureDLL.l InitializePlugin()
  OutputDebugString_("InitializePlugin")
  ProcedureReturn #Null  
EndProcedure

ProcedureDLL.l ShutdownPlugin(bEndProcess.b)
  OutputDebugString_("ShutdownPlugin")
  ProcedureReturn #Null  
EndProcedure

ProcedureDLL.l GetPluginInfo()
  OutputDebugString_("GetPluginInfo")
  Static pi.PLUGININFO_STRUCT
  Define DLLname.s
  Define DLLauth.s
  Define DLLmail.s
  Define DLLwww.s
  Define DLLdesc.s
  Define DLLfuns.s
  
  DLLname = "Plugin Dummy"
  DLLauth = "Joe Caverly"
  DLLmail = "jlcaverlyca@yahoo.ca"
  DLLwww  = "https://www.twitter.com/JoeC4281"
  DLLdesc = "TCC Plugin Template written using Purebasic"
  DLLfuns = "@Reverse"
  
  pi\pszDll         = @DLLname
  pi\pszAuthor      = @DLLauth
  pi\pszEmail       = @DLLmail
  pi\pszWWW         = @DLLwww
  pi\pszDescription = @DLLdesc
  pi\pszFunctions   = @DLLfuns
  
  pi\nMajor = 2021
  pi\nMinor = 8
  pi\nBuild = 7
  
  ProcedureReturn @pi
EndProcedure

ProcedureDLL.l f_Reverse(*pstrArgs)
  wprintf("Hello World!\r\n")
  Define ArgumentString$
  
;   https://www.purebasic.fr/english/search.php?st=0&sk=t&sd=d&sr=posts&keywords=peeks&start=30  
  
;  *pstrArgs.String = @*pstrArgs
  
  ArgumentString$ = PeekS(*pstrArgs,256,#PB_Unicode)
  OutputDebugString_(@ArgumentString$)
  ArgumentString$ = ReverseString(ArgumentString$)
  OutputDebugString_(@ArgumentString$)
  
  ProcedureReturn #Null
EndProcedure

; IDE Options = PureBasic 5.73 LTS (Windows - x64)
; ExecutableFormat = Shared dll
; Folding = -
; EnableXP
; Executable = test.dll
; Compiler = PureBasic 5.73 LTS (Windows - x64)