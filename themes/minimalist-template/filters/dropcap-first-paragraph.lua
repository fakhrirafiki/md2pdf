-- dropcap-first-paragraph.lua
-- Automatically apply \lettrine to first paragraph after each chapter

function RawBlock(el)
    if el.format == "latex" and el.text:match("\\chapter%*?{") then
      is_after_chapter = true
    end
  end
  
  function Para(el)
    if is_after_chapter then
      local first_word = el.content[1]
      if first_word and first_word.t == "Str" then
        local first_char = first_word.text:sub(1,1)
        local rest = first_word.text:sub(2)
        first_word.text = rest
        table.insert(el.content, 1, pandoc.RawInline("latex", "\\lettrine{" .. first_char .. "}{"))
        table.insert(el.content, pandoc.RawInline("latex", "}"))
        is_after_chapter = false
      end
    end
    return el
  end