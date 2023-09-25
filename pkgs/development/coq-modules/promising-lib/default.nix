{ lib, mkCoqDerivation, which, coq
  , sflib
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "promising-lib";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  propagatedBuildInputs = [sflib];
  extraInstallFlags = ["-f" "Makefile.coq"]; 

  meta = {
    description = "A Library for the Coq developments of the Promising Semantics";
    maintainers = with maintainers; [ anlun ];
  };
}
