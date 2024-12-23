# JavaFX Nix Flake

This is a basic JavaFX Nix Flake

This uses the following versions

| NixOS Channel | 24.11 |
| Java          | 23    |
| JavaFX        | 23    |

This uses the following command to bootstrap the project

``` shell
mvn archetype:generate \
        -DarchetypeGroupId=org.openjfx \
        -DarchetypeArtifactId=javafx-archetype-simple \
        -DarchetypeVersion=0.0.3 \
        -DgroupId=org.openjfx \
        -DartifactId=sample \
        -Dversion=1.0.0 \
        -Djavafx-version=23.0.1
```

This will generate a directory with the code

Then run with

``` shell
cd sample/
mvn clean javafx:run
```


# Issues

## libgthread-2.0.so.0 not found

## libXxf86vm.so.1: cannot open shared object file: No such file or directory

xorg.libXxf86vm
