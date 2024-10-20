fx_version "cerulean"
game "gta5"
lua54 'yes'

author 'dori_scripts'
version '1.0'

shared_scripts {
    "@es_extended/imports.lua",
    "config.lua",
    '@ox_lib/init.lua'
}

server_scripts {
    "server/main.lua"
}

client_scripts {
    "client/main.lua"
}

escrow_ignore {
    "config.lua",

}

dependencies {
    'es_extended',
    'ox_lib',
    'ox_target'
}