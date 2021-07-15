ScriptName BaseObject extends Form

Form Function MakeNewObject(string type) Global
	return OSANative.newobject(type)
EndFunction

bool Function Exists()
	return true 
endfunction

Function Destroy()
	OSANative.DeleteObject(self as form)
EndFunction

