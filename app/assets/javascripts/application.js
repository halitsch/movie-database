// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require highcharts
//= require chartkick
//= require bootstrap
//= require turbolinks
//= require_tree .

var ready;
 ready = function() {

    jQuery(function(){

            var minimized_elements = $('p.minimize');
            
            minimized_elements.each(function(){    
                var t = $(this).text();        
                if(t.length < 100) return;
                
                $(this).html(
                    t.slice(0,100)+'<span>... </span><a href="#" class="more">More</a>'+
                    '<span style="display:none;">'+ t.slice(100,t.length)+' <a href="#" class="less">Less</a></span>'
                );
                
            }); 
            
            $('a.more', minimized_elements).click(function(event){
                event.preventDefault();
                $(this).hide().prev().hide();
                $(this).next().show();        
            });
            
            $('a.less', minimized_elements).click(function(event){
                event.preventDefault();
                $(this).parent().hide().prev().show().prev().show();    
            });

    });
    
};
 
 $(document).ready(ready);
 $(document).on('page:load', ready);

