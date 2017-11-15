self: super:
let
  pkgs = super;
  sbcl = pkgs.sbcl;
  wrapper = pkgs.writeText "sbcl-wrapper" ''
  #/bin/sh
  export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$NIX_LISP_LD_LIBRARY_PATH
  ${sbcl}/bin/sbcl $@
  '';
in pkgs.stdenv.mkDerivation {
  name = "sbcl";
  installPhase = ''
    mkdir -p $out/bin
    cp ${wrapper} $out/bin/sbcl
    chmod +x $out/bin/sbcl
  '';
  phases = "installPhase";
}
