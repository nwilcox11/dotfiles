-- Will probably replace this with nvim-spectre
-- https://github.com/nvim-pack/nvim-spectre

local function split(s)
  local out = {}
  local delimiter = "|"

  for match in (s..delimiter):gmatch("(.-)"..delimiter) do
    table.insert(out, match)
  end

  return out
end

vim.api.nvim_create_user_command("Rename", function()
  local input = vim.fn.input("Replace a with b: ", "")
  local replace_list = split(input)

  if #replace_list ~= 2 then
    print("Please provide two | separated strings.")
  else
    vim.cmd(":cdo %s".."/" .. replace_list[1] .. "/" .. replace_list[2] .. "/g|w")
  end
end, {})

vim.keymap.set("n", "<leader>rn", "<cmd>Rename<CR>", { silent = true })
