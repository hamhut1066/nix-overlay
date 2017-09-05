{ pkgs, python }:

self: super: {
  "cheroot" = python.overrideDerivation super."cheroot" (old: {
    buildInputs = old.buildInputs ++ [ self."setuptools-scm" ];
  });

}
