function Div(el)
    if el.classes:includes("quotebox") then
      return pandoc.RawBlock("latex", "\\begin{quotebox}\n" ..
        pandoc.utils.stringify(el) ..
        "\n\\end{quotebox}")
    end
  end
  