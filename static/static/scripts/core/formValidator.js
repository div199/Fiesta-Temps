$.fn.validate = function(options){
	var $formElement = $(this);
	var rules = {
        required:function(value){return value.trim().length > 0;},
        email:function(email){var filter = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;return email.search(filter) != -1;},
        number:function(number){var filter = /^[0-9]+$/;return number.search(filter) != -1;},
		password: function(value) {return value.trim().length >= 8;},
		retypePassword: function(retypePasswordValue, $ele) {
			var passwordField = $ele.attr("data-password-field");
			var passwordValue = $formElement.find("input[name='"+passwordField+"']").val();
			return passwordValue == retypePasswordValue;
		}
    };
	var validate = {
		element:function($ele){
			$ele.removeClass("error");
		},
		blur:function($ele){
			var type = $ele.attr('data-validate');
			if(!rules[type]($ele.val(), $ele)){
				$ele.addClass("error");
				return false;
			}else{
				$ele.removeClass("error");
				return true;
			}
		},
		all:function($form){
			var that = this;
			var isValid = true;
			$.each($form.find('[data-validate]'), function(ind, ele){
				if(!that.blur($(ele))){
					isValid = false;
				}
			});
			return isValid;
		}
	};
	$(this).submit(function(){
		if(validate.all($(this))) {
			if(typeof options.submitHandler == "function") {
				options.submitHandler();
				return false;
			} else {
				return true;
			}
		} else {
			return false;
		};
	});
	$.each($(this).find('[data-validate]'), function(ind, ele){
		$(ele).bind('keyup, focus, keydown', function(){
			validate.element($(this));
		});
		$(ele).bind('blur', function(){
			validate.blur($(this));
		});
	});
}

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};
