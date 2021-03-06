# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, cleanUnions, elevator, transformers }:

cabal.mkDerivation (self: {
  pname = "minioperational";
  version = "0.4.8.1";
  sha256 = "02nkgbpf1dky7h3n99j9m3101wyfahcdx5wk5vidvf9snl5vy1w9";
  buildDepends = [ cleanUnions elevator transformers ];
  meta = {
    homepage = "https://github.com/fumieval/minioperational";
    description = "fast and simple operational monad";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
