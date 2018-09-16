create-ipf-project
==================

This is a scaffolding script which sets up the project structure necessary for developing a new `.ipf` application. In order to use this script, either add its location to your `PATH` environment variable or invoke it directly from its location.

Packaging an `.ipf`
------------------
In order to package a new `.ipf`, run the `deploy-ipf.bat` located within the project directory. This will also copy the `.ipf` to the game client directory, but you will need to reload the game client in order to see the changes.

Example usage
-------------

```
c:\Users\case\Desktop>create-ipf-project test
Project `test' created.

c:\Users\case\Desktop>cd test

c:\Users\case\Desktop\test>deploy-ipf
reading file list....
done....
IPF file in file 2
compress data...addon_d.ipf test/test.lua
compress data...addon_d.ipf test/test.xml
done!
Active code page: 65001
        1 file(s) copied.

c:\Users\case\Desktop\test>dir
 Volume in drive C has no label.
 Volume Serial Number is 7CF2-BB26

 Directory of c:\Users\case\Desktop\test

09/15/2018  09:06 PM    <DIR>          .
09/15/2018  09:06 PM    <DIR>          ..
09/15/2018  09:06 PM               140 deploy-ipf.bat
09/15/2018  09:02 PM            51,726 ipf.exe
09/15/2018  09:02 PM            56,850 libipf.dll
09/15/2018  09:06 PM    <DIR>          src
09/15/2018  09:06 PM               294 test.ipf
               4 File(s)        109,010 bytes
               3 Dir(s)  117,288,747,008 bytes free

c:\Users\case\Desktop\test>
```