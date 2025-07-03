-- Lua filter to override H3 and H4 headings with custom LaTeX block
function Header(el)
    local heading_doc = pandoc.Pandoc({pandoc.Para(el.content)})
    local heading_latex = pandoc.write(heading_doc, "latex"):gsub("^%s+", ""):gsub("\n", "")
  
    if el.level == 3 then
      return pandoc.RawBlock("latex", "\\vspace{1em}\\begin{flushleft}\\sffamily\\bfseries\\Large " .. heading_latex .. "\\end{flushleft}")
    elseif el.level == 4 then
      return pandoc.RawBlock("latex", "\\vspace{0.5em}\\begin{flushleft}\\sffamily\\bfseries\\normalsize " .. heading_latex .. "\\end{flushleft}")
    end
  end
  