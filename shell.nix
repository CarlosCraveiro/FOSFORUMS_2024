{ pkgs ? import <nixpkgs> { } }:
with pkgs;
mkShell {
  buildInputs = [
    nixpkgs-fmt
    typst
    pdfpc
    zathura
  ];

  shellHook = ''
    zathura main.pdf&
  '';
}
