jQuery ->
  $('.input-radio label').click ->
    $('.submit-question').removeAttr('disabled')
    $('.submit-question').addClass('btn-active')
    $('.submit-question').css({opacity: 1.0})

  $('.ez-hide').click ->
    $('.submit-question').removeAttr('disabled')
    $('.submit-question').addClass('btn-active')
    $('.submit-question').css({opacity: 1.0})

  if($('.top-part').length > 0)
    window.parent.postMessage('{"w": "374","h": "650"}', "*")
    $('.submenu li a').click ->
      window.open($(this).attr('href'), '_blank')
  else
    window.parent.postMessage('{"w": "374","h": "400"}', "*")


  $('.submit-question').click ->
    if !$(this).prop('disabled')
      $.ajax
        type: "POST"
        url: $('#choose-time').attr("action")
        data: $('#choose-time').serialize()
        success: (data) ->
          $('#page').html(data)
          $('.inner').animate({'marginLeft': '-=2000px'})
          $('.inner').animate({'marginLeft': '+=2000px'})
      false


  $('.previous-question').click ->
    $.ajax
      type: "GET"
      url: $(this).attr('href')
      success: (data) ->
        $('#page').html(data)
        $('.inner').animate({'marginLeft': '-=2000px'})
        $('.inner').animate({'marginLeft': '+=2000px'})
        if($('.answered-question').length > 0)
          answer = $('.answered-question').attr('answer_id')
          $('input[value="' + answer + '"]').first().trigger('click')
          $('.submit-question').removeAttr('disabled')
          $('input[value="' + answer + '"]').parent().first().addClass('selected')
          $('.submit-question').css({opacity: 1.0})
      false


  if($('.table').length > 0)
    cells = $('.table').find('tr')[0].cells.length
    desired_width = 940 / cells + 'px'

  $('.table td').css('width', desired_width)

  $('#sortable').sortable(
    axis: 'y'
    items: '.item'

    stop: (e, ui) ->
      ui.item.children('td').effect('highlight', {}, 1000)
    update: (e, ui) ->
      item_id = ui.item.attr('data-question-id')
      position = ui.item.index()
      $.ajax(
        type: 'POST'
        url: $(this).attr('data-update-url')
        dataType: 'json'
        data: { id: item_id, ordering: { row_order_position: position } }
      )
  )

