local bg = '#000000'
local fg = '#fcfcfc'
local bright_bg = '#000000'
local bright_fg = '#FFFFFF'
local black = '#000000'
local white = '#FFFFFF'

return {
  tab_bar = {
    background = black,
    active_tab = {
      bg_color = bg,
      fg_color = white,
      intensity = 'Bold', -- "Half" "Normal" "Bold"
      underline = 'None', -- "None" "Single" "Double"
      italic = false,
      strikethrough = false,
    },
    inactive_tab = {
      bg_color = black,
      fg_color = fg,
    },
    new_tab = {
      bg_color = black,
      fg_color = fg,
    },
    inactive_tab_hover = {
      bg_color = black,
      fg_color = bright_fg,
      italic = false,
    },
    new_tab_hover = {
      bg_color = bg,
      fg_color = bright_fg,
      italic = false,
    },
  },
  background = bg,
  foreground = fg,
  cursor_bg = fg,
  cursor_fg = black,
  cursor_border = fg,
  selection_fg = black,
  selection_bg = fg,
  scrollbar_thumb = fg,
  split = black,
  ansi = {
    bright_bg,
    '#ed1515',
    '#11d116',
    '#f67400',
    '#1d99f3',
    '#9b59b6',
    '#1abc9c',
    bright_fg,
  },
  brights = {
    '#7f8c8d',
    '#c0392b',
    '#1cdc9a',
    '#fdbc4b',
    '#3daee9',
    '#8e44ad',
    '#16a085',
    white,
  },
}
