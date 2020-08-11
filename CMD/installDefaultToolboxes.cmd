rmdir /s /q "%UserProfile%\Documents\MATLAB\.toolboxes\toolboxes"
mkdir "%UserProfile%\Documents\MATLAB\.toolboxes"
cd /d "%UserProfile%\Documents\MATLAB\.toolboxes"
hg clone https://www.bitbucket.com/IslasGECI/toolboxes
cd toolboxes
hg update default
rmdir /s /q "%UserProfile%\Documents\MATLAB\library\toolboxes"
robocopy ".\inst\extdata" "%UserProfile%\Documents\MATLAB\library\toolboxes\datos" *.json
robocopy ".\inst\MATLAB\funciones" "%UserProfile%\Documents\MATLAB\library\toolboxes\funciones" *.m
robocopy ".\MATLAB\enumeraciones" "%UserProfile%\Documents\MATLAB\library\toolboxes\enumeraciones" *.m
robocopy ".\MATLAB\funciones" "%UserProfile%\Documents\MATLAB\library\toolboxes\+toolboxes" *.m
robocopy ".\MATLAB\funciones\private" "%UserProfile%\Documents\MATLAB\library\toolboxes\+toolboxes\private" *.m
