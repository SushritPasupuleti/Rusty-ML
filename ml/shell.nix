{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  # LD_LIBRARY_PATH = "${stdenv.cc.cc.lib}/lib";
  LD_LIBRARY_PATH = lib.makeLibraryPath [ "${stdenv.cc.cc.lib}/lib" gcc-unwrapped zlib libglvnd glib linuxPackages.nvidia_x11 libtorch-bin ];
  nativeBuildInputs = [ rustc cargo openssl.dev pkg-config libtorch-bin python3 python3Packages.pytorch ];
}
