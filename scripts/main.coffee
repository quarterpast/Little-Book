---
---

$ = document.querySelector.bind document

closest = (selector, el)->
  switch
    when not el? or not el.matches? then false
    when el.matches selector then el
    else closest selector, el.parentNode

currentPage = ->
  parseInt($('.little-book').getAttribute 'data-page') or 1

hashChange = ->
  page = parseInt(location.hash.substr(1)) or 1

  if 1 <= page <= 5
    changePage page

changePage = (page)->
  $('.little-book').setAttribute 'data-page', page

navigate = (page)->
  if 1 <= page <= 5
    location.hash = '#' + page

$ '.little-book'
  .addEventListener 'click', (ev)->
    target = closest '.little-book > section', ev.target
    if target
      navigate currentPage() + if target.matches ':nth-child(even)' then -1 else 1

document.addEventListener 'keydown', (ev)->
  switch ev.which
    when 37, 74 # left, j
      navigate currentPage() - 1
    when 39, 75 # right, k
      navigate currentPage() + 1

window.addEventListener 'hashchange', hashChange
hashChange()
