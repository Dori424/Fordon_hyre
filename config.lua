Config = {}

Config.esx_version = 'esx_legacy' -- om du vill ha revoked skriv (revoked) om vill ha esx skriv (esx_legacy)

-- om du inte vet vad revoked är så är det gamla ESX

Config.spawn = {
    pedcoords = vec4(412.0883, 315.1540, 102.1327, 209.4362),
    fordonSpawn = vec(390.5172, 290.6028, 102.5888, 154.4107)
}

Config.blip = {
    synlig = true,
    typ = 205,-- vilken bild på blipen.
    color = 51 -- färgen på blipen
}


Config.fordon = { -- lägg hur många fordon du önskar
    {
        model = 'bmx',
        titel = 'Bmx',
        pris = 500,
        typ = 'cyckel'

    },
    {
        model = 'faggio',
        titel = 'Moppe',
        pris = 1250,
        typ = 'motorcyckel'
    }
    
}
