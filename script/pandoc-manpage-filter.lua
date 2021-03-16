return {
  {
    Emph = function(elem)
      return pandoc.Code(pandoc.utils.stringify(elem.c))
    end,
  }
}
