{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    nixpkgs-fmt
    typst
    pdfpc
  ];

  shellHook = ''
    # ...
  '';
}