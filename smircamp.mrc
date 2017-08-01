;#               mIRCamp - | n F 3 r N 0 script
;                       (IRC Mania editon)
;#  created by scottanyo - http://inferno.hq.hu (infern0@fw.hu)

;# Used dll:
;#           - swamp.dll (Winamp playlist)
;#                  Author: LightStrike
;#                  e-mail: LightStrike@mail.pt

;# The best mp3 player for mIRC!!! :) 
;# mIRCamp can play mp3, and can import the winamp's playlist!!!

on *:load:{
  if ($version < 6.12)  { echo -a  * $chr(91) $+ - $+ $chr(93) mIRcamp must min. 6.12 mIRC! | unload  -rs $script  }
  echo -a  * $chr(91) $+ - $+ $chr(93) mIRCamp loaded | echo -a  * $chr(91) $+ - $+ $chr(93) Created by scottanyo [IMS] | run $mircdirsystem/mp_readme.txt
}
on *:unload: echo -a  * $chr(91) $+ - $+ $chr(93) mIRCamp unloaded  | unset %sc.mp*

menu channel,status {
  mIRCamp
  .load/active: mp
  . $iif($active != Status Window, say): me $sc.mp.say
  . $iif($active != Status Window, advertise): me  $sc.mp.adv
}

DIALOG mp {

  TITLE "I n F 3 r N 0 - mIRCamp"
  SIZE -1 -1 500 300
  ICON system/graph/mircamp.ico
  TAB "Player" 800 , 10 10 480 280
  TAB "Edit playlist" 801
  TAB "Info tag" 802
  TAB "About" 803

  BOX "Control/Time" 700, 25 50 180 180, tab 800
  BOX "Playlist" 701 , 220 50 255 5, tab 800
  EDIT "" , 711, 45 70 140 20, center, read. autohs, tab 800
  EDIT "" , 712, 45 91 140 20, center, read autohs, tab 800
  BUTTON "<" 704, 65 150 20 20, flat, tab  800
  BUTTON "=" 705, 105 150 20 20, flat, tab  800
  BUTTON "|>" 706, 85 150 20 20, flat, tab  800
  BUTTON "[ ]" 707, 125 150 20 20, flat, tab  800
  BUTTON ">" 708, 145 150 20 20, flat, tab  800
  EDIT "start" , 709, 50 120 60 20, center, read tab 800
  EDIT "end", 710 , 120 120 60 20, center, read tab 800
  BUTTON "Add file" , 713 , 25 240 60 15, flat, center, bottom, tab 800
  BUTTON "Add dir" , 735 , 25 255 60 15, flat, center, bottom, tab 800
  BUTTON "Remove" , 714,  90 240 60 15, flat, center, bottom, tab 800
  BUTTON "Remove all" , 715,  90 255 60 15, flat, center, bottom, tab 800
  BUTTON "Wp playlist", 716, 155 240 60 30, flat, center, bottom, tab 800
  LIST 702, 222 65 250 212, tab 800
  BUTTON "+" 717,  40 200 30 18, flat, center, tab 800
  BUTTON "--" 718, 40 180 30 18, flat, center, tab 800
  EDIT "80%" 719, 80 190 40 20, read, center, tab 800
  BUTTON " say" 721, 442 42 30 18, tab 800 
  BUTTON " adv" 722, 400 42 30 18, tab 800 
  CHECK " Shuffle " 720, 135 190 55 20, tab 800
  LIST 723, 152 55 320 212, tab 801
  BOX "" 730, 30 50 122 216, tab 801
  BUTTON "Load list      >" 724, 50 75 80 20, tab 801
  BUTTON "Move up    /'\" 725, 50 105 80 20, tab 801
  BUTTON "Add           +" 726, 50 135 80 20, tab 801
  BUTTON "Edit           *" 727, 50 165 80 20, tab 801
  BUTTON "Delete       --" 728, 50 195 80 20, tab 801
  BUTTON "Move down \./" 729, 50 225 80 20, tab 801

  TEXT "* KAZ| is listening to 'Comp - Do Sumptin' " 736, 40 70 230 20, tab 802
  TEXT "" 743, 40 50 400 20, tab 802
  TEXT "" 744, 240 70 250 20, tab 802

  CHECK " 192Kbps"  738, 100 100 60 20, tab 802
  CHECK " 44KHz" 739, 175 100 55 20, tab 802
  CHECK " 7,24Mb" 740, 240 100 55 20, tab 802
  CHECK " 00:25/05:37" 741, 305 100 90 20 , tab 802

  TEXT "mIRCamp in  | n F 3 r N 0  s c r i p t   v 1 . 0" 731, 30 50 240 20, tab 803
  TEXT "Made by scottanyo (c) 2004 | n F 3 r N 0 project" 732, 30 70 260 20, tab 803
  TEXT "If you need help please: " 733, 30 90 118 20, tab 803
  LINK "click here!" 734, 148 90 90 20, tab 803
}

