@RailsBsPopcon = {}
RailsBsPopcon.DEFAULTS = $.extend {}, $.fn.popover.Constructor.DEFAULTS,
  placement: 'top'
  title: 'Are you sure?'
  html: true
  btnOkClass: 'btn btn-danger'
  btnOkIcon: 'glyphicon glyphicon-ok'
  btnOkLabel: 'Yes'
  btnCancelClass: 'btn btn-default'
  btnCancelIcon: 'glyphicon glyphicon-remove'
  btnCancelLabel: 'No'
  template:
      '<div class="popover">
        <div class="arrow"></div>
        <h3 class="popover-title"></h3>
        <div class="popover-content text-center">
        </div>
      </div>'
  content: '
    <div class="btn-group">
      <a class="btn" data-apply="confirmation"></a>
      <a class="btn" data-dismiss="confirmation"></a>
    </div>'

actionConfirmed = (element) ->
  $(element).removeAttr('data-confirm')
  $(element).removeData('confirm')
  $(element).trigger('click.rails')

if (typeof $().popover == 'function') # test if bootstrap is loaded
  $.rails.allowAction = (element) ->
    message = element.data('confirm')
    answer = false
    return true unless message
      
    if $.rails.fire(element, 'confirm')
      if $(element).data('bs.popover') == undefined
        options = $.extend {}, RailsBsPopcon.DEFAULTS, $(element).data()
        $content = $('<div>', html: options.content)
        $content.prepend $('<p>', html: message) unless typeof(message) == 'boolean'
        $content.find '[data-apply=confirmation]'
          .addClass options.btnOkClass
          .html options.btnOkLabel
          .prepend $('<i>', class: options.btnOkIcon), ' '
          .on 'click', ->
            actionConfirmed(element)
            $(element).popover('destroy')
        $content.find '[data-dismiss=confirmation]'
          .addClass options.btnCancelClass
          .html options.btnCancelLabel
          .prepend $('<i>', class: options.btnCancelIcon), ' '
          .on 'click', ->
            $(element).popover('destroy')
        options.content = $content.children()
        $(element).popover(options).popover('show')
        $(element).data('bs.popover').inState.click = true # https://github.com/twbs/bootstrap/issues/16732

    false