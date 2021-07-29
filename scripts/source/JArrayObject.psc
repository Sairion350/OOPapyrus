ScriptName JArrayObject extends JValueObject


JArrayObject Function NewObject(int jarr = -1, string sourceFile = "") Global
	JArrayObject obj = BaseObject.Construct("JArrayObject") as JArrayObject
	
	if jarr != -1 
		obj.data = jarr
	elseif sourceFile != ""
		obj.readfromfile(sourceFile)
	else 
		obj.data = JArray.object()
	endif 

	JValue.retain(obj.data)

	return obj
EndFunction 


int Function GetInt(int index, int default = 0)
	return JArray.getInt(data, index, default)
EndFunction

float Function GetFloat(int index, float default = 0.0)
	return JArray.GetFlt(data, index, default)
EndFunction

string Function GetString(int index, string default = "")
	return JArray.getStr(data, index, default)
EndFunction

Form Function GetForm(int index, form default = none)
	return JArray.getForm(data, index, default)
EndFunction

JArrayObject Function GetObjectJArray(int index)
	return JArrayObject.newObject(JArray.getObj(data, index, -1))
EndFunction

;JMapObject Function GetObjectJMap(int index)
;	return JMapObject.newObject(JArray.getObj(data, index, -1))
;EndFunction

