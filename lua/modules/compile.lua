#!/usr/bin/env lua

local path = require('pl.path')
local dir = require('pl.dir')

local configs = {
  supported = { c = true, cc = true, cpp = true, cxx = true, cu = true },
  backup_dir = path.join(os.getenv('HOME'), '.config', 'nvim', 'tmp', 'backup'),
  compile_commands = {
    xmake = 'xmake && xmake run %s',
    cmake = 'cmake -B build && cmake --build build && ./build/%s',
    gcc = 'g++ -g -ldl -lm -llua -lpthread -Wall %s -o %s && ./%s',
  },
}

local all_files = dir.getfiles(path.abspath('.'))
local swp_files = dir.getfiles(configs.backup_dir)

local swp_index = {}
for _, swp_file in ipairs(swp_files) do
  swp_index[path.splitext(path.basename(swp_file))] = true
end

local function compile_and_run(filename, compile_commands)
  local basename = path.basename(filename)
  local stem = path.splitext(basename)
  local extension = path.extension(basename):sub(2)

  if configs.supported[extension] and swp_index[basename] then
    local command = nil

    if path.exists('xmake.lua') then
      command = compile_commands.xmake:format(stem)
    elseif path.exists('CMakeLists.txt') then
      command = compile_commands.cmake:format(stem)
    else
      command = compile_commands.gcc:format(basename, stem, stem)
    end

    if command then
      os.execute(command)
    end
  end
end

for _, filename in ipairs(all_files) do
  compile_and_run(filename, configs.compile_commands)
end