DIALOG mp_e  {
  TITLE "Edit Descripton"
  ICON $mircdirsystem/graph/edit.ico
  SIZE -1 -1 300 105
  TEXT "Name:"  1, 25 15 50 20
  EDIT "" 2, 25 40 250 20, autohs 
  BUTTON "OK" 3, 90 75 50 20,  flat
  BUTTON "Cancel" 4, 160 75 50 20,  cancel, flat
} 

on 1:mp3end:{
  if (%sc.mp.shu = 0) { sc.mp.next  }
  else {
    sc.mp.rand
  }
}

on 1:DIALOG:mp_e:sclick:3:{
  if ($did(2) = $null) { echo -a * $chr(91) $+ - $+ $chr(93)  Error: pls enter something! | halt }
  else {
    write -l $+ %sc.mp.editn $mircdirsystem/data/mp_name.sco $did(2) 
    did -o mp 723 %sc.mp.editn $did(2) 
    did -o mp 702 %sc.mp.editn $did(2) 
    dialog -x mp_e mp_e
    dialog -ev mp mp
  }
}

on 1:DIALOG:mp:*:*:{
  if ($devent = close) { splay stop | .timer.sc.mp* off | unset %sc.mp.the.time  }

  if ($devent = init) { 
    if ($isfile($mircdirsystem/data/mp_path.sco) = $false) { did -r mp 702 | write -c $mircdirsystem/data/mp_path.sco | write -c $mircdirsystem/data/mp_name.sco  | unset %sc.mp.newtoplay | unset %sc.mp.nowplay  }
    if (%sc.mp.info.kb = 1) { did -o mp  744 1 $did(744) 192Kbps | did -c mp 738 }
    if (%sc.mp.info.kh = 1) { did -o mp  744 1 $did(744) 44KHz   | did -c mp 739 }
    if (%sc.mp.info.mb = 1) { did -o mp  744 1 $did(744) 7,24Mb  | did -c mp 740 }
    if (%sc.mp.info.ss = 1) { did -o mp  744 1 $did(744) 00:25/05:37  | did -c mp 741 }

    if (%sc.mp.shu = 1) { did -c mp 720 )   }
    if (%sc.mp.sorszam != $null) { .timer.sc.mp.lastc 1 2 did -c mp 702 %sc.mp.sorszam | %sc.mp.newtoplay = $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam) }
    unset %sc.mp.nowplay 
    did -o mp 709 1 00:00
    did -o mp 710 1 88:88
    did -o mp 711 1 I n F 3 r N 0 
    did -o mp 712 1 mIRCamp
    sc.mp.upload 702
    did -o mp 719 1  $round($calc(($vol(wave) / 65535) * 100),0) $+ $chr(37)
  }

  ;dupla klikk
  if ($devent = dclick) && ($did = 702) {
    %sc.mp.newtoplay = $read($mircdirsystem/data/mp_path.sco, $did(702).sel)
    %sc.mp.sorszam = $did(702).sel
    %sc.mp.nowplay =  %sc.mp.newtoplay 
    splay -p %sc.mp.nowplay 
    sc.mp.playtimer
    sc.mp.getdata

  }

  ;sima klikk
  if ($devent = sclick) {

    ;listan kivalasztas
    if ($did = 702) {
      %sc.mp.newtoplay = $read($mircdirsystem/data/mp_path.sco, $did(702).sel)
      %sc.mp.sorszam = $did(702).sel
    }

    ;hozzaadas file/dir
    if ($did = 713) { 
      %sc.mp.newfile = $$sfile(*.mp3)
      did -a mp 702  $remove($nopath(%sc.mp.newfile), .mp3)
      write $mircdirsystem/data/mp_path.sco %sc.mp.newfile
      write $mircdirsystem/data/mp_name.sco $nopath(%sc.mp.newfile)
    }
    if ($did = 735) { 
      var %sc.mp.newdir $$sdir(c:\)
      echo -a   * $chr(91) $+ - $+ $chr(93) Search mp3 files in: %sc.mp.newdir $+  $+ .
      var %sc.mp.nemkell   $findfile(%sc.mp.newdir,*.mp3,0, write $mircdirsystem/data/mp_path.sco $1- ) 
      var %sc.mp.nemkell2  $findfile(%sc.mp.newdir,*.mp3,0,      write $mircdirsystem/data/mp_name.sco $nopath( $1-) )
      echo -a   * $chr(91) $+ - $+ $chr(93)  $findfile(%sc.mp.newdir,*.mp3,0, did -a mp 702  $remove($nopath( $1- ), .mp3) ) file succefull added. All files: $lines($mircdirsystem/data/mp_name.sco))  $+  $+ .
    }

    ;import wp list
    if ($did = 716) { sc.mp.getwplist }

    ;egy törlése
    if ($did = 714) && (%sc.mp.newtoplay != $null)  { 
      write -dl $+ $did(702).sel) $mircdirsystem/data/mp_path.sco
      write -dl $+ $did(702).sel)  $mircdirsystem/data/mp_name.sco
      did -d mp 702 $did(702).sel
    }

    ;mind törlése
    if ($did = 715) { did -r mp 702 | write -c $mircdirsystem/data/mp_path.sco | write -c $mircdirsystem/data/mp_name.sco | unset %sc.mp.newtoplay | unset %sc.mp.nowplay }

    ;play
    if ($did = 706) && (%sc.mp.newtoplay != $null) {
      sc.mp.playtimer
      if (%sc.mp.newtoplay !=  %sc.mp.nowplay) {
        %sc.mp.nowplay =  %sc.mp.newtoplay 
        splay -p %sc.mp.nowplay 
        sc.mp.getdata
      }
      else {
        if ($insong = $true ) { splay resume | sc.mp.timer | halt }
        ;splay -p %sc.mp.newtoplay
      }
    }

    ;pause/stop
    if ($did = 705) { splay pause | .timer.sc.mp* off 
      .timer.sc.mp.d* off
      .timer.sc.mp.dpause1  0 1 dialog -t mp I n F 3 r N 0 - mIRCamp ( P A U S E D )
      .timer.sc.mp.dpause2  0 2 dialog -t mp I n F 3 r N 0 - mIRCamp 
    }
    if ($did = 707) {
      .timer.sc.mp* off
      .timer.sc.mp.dstop1  0 1 dialog -t mp I n F 3 r N 0 - mIRCamp ( S T O P E D )
      .timer.sc.mp.dstop2  0 2 dialog -t mp I n F 3 r N 0 - mIRCamp
      splay stop | did -o mp 709 1 00:00 | unset %sc.mp.the.time | unset %sc.mp.nowplay
    }

    ;next/prev szam
    if ($did = 704) { 
      if (%sc.mp.shu = 0) {     sc.mp.prev   }
      else { sc.mp.rand }
    }
    if ($did = 708) {
      if (%sc.mp.shu = 0) {    sc.mp.next     }
      else { sc.mp.rand }
    }

    ;hang fel
    if ($did = 717) { 
      if ( $remove($did(719), $chr(37))  < 100 ) {
        vol -w $calc($vol(wave) + 6553.5)
        did -o mp 719 1  $round($calc(($vol(wave) / 65535) * 100),0) $+ $chr(37)
      }
    }

    ;hang le
    if ($did = 718) {
      if ($remove($did(719), $chr(37)) > 1 ) {
        vol -w  $calc( $vol(wave) - 6553.5 )
        did -o mp 719 1  $round($calc(($vol(wave) / 65535) * 100),0) $+ $chr(37)
      }
    }

    ;véletlen lejatszas
    if ($did = 720) {
      if ($did(720).state = 1) %sc.mp.shu = 1
      if ($did(720).state = 0) %sc.mp.shu = 0
    }

    ;advert
    if ($did = 721) && ($did(711) != $null) ame  $sc.mp.say 
    if ($did = 722)  ame $sc.mp.adv   

    ;EDIT PLAYLIST
    if ($did = 724) { sc.mp.upload 723 }
    if ($did = 725)  && ($did(723).sel != $null) {
      %sc.mp.edit.sor =  $did(723).sel
      var %sc.mp.edit  $read( $mircdirsystem/data/mp_name.sco, $did(723).sel)
      write -dl $+ $did(723).sel $mircdirsystem/data/mp_name.sco
      write -il $+ $calc($did(723).sel - 1)  $mircdirsystem/data/mp_name.sco %sc.mp.edit 
      var %sc.mp.edit2  $read( $mircdirsystem/data/mp_path.sco, $did(723).sel)
      write -dl $+ $did(723).sel $mircdirsystem/data/mp_path.sco
      write -il $+ $calc($did(723).sel - 1)  $mircdirsystem/data/mp_path.sco %sc.mp.edit2  
      did -d mp 723    %sc.mp.edit.sor 
      did -i  mp 723 $calc(    %sc.mp.edit.sor  - 1)   $remove(%sc.mp.edit, .mp3)  
      did -d mp 702    %sc.mp.edit.sor 
      did -i  mp 702 $calc(   %sc.mp.edit.sor   - 1)   $remove(%sc.mp.edit, .mp3)  
    }
    if ($did = 726)  {
      %sc.mp.newfile = $$sfile(*.mp3)
      did -a mp 723  $remove($nopath(%sc.mp.newfile), .mp3)
      did -a mp 702  $remove($nopath(%sc.mp.newfile), .mp3)
      write $mircdirsystem/data/mp_path.sco %sc.mp.newfile
      write $mircdirsystem/data/mp_name.sco $nopath(%sc.mp.newfile)
    }
    if ($did = 727) && ($did(723).sel != $null) {
      %sc.mp.editname = $did(723).seltext 
      %sc.mp.editn = $did(723).sel 
      dialog -m mp_e mp_e 
      did -a mp_e 2 %sc.mp.editname
    }
    if ($did = 728) && ($did(723).sel != $null) { 
      write -dl $+ $did(723).sel $mircdirsystem/data/mp_path.sco
      write -dl $+ $did(723).sel $mircdirsystem/data/mp_name.sco
      did -d mp 723 $did(723).sel
      sc.mp.upload 702
    }
    if ($did = 729) && ($did(723).sel != $null) { 
      %sc.mp.edit.sor =  $did(723).sel
      var %sc.mp.edit  $read( $mircdirsystem/data/mp_name.sco, $did(723).sel)
      write -dl $+ $did(723).sel $mircdirsystem/data/mp_name.sco
      write -il $+ $calc($did(723).sel + 1) $mircdirsystem/data/mp_name.sco %sc.mp.edit 
      var %sc.mp.edit2  $read( $mircdirsystem/data/mp_path.sco, $did(723).sel)
      write -dl $+ $did(723).sel $mircdirsystem/data/mp_path.sco
      write -il $+ $calc($did(723).sel + 1) $mircdirsystem/data/mp_path.sco %sc.mp.edit2  
      did -d mp 723  %sc.mp.edit.sor 
      did -i  mp 723 $calc(%sc.mp.edit.sor  + 1)  $remove(%sc.mp.edit, .mp3) 
      did -d mp 702 %sc.mp.edit.sor 
      did -i  mp 702 $calc(%sc.mp.edit.sor  + 1)   $remove(%sc.mp.edit, .mp3)  
    }
    if ($did = 734) run $mircdirsystem/mp_readme.txt


    ;INFO TAG
    if ($did = 738) {
      if ($did(738).state = 1) {  did -o mp  744 1 $did(744) 192Kbps | %sc.mp.info.kb = 1 }
      if ($did(738).state = 0)  { did -o mp  744 1 $remove($did(744), 192Kbps)  | unset %sc.mp.info.kb  }
    }
    if ($did = 739) {
      if ($did(739).state = 1) { did -o mp  744 1 $did(744) 44KHz | %sc.mp.info.kh = 1 }
      if ($did(739).state = 0) { did -o mp  744 1 $remove($did(744), 44KHz) | unset %sc.mp.info.kh }
    }
    if ($did = 740) {
      if ($did(740).state = 1) { did -o mp  744 1 $did(744) 7,24Mb | %sc.mp.info.mb = 1 }
      if ($did(740).state = 0)  { did -o mp  744 1 $remove($did(744), 7 $+ $chr(44) $+ 24Mb) | unset %sc.mp.info.mb }
    }
    if ($did = 741) {
      if ($did(741).state = 1) { did -o mp  744 1 $did(744) 00:25/05:37 | %sc.mp.info.ss = 1 }
      if ($did(741).state = 0) {  did -o mp  744 1 $remove($did(744),00:25/05:37) | unset %sc.mp.info.ss }
    }
    if ($did > 737) && ($did < 742) {
      if ($did(744) = $chr(40) $+ $chr(32) $+ $chr(41)) { did -o mp 744 1 $chr(32) | %sc.mp.info.null = 1 |  halt  }
      did -o mp 744 1 $chr(40) $remove($did(744),$chr(40),$chr(41)) $chr(41) | unset %sc.mp.info.null
    }

  }
  ;simaklikk vége

}

