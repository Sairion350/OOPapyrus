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


Function SetInt(int index, int value)
	JArray.setInt(data, index, value)
EndFunction

Function SetFloat(int index, float value)
	JArray.setFlt(data, index, value)
EndFunction

Function SetString(int index, string value)
	JArray.setStr(data, index, value)
EndFunction

Function SetForm(int index, form value)
	JArray.setForm(data, index, value)
EndFunction

Function SetObject(int index, jvalueobject value)
	JArray.setObj(data, index, value.data)
EndFunction


int Function FindInt(int value)
	return JArray.findInt(data, value)
EndFunction

int Function FindFloat(float value)
	return JArray.findFlt(data, value)
EndFunction

int Function FindString(string value)
	return JArray.findStr(data, value)
EndFunction

int Function FindForm(form value)
	return JArray.findForm(data, value)
EndFunction

int Function FindObject(jvalueobject value)
	return JArray.findInt(data, value.data)
EndFunction


int Function CountInt(int value)
	return JArray.countInteger(data, value)
EndFunction

int Function CountFloat(float value)
	return JArray.countFloat(data, value)
EndFunction

int Function CountString(string value)
	return JArray.countString(data, value)
EndFunction

int Function CountForm(form value)
	return JArray.countForm(data, value)
EndFunction

int Function CountObject(jvalueobject value)
	return JArray.countInteger(data, value.data)
EndFunction



Function PushInt(int value)
	JArray.addInt(data, value)
EndFunction

Function PushFloat(float value)
	JArray.addFlt(data, value)
EndFunction

Function PushString(string value)
	JArray.addstr(data, value)
EndFunction

Function PushForm(form value)
	JArray.addform(data, value)
EndFunction

Function PushObject(jvalueobject value)
	JArray.addObj(data, value.data)
EndFunction


Function InsertInt(int at, int value)
	JArray.addInt(data, value, at)
EndFunction

Function InsertFloat(int at, float value)
	JArray.addFlt(data, value, at)
EndFunction

Function InsertString(int at, string value)
	JArray.addstr(data, value, at)
EndFunction

Function InsertForm(int at, form value)
	JArray.addform(data, value, at)
EndFunction

Function InsertObject(int at, jvalueobject value)
	JArray.addObj(data, value.data, at)
EndFunction



int Function EraseInt(int value)
	return JArray.eraseinteger(data, value)
EndFunction

int Function EraseFloat(float value)
	return JArray.erasefloat(data, value)
EndFunction

int Function EraseString(string value)
	return JArray.erasestring(data, value)
EndFunction

int Function EraseForm(form value)
	return JArray.eraseform(data, value)
EndFunction

int Function EraseObject(jvalueobject value)
	return JArray.eraseObject(data, value.data)
EndFunction



int Function ValueType(int index)
	return JArray.ValueType(data, index)
EndFunction