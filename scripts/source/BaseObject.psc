ScriptName BaseObject extends Form

Form Function MakeNewObject(string type) Global Native


bool Function Exists()
	return true 
endfunction

Function Destroy()
	DeleteObject(self as form)
EndFunction

Function DeleteObject(form toDelete) Global Native


