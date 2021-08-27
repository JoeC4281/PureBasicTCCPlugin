; These 4 procedures are Windows specific
;

; This procedure is called once, when the program loads the library
; for the first time. All init stuffs can be done here (but not DirectX init)
;
ProcedureDLL AttachProcess(Instance)
EndProcedure
  
  
; Called when the program release (free) the DLL
;
ProcedureDLL DetachProcess(Instance)
EndProcedure
  
  
; Both are called when a thread in a program call or release (free) the DLL
;
ProcedureDLL AttachThread(Instance)
EndProcedure
  
ProcedureDLL DetachThread(Instance)
EndProcedure

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
  
  ; How do I get the text from *pstrArgs?
  ; ReverseString("Stuff") 
  ; How do I return the reversed string back via *pstrArgs?
  
  ProcedureReturn #Null
EndProcedure
