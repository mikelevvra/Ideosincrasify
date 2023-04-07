
@echo off

rem Run this script pointing to all libraries required to package them for the Lambda.

terraform init

xcopy /s /i "C:\Users\mikel\anaconda3\Lib\site-packages\spotipy" "..\lambda_payloads\avg_album_length_playlist_payload\spotipy\"
xcopy /s /i "C:\Users\mikel\anaconda3\Lib\site-packages\requests" "..\lambda_payloads\avg_album_length_playlist_payload\requests\"

copy /y "C:\Users\mikel\OneDrive\Escritorio\SpotifyAWS\avg_album_length_playlist.py" "..\lambda_payloads\avg_album_length_playlist_payload\"
xcopy /s /i "C:\Users\mikel\OneDrive\Escritorio\SpotifyAWS\config\playlists.py" "..\lambda_payloads\avg_album_length_playlist_payload\config\"
xcopy /s /i "C:\Users\mikel\OneDrive\Escritorio\SpotifyAWS\tools\playlists.py" "..\lambda_payloads\avg_album_length_playlist_payload\tools\"

cd ..\lambda_payloads\avg_album_length_playlist_payload\

powershell Compress-Archive * ..\..\payload.zip

cd ..\..\tf\

terraform plan