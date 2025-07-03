-- unnumbered-chapters.lua
function Header(el)
  local unnumbered_titles = {
    "Pendahuluan",
    "Catatan Penulis",
    "Bagian Nilai",
    "Bagian Ilmu",
    "Bagian Aktivitas",
  }

  if el.level == 1 then
    local title = pandoc.utils.stringify(el.content)
    for _, v in ipairs(unnumbered_titles) do
      if title == v then
        return pandoc.RawBlock('latex',
          '\\chapter*{' .. title .. '}\\addcontentsline{toc}{chapter}{' .. title .. '}')
      end
    end
  end

  return el
end