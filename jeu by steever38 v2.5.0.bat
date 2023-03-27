:: Merci de ne pas supprimer le paragraphe suivant :
:: --------------------------------------------------
:: © Tous droits réservés - 2022
:: Jeu créer par steever38
:: Merci de me demander avant de modifier ce projet
:: Discord : steever38#2032
:: --------------------------------------------------

@echo off & "%__APPDIR__%chcp.com" 65001 >nul
set version=2.5.0
:restart
if not exist ".\library" goto :download
if not exist ".\library\users" goto :download
if not exist ".\library\requirements" goto :download
if not exist ".\library\requirements\PlaySound.exe" goto :download
start .\library\requirements\PlaySound.exe "%WINDIR%\Media\windows unlock.wav" 
goto :cr

:menu
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
color E
cls
echo                                                    ╔════════════════╗
echo                                                    ║ Menu principal ║
echo                                                    ╚════════════════╝
echo.
echo                                  [1] Chifoumi  [2] Quit ou double  [3] Trouve le nombre
echo                                   [4] Machine a sous (new!) [5] Recompense journaliere
echo                                            [6] Se deconnecter de %username%  [7] Infos
echo.
echo Score de %username% : %score%
echo.
set /p jeu=Choisis : 
if %jeu%==44455544455 goto :admin
if %jeu%==1 goto :chifoumi
if %jeu%==2 goto :qoud
if %jeu%==3 goto :TLN
if %jeu%==4 goto :MaS
if %jeu%==5 goto :recompense
if %jeu%==6 (goto :restart)
if %jeu%==7 (goto :infos) else (echo Erreur : mauvaise valeur) &color 4 & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :menu

:qoud
cls
echo                                        ╔════════════════════════════════════════╗
echo                                        ║ Bienvenue sur le jeu du quit ou double ║
echo                                        ╚════════════════════════════════════════╝
color E
echo.
echo Regles : une chance sur 2 de tout perdre ou de doubler son score
pause
goto :jeu_qoud

:chifoumi
cls
echo                                      ╔══════════════════════════════════════════════╗
echo                                      ║ Bienvenue sur le jeu du pierre papier cisaux ║
echo                                      ╚══════════════════════════════════════════════╝
color E
echo.
echo Regles : jeu du pierre papier cisaux classique
echo.
echo Points : gagner +10 points, perdu -8 points
pause
goto :jeu_chifoumi

:TLN
cls
echo                                       ╔══════════════════════════════════════════╗
echo                                       ║ Bienvenue sur le jeu du trouve le nombre ║
echo                                       ╚══════════════════════════════════════════╝
color E
echo Regles : trouver le nombre en 0 et 100
echo.
echo Coup du jeu : 20 points
echo Points : trouver en une tentative : 150 points, de la 2eme : 100 points, de la 3eme : 50 points, entre la 4eme et la 7eme : 25 points, entre la 8eme et la 10eme : 20 points, plus de 11 tentatives : 10 points
pause
goto :jeu_TLN

:MaS
cls
echo                                       ╔═══════════════════════════════════════════╗
echo                                       ║ Bienvenue sur le jeu de la machine a sous ║
echo                                       ╚═══════════════════════════════════════════╝
color E
echo.
echo Regles : misez des points. Si la combinaison obtenu est 3 fois le meme nombre, vous gagnez 20x la mise. si la combinaison obtenu est 1 2 3, vous gagnez 50x la mise
echo.
pause
goto :jeu_Mas

:cr
title Se connecter ou creer un compte
color E
cls
echo                                           ╔═════════════════════════════════╗
echo                                           ║ Se connecter ou creér un compte ║
echo                                           ╚═════════════════════════════════╝
echo.
echo                              [1] Se connecter  [2] Creér un compte  [3] Supprimer un compte
echo.
set /p option=Choisis : 
if %option%==1 goto :login
if %option%==3 goto :delete
if %option%==2 (goto :new) else (echo Erreur : mauvaise valeur) & color 4 & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :cr

