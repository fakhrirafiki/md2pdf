-- markright-from-heading.lua
function Header(el)
  if el.level == 1 then
    local title = pandoc.utils.stringify(el.content)
    local latex = "\\markright{" .. title .. "}"
    return { el, pandoc.RawBlock("latex", latex) }
  end
end