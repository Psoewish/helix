{
  theme = "rose_pine";
  editor = {
    line-number = "absolute";
    continue-comments = false;
    bufferline = "multiple";
    color-modes = true;
    end-of-line-diagnostics = "hint";
  };
  editor.statusline = {
    left = [
      "mode"
      "read-only-indicator"
      "diagnostics"
    ];
    center = [
      "spinner"
      "file-name"
      "file-modification-indicator"
    ];
    right = [
      "file-type"
      "position"
    ];
  };
  editor.cursor-shape = {
    insert = "bar";
  };
  editor.file-picker = {
    hidden = false;
  };
  editor.whitespace.render = {
    space = "none";
    tab = "all";
    nbsp = "none";
    nnbsp = "none";
    newline = "none";
  };
  editor.indent-guides = {
    render = true;
    character = "▏";
    skip-levels = 1;
  };
  editor.soft-wrap = {
    enable = true;
  };
  editor.inline-diagnostics = {
    cursor-line = "warning";
  };
  keys = {
    normal = {
      esc = [
        "collapse_selection"
        "keep_primary_selection"
      ];
      C-g = [
        ":new"
        ":insert-output lazygit"
        ":buffer-close!"
        ":redraw"
      ];
      C-s = [ ":w" ];
    };
  };
}
