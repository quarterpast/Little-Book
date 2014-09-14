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
  changePage(parseInt(location.hash.substr(1)) or 1)

changePage = (page)->
  $('.little-book').setAttribute 'data-page', page

navigate = (page)->
  location.hash = '#' + page

$ '.little-book'
  .addEventListener 'click', (ev)->
    target = closest '.little-book > section', ev.target
    page   = parseInt($('.little-book').getAttribute 'data-page') or 1
    even   = target.matches ':nth-child(even)'
    next   = currentPage() + if even then -1 else 1

    if 1 <= next <= 5
      navigate next

window.addEventListener 'hashchange', hashChange
hashChange()
