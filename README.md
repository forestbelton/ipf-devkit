create-ipf-project
==================

This is a scaffolding script which sets up the project structure necessary for developing a new `.ipf` application. In order to use this script, either add its location to your `PATH` environment variable or invoke it directly from its location. Both `libipf.dll` and `ipf.exe` (available [here](https://github.com/forestbelton/libipf/releases/tag/v1.01)) must be present in the same folder in order for this script to work.

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

c:\Users\case\Desktop\test>
```