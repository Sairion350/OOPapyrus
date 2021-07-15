ScriptName Vector_Form extends BaseObject

;██╗   ██╗███████╗ ██████╗████████╗ ██████╗ ██████╗ 
;██║   ██║██╔════╝██╔════╝╚══██╔══╝██╔═══██╗██╔══██╗
;██║   ██║█████╗  ██║        ██║   ██║   ██║██████╔╝
;╚██╗ ██╔╝██╔══╝  ██║        ██║   ██║   ██║██╔══██╗
; ╚████╔╝ ███████╗╚██████╗   ██║   ╚██████╔╝██║  ██║
;  ╚═══╝  ╚══════╝ ╚═════╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
;                                                   
; Implementation of vectors/dynamic arrays with even more features

Form[] property data auto

Vector_Form Function NewObject() Global
	Vector_Form obj = BaseObject.MakeNewObject("Vector_Form") as Vector_Form 
	
	obj.Clear()

	return obj
EndFunction 

;███████╗██╗     ███████╗███╗   ███╗███████╗███╗   ██╗████████╗     █████╗  ██████╗ ██████╗███████╗███████╗███████╗
;██╔════╝██║     ██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝    ██╔══██╗██╔════╝██╔════╝██╔════╝██╔════╝██╔════╝
;█████╗  ██║     █████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║       ███████║██║     ██║     █████╗  ███████╗███████╗
;██╔══╝  ██║     ██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║       ██╔══██║██║     ██║     ██╔══╝  ╚════██║╚════██║
;███████╗███████╗███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║       ██║  ██║╚██████╗╚██████╗███████╗███████║███████║
;╚══════╝╚══════╝╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝       ╚═╝  ╚═╝ ╚═════╝ ╚═════╝╚══════╝╚══════╝╚══════╝

Form Function Get(int pos)
{Return the element at the position}
	return data[pos]
EndFunction

	Form Function At(int pos)
	{Same as Get()}
		return data[pos]
	EndFunction 

Form Function GetRandom(int min = 0, int max = -1)
{Return a random element, optionally you can define a range}
	if max == -1
		max = data.length - 1
	endif 
	return data[Utility.RandomInt(min, max)]
EndFunction

Form Function Front()
{Return the first element in the array}
	return data[0]
EndFunction 

Form Function Back()
{Return the last element in the array}
	return data[data.Length - 1]
EndFunction 

; ██████╗ █████╗ ██████╗  █████╗  ██████╗██╗████████╗██╗   ██╗
;██╔════╝██╔══██╗██╔══██╗██╔══██╗██╔════╝██║╚══██╔══╝╚██╗ ██╔╝
;██║     ███████║██████╔╝███████║██║     ██║   ██║    ╚████╔╝ 
;██║     ██╔══██║██╔═══╝ ██╔══██║██║     ██║   ██║     ╚██╔╝  
;╚██████╗██║  ██║██║     ██║  ██║╚██████╗██║   ██║      ██║   
; ╚═════╝╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚═╝   ╚═╝      ╚═╝   
                                                             
Bool Function Empty()
{Returns true if the array is empty}
	return data.Length == 0
EndFunction

int Function Size()
{Returns the number of elements}
	return data.Length
EndFunction

int Function Count(form toCount)
{Returns the number of times the given form appears in the array}
	return PapyrusUtil.CountForm(data, toCount)
EndFunction

int Function Find(Form element, int StartIndex = 0)
{Finds the position of the first instance of the given form. Can change the starting position of the search. Returns -1 if not found}
	return data.Find(element, StartIndex)
EndFunction

int Function RFind(Form element, int StartIndex = -1)
{Same as Find() but searched backwards}
	return data.RFind(element, StartIndex)
EndFunction

Bool Function Has(Form toFind)
{Returns true if the vector has the given form}
	return data.Find(toFind, 0) != -1
EndFunction

Function Reserve(int size)
{Pads the array out with NONE forms to reach the given size}
	if size > (data.Length)
		data = Utility.ResizeFormArray(data, size, none)
	endif 
EndFunction


Vector_Form Function Copy()
{Returns a copy of this vector}
	Vector_Form ret = Vector_Form.NewObject()
	ret.data = data 

	return ret
EndFunction

;███╗   ███╗ ██████╗ ██████╗ ██╗███████╗██╗███████╗██████╗ ███████╗
;████╗ ████║██╔═══██╗██╔══██╗██║██╔════╝██║██╔════╝██╔══██╗██╔════╝
;██╔████╔██║██║   ██║██║  ██║██║█████╗  ██║█████╗  ██████╔╝███████╗
;██║╚██╔╝██║██║   ██║██║  ██║██║██╔══╝  ██║██╔══╝  ██╔══██╗╚════██║
;██║ ╚═╝ ██║╚██████╔╝██████╔╝██║██║     ██║███████╗██║  ██║███████║
;╚═╝     ╚═╝ ╚═════╝ ╚═════╝ ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝

Function Set(int pos, form in)
{Set the element at the given position to the given form, expanding the array if out of bounds}
	if (pos) >= (data.Length)
		Reserve(pos + 1)
	endif 

	data[pos] = in 
