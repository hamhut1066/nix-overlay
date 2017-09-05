self: super:
let
  pkgs = super;
  python = import ./requirements.nix { inherit pkgs; };
in python.mkDerivation {
  name = "wsgidav";
  src = pkgs.fetchurl {
    url = "https://pypi.python.org/packages/7e/75/9a56d97f19e2dad7166f48d073ad79678d8f26f195e9142b01c0e8fa5e94/WsgiDAV-2.2.4.tar.gz";
    sha256 = "041d7dq31y3673s0kqb6amshrbq51kdd85lvh5b9kjis7q05lnx4";
  };
  buildInputs = [ ];
  propagatedBuildInputs = [
    # python.packages."wsgidav"
    python.packages."cheroot"
    python.packages."defusedxml"
  ];
  checkPhase = ''true'';
}
