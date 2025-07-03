function is_arabic(text)
    if text:match("[A-Za-z0-9%(%)]") or text:match("[^%s\u{0600}-\u{06FF}]") then
      return false
    end
    local count = 0
    for uchar in text:gmatch("[%z\1-\127\194-\244][\128-\191]*") do
      if uchar:match("[\u{0600}-\u{06FF}]") then
        count = count + 1
      end
    end
    return count >= 2
  end
  
  function wrap_arabic(inlines)
    local result = {}
    for _, inline in ipairs(inlines) do
      if inline.t == "Str" and is_arabic(inline.text) then
        table.insert(result, pandoc.RawInline("latex", "\\arabicfontwrap{" .. inline.text .. "}"))
      else
        table.insert(result, inline)
      end
    end
    return result
  end
  
  function Para(elem)
    elem.content = wrap_arabic(elem.content)
    return elem
  end
  
  function Plain(elem)
    elem.content = wrap_arabic(elem.content)
    return elem
  end
  
  function Emph(elem)
    elem.content = wrap_arabic(elem.content)
    return elem
  end
  
  function Strong(elem)
    local parts = wrap_arabic(elem.content)
    local result = {}
    for _, inline in ipairs(parts) do
      if inline.t == "RawInline" and inline.format == "latex" and inline.text:match("^\\arabicfontwrap") then
        table.insert(result, inline) -- let arabic text outside bold
      else
        table.insert(result, pandoc.Strong{inline})
      end
    end
    return result
  end
  