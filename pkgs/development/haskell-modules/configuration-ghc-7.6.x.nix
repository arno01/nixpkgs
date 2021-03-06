{ pkgs }:

with import ./lib.nix { inherit pkgs; };

self: super: {

  # Suitable LLVM version.
  llvmPackages = pkgs.llvmPackages_34;

  # Disable GHC 7.6.x core libraries.
  array = null;
  base = null;
  binary = null;
  bin-package-db = null;
  bytestring = null;
  Cabal = null;
  containers = null;
  deepseq = null;
  directory = null;
  filepath = null;
  ghc-prim = null;
  haskell2010 = null;
  haskell98 = null;
  hoopl = null;
  hpc = null;
  integer-gmp = null;
  old-locale = null;
  old-time = null;
  pretty = null;
  process = null;
  rts = null;
  template-haskell = null;
  time = null;
  unix = null;

  # transformers is not a core library for this compiler.
  transformers = self.transformers_0_4_3_0;

  # haskeline and terminfo are not core libraries for this compiler.
  haskeline = self.haskeline_0_7_2_1;
  terminfo = self.terminfo_0_4_0_1;

  # https://github.com/haskell/cabal/issues/2322
  Cabal_1_22_2_0 = super.Cabal_1_22_2_0.override { binary = self.binary_0_7_4_0; };

  # https://github.com/tibbe/hashable/issues/85
  hashable = dontCheck super.hashable;

  # Needs Cabal >= 1.18.x.
  jailbreak-cabal = super.jailbreak-cabal.override { Cabal = dontJailbreak self.Cabal_1_18_1_6; };

  # Haddock chokes on the prologue from the cabal file.
  ChasingBottoms = dontHaddock super.ChasingBottoms;

  # Later versions require a newer version of bytestring than we have.
  aeson = self.aeson_0_7_0_6;

  # The test suite depends on time >=1.4.0.2.
  cookie = dontCheck super.cookie;

  # Work around bytestring >=0.10.2.0 requirement.
  streaming-commons = addBuildDepend super.streaming-commons self.bytestring-builder;

  # Choose appropriate flags for our version of 'bytestring'.
  bytestring-builder = disableCabalFlag super.bytestring-builder "bytestring_has_builder";

  # Tagged is not part of base in this environment.
  contravariant = addBuildDepend super.contravariant self.tagged;
  reflection = dontHaddock (addBuildDepend super.reflection self.tagged);

  # The compat library is empty in the presence of mtl 2.2.x.
  mtl-compat = dontHaddock super.mtl-compat;

  # Newer versions require a more recent compiler.
  control-monad-free = super.control-monad-free_0_5_3;

  # Needs hashable on pre 7.10.x compilers.
  nats = addBuildDepend super.nats self.hashable;

}