alias sc.mp.rand {
  %sc.mp.sorszam = $rand(1, $lines($mircdirsystem/data/mp_name.sco) )
  splay -p  $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam)
  %sc.mp.nowplay = $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam)
  %sc.mp.newtoplay =  %sc.mp.nowplay
  did -c mp 702 %sc.mp.sorszam 
  sc.mp.getdata
  sc.mp.playtimer
}

alias sc.mp.next {
  if ($read($mircdirsystem/data/mp_path.sco, $calc(%sc.mp.sorszam + 1 )) != $null) {
    inc %sc.mp.sorszam
    splay -p  $read($mircdirsystem/data/mp_path.sco,%sc.mp.sorszam)
    did -c mp 702 %sc.mp.sorszam
    %sc.mp.nowplay = $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam)
    sc.mp.getdata
    %sc.mp.newtoplay =   %sc.mp.nowplay
    sc.mp.playtimer
  }
  else { sc.mp.first }
}

alias sc.mp.prev {
  if ($read($mircdirsystem/data/mp_path.sco, $calc(%sc.mp.sorszam - 1 )) != $null) {
    dec %sc.mp.sorszam
    splay -p  $read($mircdirsystem/data/mp_path.sco,%sc.mp.sorszam)
    did -c mp 702 %sc.mp.sorszam
    %sc.mp.nowplay = $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam)
    sc.mp.getdata
    %sc.mp.newtoplay =   %sc.mp.nowplay
    sc.mp.playtimer
  }
  else { sc.mp.next }
}

