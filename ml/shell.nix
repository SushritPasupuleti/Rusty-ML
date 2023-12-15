{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  LD_LIBRARY_PATH = "${stdenv.cc.cc.lib}/lib";
  nativeBuildInputs = [ rustc cargo openssl.dev pkg-config libtorch-bin python3 python3Packages.pytorch ];
}