:delete
title Supprimer un compte
cls
echo                                                 ╔═════════════════════╗
echo                                                 ║ Supprimer un compte ║
echo                                                 ╚═════════════════════╝
echo.
set /p compteAd1=Nom du compte a supprimer : 
if %compteAd1%==b** goto :cr
if not exist ".\library\users\%compteAd1%" color 4 & echo Utilisateur inconnu & timeout 2 /NOBREAK >nul & goto :cr
set /p compteAd2=Veillez rentrer le nom du compte pour confirmer : 
if not %compteAd1%==%compteAd2% color 4 & echo Une erreur est survenue ! & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :cr
rmdir ".\library\users\%compteAd2%" /s /q
echo.
echo Le compte %compteAd2% a été supprimé avec succès
timeout 3 /NOBREAK >nul
goto :cr

:login
title Se connecter
cls
echo                                                     ╔══════════════╗
echo                                                     ║ Se connecter ║ 
echo                                                     ╚══════════════╝
echo.
set /p username=Nom d'utilisateur : 
if %username%==b** goto :cr
if not exist ".\library\users\%username%" color 4 & echo Utilisateur inconnu & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :cr
if not exist ".\library\users\%username%\score.dll" echo 10>".\library\users\%username%\score.dll
if not exist ".\library\users\%username%\recompense" md ".\library\users\%username%\recompense"
echo Bienvenue %username%
set /p score=<".\library\users\%username%\score.dll"
timeout 2 /NOBREAK >nul
goto :menu

:new
title Créer un compte
cls
echo                                                   ╔═════════════════╗
echo                                                   ║ Créer un compte ║
echo                                                   ╚═════════════════╝
echo.
set /p new_username=Nom d'utilisateur (sans caractères speciaux !!): 
if %new_username%==b** goto :cr
if exist ".\library\users\%new_username%" color 4 & echo Erreur : le compte %new_username% existe deja !! & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :cr
md ".\library\users\%new_username%
echo 10 >".\library\users\%new_username%\score.dll"
cls
echo                                                   ╔═════════════════╗
echo                                                   ║ Créer un compte ║
echo                                                   ╚═════════════════╝
echo.
echo le compte %new_username% a été créer avec succès.
echo 10 points de bienvenue ont été ajouté a votre nouveau compte.
timeout 3 /NOBREAK >nul
goto :login

:jeu_chifoumi
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
cls
color E
set /p score=<".\library\users\%username%\score.dll"
echo                                                  ╔═══════════════════╗
echo                                                  ║ Jouer au chifoumi ║
echo                                                  ╚═══════════════════╝
echo.
echo                                 [1] Pierre  [2] Papier  [3] Ciseaux  [4] Menu principal
echo.
echo Score de %username% : %score%
echo.
set /p objet_m=Choisis : 
if %objet_m%==4 goto :menu
if %objet_m%==1 set /a objet=0 & goto :chifoumi_suite
if %objet_m%==2 set /a objet=1 & goto :chifoumi_suite
if %objet_m%==3 set /a objet=2 & goto :chifoumi_suite
color 4 & echo Erreur : mauvaise valeur & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :jeu_chifoumi

:chifoumi_suite
set /a objet_bot=%random%%%3

if %objet_bot% == 0 set n_objet_bot=Ciseaux
if %objet_bot% == 1 set n_objet_bot=Pierre
if %objet_bot% == 2 set n_objet_bot=Papier


if %objet% == %objet_bot% goto :win
if %objet% == 0 goto :Pierre
if %objet% == 1 goto :Papier
if %objet% == 2 goto :Ciseaux



:Pierre
if %objet_bot% == 0 goto :win
if %objet_bot% == 1 goto :egalite
if %objet_bot% == 2 goto :perdu


:Papier
if %objet_bot% == 1 goto :win
if %objet_bot% == 2 goto :egalite
if %objet_bot% == 0 goto :perdu

