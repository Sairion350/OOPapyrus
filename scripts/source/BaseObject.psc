ScriptName BaseObject extends Form

;string property ScriptInstanceID auto 

BaseObject Function Construct(string type) Global
	BaseObject ret = MakeNewBoundObject(type) as BaseObject

;	ret.ScriptInstanceID = GetVMHandle(ret as form, type)

	return ret
EndFunction




bool Function Exists()
	return true 
endfunction

Function Destroy()
	DeleteObject(self as form)
EndFunction

















Function DeleteObject(form toDelete) Global Native

Function Scan(form toScan) Global Native

String Function GetVMHandle(form boundForm, string type) Global Native

Form Function MakeNewBoundObject(string type) Global Native

;Function UnbindObjects(form toUnbind) Global Native

; bound objects - always persist
; unbound - persist when initialized as local variables. Seem to die when initialized as a member variable, then said variable no longer references