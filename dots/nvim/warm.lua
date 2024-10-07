-- Thanks to https://github.com/savq/melange 
-- This is a modified version of it
-- ~/.local/share/nvim/lazy/base46/lua/base46/themes/
local M = {}
local color0  = "#1e1000"
local color1  = "#E66D13"
local color2  = "#B98820"
local color3  = "#CF830E"
local color4  = "#FD9412"
local color5  = "#FFA319"
local color6  = "#E49B5D"
local color7  = "#ffc362"
local color8  = "#291703"
local color9  = "#403030"
local color10 = "#1b0f00"
M.base_30 = {
  -- weirdass notation
  -- this theme is based on melange theme templates so idk 
  white = color7,
  darker_black = color10,
  black = color0, -- nvim bg
  black2 = color8,  
  one_bg = color8,
  one_bg2 = color9,
  one_bg3 = color4,
  grey = color8,
  grey_fg = color3,
  grey_fg2 = color8,
  light_grey = color9,
  red = color1,
  baby_pink = color6,
  pink = color6,
  line = color5, -- for lines like vsplit
  green = color2,
  v_green = color2,
  nord_blue = color3,
  blue = color3,
  yellow = color4,
  sun = color4,
  purple = color6,
  dark_purple = color4, --insert
  teal = color2,
  orange = color4,
  firered = color3,
  cyan = color9, --that thingy on stt line bg
  statusline_bg = color10,
  lightbg = color8,
  pmenu_bg = color2, -- command suggestion thingy 
  folder_bg = color8,
}

M.base_16 = {
  base00 = color0,
  base01 = color9,
  base02 = color5,
  base03 = color5,
  base04 = color6,
  base05 = color4, --string
  base06 = color2,
  base07 = color3,
  base08 = color1,
  base09 = color2,
  base0A = color3,
  base0B = color2,
  base0C = color5,
  base0D = color7,
  base0E = color2,
  base0F = color6,
}

M.type = "dark"

M.polish_hl = {
  ["@field"] = { fg = M.base_30.black },
  ["@field.key"] = { fg = M.base_30.white },

  ["@function.macro"] = {
    fg = M.base_30.v_green,
  },

  Include = {
    fg = M.base_30.v_green,
  },

  Operator = {
    fg = M.base_30.firered,
  },

  Boolean = {
    fg = M.base_30.purple
  }
}

M = require("base46").override_theme(M, "amogus")
return M
