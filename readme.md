 
                                             | n F 3 r N 0 script
                                              made by scottanyo

                                      [ http://inferno.hq.hu - infern0@fw.hu ]

 
                                           mIRCamp - IRC Mania edition 


News:
-----

 0.5 2004.06.17 
 - támogatott mirc: 6.14
 - Horcsog-nek postázom az elsõ verziót
 - design hibák, winxp 98 style alatt 
  

 0.6 2004.12.23
 - 6.16 -os mIRC nem tesztelt...
 - indításkori hibás hangerõ kijelzés -> javítva



History:
--------


Ez a file a mIRCamp mp3 lejátszó readmeje. Fontos információkat tartalmaz, ezért olvasd el!
Kiemelem, hogy az eredeti mIRCamp önállóan nem terjeszthetõ. Ez viszont egy külön kiadás, csak az IRC Mánia olvasóinak :). 

A kitömörítés után ezt a könyvtárszerkezetet kell kapod:

..smircamp.mrc
..system/mp_readme.txt
..system/graph/mircamp.ico
..system/graph/edit.ico
..system/dll/swamp.dll


A scriptet úgy tudod meghívni, hogy a statusba beírod ezt: /load -rs mircamp.mrc Fontos, hogy a scriptet a mIRC alapkönyvtárába hozd létre (tehát a mIRC/system -nek létre kell jönnie!) mert csak úgy müködik. Ha ezen változtatni akarsz, akkor ehhez át kell írnod :) Sok sikert, nem nehéz.
Ha sikeresen megnyitotta, akkor ezt jelzi is. Public parancsa a /mp. (menukbe is beleírja magát) Ha nincs megnyitva, akkor elindítja a progit, ha már egyszer fut akkor aktívvá teszi a dialogot. Kezelõfelület egyértelmû. Az elsõ fülön vannak a kezelõgombok, és az éppen játszott fájlról megjelenített információk. Itt található a playlist is, és a hozzá tartozó gombok is. Az "Add file" gombbal egy fájt tudsz hozzáadni, az "Add dir"-rel értelemszerûen egy könyvtár összes fájlát (alkönyvtárakat is!). A "Remove"-val a kijelöltet tudod eltávolítani, a "Remove all" az egész listát törli. A "Wp playlist" gombbal (ha van akkor) a Winamp aktuális playlistjét importálja, de csak az mp3 fájlokat! Figyelem, csak úgy mûködik (egyenlõre, mert lusta vagyok), hogy a Winamp rendszerkönyvtárába winamp.m3u néven elmenti a playlistet, és ebbõl tölti fel a sajátját. Ezt nem kell minden egyes indításnál megcsinálni, mert elmenti automatikusan a listát. 
Az következõ fülön lehet igazából szerkeszteni a listát. Tudod fel ill. le mozgatni a számokat, törölni egyet, hozzáadni egyet, és a playlisten megjelenõ nevét változtatni.

A script úgy dolgozza fel a megjelenítendõ szöveges adatokat (elõadó/cím), hogy elõször az id3 tagot nézi (ha csak v2 van, az nem jó!) ha nincsen, akkor a fájl nevébõl szedi ki. (Mivel ált. úgy néz ki egy fájl neve, hogy Boriska zenekarja - Gitárzúzás így ez alapján próbálja meg elõvakarni az adatokat. Na nem tudja, akkor no artist, no titlet ad neki.)

Itt elmondanám, hogy nem kell megijedni, hogy a /timer parancs kiadására rengetek aktív timert találsz. Amiket a script használ mindig .sc.mp névvel kezdõdnek.

Pár egyéb funkció, ami csak úgy eszembe jut:
- teles körú lejátszás: play/pause/stop/next/prev
- hangerõ állítás
- véletlenszerû lejátszás ki-be
- informativ kijelzés
- nagyfokú desginolási lehetõség :) (magyarul megszabhatod, hogy milyen információkat küldjön a csatira az 
  éppen játszott zenébõl)

Természetesen nincs copyright, de azért pár dolgot kérlek tarts be:
 a; csak egyben, az eredeti csomagolt :) formátumba terjeszthetõ ezen a név alatt
 b; ha valahova public helyre felrakod (website...) akkor kérlek értesíts engem
 c; ha felhasználod saját scriptedben és publikálod saját név alatt, akkor is szólj, és ha lehet a nevemet és címemet is 
    említsd meg :)
 d; nem jut több eszembe :)


Sajnos mivel ez még egy erõsen béta verzió, gyakran "bug-ozhat". Eddig sikerült kiderítenem azt, hogy nem szereti az igen hosszúra sikeredett könyvtárszerkezetet. Szóval ettõl tartózkodjál. Ha nagyon összegubancolódott, akkor: /unload -rs mircamp.mrc. Ekkor eltüntetni a változóit. Hívd be újra és légy türelmes. Ha sikerül reprodukálnod a hibát, akkor értesíts, mert ezzel is segíted a fejlesztést.
A fejlesztése mIRC 6.14-en indult el, közben megérkezett a 6.15-ös is. Ezen még nem tudtam 100%-osan letetsztelni, úgyhogy az ajánlott verzió még mindig a 6.14. Nem hajlandó mûködni 6.12-es alatt sem, mert ekkor az idõkiírással valami gondja van.


Készítette: scottanyo [IMS/EFC]
Web: http://billsuxx.fw.hu
E-mail: scottanyo@freemail.hu
