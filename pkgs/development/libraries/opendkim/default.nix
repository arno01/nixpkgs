{stdenv, fetchurl, openssl, libmilter}:

stdenv.mkDerivation rec {
  name = "opendkim-2.4.3";
  src = fetchurl {
    url = "mirror://sourceforge/opendkim/files/${name}.tar.gz";
    sha256 = "01h97h012gcp8rimjbc9mrv4759cnw4flb42ddiady1bmb2p7vy3";
  };

  preConfigure = ''
    configureFlagsArray=(
      CFLAGS="-fPIE -fstack-protector-all --param ssp-buffer-size=4 -O2 -D_FORTIFY_SOURCE=2" LDFLAGS="-pie -Wl,-z,relro,-z,now"
    )
  '';

  configureFlags="--with-openssl=${openssl} --with-milter=${libmilter}";

  buildInputs = [openssl libmilter];
}
