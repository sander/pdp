$ ->
  $('h1 + p').each ->
    [name, version] = $(@).remove().text().split(/\n\s*/g)
    $('<header>').html([
      $('<h1>').text(name),
      $('<h2>').text(version)
    ]).prependTo('body')

  $('article h1, hr').each ->
    $part = $(@).nextUntil('hr').wrapAll('<section class="part">').parent()

  $('article h2').each ->
    $goal = $(@).nextUntil('h2, hr').andSelf().wrapAll('<section class="goal">').parent()
    $header = $(@).find('+ p').andSelf().wrapAll('<header>').parent()
    $main = $(@).parent().nextUntil('h3').wrapAll('<main>').parent()

    [areas, _, means, _] = $header.find('p').text().split(/( \(|\))/)
    $p = $header.find('p').empty()
    $('<span class="areas">').text(areas).appendTo $p
    $('<span class="means">').text(means).appendTo $p if means

    $main.html $main.html().replace /(>)([^<.]+\.)([^<]*)/,
      '$1<span class=first>$2</span><span class=rest>$3</span>'

    remove = true
    $status = $goal.find('h3').nextAll().andSelf().wrapAll('<footer>').parent()
    $goal.addClass switch $status.find('p').text().split('.')[0]
      when 'In progress' then 'in-progress'
      when 'Cancelled' then 'cancelled'
      when 'Success' then 'success'
      when 'Waiting' then 'waiting'
      else remove = false
    $status.find('p').html($status.find('p').html().replace(/[^\.]*\./, '')) if remove

  $('body').addClass 'details'
  $('<a>').addClass('toggle-details').text('Details').appendTo($('<p>').prependTo('body')).click ->
    $('body').toggleClass('details').toggleClass('no-details')
