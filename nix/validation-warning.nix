{ mkDerivation, base, bytestring, containers, criterion, deepseq
, doctest, exceptions, hashable, hedgehog, lens, mtl, spiros
, stdenv, tasty, tasty-hedgehog, tasty-hunit, text, transformers
, unordered-containers
}:
mkDerivation {
  pname = "validation-warning";
  version = "0.0";
  src = ./.;
  isLibrary = true;
  isExecutable = true;
  libraryHaskellDepends = [
    base bytestring containers deepseq exceptions hashable lens mtl
    spiros text transformers unordered-containers
  ];
  executableHaskellDepends = [ base ];
  testHaskellDepends = [
    base doctest hedgehog tasty tasty-hedgehog tasty-hunit
  ];
  benchmarkHaskellDepends = [ base criterion deepseq ];
  homepage = "http://github.com/sboosali/validation-warning#readme";
  description = "TODO";
  license = stdenv.lib.licenses.bsd3;
}
