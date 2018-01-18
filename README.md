# RailsBsPopcon
[![Code Climate](https://codeclimate.com/github/fnix/rails_bs_popcon/badges/gpa.svg)](https://codeclimate.com/github/fnix/rails_bs_popcon)

Use a bootstrap popover for your links with data-confirm:

You must include the following JavaScript file:

`#= require rails_bs_popcon`

The default options are:

```coffeescript
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
```

After requiring the popcon file you can change the default options like this:

```coffeescript
$.extend RailsBsPopcon.DEFAULTS,
  title: 'Tem certeza?'
  btnOkClass: 'btn btn-danger'
  btnOkLabel: 'Sim'
  btnCancelClass: 'btn btn-default'
  btnCancelLabel: 'Não'
```

The example below was generated with these modifications:



![popcon example](https://user-images.githubusercontent.com/943369/35099987-3de51bea-fc41-11e7-8890-657c01d60f1f.png "RailsBsPopcon example.")

You can also replace these options, or the [popover ones](http://getbootstrap.com/javascript/#popovers-options), through data
attributes, like `data-title: 'What?'`, `data-btn-ok-class: 'btn btn-primary btn-sm'` and so on.

If you don't want any message inside the popover content just set data-confirm to true.

MIT-LICENSE &copy; Kadu Diógenes.
