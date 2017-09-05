self: super:

{
# https://github.com/mozilla/nixpkgs-mozilla
latest = {
    rustChannels = (import ./rust-overlay.nix self super).latest.rustChannels or "";
    # rustChannels = (import ./rust-overlay.nix self super).latest.rustChannels or "";
  } // (import ./firefox-overlay.nix self super).latest;

  overlay = {
    wsgidav = (import ./wsgidav self super);
  };
}
