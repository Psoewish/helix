{
  language = [
    {
      name = "nix";
      language-servers = [ "nixd" ];
      auto-format = true;
      formatter.command = "nixfmt";
    }
    {
      name = "lua";
      auto-format = true;
    }
    {
      name = "markdown";
      language-servers = [
        "marksman"
        "markdown-oxide"
        "harper"
        "mpls"
      ];
      formatter = {
        command = "prettier";
        args = [
          "--parser"
          "--markdown"
          "--prose-wrap"
          "never"
        ];
      };
      auto-format = true;
    }
  ];
  language-server = {
    harper-ls = {
      command = "harper-ls";
      args = [ "--stdio" ];
    };
    mpls = {
      command = "mpls";
      args = [
        "--dark-mode"
        "--enable-emoji"
        "--full-sync"
      ];
    };
  };
}
