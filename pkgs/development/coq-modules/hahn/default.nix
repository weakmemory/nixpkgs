{ lib, mkCoqDerivation, which, coq
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "hahn";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  extraInstallFlags = ["-f" "Makefile.coq"]; 

  meta = {
    description = "Hahn is a Coq library that contains a useful collection of lemmas and tactics about lists and binary relations.";
     maintainers = with maintainers; [ anlun ];
     license = licenses.mit;
  };
}
