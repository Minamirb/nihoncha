$(function(){
  lightboxConfig['lbdialog_defaultHeight'] = 300;
  $("#wish_submit").click(function(){
    $(this).hide();
    $("#ajax_loader").show();
    var form = $(this.form);
    var action = form.attr('action') + '.json';
    $.ajax({type: 'POST',
            url:  action,
            data: form.serialize(),
            dataType: 'json',
            success: function(result, dataType){
              var div = $(document.createElement('div'));
              div.attr('wish_preview');
              form = $(document.createElement('form'));
              action = action.split('/');
              action.pop();
              form.attr({'method': 'POST', 'action': action.join('/')});
              var wish = result['wish'];
              var attributes = ['name', 'price', 'description'];
              for(var n = 0; n < attributes.length; n++){
                var d = $(document.createElement('div'));
                d.html(wish[attributes[n]]);
                d.attr('id', 'wish_' + attributes[n]);
                div.append(d);
              }
              var message = $(document.createElement('p'));
              message.html('この内容で登録してもよろしいですか？');
              message.css({'text-align': 'center'});
              div.append(message);
              lbdialog({
                content: div.html(),
                OKButton: {text: '登録',
                           callback: function(){
                             $("#wish_uri").val('');
                             $.ajax({type: 'POST', 
                                     async: false,
                                     url: '/wishes.json',
                                     data: {'wish': wish}
                                    });
                             location.reload();
                           }
                          },
                cancelButton: {text: 'キャンセル',
                               callback: function(){
                                 $("#wish_submit").show();
                               }
                              }
              });
              $("#ajax_loader").hide();
           },
           error: function(){
             alert('error');
           }});
    return false;
  });
});