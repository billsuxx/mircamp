 
                                             | n F 3 r N 0 script
                                              made by scottanyo

                                      [ http://inferno.hq.hu - infern0@fw.hu ]

 
                                           mIRCamp - IRC Mania edition 


News:
-----

 0.5 2004.06.17 
 - t�mogatott mirc: 6.14
 - Horcsog-nek post�zom az els� verzi�t
 - design hib�k, winxp 98 style alatt 
  

 0.6 2004.12.23
 - 6.16 -os mIRC nem tesztelt...
 - ind�t�skori hib�s hanger� kijelz�s -> jav�tva



History:
--------


Ez a file a mIRCamp mp3 lej�tsz� readmeje. Fontos inform�ci�kat tartalmaz, ez�rt olvasd el!
Kiemelem, hogy az eredeti mIRCamp �n�ll�an nem terjeszthet�. Ez viszont egy k�l�n kiad�s, csak az IRC M�nia olvas�inak :). 

A kit�m�r�t�s ut�n ezt a k�nyvt�rszerkezetet kell kapod:

..smircamp.mrc
..system/mp_readme.txt
..system/graph/mircamp.ico
..system/graph/edit.ico
..system/dll/swamp.dll


A scriptet �gy tudod megh�vni, hogy a statusba be�rod ezt: /load -rs mircamp.mrc Fontos, hogy a scriptet a mIRC alapk�nyvt�r�ba hozd l�tre (teh�t a mIRC/system -nek l�tre kell j�nnie!) mert csak �gy m�k�dik. Ha ezen v�ltoztatni akarsz, akkor ehhez �t kell �rnod :) Sok sikert, nem neh�z.
Ha sikeresen megnyitotta, akkor ezt jelzi is. Public parancsa a /mp. (menukbe is bele�rja mag�t) Ha nincs megnyitva, akkor elind�tja a progit, ha m�r egyszer fut akkor akt�vv� teszi a dialogot. Kezel�fel�let egy�rtelm�. Az els� f�l�n vannak a kezel�gombok, �s az �ppen j�tszott f�jlr�l megjelen�tett inform�ci�k. Itt tal�lhat� a playlist is, �s a hozz� tartoz� gombok is. Az "Add file" gombbal egy f�jt tudsz hozz�adni, az "Add dir"-rel �rtelemszer�en egy k�nyvt�r �sszes f�jl�t (alk�nyvt�rakat is!). A "Remove"-val a kijel�ltet tudod elt�vol�tani, a "Remove all" az eg�sz list�t t�rli. A "Wp playlist" gombbal (ha van akkor) a Winamp aktu�lis playlistj�t import�lja, de csak az mp3 f�jlokat! Figyelem, csak �gy m�k�dik (egyenl�re, mert lusta vagyok), hogy a Winamp rendszerk�nyvt�r�ba winamp.m3u n�ven elmenti a playlistet, �s ebb�l t�lti fel a saj�tj�t. Ezt nem kell minden egyes ind�t�sn�l megcsin�lni, mert elmenti automatikusan a list�t. 
Az k�vetkez� f�l�n lehet igaz�b�l szerkeszteni a list�t. Tudod fel ill. le mozgatni a sz�mokat, t�r�lni egyet, hozz�adni egyet, �s a playlisten megjelen� nev�t v�ltoztatni.

A script �gy dolgozza fel a megjelen�tend� sz�veges adatokat (el�ad�/c�m), hogy el�sz�r az id3 tagot n�zi (ha csak v2 van, az nem j�!) ha nincsen, akkor a f�jl nev�b�l szedi ki. (Mivel �lt. �gy n�z ki egy f�jl neve, hogy Boriska zenekarja - Git�rz�z�s �gy ez alapj�n pr�b�lja meg el�vakarni az adatokat. Na nem tudja, akkor no artist, no titlet ad neki.)

Itt elmondan�m, hogy nem kell megijedni, hogy a /timer parancs kiad�s�ra rengetek akt�v timert tal�lsz. Amiket a script haszn�l mindig .sc.mp n�vvel kezd�dnek.

P�r egy�b funkci�, ami csak �gy eszembe jut:
- teles k�r� lej�tsz�s: play/pause/stop/next/prev
- hanger� �ll�t�s
- v�letlenszer� lej�tsz�s ki-be
- informativ kijelz�s
- nagyfok� desginol�si lehet�s�g :) (magyarul megszabhatod, hogy milyen inform�ci�kat k�ldj�n a csatira az 
  �ppen j�tszott zen�b�l)

Term�szetesen nincs copyright, de az�rt p�r dolgot k�rlek tarts be:
 a; csak egyben, az eredeti csomagolt :) form�tumba terjeszthet� ezen a n�v alatt
 b; ha valahova public helyre felrakod (website...) akkor k�rlek �rtes�ts engem
 c; ha felhaszn�lod saj�t scriptedben �s publik�lod saj�t n�v alatt, akkor is sz�lj, �s ha lehet a nevemet �s c�memet is 
    eml�tsd meg :)
 d; nem jut t�bb eszembe :)


Sajnos mivel ez m�g egy er�sen b�ta verzi�, gyakran "bug-ozhat". Eddig siker�lt kider�tenem azt, hogy nem szereti az igen hossz�ra sikeredett k�nyvt�rszerkezetet. Sz�val ett�l tart�zkodj�l. Ha nagyon �sszegubancol�dott, akkor: /unload -rs mircamp.mrc. Ekkor elt�ntetni a v�ltoz�it. H�vd be �jra �s l�gy t�relmes. Ha siker�l reproduk�lnod a hib�t, akkor �rtes�ts, mert ezzel is seg�ted a fejleszt�st.
A fejleszt�se mIRC 6.14-en indult el, k�zben meg�rkezett a 6.15-�s is. Ezen m�g nem tudtam 100%-osan letetsztelni, �gyhogy az aj�nlott verzi� m�g mindig a 6.14. Nem hajland� m�k�dni 6.12-es alatt sem, mert ekkor az id�ki�r�ssal valami gondja van.


K�sz�tette: scottanyo [IMS/EFC]
Web: http://billsuxx.fw.hu
E-mail: scottanyo@freemail.hu
