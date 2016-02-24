SetBatchLines, -1
api_key:=""				;Enter your key here		

InputBox,long,Goo.gl,Enter the long URL you want to shorten:
if (!long)
ExitApp

if (!Errorlevel)
{

	w := ComObjCreate("WinHTTP.WinHttpRequest.5.1")

	w.Open("POST", "https://www.googleapis.com/urlshortener/v1/url?key=" . api_key)
	w.SetRequestHeader("Content-Type", "application/json")
	Body = {"longUrl": "%long%"}
	w.Send(Body)
	Result := w.ResponseText
	Status := w.Status
	if (Status==200)
	{
	StringSplit,shorturl,result,"
	Gui, add, edit, , % shorturl8
	Gui, show 
	Send, ^c
	}
	else
	{
		MsgBox, % "Error " status " has occurred!"
		ExitApp
	}

}
return

GuiEscape:
GuiClose:
ExitApp

