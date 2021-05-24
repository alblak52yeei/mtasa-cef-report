local sx, sy = guiGetScreenSize( )
local UI = { }
local bState = true

guiSetInputMode( 'no_binds_when_editing' )

addEvent( 'OnClientSendReport',true )
addEventHandler( 'OnClientSendReport', root, function( sMessage )
	if (sMessage == '' or not sMessage)  then 
		return outputChatBox('[Репорт]#ffffff Вы не заполнили поле!', 255, 0, 0, true) 
	end
	triggerServerEvent( 'OnPlayerSendReport', resourceRoot, sMessage )
	ShowUI_Report( false )
end)

function RemoveElements( )
	for _, v in pairs( UI ) do
		if (isElement( v )) then
			v:destroy( )
		end
	end
	UI = { }
end

function ShowUI_Report( state )
	if state then
		UI.Window = guiCreateBrowser( 0, 0, sx, sy, true, true, false )
		UI.Browser = guiGetBrowser( UI.Window )
		addEventHandler( 'onClientBrowserCreated', UI.Browser, function ( ) loadBrowserURL( source, 'http://mta/local/index.html' ) end ) 
	else
		RemoveElements( )
	end
	bState = not bState
	showCursor( state or false )
end
addEvent( 'ShowUI_Report',true )
addEventHandler( 'ShowUI_Report', root, ShowUI_Report )

bindKey( 'F10', 'down', function ( )
	ShowUI_Report( bState )
end )