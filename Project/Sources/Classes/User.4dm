//The User class represents a user
//The UserHub singleton keeps a Collection of Users to represent all the connected users

shared Class constructor($id : Integer)
	
	This:C1470._id:=$id
	This:C1470._disconnectedTime:=-$id
	This:C1470._disconnectionTime:="-"
	This:C1470._activity:="Arriving in the hub"
	This:C1470.status:="Unauthenticated"
	
shared Function set name($name : Text)
	
	This:C1470._name:=$name
	This:C1470.status:="Connected"
	
shared Function set disconnectedTime($time : Integer)
	
	This:C1470._disconnectedTime:=$time
	This:C1470._disconnectionTime:=String:C10(Current time:C178)
	This:C1470.status:="Disconnected"
	This:C1470._activity:="Leaving the hub"
	
shared Function set status($status : Text)
	
	$file:=Folder:C1567("/RESOURCES/Images/Status").file($status+".png")
	$blob:=$file.getContent()
	var $picture : Picture
	BLOB TO PICTURE:C682($blob; $picture)
	This:C1470._status:=$picture
	This:C1470._statusName:=$status
	
shared Function set activity($activity : Text)
	
	This:C1470._activity:=$activity