#NoEnv

toggle_alternate() {
 static t
 t := !t
 Return, t
}

_SendIt(Key)
{  
	Send, {%key% down}
	Sleep, 50
	Send, {%key% up}
	Sleep, 50
	Return
}


AlternateKeypress(Key1, Key2)
{
   if (toggle_alternate())
   {
	 _SendIt(Key1)
   }
	else
	{
	_SendIt(Key2)
	}	
}
