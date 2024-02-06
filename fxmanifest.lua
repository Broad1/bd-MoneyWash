name "bd-MoneyWash"
Description "Wash the dirty money you get!"
author 'broad.'
version "1.0"
lua54 'yes'
-- DO NOT TOUCH ^^ For Author Only

-- Define the FX Server version and game type
game "gta5"
fx_version "cerulean"

client_scripts {
    'client.lua',
}


server_scripts { 
    'server.lua',
}

shared_scripts {
    'config.lua',
    '@ox_lib/init.lua', -- UNCOMMENT THIS IF YOUR USING OX LIBS
}

ui_page 'index.html'

files {
    '*.*'
}

escrow_ignore {
'config.lua',
}

dependencies {
"qb-core"
 }