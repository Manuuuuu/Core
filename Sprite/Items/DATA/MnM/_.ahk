#NoEnv 
SetWorkingDir %A_ScriptDir% 
AppTitle=Dir Clean-up
XDaysAgo=31
PathToCheck=C:\Users\livewa\Dropbox\Public\user_month
FilesListing=
TotalNumberOfFilesInPath=0
NumberOfFilesToDelete=0
NumberOfFilesToDeleteProcessed=0
NumberOfErrorsFound=0
FormatTime, LogFileDateString,, yyyyMMdd
LogFullPath=C:\Users\livewa\Dropbox\Public\user_month\log
IfNotExist, %LogFullPath%
	FileCreateDir, %LogFullPath%
	LogFilename=\DeleteFilesOlderThan_%XDaysAgo%_days_%LogFileDateString%_%A_Hour%%A_Min%%A_Sec%_Auto
	LogFilenameExt=log
	LogFileFullPath=%LogFullPath%\%LogFilename%.%LogFilenameExt%
	Loop, %PathToCheck%\*.txt, 0, 0		; Count TOTAL files to delete
	{
		TotalNumberOfFilesInPath++
	}
	Loop, %PathToCheck%\*.txt, 0, 0		; Count files to be DELETED based on %1%
	{
		DaysSinceUpdated=%DateString%
		FileGetTime, ThisFileTime, %A_LoopFileFullPath%, C
		EnvSub, DaysSinceUpdated, %ThisFileTime%, days
		IfGreaterOrEqual, DaysSinceUpdated, %XDaysAgo%
			{
				NumberOfFilesToDelete++
			}
	}
	DaysSinceUpdated=%LogFileDateString%
	; MsgBox, 292 , %AppTitle%, Delete %NumberOfFilesToDelete% files older than %XDaysAgo% days in `"%PathToCheck%`"?
	; IfMsgBox, no
		; ExitApp
	Loop, %PathToCheck%\*.txt, 0, 0		; Process all files, DELETE the files matched to the specified age
	{
			DaysSinceUpdated=%DateString%
			FileGetTime, ThisFileTime, %A_LoopFileFullPath%, C
			EnvSub, DaysSinceUpdated, %ThisFileTime%, days
			IfGreaterOrEqual, DaysSinceUpdated, %XDaysAgo%
			{
				NumberOfFilesToDeleteProcessed++
				FileMove, %A_LoopFileFullPath%, %PathToCheck%\moveBackup
				;msgbox, %A_LoopFileFullPath%
				IfExist, %A_LoopFileFullPath%
				{
					NumberOfErrorsFound++
					FilesListing = %FilesListing%[UNABLE TO DELETE - %DaysSinceUpdated% days old] - %A_LoopFileFullPath%`n
				}
				Else
				{
					FilesListing = %FilesListing%[DELETED - %DaysSinceUpdated% days old] - %A_LoopFileFullPath%`n
				}
			}
	}
FileAppend, %TotalNumberOfFilesInPath% checked`n%NumberOfFilesToDelete% pre-allocated for deletion`n%NumberOfFilesToDeleteProcessed% were actually deleted`n`n%NumberOfErrorsFound% errors found.`n===========================================`n`n, %LogFileFullPath%
FileAppend, %FilesListing%, %LogFileFullPath%

ExitApp