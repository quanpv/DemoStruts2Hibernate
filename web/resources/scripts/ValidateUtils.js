/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

(function ($) {
  var _defaults = {
      number_reg      : /^[0-9]+$/
  };
  
  $.ValidateUtilsSetup = function(settings){
    $.extend(true, _defaults, settings);
  };
  
  $.ValidateUtils = function(settings){
    $.extend(true, _defaults, settings);
  };
  $.fn.ValidateUtils = function(settings){
    $.extend(true, _defaults, settings);
  };
  
  $.ValidateUtils.validateNumber = function(input, options) {
    var settings = $.extend(true, {}, _defaults, options);
    return _ValidateNumber(input, settings);
  };
  
  function _ValidateNumber(input, settings) {
    return settings.number_reg.test(input);
  }
  
}(jQuery));
