{ lib, mkCoqDerivation, which, coq
  , sflib, promising-lib, paco
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "promising2";
  repo = "promising2-coq";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  propagatedBuildInputs = [sflib promising-lib paco];

  buildFlags = ["build"]; 
  extraInstallFlags = ["-f" "Makefile.coq"]; 

  meta = {
    description = "The Coq development of Promising 2.0 semantics for relaxed memory concurrency";
    maintainers = with maintainers; [ anlun ];
    license = licenses.mit;
  };
}
