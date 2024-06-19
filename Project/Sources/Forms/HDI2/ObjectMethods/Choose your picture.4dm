
$folder:=Folder:C1567("/RESOURCES/Images/Avatar")
$picture:=Select document:C905($folder.platformPath; "*"; "Select a picture"; 0)

If (Not:C34($picture=""))
	$blob:=$folder.file($picture).getContent()
	var $picture : Picture
	BLOB TO PICTURE:C682($blob; $picture)
	Form:C1466.user.picture:=$picture
	
	cs:C1710.UserHub.me.refresh()
	
End if 