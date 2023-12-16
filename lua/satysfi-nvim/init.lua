local M = {}

M.setup = function()
  -- filetype detection
  vim.filetype.add {
    extension = {
      saty = "satysfi",
      satyg = "satysfi",
      satyh = "satysfi",
    },
  }

  -- language server
  if pcall(require, "lspconfig") then
    require("lspconfig.configs").satysfi_ls = {
      default_config = {
        cmd = { 'satysfi-language-server' },
        filetypes = { 'satysfi' },
        root_dir = require("lspconfig.util").root_pattern('.git'),
        single_file_support = true,
      },
      docs = {
        description = [[
          https://github.com/monaqa/satysfi-language-server
          Language server for SATySFi.
          ]],
        default_config = {
          root_dir = [[root_pattern(".git")]],
        },
      },
    }
    if pcall(require, "mason-lspconfig") then
      pcall(function()
        -- This is not a public API, so it may be broken by in a future release.
        require("mason-lspconfig.mappings.server").lspconfig_to_package["satysfi_ls"] = "satysfi-language-server"
        require("mason-lspconfig.mappings.server").package_to_lspconfig["satysfi-language-server"] = "satysfi_ls"
      end)
    end
  end

  -- treesitter
  if pcall(require, "nvim-treesitter") then
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.satysfi = {
      install_info = {
        url = "https://github.com/monaqa/tree-sitter-satysfi", -- local path or git repo
        files = {"src/parser.c", "src/scanner.c"}
      },
      filetype = "satysfi", -- if filetype does not agrees with parser name
    }
  end
end

return M
