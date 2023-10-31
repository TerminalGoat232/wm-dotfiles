-- Thanks to https://github.com/savq/melange for existing
-- This is a modified version of it

local M = {}
local color0  = "#2d1c0a"
local color1  = "#E66D13"
local color2  = "#B98820"
local color3  = "#CF830E"
local color4  = "#FD9412"
local color5  = "#FFA319"
local color6  = "#E49B5D"
local color7  = "#f6cd8b"
local color8  = "#291703"
local color9  = "#403030"
M.base_30 = {
  -- just too lazy to rename these vars to match with their color
  -- this theme is based on melange theme templates so idk 
  white = color7,
  --darker_black = color0,
  black = color0, -- nvim bg
  --black2 = color6,
  one_bg = color7,
  one_bg2 = color2,
  one_bg3 = color4,
  grey = color6,
  grey_fg = color9,
  grey_fg2 = color6,
  light_grey = color6,
  red = color1,
  baby_pink = color1,
  pink = color1,
  line = color5, -- for lines like vsplit
  green = color2,
  v_green = color2,
  nord_blue = color3,
  blue = color3,
  yellow = color4,
  sun = color4,
  purple = color6,
  dark_purple = color7,
  teal = color2,
  orange = color4,
  firered = color3,
  cyan = color7,
  statusline_bg = color6,
  lightbg = color8,
  pmenu_bg = color6,
  folder_bg = color6,
}

M.base_16 = {
  base00 = color5,
  base01 = color2,
  base02 = color4,
  base03 = color5,
  base04 = color4,
  base05 = color6,
  base06 = color7,
  base07 = color3,
  base08 = color1,
  base09 = color2,
  base0A = color3,
  base0B = color4,
  base0C = color5,
  base0D = color1,
  base0E = color3,
  base0F = color2,
}

M.type = "dark"

M.polish_hl = {
  ["@field"] = { fg = M.base_30.white },
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

--M = require("base46").override_theme(M, "amogus")
return M
