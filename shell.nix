{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    # Build system
    gnumake

    # LaTeX distribution with pdflatex
    texlive.combined.scheme-full

    # Utilities used by the Makefile
    findutils  # for find command
    gnused     # for sed command
    coreutils  # for cp, rm, mkdir commands
  ];

  shellHook = ''
    echo "LaTeX PDF Generator development environment"
    echo "Available commands:"
    echo "  make              - Build PDF from project/ (or example/ if project/main.tex doesn't exist)"
    echo "  make build        - Same as 'make'"
    echo "  make build_example - Build example PDF"
    echo "  make clean_build  - Clean build artifacts"
    echo ""
    echo "Example with chapter selection:"
    echo "  make \"CHAPTERS=introduction chapter1 chapter2\""
    echo ""
    echo "pdflatex version: $(pdflatex --version | head -n1)"
  '';
}
