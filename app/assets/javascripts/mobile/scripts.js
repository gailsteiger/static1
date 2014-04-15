$(document).ready(function(){
	$('input[type="radio"]').ezMark();

	var option = $('.ez-radio');
	option.on('change', function(){
		if($(this).is('.ez-selected')){
			$(this).parent().addClass('selected');
			$(this).parent().siblings('.input-radio').removeClass('selected');
		}
	});
	
	$('.start-button').click(function() {
	  $.ajax({
	    type: "POST",
	    url: '/preview/questionnaires',
	    success: function(data, status, xhr) {
				var questionnaire = JSON.parse(data)
	      window.parent.postMessage('{"redirect": "http://188.226.164.52:3000/preview/questionnaires/' + questionnaire.id + '"}', "*");
	    }
	  });
	  return false;
	});

	$('.main-list li a').click(function(ev){
		$(this).next('.submenu').slideToggle(500);
		if($(this).next('.submenu').length){
			$(this).parent().toggleClass('active');
		}
		$(this).parent('li').siblings().find('.submenu').slideUp(500);	
		if($(this).parent('li').siblings().is('.active')){
			$(this).parent('li').siblings().removeClass('active')
		} 
		ev.preventDefault();
	});

	$('.submenu li a').click(function(){
		$(this).parent().addClass('active-submenu');
		$(this).parent().siblings().removeClass('active-submenu');
	});

	$('.link').click(function(ev){
		$('.bg-popup').show();
		ev.preventDefault();
	});

	$('#close').click(function(){
		$('.bg-popup').hide();
	});

	jQuery.uaMatch = function( ua ) {
	ua = ua.toLowerCase();

	var match = /(chrome)[ \/]([\w.]+)/.exec( ua ) ||
	    /(webkit)[ \/]([\w.]+)/.exec( ua ) ||
	    /(opera)(?:.*version|)[ \/]([\w.]+)/.exec( ua ) ||
	    /(msie) ([\w.]+)/.exec( ua ) ||
	    ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec( ua ) ||
	    [];

	return {
	  browser: match[ 1 ] || "",
	  version: match[ 2 ] || "0"
	};
	};

	if ( !jQuery.browser ) {
	matched = jQuery.uaMatch( navigator.userAgent );
	browser = {};

	if ( matched.browser ) {
	  browser[ matched.browser ] = true;
	  browser.version = matched.version;
	}

	if ( browser.chrome ) {
	  browser.webkit = true;
	} else if ( browser.webkit ) {
	  browser.safari = true;
	}

	jQuery.browser = browser;
	}

	$.each($.browser, function(k, v){
	if(v===true) $('html').addClass(k);
	});

});