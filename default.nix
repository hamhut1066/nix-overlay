self: super:

{
# https://github.com/mozilla/nixpkgs-mozilla
latest = {
    rustChannels = (import ./nixpkgs-mozilla/rust-overlay.nix self super).latest.rustChannels or "";
    # rustChannels = (import ./rust-overlay.nix self super).latest.rustChannels or "";
  } // (import ./nixpkgs-mozilla/firefox-overlay.nix self super).latest;

  overlay = {
    wsgidav = (import ./python/wsgidav self super);
    sbcl = (import ./common/sbcl.nix self super);
  };
}
