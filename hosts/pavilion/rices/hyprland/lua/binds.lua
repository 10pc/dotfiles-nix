hl.bind("SUPER + Return", hl.dsp.exec_raw("kitty"))
hl.bind("SUPER + D", hl.dsp.exec_raw("rofi -show drun"))
hl.bind("SUPER + Q", hl.dsp.window.close())


for i = 1, 10 do
  local key = i % 10
  hl.bind("SUPER + " .. key, hl.dsp.focus({ workspace = i }))
  hl.bind("SUPER + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end