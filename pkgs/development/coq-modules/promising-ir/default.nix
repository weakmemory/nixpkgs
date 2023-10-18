{ lib, mkCoqDerivation, which, coq
  , sflib, promising-lib, paco
  , coq-ext-lib
  , ITree 
  , version ? null }:

with lib; mkCoqDerivation {
  pname = "promising-ir";
  repo = "promising-ir-coq";
  owner = "weakmemory";
  domain = "github.com";

  inherit version;
  defaultVersion = with versions; switch coq.coq-version [
    ## Example of possible dependencies
    # { case = range "8.13" "8.14"; out = "1.2.0"; }
    ## other predicates are `isLe v`, `isLt v`, `isGe v`, `isGt v`, `isEq v` etc
  ] null;

  propagatedBuildInputs = [sflib promising-lib paco coq-ext-lib ITree];

  buildFlags = ["build"]; 
  dontConfigure = true;
  extraInstallFlags = ["-f" "Makefile.coq"]; 

  meta = {
    description = "The Coq development of Putting Weak Memory in Order via Promising Intermediate Representation";
    maintainers = with maintainers; [ anlun ];
    license = licenses.mit;
  };
}