EndFunction

Function Insert(int pos, form in)
{Insert the given form at the given position, pushing the contents of the array at and after the position forward by 1}
	if (pos) >= (data.Length)
		Reserve(pos + 1)
		data[pos] = in 
	else 
		form[] a = PapyrusUtil.SliceFormArray(data, 0, pos - 1)
		form[] c = PapyrusUtil.SliceFormArray(data, pos)
		form[] b = PapyrusUtil.FormArray(1, in)

		data = PapyrusUtil.MergeFormArray(a, b)
		data = PapyrusUtil.MergeFormArray(data, c)
	endif 
EndFunction

int Function Clear()
{Empty the array}
	data = Utility.CreateFormArray(0, none)
EndFunction

Function Erase(int pos)
{Remove the element at the position and shrink the array to fit}
	form[] b = PapyrusUtil.SliceFormArray(data, 0, pos - 1)
	form[] c = PapyrusUtil.SliceFormArray(data, pos + 1)

	data = PapyrusUtil.MergeFormArray(b, c)
EndFunction

Function Remove(Form ToRemove)
{Remove all instances of the given form and shrink the array to fit}
	data = PapyrusUtil.RemoveForm(data, ToRemove)
EndFunction

Form Function Pop_back()
{Remove and return the final element}
	form ret = Back()
	data = PapyrusUtil.SliceFormArray(data, 0, data.Length - 2)
	return ret
EndFunction

Function Push_back(Form push)
{Add the given form the back of the array}
	data = PapyrusUtil.PushForm(data, push)
EndFunction

Function Swap(Vector_Form other)
{Swap the contents of the array with another vector's}
	form[] hold = data 
	data = other.data 
	other.data = hold
EndFunction

Function Merge(Vector_Form other, bool clearOther = false)
{Add the contents of another vector on to this one. The other vector is untouched unless specified}
	data = PapyrusUtil.MergeFormArray(data, other.data)

	if clearOther
		other.Clear()
	endif
EndFunction

Function Reverse()
{Reverse the element order of the vector}
	form temp
	int start = 0 
	int end = data.Length

	while (start < end)
		temp = data[start]
		data[start] = data[end]
		data[end] = temp

		start += 1
		end -= 1
	EndWhile
EndFunction

Function RemoveDuplicates()
{Remove all duplicate forms so that each form only appears once}
	form[] newArr = Utility.CreateFormArray(0, none)

	int i = 0
	int l = data.length
	while i < l
		if newArr.find(data[i]) == -1 ;if this is a new element we haven't seen yet
			newArr = PapyrusUtil.PushForm(newArr, data[i])
		endif 

		i += 1
	EndWhile

	data = newArr
EndFunction

Function Replace(Form OriginalForm, Form ReplaceWith)
{Replace all instances of the given original form with a specified new form}
	int count = Count(OriginalForm)
	while count > 0 
		int pos = Find(OriginalForm)
		data[pos] = ReplaceWith

		count -= 1
	endwhile
EndFunction

Function Shuffle()
{Shuffle the contents of the vector}
	int i = data.length
    int j ; an index

    form temp
    While (i > 0)
        i -= 1
        j = Utility.RandomInt(0, i)

        temp = data[i]
        data[i] = data[j]
        data[j] = temp 

    EndWhile
EndFunction

Function Sort(bool reverse = false)
{Sort by form ID}
	int i = 0 
	int j = 0
	int l = data.Length
	
	while i < (l - 1)
		while (j < (l - i - 1))
			if (data[j].GetFormID()) > (data[j + 1].GetFormID())
				form temp = data[j]
				data[j] = data[j + 1]
				data[j + 1] = temp
			EndIf

			j += 1
		EndWhile

		i += 1
	endwhile

	if Reverse
		Reverse()
	endif
EndFunction

; ██████╗ ████████╗██╗  ██╗███████╗██████╗ 
;██╔═══██╗╚══██╔══╝██║  ██║██╔════╝██╔══██╗
;██║   ██║   ██║   ███████║█████╗  ██████╔╝
;██║   ██║   ██║   ██╔══██║██╔══╝  ██╔══██╗
;╚██████╔╝   ██║   ██║  ██║███████╗██║  ██║
; ╚═════╝    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝

String Function asString()
{Cast the vector to a string}
	return data as string
EndFunction

Function DestroyAll()
{Destroy all BaseObjects stored in the vector, then destroy this vector}
	ResetLooping()
	While Loop()
		BaseObject b = i() as BaseObject
		
		if b
			b.destroy()
		endif 
	EndWhile

	Parent.Destroy()
EndFunction


int iteration 

Function ResetLooping()
{Reset internal loop counter. Call before using the below}
	iteration = -1
EndFunction

Bool Function Loop()
{Use as such: "While vec.loop()" to simulate for-loop functionality}
	iteration += 1
	return (iteration >= data.Length)
EndFunction

int Function LoopPos()
{Returns the current position the iteration counter is pointing at. Use inside while loops}
	return iteration
EndFunction

Form Function i()
{Returns the current form the iteration counter is pointing at. Use inside while loops}
	return at(iteration)
EndFunction

