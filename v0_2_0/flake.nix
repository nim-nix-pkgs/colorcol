{
  description = ''Kakoune plugin for color preview'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-colorcol-v0_2_0.flake = false;
  inputs.src-colorcol-v0_2_0.owner = "SolitudeSF";
  inputs.src-colorcol-v0_2_0.ref   = "refs/tags/v0.2.0";
  inputs.src-colorcol-v0_2_0.repo  = "colorcol";
  inputs.src-colorcol-v0_2_0.type  = "github";
  
  inputs."regex".dir   = "nimpkgs/r/regex";
  inputs."regex".owner = "riinr";
  inputs."regex".ref   = "flake-pinning";
  inputs."regex".repo  = "flake-nimble";
  inputs."regex".type  = "github";
  inputs."regex".inputs.nixpkgs.follows = "nixpkgs";
  inputs."regex".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-colorcol-v0_2_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-colorcol-v0_2_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}