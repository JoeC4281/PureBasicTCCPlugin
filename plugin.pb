EnableExplicit

Import ""
  wprintf.i(format.s)
EndImport

Structure PLUGININFO_STRUCT
    *pszDll
	*pszAuthor
	*pszEmail
	*pszWWW
	*pszDescription
	*pszFunctions	
	nMajor.l
	nMinor.l
	nBuild.l
	hModule.i
	*pszModule
EndStructure

ProcedureDLL.i InitializePlugin()
  ProcedureReturn #Null  
EndProcedure

ProcedureDLL.i ShutdownPlugin(bEndProcess.b)
  ProcedureReturn #Null  
EndProcedure

ProcedureDLL.i GetPluginInfo()
  Static pi.PLUGININFO_STRUCT
  Static DLLname.s
  Static DLLauth.s
  Static DLLmail.s
  Static DLLwww.s
  Static DLLdesc.s
  Static DLLfuns.s
  
  DLLname = "PBPlugin"
  DLLauth = "Joe Caverly"
  DLLmail = "jlcaverlyca@yahoo.ca"
  DLLwww  = "https://www.twitter.com/JoeC4281"
  DLLdesc = "TCC Plugin Template written using Purebasic"
  DLLfuns = "Dummy,@Reverse,@PlusOne,_hello"
  
  pi\pszDll         = @DLLname
  pi\pszAuthor      = @DLLauth
  pi\pszEmail       = @DLLmail
  pi\pszWWW         = @DLLwww
  pi\pszDescription = @DLLdesc
  pi\pszFunctions	= @DLLfuns
  pi\nMajor.l       = 2021
  pi\nMinor.l       = 08
  pi\nBuild.l       = 27

  ProcedureReturn @pi
EndProcedure

; Command
ProcedureDLL.i Dummy(*lpszString)
  Static theString.s
  Static theValue.i
  
  theString = PeekS(*lpszString)
  
  If Len(theString) < 1
    wprintf("USAGE: Dummy <text>")
  Else
    theString = LTrim(RTrim(theString))
    wprintf(theString)
  EndIf
  
  ProcedureReturn #Null
EndProcedure

; Function
ProcedureDLL.i f_Reverse(*lpszString)
  Static theString.s
  Static theValue.i
  
  theString = PeekS(*lpszString)
  theString = ReverseString(theString)
  
  PokeS(*lpszString,theString)
  
  ProcedureReturn #Null
EndProcedure

; Function
ProcedureDLL.i f_PlusOne(*lpszString)
  Static theString.s
  Static theValue.i
  
  theString = PeekS(*lpszString)
  
  theValue = Val(theString)
  theValue = theValue + 1
  
  theString = Str(theValue)
  
  PokeS(*lpszString,theString)
  
  ProcedureReturn #Null
EndProcedure

; Internal Variable
ProcedureDLL.i _hello(*lpszString)
  PokeS(*lpszString,"Hello!")
  
  ProcedureReturn #Null
EndProcedure
