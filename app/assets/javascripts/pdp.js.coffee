$ ->
  $('article h2').each ->
    $goal = $(@).nextUntil('h2, hr').andSelf().wrapAll('<section class="goal">').parent()
    $header = $(@).find('+ p').andSelf().wrapAll('<header>').parent()
    $main = $(@).parent().nextUntil('h3').wrapAll('<main>').parent()

    remove = true
    $status = $goal.find('h3').nextAll().andSelf().wrapAll('<footer>').parent()
    $goal.addClass switch $status.find('p').text().split('.')[0]
      when 'In progress' then 'in-progress'
      when 'Cancelled' then 'cancelled'
      when 'Success' then 'success'
      when 'Waiting' then 'waiting'
      else remove = false
    $status.find('p').text($status.find('p').text().replace(/[^\.]*\./, '')) if remove
