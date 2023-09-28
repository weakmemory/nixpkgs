{ lib, mkCoqDerivation, which, coq
  , hahn
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "hahnExt";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  propagatedBuildInputs = [hahn];
  extraInstallFlags = ["-f" "Makefile.coq"]; 

  meta = {
    description = "HahnExt is an extension for the Hahn library.";
     maintainers = with maintainers; [ anlun ];
     license = licenses.mit;
  };
}
