//The UserHub is the main class handling the list of connected users
//Any process can add or remove users from its Collection by calling the appropriate shared functions

property userList : Collection  //Collection of all the users
property currentUserId : Integer  //Id of the current user (so all users get a different id)

//shared singleton keywords mean it's an application wide singleton
shared singleton Class constructor()
	
	This:C1470.currentUserId:=0
	This:C1470.userList:=New shared collection:C1527()
	
	//The shared keyword is equivalent to use/end use
shared Function newUser()->$user : cs:C1710.User
	
	This:C1470.currentUserId+=1
	$user:=cs:C1710.User.new(This:C1470.currentUserId)
	This:C1470.userList.push($user)
	This:C1470.sortList()
	
shared Function removeUser($user : cs:C1710.User)
	
	$user:=This:C1470.userList.find(Formula:C1597($1.value._id=$user._id))
	
	If ($user#Null:C1517)
		$user.disconnectedTime:=Tickcount:C458
	End if 
	
	This:C1470.sortList()
	
shared Function getUser($userID : Integer)->$user : cs:C1710.User
	
	For each ($currentUser; This:C1470.userList)
		
		If ($currentUser._id=$userID)
			$user:=$currentUser
			return 
		End if 
		
	End for each 
	
	//The exposed keyword allows Qodly to call this function
exposed shared Function connect()->$userId : Integer
	
	$user:=This:C1470.newUser()
	$userId:=$user._id
	
	//The exposed keyword allows Qodly to call this function
exposed shared Function disconnect($userId : Integer)
	
	This:C1470.removeUser(This:C1470.getUser($userId))
	
shared Function refresh()
	
	This:C1470.userList:=This:C1470.userList
	
shared Function sortList()
	
	This:C1470.userList.sort("SortByDate")
	
	While ((This:C1470.userList.last()#Null:C1517) && (This:C1470.userList.last()._disconnectedTime>0) && (Tickcount:C458>(This:C1470.userList.last()._disconnectedTime+(60*60))))
		This:C1470.userList.pop()
	End while 
	
	//The exposed keyword allows Qodly to call this function
exposed shared Function getUserList()->$userList : Collection
	
	This:C1470.sortList()
	
	$userList:=New collection:C1472()
	For each ($item; This:C1470.userList)
		$user:=New object:C1471("_disconnectionTime"; $item._disconnectionTime; "_id"; $item._id; "_statusName"; $item._statusName; "_name"; $item._name; "_activity"; $item._activity)
		$userList.push($user)
	End for each 
	
	//The exposed keyword allows Qodly to call this function
exposed shared Function changeCurrentUserName($userId : Integer; $name : Text)
	
	$user:=This:C1470.getUser($userId)
	If ($user#Null:C1517)
		$user.name:=$name
	End if 
	
exposed shared Function changeCurrentUserActivity($userId : Integer; $activity : Text)
	
	$user:=This:C1470.getUser($userId)
	If ($user#Null:C1517)
		$user.activity:=$activity
	End if 