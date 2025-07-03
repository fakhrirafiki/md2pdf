-- dropcap-first-paragraph.lua
-- Apply \lettrine to the first paragraph after each chapter title without small caps

local is_after_chapter = false
local skip_dropcap = false
local inside_blockquote = false

local chapters_without_dropcap = {
  ["Pembukaan"] = true,
  ["Pendahuluan"] = true,
  ["Catatan Penulis"] = true,
  ["Bagian Nilai"] = true,
  ["Bagian Ilmu"] = true,
  ["Bagian Aktivitas"] = true,
}

local function stringify(inlines)
  local result = {}
  for _, el in ipairs(inlines) do
    if el.t == "Str" then
      table.insert(result, el.text)
    elseif el.t == "Space" then
      table.insert(result, " ")
    end
  end
  return table.concat(result)
end

function Header(el)
  if el.level == 1 then
    is_after_chapter = true
    local title_text = stringify(el.content)
    if chapters_without_dropcap[title_text] then
      skip_dropcap = true
    else
      skip_dropcap = false
    end
  end
end

function BlockQuote(el)
  inside_blockquote = true
  return el
end

function Para(el)
  if is_after_chapter and not skip_dropcap and not inside_blockquote then
    for i, inline in ipairs(el.content) do
      if inline.t == "Str" and inline.text:match("%a") then
        local first_letter = inline.text:match("%a")
        local prefix = inline.text:match("^(.-)%a") or ""
        local rest = inline.text:gsub("^(.-)(%a)", "")

        local full = prefix .. "\\lettrine[lines=2, loversize=0.2, findent=1pt, nindent=0pt]{" .. first_letter .. "}{\\upshape " .. rest .. "}"
        el.content[i] = pandoc.RawInline("latex", full)

        is_after_chapter = false
        break
      end
    end
  else
    is_after_chapter = false
  end
  inside_blockquote = false
  return el
end
