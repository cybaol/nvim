#!/usr/bin/env lua

local execute_shell_command = function(command)
  local ans = {}
  for item in io.popen(command, 'r'):lines() do
    table.insert(ans, item)
  end
  return ans
end

local is_file_exists = function(filename)
  local f = io.open(filename, 'r')
  return f ~= nil and f:close()
end

local get_file_basename = function(filename)
  local index = filename:match('.+()%.%w+$')
  return index and filename:sub(1, index - 1) or filename
end

local get_file_extension = function(filename)
  return filename:match('.+%.(%w+)$')
end

local cwd = execute_shell_command('pwd')[1]
local files = execute_shell_command('ls ' .. cwd)
local opened_files = execute_shell_command('ls ' .. os.getenv('HOME') .. '/.config/nvim/tmp/backup/')
for _, fileName in ipairs(files) do
  local fileExt = get_file_extension(fileName)
  if fileExt == 'c' or fileExt == 'cc' or fileExt == 'cpp' or fileExt == 'cu' then
    for _, opened in ipairs(opened_files) do
      if fileName .. '.swp' == opened then
        fileNameWithoutExt = get_file_basename(fileName)
        if is_file_exists(cwd .. '/CMakeLists.txt') then
          os.execute('cmake -Bbuild -GNinja && cmake --build build && ./build/' .. fileNameWithoutExt)
        elseif fileExt == 'c' then
          os.execute(
            'clang -Og -g -lm -lpthread -Wall -std=c2x '
              .. fileName
              .. ' -o '
              .. fileNameWithoutExt
              .. ' && ./'
              .. fileNameWithoutExt
          )
        else
          os.execute(
            'clang++ -Og -g -lm -lpthread -Wall -std=c++2b '
              .. fileName
              .. ' -o '
              .. fileNameWithoutExt
              .. ' && ./'
              .. fileNameWithoutExt
          )
        end
      end
    end
  end
end
