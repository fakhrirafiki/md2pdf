-- Convert Markdown tables to tabularx with wrapping columns
function Table(elem)
    if not elem.aligns then
      return elem -- skip non-standard tables
    end
  
    local num_cols = #elem.aligns
  
    -- Build tabularx column spec
    local col_spec = {}
    for i = 1, num_cols do
      if i == 1 then
        table.insert(col_spec, ">{\\bfseries}l")
      else
        table.insert(col_spec, "X")
      end
    end
    local column_format = table.concat(col_spec, " ")
  
    local header = "\\begin{tabularx}{\\textwidth}{" .. column_format .. "}\n\\toprule"
    local footer = "\\bottomrule\n\\end{tabularx}"
  
    -- Extract header row
    local head_row = {}
    for _, cell in ipairs(elem.headers) do
      table.insert(head_row, pandoc.utils.stringify(cell))
    end
    local header_line = table.concat(head_row, " & ") .. " \\\\"
  
    -- Add midrule and body
    local body = {"\\midrule"}
    for _, row in ipairs(elem.rows) do
      local cells = {}
      for _, cell in ipairs(row) do
        table.insert(cells, pandoc.utils.stringify(cell))
      end
      table.insert(body, table.concat(cells, " & ") .. " \\\\")
    end
  
    -- Combine
    local lines = {header, header_line, table.unpack(body), footer}
    return pandoc.RawBlock("latex", table.concat(lines, "\n"))
  end
  