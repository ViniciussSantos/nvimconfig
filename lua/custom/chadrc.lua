---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "catppuccin",
  transparency = true,
  changed_themes = {
    catppuccin = {
      base_16 = {
        base00 = "#1E1D2D",
        base01 = "#282737",
        base02 = "#2f2e3e",
        base03 = "#383747",
        base04 = "#414050",
        base05 = "#bfc6d4",
        base06 = "#ccd3e1",
        base07 = "#D9E0EE",
        base08 = "#eba0ac",
        base09 = "#fab387",
        base0A = "#f9e2af",
        base0B = "#a6e3a1",
        base0C = "#89DCEB",
        base0D = "#89B4FA",
        base0E = "#CBA6F7",
        base0F = "#F38BA8",
      },
    },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
