{ lib, mkCoqDerivation, which, coq
  , paco, promising2, imm
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "promising2ToImm";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  propagatedBuildInputs = [paco promising2 imm];

  dontConfigure = true;
  extraInstallFlags = ["-f" "Makefile.coq"]; 

  ## Give some meta data
  ## This is needed for submitting the package to nixpkgs but not required for local use.
  meta = {
    description = "The Coq code of Promising 2.0 to IMM compilation correctness proof supplementing the paper 'Promising 2.0: Global Optimizations and Relaxed Memory Concurrency.'";
    maintainers = with maintainers; [ anlun ];
    license = licenses.mit;
  };
}
