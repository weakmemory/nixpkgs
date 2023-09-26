{ lib, mkCoqDerivation, which, coq
  , imm
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "weakestmoToImm";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  propagatedBuildInputs = [imm];

  dontConfigure = true;
  extraInstallFlags = ["-f" "Makefile.coq"]; 

  ## Give some meta data
  ## This is needed for submitting the package to nixpkgs but not required for local use.
  meta = {
    description = "The Coq code containing Weakestmo Memory Model and compilation correctness proofs for it and supplementing the paper 'Reconciling Event Structures with Modern Multiprocessors'.";
    maintainers = with maintainers; [ anlun ];
    license = licenses.mit;
  };
}
