// Содержит функцию, которая запрашивает
// html форму с сервера, предварительно
// показывая прелоадер.
//
// Код иницализируется и начинает своё исполнение,
// если на странице есть кто-то с class='c80_contest_invoking_btn'

var bidForm;
var $c80ContestInvokingBtns;
var okMessage;

$(function () {

    $c80ContestInvokingBtns = $('.c80_contest_invoking_btn');

    if ($c80ContestInvokingBtns.length > 0) {

        var loading = (function () {

            var _$lo;

            var _fInit = function () {
                _$lo = $('<div id="lo"></div>');
            };

            var fShow = function ($clickedButton) {

                _$lo.appendTo($('body'));

                var top = $clickedButton.offset().top;
                var left = $clickedButton.offset().left;
                left -= _$lo.width() + 10;
                top = top + $clickedButton.height()/2 - _$lo.height()/2;

                _$lo.css("top",top+"px");
                _$lo.css("left",left+"px");
            };

            var fHide = function () {
                _$lo.addClass('invis');
                setTimeout(function () {
                    _$lo.remove();
                    _$lo.removeClass('invis');
                }, 1000);
            };

            _fInit();

            return {
                show:fShow,
                hide:fHide
            }

        })();

        bidForm = (function () {

            var _markInvalidateInProgress = false;
            var _markWasPasted = false;
            var __$f;

            var init = function () {
                $c80ContestInvokingBtns.click(function (e) {
                    var $t = $(this);
                    e.preventDefault();
                    _fGetOrderForm($t);
                    loading.show($t);
                });
            };

            //noinspection JSUnusedLocalSymbols
            var _fGetOrderForm = function ($clickedButton) {
                if (!_markInvalidateInProgress) {
                    _markInvalidateInProgress = true;

                    if (!_markWasPasted) {

                        $.ajax({
                            url: '/give_me_bid_form',
                            data:{

                            },
                            type: 'POST',
                            dataType: 'script'
                        }).done(function (data, result) {
                            if (result == "success") {
                                _markWasPasted = true;
                                _markInvalidateInProgress = false;
                            }
                        });
                    }
                }
            };

            var fShowForm = function (html_str) {

                var $cc = $('body');
                $cc.append($(html_str));

                __$f = $('#bid_form');
                __$f.on('hidden.bs.modal', __fRemoveForm);

                var $form = $("form#form_bid");
                $form.bind("ajax:error", function (event, data, status, xhr) {
                    $form.render_form_errors($.parseJSON(data.responseText));
                });

                setTimeout(function () {
                    $("#bid_photo").fileinput();
                    __$f.modal();
                    loading.hide();
                },1000);

                /*console.log("<this.afterShowForm>" + this.afterShowForm);
                if (this.afterShowForm) {
                    setTimeout(this.afterShowForm,200);
                }*/

            };

            var fHideForm = function () {
                __$f.modal('hide');
            };

            var __fRemoveForm = function () {
                __$f.remove();
                _markWasPasted = false;
            };

            return {
                init: init,
                show: fShowForm,
                hide: fHideForm
            }

        })();

        okMessage = (function () {

            var fShow = function () {
                var $form = $("#bid_ok");
                $form.modal();
                $form.on('hidden.bs.modal', function () {
                    $form.remove();
                });
            };

            return {
                show:fShow
            }

        })();

        bidForm.init();
    }

});