alias sc.mp.first {
  %sc.mp.sorszam = 1
  splay -p  $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam)
  did -c mp 702 %sc.mp.sorszam 
  %sc.mp.nowplay = $read($mircdirsystem/data/mp_path.sco, %sc.mp.sorszam)
  sc.mp.getdata
  %sc.mp.newtoplay =   %sc.mp.nowplay
  sc.mp.playtimer
}

alias sc.mp.set.time  did -o mp 709 1 $right($duration(%sc.mp.the.time,3), 5 )

alias sc.mp.timer {
  .timer.sc.mp.time 0 1 inc %sc.mp.the.time
  .timer.sc.mp.time2 0 1  sc.mp.set.time
}

alias sc.mp.playtimer {
  .timer.sc.mp.d* off
  .timer.sc.mp.dplay1  0 1 dialog -t mp I n F 3 r N 0 - mIRCamp ( P L  A Y I N G )
  .timer.sc.mp.dplay2  0 2 dialog -t mp I n F 3 r N 0 - mIRCamp 
}

alias sc.mp.getdata {
  ;hossz meghatarozas
  if ( $left($duration($calc($insong.length / 1000),3),2) = 00 ) {
    did -o mp 710 1 $right($duration($calc($insong.length / 1000),3),5)
    %sc.mp.time.full = $duration($calc($insong.length / 1000),3)
    unset %sc.mp.the.time
    sc.mp.timer 
  }
  else {
    did -o mp 710 1 $duration($calc($insong.length / 1000),3)
  }

  ;eloado es cim (id3 es fajnev alapjan) - csak id3v2 nem támogatja!!!!!
  if ($sound(%sc.mp.nowplay).artist != $null) && ($sound(%sc.mp.nowplay).title != $null) {
    did -o mp 711 1 $sound(%sc.mp.nowplay).artist 
    did -o mp 712 1 $sound(%sc.mp.nowplay).title
  }
  else {
    %sc.mp.nowplay = $replace(%sc.mp.nowplay, $chr(32), $chr(63))
    if ( $chr(63) $+ $chr(45) $+ $chr(63) !isin %sc.mp.nowplay) { did -o mp 711 1 No Artist |  did -o mp 712 1 No Title | halt }
    %sc.mp.newtitle = $remove($nopath(%sc.mp.nowplay), .mp3)
    %sc.mp.cik = 1
    :sc.mp.cik
    if ($mid(%sc.mp.newtitle, %sc.mp.cik, 3) = $chr(63) $+ $chr(45) $+ $chr(63) ) {
      var %sc.mp.titlel =  $remove(%sc.mp.newtitle, $left(%sc.mp.newtitle, %sc.mp.cik)), 3 , 0 )
      did -o mp 711 1 $replace($left(%sc.mp.newtitle, %sc.mp.cik), $chr(63), $chr(32))
      did -o mp 712 1 $replace($mid( $remove(%sc.mp.newtitle, $left(%sc.mp.newtitle, %sc.mp.cik)), 3 , %sc.mp.titlel ), $chr(63), $chr(32))
      halt
    }
    else {
      inc %sc.mp.cik
      if (%sc.mp.cik = $len(%sc.mp.newtitle)) {  did -o mp 711 1 No Artist |  did -o mp 712 1 No Title | halt }
      goto sc.mp.cik
    }
  }
}

