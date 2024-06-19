Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		InitInfo
		Form:C1466.user:=cs:C1710.UserHub.me.newUser()
		
	: (Form event code:C388=On Close Box:K2:21)
		If (Is Windows:C1573 && Get application info:C1599().SDIMode)
			QUIT 4D:C291
		Else 
			cs:C1710.UserHub.me.removeUser(Form:C1466.user)
			CANCEL:C270
		End if 
		
End case 

