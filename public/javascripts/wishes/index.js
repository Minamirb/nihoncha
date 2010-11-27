$(function(){
  lightboxConfig['lbdialog_defaultHeight'] = 280;
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
              var img;
              if(wish['image_url']){
                img = $(document.createElement('img'));
                img.attr({src: wish['image_url'], align: 'top', width: 80});
                img.css('float', 'left');
                div.append(img);
              }

              var h3 = $(document.createElement('h3'));
              var a = $(document.createElement('a'));
              a.html(wish['name']);
              a.attr('href', 'javascript:void(0); return false;');
              h3.append(a);
              h3.css('font-size', 'small');
              var span = $(document.createElement('span'));
              span.html('&yen;' + wish['price']);
              h3.append(span);
              div.append(h3);

              var description = $(document.createElement('div'));
              description.html(wish['description']);
              div.append(description);

              if(img){
                d = $(document.createElement('div'));
                d.css('clear', 'both');
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
