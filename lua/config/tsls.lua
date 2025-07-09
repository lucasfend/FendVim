local M = {}

function M.setup()
  -- Remove the LSP setup lines since they're now in plugins/typescript.lua
  -- Keep only the Angular CLI commands and keymaps
  -- ==========================================
  -- Angular CLI Shortcuts (Shorthand Syntax!)
  -- ==========================================
  local function get_angular_input(type)
    local name = vim.fn.input("Name (e.g., 'user-profile'): ")
    if name == "" then
      return nil
    end
    return name
  end

  -- Define :Ng command with subcommands (g[enerate])
  vim.api.nvim_create_user_command("Ng", function(opts)
    local parts = vim.split(opts.args, "%s+")
    local command = table.concat(parts, " ")

    local generators = {
      c = "component",
      s = "service",
      i = "interface",
      d = "directive",
      p = "pipe",
    }

    if #parts >= 2 and parts[1] == "g" and generators[parts[2]] then
      local generator = generators[parts[2]]
      local name = #parts >= 3 and parts[3] or get_angular_input(generator)
      if name then
        local cmd = "!ng generate " .. generator .. " " .. name
        vim.cmd("botright split | terminal " .. cmd)
      end
    else
      vim.cmd("botright split | terminal ng " .. command) --running the ng server on another terminal so it dont causes nvim to freeze
    end
  end, { nargs = "*", desc = "Angular CLI wrapper (e.g., ':Ng g c my-comp')" })

  vim.keymap.set("n", "<leader>ng", ":Ng ", { desc = "Angular CLI" })
end

return M

-- testing restore_cr
-- it works well by now
