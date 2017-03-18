# create_repo_from_current_folder

Creates a repository in github from the current folder.

USAGE:
1. Send the createrepofromcurrentfolder.php and createrepofromcurrentfolder.confs.php to online server that can do ssh curl.
2. Alter the createrepofromcurrentfolder.confs.php to custom values. YOURAUTHORIZEDUSER is just for secure sakes. Its a custom name \(can be anything\) that you must type in the shell parameter utility to be an aditional secure layer. The USERNAME is your github user. PASSWORD is your github pass \(caution with this informations!!!\).
3. Create an ordibary folder locally that will be your project folder.
4. Put the files of your github project. Does not need create README.md.
5. Execute "createrepofromcurrentfolder PHPSCRIPTBASEPATH YOURAUTHORIZEDUSER" and see the magic happens! For example, if you put the createrepofromcurrentfolder.php in <yourdomain>/utils, then you mus write  PHPSCRIPTBASEPATH as <yourdomain>/utils.