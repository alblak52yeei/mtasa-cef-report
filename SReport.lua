addEvent( "OnPlayerSendReport", true )
addEventHandler( "OnPlayerSendReport", resourceRoot,
    function ( sMessage )
        for _, pElement in ipairs( getElementsByType( 'player' ) ) do
            if (hasObjectPermissionTo( pElement, 'command.ban', true )) then
                pElement:outputChat( '[Репорт] '..client.name..': '..sMessage, 254, 179, 24 )
            end
        end
    end )