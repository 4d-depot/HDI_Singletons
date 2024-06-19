//%attributes = {}
If ($1.value._disconnectedTime<0)
	If ($1.value2._disconnectedTime<0)
		$1.result:=$1.value._disconnectedTime<$1.value2._disconnectedTime
	Else 
		$1.result:=True:C214
	End if 
Else 
	If ($1.value2._disconnectedTime>0)
		$1.result:=$1.value._disconnectedTime>$1.value2._disconnectedTime
	Else 
		$1.result:=False:C215
	End if 
End if 