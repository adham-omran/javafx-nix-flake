# JavaFX Nix Flake

This is a basic JavaFX Nix Flake

This uses the following versions

| Item          | Version |
|---------------|---------|
| NixOS Channel | 24.11   |
| Java          | 23      |
| JavaFX        | 23      |

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