alias sc.mp.upload {
  if ($1 = $null) { halt }
  var %sc.mp.uploadn = $1
  did -r mp %sc.mp.uploadn
  if $exists($mircdirsystem/data/mp_name.sco ) {
    %felt_mp = 1
    :feltolt_mp
    if ( $read -l $+ %felt_mp $mircdirsystem/data/mp_name.sco != $null ) {
      var %sc.mp.upload = $read -l $+ %felt_mp  $mircdirsystem/data/mp_name.sco 
      did -a mp  %sc.mp.uploadn $remove(%sc.mp.upload, .mp3)
      dialog -t mp I n F 3 r N 0 - mIRCamp $chr(91) Working: $round($calc( (%felt_mp / $lines( $mircdirsystem/data/mp_name.sco  )) * 100),0) $+ $chr(37) $chr(93)
      inc %felt_mp 
      goto feltolt_mp
    }
    else {  dialog -t mp I n F 3 r N 0 - mIRCamp | halt }
  }
}

alias sc.mp.getwplist {
  sc.mp.wp saveplaylist 
  echo -a Importing winamp's playlist. Pls be patient.....
  %sc.mp.wpfile = $dll($mircdirsystem/dll/swamp.dll,WinAmpGet,directory)  $+ WinAmp.m3u
  %felt_mpwp = 1
  :feltolt_mpwp
  if ( $read -l $+ %felt_mpwp %sc.mp.wpfile   != $null ) {
    var %sc.mp.winpl =  $read -l $+ %felt_mpwp %sc.mp.wpfile  
    dialog -t mp I n F 3 r N 0 - mIRCamp $chr(91) Working: $round($calc( (%felt_mpwp / $lines(%sc.mp.wpfile )) * 100),0) $+ $chr(37) $chr(93)
    if ( .mp3 isin %sc.mp.winpl) {
      write $mircdirsystem/data/mp_path.sco %sc.mp.winpl
      write $mircdirsystem/data/mp_name.sco $nopath(%sc.mp.winpl)
      did -a mp  702 $remove($nopath(%sc.mp.winpl), .mp3)
      inc %felt_mpwp
      goto feltolt_mpwp
    }
    else {
      inc %felt_mpwp
      goto feltolt_mpwp
    }
  }
  else {
    dialog -t mp I n F 3 r N 0 - mIRCamp
  }
}

