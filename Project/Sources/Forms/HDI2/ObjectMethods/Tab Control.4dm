$result:=OBJECT Get value:C1743("Tab control")
If ($result.index=1 && Undefined:C82(Form:C1466.user._name))
	$prompt:=Request:C163("Please tell us your name :")
	
	Form:C1466.user.name:=$prompt
	cs:C1710.UserHub.me.refresh()
End if 
If ($result.index=2)
	OPEN URL:C673("http://127.0.0.1/$lib/renderer/?w=HDI")
End if 