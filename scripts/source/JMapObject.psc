ScriptName JMapObject extends JValueObject

JMapObject Function NewObject(int sourcejmap = -1, string sourceFile = "") Global
	JMapObject obj = BaseObject.Construct("JMapObject") as JMapObject
	
	if sourcejmap != -1 
		obj.data = sourcejmap
	elseif sourceFile != ""
		obj.readfromfile(sourceFile)
	else 
		obj.data = JMap.object()
	endif 

	JValue.retain(obj.data)

	return obj
EndFunction 


int Function GetInt(string map_key, int default = 0)
	return JMap.getInt(data, map_key, default)
EndFunction

float Function GetFloat(string map_key, float default = 0.0)
	return JMap.GetFlt(data, map_key, default)
EndFunction

string Function GetString(string map_key, string default = "")
	return JMap.getStr(data, map_key, default)
EndFunction

Form Function GetForm(string map_key, form default = none)
	return JMap.getForm(data, map_key, default)
EndFunction

JArrayObject Function GetObjectJArray(string map_key)
	return JArrayObject.newObject(JMap.getObj(data, map_key, -1))
EndFunction

JMapObject Function GetObjectJMap(string map_key)
	return JMapObject.newObject(JMap.getObj(data, map_key, -1))
EndFunction



Function SetInt(string map_key, int value)
	JMap.setInt(data, map_key, value)
EndFunction

Function SetFloat(string map_key, float value)
	JMap.setFlt(data, map_key, value)
EndFunction

Function SetString(string map_key, string value)
	JMap.setStr(data, map_key, value)
EndFunction

Function SetForm(string map_key, form value)
	JMap.setForm(data, map_key, value)
EndFunction

Function SetObject(string map_key, jvalueobject value)
	JMap.setObj(data, map_key, value.data)
EndFunction



int Function ValueType(string map_key)
	return jmap.ValueType(data, map_key)
EndFunction

JMapObject Function Copy()
	return JMapObject.NewObject(JValue.deepCopy(data))
EndFunction

string[] Function AllKeys()
	return jmap.allKeysPArray(data)
EndFunction

JArrayObject Function AllValues()
	return JArrayobject.NewObject(jmap.allValues(data))
EndFunction

bool function hasKey(string map_key)
	return jmap.hasKey(data, map_key)
EndFunction

Function Merge(JMapObject other, bool overrideDuplicates = false)
	jmap.addPairs(data, other.data, overrideDuplicates)
EndFunction