:Ciseaux
if %objet_bot% == 2 goto :win
if %objet_bot% == 0 goto :egalite
if %objet_bot% == 1 goto :perdu

:win
color A
cls
echo                                                       ╔══════════╗
echo                                                       ║ Resultat ║
echo                                                       ╚══════════╝
echo.
echo BRAVO !! :)
echo Le bot avait choisi %n_objet_bot%
echo +10 points
set /a score=score+10
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
timeout 2 /NOBREAK >nul
pause
goto :jeu_chifoumi

:egalite
color D
cls
echo                                                       ╔══════════╗
echo                                                       ║ Resultat ║
echo                                                       ╚══════════╝
echo.
echo EGALITE -_-
echo Le bot avait choisi %n_objet_bot%
echo +0 point
set /a score=score+0
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
timeout 2 /NOBREAK >nul
pause
goto :jeu_chifoumi

:perdu
color 4
cls
echo                                                       ╔══════════╗
echo                                                       ║ Resultat ║
echo                                                       ╚══════════╝
echo.
echo PERDU :(
echo Le bot avait choisi %n_objet_bot%
echo -8 points
set /a score=score-8
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
timeout 2 /NOBREAK >nul
pause
goto :jeu_chifoumi

:jeu_qoud
color E
cls
echo                                               ╔═════════════════════════╗
echo                                               ║ Jouer au quit ou double ║
echo                                               ╚═════════════════════════╝
echo.
echo                                              [1] Jouer  [2] Menu principal
echo.
echo Score de %username% : %score%
echo.
set /p objet=Choisis : 
if %objet%==2 goto :menu
if not %objet%==1 color 4 & echo Erreur : mauvaise valeur & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :jeu_qoud

set /a objet_bot=%random%%%2
if %objet_bot%==0 goto :qoud_perdu
if %objet_bot%==1 goto :qoud_gagner

:qoud_perdu
cls
color 4
echo                                                       ╔══════════╗
echo                                                       ║ Resultat ║
echo                                                       ╚══════════╝
echo.
echo MALHEURESEMENT TU AS PERDU TOUS TES POINTS :(
echo -%score% points
set /a score=0
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
timeout 2 /NOBREAK >nul
pause
goto :menu

:qoud_gagner
cls
color A
echo                                                       ╔══════════╗
echo                                                       ║ Resultat ║
echo                                                       ╚══════════╝
echo.
echo TU AS DOUBLER TES POINTS !! :)
start .\library\requirements\PlaySound.exe "%WINDIR%\Media\tada.wav"
echo +%score% points
set /a score=%score%+%score%
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
pause
goto :menu

:jeu_TLN
color E
cls
echo                                      ╔════════════════════════════════════════════╗
echo                                      ║ Jouer au trouve le nombre (entre 0 et 100) ║
echo                                      ╚════════════════════════════════════════════╝
echo.
echo                                              [1] Jouer  [2] Menu principal
echo.
echo Score de %username% : %score%
echo.
set /p objet=Choisis : 
if %objet%==2 goto :menu
if not %objet%==1 color 4 & echo Erreur : mauvaise valeur & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :jeu_TLN
set /a score = score-20
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
set /a Nba=%Random% %%100
set /a Nc=0
cls

:question
set /p Nb=Choisis un nombre : 
set /a Nc=Nc+1
if %Nb% LSS %Nba% goto :PP
if %Nb% GTR %Nba% goto :PG
if %Nb% == %Nba% goto :win_TLN

:PP
echo c'est plus...
goto :question

:PG
echo c'est moins...
goto :question
pause

:win_TLN
color A
cls
echo                                                       ╔══════════╗
echo                                                       ║ Resultat ║
echo                                                       ╚══════════╝
echo.
echo BRAVO !! :)
echo Tu as trouvé en %Nc% tentatives
if %Nc%==1 set /a score=%score%+150 & echo + 150 points
if %Nc%==2 set /a score=%score%+100 & echo + 100 points
if %Nc%==3 set /a score=%score%+50 & echo + 50 points
if %Nc%==4 set /a score=%score%+40 & echo + 40 points
if %Nc%==5 set /a score=%score%+25 & echo + 25 points
if %Nc%==6 set /a score=%score%+25 & echo + 25 points
if %Nc%==7 set /a score=%score%+25 & echo + 25 points
if %Nc%==8 set /a score=%score%+20 & echo + 20 points
if %Nc%==9 set /a score=%score%+20 & echo + 20 points
if %Nc%==10 set /a score=%score%+20 & echo + 20 points
if %Nc% GTR 10 set /a score=%score%+10 & echo + 10 points
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
timeout 2 /NOBREAK >nul
pause
goto :jeu_TLN

