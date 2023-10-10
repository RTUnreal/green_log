let
  _pkgs = (import <nixpkgs> { });
  oxalica = import (_pkgs.fetchFromGitHub {
    owner = "oxalica";
    repo = "rust-overlay";
    rev = "21afe9cb01cd2bb38335b09f0d0efe9cb6b0f82d"; # Latest stable (1.69.0)
    sha256 = "sha256-k8qmH9WG3C742OzqQfGmDqKqkqawIT7MwnAabk/OiZo=";
  });
  pkgs = import <nixpkgs> { overlays = [ oxalica ]; };
in
pkgs.mkShell rec {
  packages = with pkgs; [
    rust-bin.stable.latest.default # Build Rust sources
    cargo-watch

    curl # For container health checks

    pkg-config # For header discovery from build scripts
    openssl.dev # OpenSSL headers
    pkgs.llvmPackages.bintools # lld for faster linking

    shellcheck # Lint shell scripts
    terraform
    yarn

    # sqlx cli for migration management
    (rustPlatform.buildRustPackage rec {
      pname = "sqlx-cli";
      version = "0.6.3";

      src = fetchCrate {
        inherit pname version;
        sha256 = "sha256-891GwbqaB3sR+fCH3FQFuD1TXoxxNxg1qn/t5ANH//8=";
      };

      cargoHash = "sha256-tE65wBkbWU6roBTWPoz4jbkj3rNMgS2euX4A5UD3SAQ=";
      cargoDepsName = pname;

      buildNoDefaultFeatures = true;
      buildFeatures = [ "postgres" "native-tls" ];
      nativeBuildInputs = [ pkgs.pkg-config ];
      buildInputs = [ pkgs.openssl ];
    })
  ];
}
