create-ipf-project
==================

This is a scaffolding script which sets up the project structure necessary for developing a new `.ipf` application.

Make sure you have [libipf](https://github.com/forestbelton/libipf) installed and the `ipf` tool is available on your `PATH`.

In order to create a new `.ipf` project for an `.ipf` named `foo.ipf`:

```bash
$ create-ipf-project foo
```

A new directory named `foo` will be created with all of the boilerplate included. In order to package a new `.ipf`, run the `deploy.bat` located within the project directory. This will also copy the `.ipf` to the correct game client directory, but you will need to reload the game client in order to see the changes.