:recompense
cls
echo                                                      ╔════════════╗
echo                                                      ║ Récompense ║
echo                                                      ╚════════════╝
echo.
set "folder_R=.\library\users\%username%\recompense"
set "file_R=%date:/=_%.flag"
 
set "FileRecompense=%folder_R%\%file_R%"
 
for /F "tokens=*" %%a in ('dir "%folder_R%\??_??_????.flag" /A /B 2^>nul') do if /I NOT "%file_R%" == "%%~nxa" del /F /Q /A "%folder_R%\%%~nxa"
IF EXIST "%FileRecompense%" (goto :Oui) else (goto :Non)

:Oui
color 4
echo Récompense déjà recupérée aujourd hui.
start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" 
timeout 3 /NOBREAK >nul 
goto :menu
pause
:Non
set /a recompense=%random% %%30
echo +%recompense% points
set /a score = score+recompense
echo %score% >".\library\users\%username%\score.dll"
echo >"%FileRecompense%"
timeout 3 /NOBREAK >nul 
goto :menu
pause

:jeu_MaS
set /a repet1=0
set /a repet2=0
set /a repet3=0
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
cls
color E
set /p score=<".\library\users\%username%\score.dll"
echo                                                  ╔═══════════════════╗
echo                                                  ║ La machine a sous ║
echo                                                  ╚═══════════════════╝
echo.
echo                                              [1] Jouer  [2] Menu principal
echo.
echo Score de %username% : %score%
echo.
set /p objet=Choisis : 
if %objet%==2 goto :menu
if not %objet%==1 color 4 & echo Erreur : mauvaise valeur & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :jeu_MaS

cls
echo                                           ╔═══════════════════════════════════╗
echo                                           ║ La machine a sous misez une somme ║
echo                                           ╚═══════════════════════════════════╝

set /p mise=Votre mise : 
if %mise% GTR %score% color 4 & echo Erreur : vous n'avez pas assez de point & start .\library\requirements\PlaySound.exe "%WINDIR%\Media\Windows Foreground.wav" & timeout 2 /NOBREAK >nul & goto :jeu_MaS
set /a score = %score% - %mise%
echo -%mise% points
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]
timeout 2 >nul

:repet1
color 4
cls
color E
echo.
echo.
set /a nb1= %random%%%6
::set /a nb1= 3
echo                                                    ╔═══╗ ╔═══╗ ╔═══╗
echo                                                    ║ %nb1% ║ ║ - ║ ║ - ║
echo                                                    ╚═══╝ ╚═══╝ ╚═══╝
set /a repet1=repet1+1
echo [%repet1%]
ping -n 2 127.0.0.1 > nul
if %repet1% == 3 goto :repet2
color 4
goto :repet1

:repet2
color 4
cls
color E
echo.
echo.
set /a nb2= %random%%%6
::set /a nb2= 3
echo                                                    ╔═══╗ ╔═══╗ ╔═══╗
echo                                                    ║ %nb1% ║ ║ %nb2% ║ ║ - ║
echo                                                    ╚═══╝ ╚═══╝ ╚═══╝
set /a repet2=repet2+1
echo [%repet2%]
ping -n 2 127.0.0.1 > nul
if %repet2% == 3 goto :repet3
color 4
goto :repet2

