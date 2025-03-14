-- return {
--     'sainnhe/gruvbox-material',
--     lazy = false, -- Cargar inmediatamente
--     priority = 1000, -- Cargar antes que otros esquemas de colores
--     config = function()
--       -- Configuración para Gruvbox Material
--       vim.g.gruvbox_material_background = 'hard' -- Opciones: 'hard', 'medium', 'soft'
--       vim.g.gruvbox_material_palette = 'original'       -- Opciones: 'original', 'mix', 'material'
--       vim.g.gruvbox_material_enable_italic = 0     -- Habilitar cursivas
--       vim.g.gruvbox_material_diagnostic_virtual_text = 'colored' -- Colores en texto virtual
--
--       -- Aplicar el esquema de colores
--       vim.cmd.colorscheme('gruvbox-material')
--     end
--   }
return {
  'projekt0n/github-nvim-theme',
  name = 'github-theme',
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require('github-theme').setup({
      -- ...
    })

    vim.cmd('colorscheme github_dark')
  end,
}
