ScriptName Mutex Extends BaseObject

; Implementation of Mutex objects, allows you to safely lock threads for safer and easier async programming
; Based on cpp's std::mutex https://www.cplusplus.com/reference/mutex/mutex/

float property spinlockRate auto

Function Lock()
	while jatomic.exchangeInt(jthing, ".lock[0]", 1, createMissingKeys = false, onErrorReturn = -1) == 1
		Utility.WaitMenuMode(spinlockRate)
	endwhile
EndFunction


Function Unlock()
	JValue.solveIntSetter(jthing, ".lock[0]", 0)
EndFunction




Mutex Function NewObject(float zspinlockRate = 0.01) Global
	Mutex obj = BaseObject.Construct("Mutex") as Mutex 
	
	obj.Setup(zspinlockRate)

	return obj
EndFunction 

Function Setup(float zspinlockRate)
	jthing = jmap.object()
	jvalue.retain(jthing)
	JValue.solveIntSetter(jthing, ".lock[0]", 0, true)
	spinlockRate = zspinlockRate
EndFunction

Event Destroy()
	JValue.release(jthing)

	Parent.Destroy()
EndEvent


int jthing