:repet3
color 4
cls
color E
echo.
echo.
set /a nb3= %random%%%6
::set /a nb3= 3
echo                                                    ╔═══╗ ╔═══╗ ╔═══╗
echo                                                    ║ %nb1% ║ ║ %nb2% ║ ║ %nb3% ║
echo                                                    ╚═══╝ ╚═══╝ ╚═══╝
set /a repet3=repet3+1
echo [%repet3%]
ping -n 2 127.0.0.1 > nul
if %repet3% == 3 goto :verif_LaS1
color 4
goto :repet3

:verif_LaS1
if %nb1% == %nb2% goto :verif_LaS2
goto :verif_LaS3

:verif_LaS2
if %nb2% == %nb3% goto :LaS_win1
goto :verif_LaS3

:verif_LaS3
if not %nb1% == 1 goto :LaS_lose
if not %nb2% == 2 goto :LaS_lose
if not %nb3% == 3 goto :LaS_lose
goto :LaS_win2

:LaS_win1
start .\library\requirements\PlaySound.exe "%WINDIR%\Media\tada.wav"
color a
set /a gain = %mise% * 20
set /a score = %score% + %gain%
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]

echo.
echo Win! vous gagnez 20x votre mise (+ %gain% points !)
pause
goto :jeu_MaS


:LaS_win2
start .\library\requirements\PlaySound.exe "%WINDIR%\Media\tada.wav"
color a
set /a gain = %mise% * 50
set /a score = %score% + %gain%
echo %score% >".\library\users\%username%\score.dll"
title [utilisateur : %username%]  [score : %score%]  [version : %version%]

echo.
echo Big win! vous gagnez 50x votre mise (+ %gain% points !)
pause
goto :jeu_MaS

:LaS_lose
color 4
echo.
echo Vous avez perdu...
pause
goto :jeu_MaS





:infos
cls
echo                                                     ╔══════════════╗
echo                                                     ║ Informations ║
echo                                                     ╚══════════════╝
echo.
echo Le jeux a été créer par steever38 (discord : steever38#0252)
echo Github : https://github.com/steever38
echo Le language de programmation utilisé est le batch.
echo.
echo Crédits : merci a ericlm128 qui m'a aider a coder les recompenses journalières.
echo.
echo Version = %version%
echo.
echo © Tous droits réservés - 2022
pause
goto :menu

:admin
color A
cls
echo                                                   ╔════════════════╗
echo                                                   ║ Administration ║
echo                                                   ╚════════════════╝
echo.
echo                                       [1] Score [2] Réinstaller [3] Menu principal
echo.
echo Score de %username% : %score%
set /p admin=Choisis : 
if %admin%==1 set /p score=nouveau score de %username% : 
if %admin%==1 echo %score% >".\library\users\%username%\score.dll" & title [utilisateur : %username%]  [score : %score%]  [version : %version%] & cls
if %admin%==2 rmdir ".\library" /s /q & echo fichiers supprimés ! & goto :download
if %admin%==3 goto :menu
goto :admin

:download
cls
echo                                                     ╔══════════════╗
echo                                                     ║ Installation ║
echo                                                     ╚══════════════╝
echo.
echo installation des fichiers prérequis

if not exist ".\library" md ".\library"
if not exist ".\library\users" md ".\library\users"
if not exist ".\library\requirements" md ".\library\requirements"
if not exist ".\library\requirements\PlaySound.exe" powershell -Command "(New-Object Net.WebClient).DownloadFile('https://cdn.discordapp.com/attachments/944690309453983754/944690381092691988/PlaySound.exe', 'PlaySound.exe')" & copy PlaySound.exe ".\library\requirements\PlaySound.exe" >nul & del PlaySound.exe

echo.
echo Installation réussite !
color a
timeout 1 /NOBREAK >nul
echo.
echo merci de relancer le jeu.
timeout 3 /NOBREAK >nul
quit

:: © Tous droits réservés - 2022