alias sc.mp.wp dll $mircdirsystem/dll/swamp.dll WinAmpCmd $1-

alias mp { 
  if ($dialog(mp).active = $false) { .timer.sc.mp.act 1 0 dialog -ev mp mp }
  else {
    echo -a * $chr(91) $+ - $+ $chr(93) loading mIRCamp... 
    dialog -med mp mp 
    dialog -t mp  I n F 3 r N 0 - mIRCamp ( Now $lines($mircdirsystem/data/mp_name.sco)) .mp3 file )
  }
}

alias -l sc.mp.say { 
  unset %sc.mp.say*
  unset %sc.mp.info.end
  if (%sc.mp.info.kb = 1) { %sc.mp.say1 =  $chr(124) $+ $sound( $insong.fname).bitrate $+ Kbps $+ $chr(124) }
  if (%sc.mp.info.kh = 1) { %sc.mp.say2 = $chr(124)  $+ $round( $calc( ($sound( $insong.fname).sample) / 1000),0) $+ KHz $+ $chr(124) }
  if (%sc.mp.info.mb = 1) { %sc.mp.say3 = $chr(124) $+ $round($calc($file($insong.fname).size / (1024*1024) ),2) $+ Mb $+ $chr(124)  }
  if (%sc.mp.info.ss = 1) { %sc.mp.say4 = $chr(124) $+ $right($duration($calc($insong.pos / 1000),3 ),5)  $+ / $+ $right($duration($calc($insong.length / 1000),3 ),5) }
  if (%sc.mp.info.null = 1) { %sc.mp.info.say = $chr(32) }
  else {
    %sc.mp.info.end =  ( $+ %sc.mp.say1 $+ %sc.mp.say2  $+ %sc.mp.say3  $+ %sc.mp.say4 $+ )
  }
  return is listening to $chr(34) $+ $did(mp,711) - $did(mp,712) $+ $chr(34) $replace(%sc.mp.info.end, $chr(124) $+ $chr(124), $chr(124) , $chr(40) $+ $chr(124), $chr(40), $chr(124) $+ $chr(41), $chr(41), $chr(40),  $+ $chr(40) $+ , $chr(41),  $+ $chr(41) $+ , $chr(124),  $+ $chr(124) $+  )   [mIRCamp]
}

alias -l sc.mp.adv return is using [mIRCamp] the best mp3 player for mIRC [ $+ $chr(124) n F 3 r N 0 script]
