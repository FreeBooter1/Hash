:: Add Hash to Context Menu of Files in Windows 8, Windows 10 and Windows 11

@Echo Off & Cls 


(Net session >nul 2>&1)||(PowerShell start """%~0""" -verb RunAs & Exit /B)

Cls & Mode CON  LINES=11 COLS=60 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo          Add Hash to Context Menu of Files (A)   
Echo.       
Echo          Remove Hash from Context Menu     (R)
Echo.


Set /p input=^>

If /i  Not %input%==A (Goto :_Ex) Else (Goto :_Enable) 

:_Ex
If /i Not %input%==R  (Goto :EOF) Else (Goto :_RegRestore)



:_Enable

Reg.exe add "HKCR\*\shell\hash" /v "MUIVerb" /t REG_SZ /d "Hash" /f >Nul
Reg.exe add "HKCR\*\shell\hash" /v "SubCommands" /t REG_SZ /d "" /f >Nul
REM ; SHA1
Reg.exe add "HKCR\*\shell\hash\shell\01menu" /v "MUIVerb" /t REG_SZ /d "SHA1" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\01menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm SHA1 | format-list" /f >Nul
REM ; SHA256
Reg.exe add "HKCR\*\shell\hash\shell\02menu" /v "MUIVerb" /t REG_SZ /d "SHA256" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\02menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm SHA256 | format-list" /f >Nul
REM ; SHA384
Reg.exe add "HKCR\*\shell\hash\shell\03menu" /v "MUIVerb" /t REG_SZ /d "SHA384" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\03menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm SHA384 | format-list" /f >Nul
REM ; SHA512
Reg.exe add "HKCR\*\shell\hash\shell\04menu" /v "MUIVerb" /t REG_SZ /d "SHA512" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\04menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm SHA512 | format-list" /f >Nul
REM ; MACTripleDES
Reg.exe add "HKCR\*\shell\hash\shell\05menu" /v "MUIVerb" /t REG_SZ /d "MACTripleDES" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\05menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm MACTripleDES | format-list" /f >Nul
REM ; MD5
Reg.exe add "HKCR\*\shell\hash\shell\06menu" /v "MUIVerb" /t REG_SZ /d "MD5" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\06menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm MD5 | format-list" /f >Nul
REM ; RIPEMD160
Reg.exe add "HKCR\*\shell\hash\shell\07menu" /v "MUIVerb" /t REG_SZ /d "RIPEMD160" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\07menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm RIPEMD160 | format-list" /f >Nul
REM ; Allget-filehash -literalpath '%1' -algorithm RIPEMD160 | format-list
Reg.exe add "HKCR\*\shell\hash\shell\08menu" /v "CommandFlags" /t REG_DWORD /d "32" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\08menu" /v "MUIVerb" /t REG_SZ /d "Show all" /f >Nul
Reg.exe add "HKCR\*\shell\hash\shell\08menu\command" /ve /t REG_SZ /d "powershell -noexit get-filehash -literalpath '%%1' -algorithm SHA1 | format-list;get-filehash -literalpath '%%1' -algorithm SHA256 | format-list;get-filehash -literalpath '%%1' -algorithm SHA384 | format-list;get-filehash -literalpath '%%1' -algorithm SHA512 | format-list;get-filehash -literalpath '%%1' -algorithm MACTripleDES | format-list;get-filehash -literalpath '%%1' -algorithm MD5 | format-list;get-filehash -literalpath '%%1' -algorithm RIPEMD160 | format-list" /f >Nul




Cls & Mode CON  LINES=11 COLS=60 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo            Adding Hash to Context Menu of Files
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit


:_RegRestore

Reg.exe delete "HKCR\*\shell\hash" /f >Nul



Cls & Mode CON  LINES=11 COLS=60 & Color 0E & Title Created By FreeBooter
Echo.
Echo.
Echo.
Echo.
Echo            Removing Hash from Context Menu   
Echo.
Echo.
Echo. 
Ping -n 6 localhost >Nul
Exit
