ScriptName JValueObject extends BaseObject

int property data auto 

int property TypeNoValue = 0 AutoReadOnly
int property TypeNone = 1 AutoReadOnly
int property TypeInt = 2 AutoReadOnly
int property TypeFloat = 3 AutoReadOnly
int property TypeForm = 4 AutoReadOnly
int property TypeObject = 5 AutoReadOnly
int property TypeString = 6 AutoReadOnly

int Function Count()
	return JValue.count(data)
EndFunction

int Function Size()
	return JValue.count(data)
EndFunction

bool Function Empty()
	return JValue.Empty(data)
EndFunction

Function Clear()
	return JValue.clear(data)
EndFunction

Function ReadFromFile(string filepath)
	data = JValue.readFromFile(filepath)
EndFunction

Function WriteToFile(string filepath)
	JValue.writeToFile(data, filepath)
EndFunction


Event Destroy()
	JValue.release(data)

	Parent.Destroy()
EndEvent
