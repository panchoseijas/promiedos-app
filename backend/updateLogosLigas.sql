UPDATE "Competition" 
SET "logo" = CASE
    WHEN "id" = 'sr:season:118699' THEN 'https://upload.wikimedia.org/wikipedia/en/thumb/0/0f/EFL_Championship_Logo.svg/160px-EFL_Championship_Logo.svg.png'
    WHEN "id" = 'sr:season:119835' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/Ligue_1_2024_Logo.png/175px-Ligue_1_2024_Logo.png'
    WHEN "id" = 'sr:season:119799' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/Eredivisie_nieuw_logo_2017-.svg/250px-Eredivisie_nieuw_logo_2017-.svg.png'
    WHEN "id" = 'sr:season:118691' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/LaLiga_EA_Sports_2023_Horizontal_Logo.svg/250px-LaLiga_EA_Sports_2023_Horizontal_Logo.svg.png'
    WHEN "id" = 'sr:season:118693' THEN 'https://upload.wikimedia.org/wikipedia/en/thumb/d/df/Bundesliga_logo_%282017%29.svg/1200px-Bundesliga_logo_%282017%29.svg.png'
    WHEN "id" = 'sr:season:114317' THEN 'https://upload.wikimedia.org/wikipedia/commons/thumb/9/92/Logo_de_la_Liga_Profesional_de_F%C3%BAtbol_de_Argentina.svg/200px-Logo_de_la_Liga_Profesional_de_F%C3%BAtbol_de_Argentina.svg.png'
    WHEN "id" = 'sr:season:118689' THEN 'https://static.wikia.nocookie.net/fifa/images/9/92/Premier_League_2017.png/revision/latest?cb=20170204014330&path-prefix=es'
	WHEN "id" = 'sr:season:119847' THEN 'https://upload.wikimedia.org/wikipedia/commons/5/5a/S%C3%ADmbolo_da_Liga_Portuguesa_de_Futebol_Profissional.png'
    
    
    ELSE logo
END
WHERE "id" IN ('sr:season:118699',
'sr:season:119835',
'sr:season:119799',
'sr:season:118691',
'sr:season:118693',
'sr:season:114317',
'sr:season:118689',
'sr:season:119847');


-- SELECT * FROM "Competition"


