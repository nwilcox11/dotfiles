local has_git, gitsigns = pcall(require, "gitsigns")

if has_git then
    gitsigns.setup {}
end
