local M = {}
M.Nmap = function(keys, cmd, desc)
    vim.keymap.set("n", keys, cmd, { desc = desc })
end

M.Vmap = function (keys, cmd, desc)
    vim.keymap.set("v", keys, cmd, { desc = desc })
end


M.Tmap = function (keys, cmd, desc)
    vim.keymap.set("t", keys, cmd, { desc = desc })
end

-- https://www.tutorialspoint.com/concatenation-of-tables-in-lua-programming
M.MergeTables = function(t1,t2)
   for i=1,#t2 do
      t1[#t1+1] = t2[i]
   end
   return t1
end
return M
