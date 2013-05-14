/**
 * spinner - spinning large chunks of data with jQuery
 *   http://n.efario.us/jquery/spinner/
 *
 * Copyright (c) 2008 Paul Bringetto (http://n.efario.us)
 * licensed under http://www.gnu.org/licenses/gpl-3.0.txt.
 *
 */
 (function($){  
  $.fn.spinner = function(total,options) {  
   var defaults = {
      current_offset: 0,
      items_per_page: 15,
      result_container: 'result',
      image_prev: 'http://assets.bringetto.com/js/spinner/img/link-vert-prev.png',
      image_next: 'http://assets.bringetto.com/js/spinner/img/link-vert-next.png',
      prev_id: 'prev',
      next_id: 'next',
      prev_alt: 'prev',
      next_alt: 'next',
      orientation: 'vert',
      image_container_class: 'prev_next',
      callback:function() { return false; }
    };
    var options = $.extend(defaults, options); 
    return this.each(function() {        
      var obj = $(this);
      //get the container id
      var container_id = $(this).attr('id');
      //create containers
      var container = $('<div></div>');
      var prev = $('<div></div>');
      var result = $('<div></div>');
      var next = $('<div></div>');  
      $(prev).addClass(options.prev_id + '_' + options.orientation);
      $(next).addClass(options.next_id + '_' + options.orientation);
      $(prev).attr({id: options.prev_id});   
      $(result).attr({id: options.result_container});
      $(next).attr({id: options.next_id});
      $(container).append(prev);
      $(container).append(result);
      $(container).append(next);
      if(options.orientation === 'horz') {
        $(container).addClass('clearfix');
        $(prev).addClass('floatleft');
        $(result).addClass('floatleft');
        $(next).addClass('floatright');
        var container_height = $(obj).height();
        $(prev).height(container_height);
        $(next).height(container_height);
        $(prev).css('line-height',container_height + 'px');
        $(next).css('line-height',container_height + 'px');
      } else {
        $(prev).css('text-align','center');
        $(next).css('text-align','center');        
      }
      $(this).append(container);
      //inserts the links into the container element
      function paintArrows() {
        //helper function returns a handler function that calls getOffset with the correct offset
        var getClickHandler = function(offset) {
          return function(evt){ return getOffset(offset,evt); }
        }       
        //create prev link and bind click event
        var prev_link = $('<img src="'+(options.image_prev)+'" border=0 alt="'+(options.prev_alt)+'" />').bind('click', getClickHandler(current_offset-1));
        //create next link and bind click event
        var next_link = $('<img src="'+(options.image_next)+'" border=0 alt="'+(options.next_alt)+'" />').bind('click', getClickHandler(current_offset+1));
        if(options.orientation === 'horz') {
          $(prev_link).css("vertical-align","middle");
          $(next_link).css("vertical-align","middle");
        }
        //update links
        $('#' + container_id + ' #' + options.prev_id).html(prev_link);
        $('#' + container_id + ' #' + options.next_id).html(next_link);
      }
      /*
      *  This is the event handling function for the links.
      *  @param {int} offset The new offset
      */
      function getOffset(offset, evt){
        current_offset = offset;
        //offset * items per page > than total
        if((offset * options.items_per_page) > total) {
          current_offset = 0;
        }
        //offset < 0
        if(offset < 0) {
          current_offset = Math.round((total / options.items_per_page));
        }
        //update links and bind new event handlers
        paintArrows();
        //determine offset param to pass to server side script
        callback_offset = current_offset * options.items_per_page;
        //if result is less than items per page then decrease offset to fill the page
        if((total - callback_offset) < options.items_per_page) {
          callback_offset = total - options.items_per_page;
        }
        //load contents in results container
        options.callback(callback_offset,options.items_per_page);
      }
      //get offset from options
      var current_offset = options.current_offset;      
      //initialisation is complete, paint the links
      if(total > options.items_per_page) {
        paintArrows();
      }
    });
  };  
})(jQuery);



