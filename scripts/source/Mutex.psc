ScriptName Mutex Extends BaseObject

; Implementation of Mutex objects, allows you to safely lock threads for safer and easier async programming
; Based on cpp's std::mutex https://www.cplusplus.com/reference/mutex/mutex/

; You can set the spinlock rate in the constructor. For mutexs expected to get high traffic, high values are
; advised. Having many active locks (a dozen or more), high-speed spinlock rates can lock up the mutex object
; which means calls to Unlock() can take a very long time to come through, so please test for worse-case-scenarios.

float property spinlockRate auto

Function Lock()
	while jatomic.compareExchangeInt(jthing, ".lock[0]", 1, 0, createMissingKeys=false, onErrorReturn=-1) == 1
		Utility.WaitMenuMode(spinlockRate)
	endwhile
EndFunction


Function Unlock()
	jatomic.exchangeInt(jthing, ".lock[0]", 0,  createMissingKeys = false, onErrorReturn = -1)
EndFunction




Mutex Function NewObject(float zspinlockRate = 0.02) Global
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
