-- quotebox-fix.lua
-- Preserve bold, italic, bullet list, and ensure line breaks inside quotebox.

function Div(el)
  if el.classes:includes("quotebox") then
    local result = { pandoc.RawBlock("latex", "\\begin{quotebox}") }

    for _, block in ipairs(el.content) do
      table.insert(result, block)

      if block.t == "Para" or block.t == "Plain" then
        table.insert(result, pandoc.RawBlock("latex", "\\par"))
      elseif block.t == "BulletList" or block.t == "OrderedList" then
        -- biarkan tanpa spasi tambahan agar tidak rusak
      elseif block.t ~= "RawBlock" then
        table.insert(result, pandoc.RawBlock("latex", "\\vspace{0.5em}"))
      end
    end

    table.insert(result, pandoc.RawBlock("latex", "\\end{quotebox}"))
    return result
  end
end