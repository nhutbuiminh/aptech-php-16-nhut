(function(n,t){typeof define=="function"&&define.amd?define("smoothScroll",t(n)):typeof exports=="object"?module.smoothScroll=t(n):n.smoothScroll=t(n)})(this,function(n){"use strict";var t={},o=!!document.querySelector&&!!n.addEventListener,u,f={speed:500,easing:"easeInOutCubic",offset:0,updateURL:!1,callbackBefore:function(){},callbackAfter:function(){}},i=function(n,t,i){var u,r,f;if(Object.prototype.toString.call(n)==="[object Object]")for(u in n)Object.prototype.hasOwnProperty.call(n,u)&&t.call(i,n[u],u,n);else for(r=0,f=n.length;r<f;r++)t.call(i,n[r],r,n)},r=function(n,t){var r={};return i(n,function(t,i){r[i]=n[i]}),i(t,function(n,i){r[i]=t[i]}),r},s=function(n,t){var i;return n==="easeInQuad"&&(i=t*t),n==="easeOutQuad"&&(i=t*(2-t)),n==="easeInOutQuad"&&(i=t<.5?2*t*t:-1+(4-2*t)*t),n==="easeInCubic"&&(i=t*t*t),n==="easeOutCubic"&&(i=--t*t*t+1),n==="easeInOutCubic"&&(i=t<.5?4*t*t*t:(t-1)*(2*t-2)*(2*t-2)+1),n==="easeInQuart"&&(i=t*t*t*t),n==="easeOutQuart"&&(i=1- --t*t*t*t),n==="easeInOutQuart"&&(i=t<.5?8*t*t*t*t:1-8*--t*t*t*t),n==="easeInQuint"&&(i=t*t*t*t*t),n==="easeOutQuint"&&(i=1+--t*t*t*t*t),n==="easeInOutQuint"&&(i=t<.5?16*t*t*t*t*t:1+16*--t*t*t*t*t),i||t},h=function(n,t,i){var r=0;if(n.offsetParent)do r+=n.offsetTop,n=n.offsetParent;while(n);return r=r-t-i,r>=0?r:0},c=function(){return Math.max(document.body.scrollHeight,document.documentElement.scrollHeight,document.body.offsetHeight,document.documentElement.offsetHeight,document.body.clientHeight,document.documentElement.clientHeight)},e=function(n){return n.replace(/^\s+|\s+$/g,"")},l=function(n){var t={};return n&&(n=n.split(";"),n.forEach(function(n){n=e(n);n!==""&&(n=n.split(":"),t[n[0]]=e(n[1]))})),t},a=function(n,t){history.pushState&&(t||t==="true")&&history.pushState({pos:n.id},"",n)};return t.animateScroll=function(t,i,u,e){var o=r(o||f,u||{}),g=l(t?t.getAttribute("data-options"):null);o=r(o,g);var y=document.querySelector("[data-scroll-header]"),nt=y===null?0:y.offsetHeight+y.offsetTop,w=n.pageYOffset,b=h(document.querySelector(i),nt,parseInt(o.offset,10)),k,tt=b-w,it=c(),d=0,v,p;t&&t.tagName.toLowerCase()==="a"&&e&&e.preventDefault();a(i,o.updateURL);var rt=function(r,u,f){var e=n.pageYOffset;(r==u||e==u||n.innerHeight+e>=it)&&(clearInterval(f),o.callbackAfter(t,i))},ut=function(){d+=16;v=d/parseInt(o.speed,10);v=v>1?1:v;p=w+tt*s(o.easing,v);n.scrollTo(0,Math.floor(p));rt(p,b,k)},ft=function(){o.callbackBefore(t,i);k=setInterval(ut,16)};n.pageYOffset===0&&n.scrollTo(0,0);ft()},t.init=function(n){if(o){u=r(f,n||{});var e=document.querySelectorAll("[data-scroll]");i(e,function(n){n.addEventListener("click",t.animateScroll.bind(null,n,n.hash,u),!1)})}},t});
/*
//# sourceMappingURL=mousescroll.min.js.map
*/

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/mousescroll.min.js'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/mousescroll.min.js');
/* ------------------------------------------------------------------------
	Class: prettyPhoto
	Use: Lightbox clone for jQuery
	Author: Stephane Caron (http://www.no-margin-for-errors.com)
	Version: 3.1.5
------------------------------------------------------------------------- */
(function (e) {
    function t() {
        var e = location.href;
        hashtag = e.indexOf("#prettyPhoto") !== -1 ? decodeURI(e.substring(e.indexOf("#prettyPhoto") + 1, e.length)) : false;
        return hashtag
    }

    function n() {
        if (typeof theRel == "undefined") return;
        location.hash = theRel + "/" + rel_index + "/"
    }

    function r() {
        if (location.href.indexOf("#prettyPhoto") !== -1) location.hash = "prettyPhoto"
    }

    function i(e, t) {
        e = e.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]");
        var n = "[\\?&]" + e + "=([^&#]*)";
        var r = new RegExp(n);
        var i = r.exec(t);
        return i == null ? "" : i[1]
    }
    e.prettyPhoto = {
        version: "3.1.5"
    };
    e.fn.prettyPhoto = function (s) {
        function g() {
            e(".pp_loaderIcon").hide();
            projectedTop = scroll_pos["scrollTop"] + (d / 2 - a["containerHeight"] / 2);
            if (projectedTop < 0) projectedTop = 0;
            $ppt.fadeTo(settings.animation_speed, 1);
            $pp_pic_holder.find(".pp_content").animate({
                height: a["contentHeight"],
                width: a["contentWidth"]
            }, settings.animation_speed);
            $pp_pic_holder.animate({
                top: projectedTop,
                left: v / 2 - a["containerWidth"] / 2 < 0 ? 0 : v / 2 - a["containerWidth"] / 2,
                width: a["containerWidth"]
            }, settings.animation_speed, function () {
                $pp_pic_holder.find(".pp_hoverContainer,#fullResImage").height(a["height"]).width(a["width"]);
                $pp_pic_holder.find(".pp_fade").fadeIn(settings.animation_speed);
                if (isSet && S(pp_images[set_position]) == "image") {
                    $pp_pic_holder.find(".pp_hoverContainer").show()
                } else {
                    $pp_pic_holder.find(".pp_hoverContainer").hide()
                }
                if (settings.allow_expand) {
                    if (a["resized"]) {
                        e("a.pp_expand,a.pp_contract").show()
                    } else {
                        e("a.pp_expand").hide()
                    }
                }
                if (settings.autoplay_slideshow && !m && !f) e.prettyPhoto.startSlideshow();
                settings.changepicturecallback();
                f = true
            });
            C();
            s.ajaxcallback()
        }

        function y(t) {
            $pp_pic_holder.find("#pp_full_res object,#pp_full_res embed").css("visibility", "hidden");
            $pp_pic_holder.find(".pp_fade").fadeOut(settings.animation_speed, function () {
                e(".pp_loaderIcon").show();
                t()
            })
        }

        function b(t) {
            t > 1 ? e(".pp_nav").show() : e(".pp_nav").hide()
        }

        function w(e, t) {
            resized = false;
            E(e, t);
            imageWidth = e, imageHeight = t;
            if ((p > v || h > d) && doresize && settings.allow_resize && !u) {
                resized = true, fitting = false;
                while (!fitting) {
                    if (p > v) {
                        imageWidth = v - 200;
                        imageHeight = t / e * imageWidth
                    } else if (h > d) {
                        imageHeight = d - 200;
                        imageWidth = e / t * imageHeight
                    } else {
                        fitting = true
                    }
                    h = imageHeight, p = imageWidth
                }
                if (p > v || h > d) {
                    w(p, h)
                }
                E(imageWidth, imageHeight)
            }
            return {
                width: Math.floor(imageWidth),
                height: Math.floor(imageHeight),
                containerHeight: Math.floor(h),
                containerWidth: Math.floor(p) + settings.horizontal_padding * 2,
                contentHeight: Math.floor(l),
                contentWidth: Math.floor(c),
                resized: resized
            }
        }

        function E(t, n) {
            t = parseFloat(t);
            n = parseFloat(n);
            $pp_details = $pp_pic_holder.find(".pp_details");
            $pp_details.width(t);
            detailsHeight = parseFloat($pp_details.css("marginTop")) + parseFloat($pp_details.css("marginBottom"));
            $pp_details = $pp_details.clone().addClass(settings.theme).width(t).appendTo(e("body")).css({
                position: "absolute",
                top: -1e4
            });
            detailsHeight += $pp_details.height();
            detailsHeight = detailsHeight <= 34 ? 36 : detailsHeight;
            $pp_details.remove();
            $pp_title = $pp_pic_holder.find(".ppt");
            $pp_title.width(t);
            titleHeight = parseFloat($pp_title.css("marginTop")) + parseFloat($pp_title.css("marginBottom"));
            $pp_title = $pp_title.clone().appendTo(e("body")).css({
                position: "absolute",
                top: -1e4
            });
            titleHeight += $pp_title.height();
            $pp_title.remove();
            l = n + detailsHeight;
            c = t;
            h = l + titleHeight + $pp_pic_holder.find(".pp_top").height() + $pp_pic_holder.find(".pp_bottom").height();
            p = t
        }

        function S(e) {
            if (e.match(/youtube\.com\/watch/i) || e.match(/youtu\.be/i)) {
                return "youtube"
            } else if (e.match(/vimeo\.com/i)) {
                return "vimeo"
            } else if (e.match(/\b.mov\b/i)) {
                return "quicktime"
            } else if (e.match(/\b.swf\b/i)) {
                return "flash"
            } else if (e.match(/\biframe=true\b/i)) {
                return "iframe"
            } else if (e.match(/\bajax=true\b/i)) {
                return "ajax"
            } else if (e.match(/\bcustom=true\b/i)) {
                return "custom"
            } else if (e.substr(0, 1) == "#") {
                return "inline"
            } else {
                return "image"
            }
        }

        function x() {
            if (doresize && typeof $pp_pic_holder != "undefined") {
                scroll_pos = T();
                contentHeight = $pp_pic_holder.height(), contentwidth = $pp_pic_holder.width();
                projectedTop = d / 2 + scroll_pos["scrollTop"] - contentHeight / 2;
                if (projectedTop < 0) projectedTop = 0;
                if (contentHeight > d) return;
                $pp_pic_holder.css({
                    top: projectedTop,
                    left: v / 2 + scroll_pos["scrollLeft"] - contentwidth / 2
                })
            }
        }

        function T() {
            if (self.pageYOffset) {
                return {
                    scrollTop: self.pageYOffset,
                    scrollLeft: self.pageXOffset
                }
            } else if (document.documentElement && document.documentElement.scrollTop) {
                return {
                    scrollTop: document.documentElement.scrollTop,
                    scrollLeft: document.documentElement.scrollLeft
                }
            } else if (document.body) {
                return {
                    scrollTop: document.body.scrollTop,
                    scrollLeft: document.body.scrollLeft
                }
            }
        }

        function N() {
            d = e(window).height(), v = e(window).width();
            if (typeof $pp_overlay != "undefined") $pp_overlay.height(e(document).height()).width(v)
        }

        function C() {
            if (isSet && settings.overlay_gallery && S(pp_images[set_position]) == "image") {
                itemWidth = 52 + 5;
                navWidth = settings.theme == "facebook" || settings.theme == "pp_default" ? 50 : 30;
                itemsPerPage = Math.floor((a["containerWidth"] - 100 - navWidth) / itemWidth);
                itemsPerPage = itemsPerPage < pp_images.length ? itemsPerPage : pp_images.length;
                totalPage = Math.ceil(pp_images.length / itemsPerPage) - 1;
                if (totalPage == 0) {
                    navWidth = 0;
                    $pp_gallery.find(".pp_arrow_next,.pp_arrow_previous").hide()
                } else {
                    $pp_gallery.find(".pp_arrow_next,.pp_arrow_previous").show()
                }
                galleryWidth = itemsPerPage * itemWidth;
                fullGalleryWidth = pp_images.length * itemWidth;
                $pp_gallery.css("margin-left", -(galleryWidth / 2 + navWidth / 2)).find("div:first").width(galleryWidth + 5).find("ul").width(fullGalleryWidth).find("li.selected").removeClass("selected");
                goToPage = Math.floor(set_position / itemsPerPage) < totalPage ? Math.floor(set_position / itemsPerPage) : totalPage;
                e.prettyPhoto.changeGalleryPage(goToPage);
                $pp_gallery_li.filter(":eq(" + set_position + ")").addClass("selected")
            } else {
                $pp_pic_holder.find(".pp_content").unbind("mouseenter mouseleave")
            }
        }

        function k(t) {
            if (settings.social_tools) facebook_like_link = settings.social_tools.replace("{location_href}", encodeURIComponent(location.href));
            settings.markup = settings.markup.replace("{pp_social}", "");
            e("body").append(settings.markup);
            $pp_pic_holder = e(".pp_pic_holder"), $ppt = e(".ppt"), $pp_overlay = e("div.pp_overlay");
            if (isSet && settings.overlay_gallery) {
                currentGalleryPage = 0;
                toInject = "";
                for (var n = 0; n < pp_images.length; n++) {
                    if (!pp_images[n].match(/\b(jpg|jpeg|png|gif)\b/gi)) {
                        classname = "default";
                        img_src = ""
                    } else {
                        classname = "";
                        img_src = pp_images[n]
                    }
                    toInject += "<li class='" + classname + "'><a href='#'><img src='" + img_src + "' width='50' alt='' /></a></li>"
                }
                toInject = settings.gallery_markup.replace(/{gallery}/g, toInject);
                $pp_pic_holder.find("#pp_full_res").after(toInject);
                $pp_gallery = e(".pp_pic_holder .pp_gallery"), $pp_gallery_li = $pp_gallery.find("li");
                $pp_gallery.find(".pp_arrow_next").click(function () {
                    e.prettyPhoto.changeGalleryPage("next");
                    e.prettyPhoto.stopSlideshow();
                    return false
                });
                $pp_gallery.find(".pp_arrow_previous").click(function () {
                    e.prettyPhoto.changeGalleryPage("previous");
                    e.prettyPhoto.stopSlideshow();
                    return false
                });
                $pp_pic_holder.find(".pp_content").hover(function () {
                    $pp_pic_holder.find(".pp_gallery:not(.disabled)").fadeIn()
                }, function () {
                    $pp_pic_holder.find(".pp_gallery:not(.disabled)").fadeOut()
                });
                itemWidth = 52 + 5;
                $pp_gallery_li.each(function (t) {
                    e(this).find("a").click(function () {
                        e.prettyPhoto.changePage(t);
                        e.prettyPhoto.stopSlideshow();
                        return false
                    })
                })
            }
            if (settings.slideshow) {
                $pp_pic_holder.find(".pp_nav").prepend('<a href="#" class="pp_play">Play</a>');
                $pp_pic_holder.find(".pp_nav .pp_play").click(function () {
                    e.prettyPhoto.startSlideshow();
                    return false
                })
            }
            $pp_pic_holder.attr("class", "pp_pic_holder " + settings.theme);
            $pp_overlay.css({
                opacity: 0,
                height: e(document).height(),
                width: e(window).width()
            }).bind("click", function () {
                if (!settings.modal) e.prettyPhoto.close()
            });
            e("a.pp_close").bind("click", function () {
                e.prettyPhoto.close();
                return false
            });
            if (settings.allow_expand) {
                e("a.pp_expand").bind("click", function (t) {
                    if (e(this).hasClass("pp_expand")) {
                        e(this).removeClass("pp_expand").addClass("pp_contract");
                        doresize = false
                    } else {
                        e(this).removeClass("pp_contract").addClass("pp_expand");
                        doresize = true
                    }
                    y(function () {
                        e.prettyPhoto.open()
                    });
                    return false
                })
            }
            $pp_pic_holder.find(".pp_previous, .pp_nav .pp_arrow_previous").bind("click", function () {
                e.prettyPhoto.changePage("previous");
                e.prettyPhoto.stopSlideshow();
                return false
            });
            $pp_pic_holder.find(".pp_next, .pp_nav .pp_arrow_next").bind("click", function () {
                e.prettyPhoto.changePage("next");
                e.prettyPhoto.stopSlideshow();
                return false
            });
            x()
        }
        s = jQuery.extend({
            hook: "rel",
            animation_speed: "fast",
            ajaxcallback: function () { },
            slideshow: 5e3,
            autoplay_slideshow: false,
            opacity: .8,
            show_title: true,
            allow_resize: true,
            allow_expand: true,
            default_width: 500,
            default_height: 344,
            counter_separator_label: "/",
            theme: "pp_default",
            horizontal_padding: 20,
            hideflash: false,
            wmode: "opaque",
            autoplay: true,
            modal: false,
            deeplinking: true,
            overlay_gallery: true,
            overlay_gallery_max: 30,
            keyboard_shortcuts: true,
            changepicturecallback: function () { },
            callback: function () { },
            ie6_fallback: true,
            markup: '<div class="pp_pic_holder"> 						<div class="ppt">Â </div> 						<div class="pp_top"> 							<div class="pp_left"></div> 							<div class="pp_middle"></div> 							<div class="pp_right"></div> 						</div> 						<div class="pp_content_container"> 							<div class="pp_left"> 							<div class="pp_right"> 								<div class="pp_content"> 									<div class="pp_loaderIcon"></div> 									<div class="pp_fade"> 										<a href="#" class="pp_expand" title="Expand the image">Expand</a> 										<div class="pp_hoverContainer"> 											<a class="pp_next" href="#">next</a> 											<a class="pp_previous" href="#">previous</a> 										</div> 										<div id="pp_full_res"></div> 										<div class="pp_details"> 											<div class="pp_nav"> 												<a href="#" class="pp_arrow_previous">Previous</a> 												<p class="currentTextHolder">0/0</p> 												<a href="#" class="pp_arrow_next">Next</a> 											</div> 											<p class="pp_description"></p> 											<div class="pp_social">{pp_social}</div> 											<a class="pp_close" href="#">Close</a> 										</div> 									</div> 								</div> 							</div> 							</div> 						</div> 						<div class="pp_bottom"> 							<div class="pp_left"></div> 							<div class="pp_middle"></div> 							<div class="pp_right"></div> 						</div> 					</div> 					<div class="pp_overlay"></div>',
            gallery_markup: '<div class="pp_gallery"> 								<a href="#" class="pp_arrow_previous">Previous</a> 								<div> 									<ul> 										{gallery} 									</ul> 								</div> 								<a href="#" class="pp_arrow_next">Next</a> 							</div>',
            image_markup: '<img id="fullResImage" src="{path}" />',
            flash_markup: '<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="{width}" height="{height}"><param name="wmode" value="{wmode}" /><param name="allowfullscreen" value="true" /><param name="allowscriptaccess" value="always" /><param name="movie" value="{path}" /><embed src="{path}" type="application/x-shockwave-flash" allowfullscreen="true" allowscriptaccess="always" width="{width}" height="{height}" wmode="{wmode}"></embed></object>',
            quicktime_markup: '<object classid="clsid:02BF25D5-8C17-4B23-BC80-D3488ABDDC6B" codebase="http://www.apple.com/qtactivex/qtplugin.cab" height="{height}" width="{width}"><param name="src" value="{path}"><param name="autoplay" value="{autoplay}"><param name="type" value="video/quicktime"><embed src="{path}" height="{height}" width="{width}" autoplay="{autoplay}" type="video/quicktime" pluginspage="http://www.apple.com/quicktime/download/"></embed></object>',
            iframe_markup: '<iframe src ="{path}" width="{width}" height="{height}" frameborder="no"></iframe>',
            inline_markup: '<div class="pp_inline">{content}</div>',
            custom_markup: "",
            social_tools: '<div class="twitter"><a href="http://twitter.com/share" class="twitter-share-button" data-count="none">Tweet</a><script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script></div><div class="facebook"><iframe src="//www.facebook.com/plugins/like.php?locale=en_US&href={location_href}&layout=button_count&show_faces=true&width=500&action=like&font&colorscheme=light&height=23" scrolling="no" frameborder="0" style="border:none; overflow:hidden; width:500px; height:23px;" allowTransparency="true"></iframe></div>'
        }, s);
        var o = this,
            u = false,
            a, f, l, c, h, p, d = e(window).height(),
            v = e(window).width(),
            m;
        doresize = true, scroll_pos = T();
        e(window).unbind("resize.prettyphoto").bind("resize.prettyphoto", function () {
            x();
            N()
        });
        if (s.keyboard_shortcuts) {
            e(document).unbind("keydown.prettyphoto").bind("keydown.prettyphoto", function (t) {
                if (typeof $pp_pic_holder != "undefined") {
                    if ($pp_pic_holder.is(":visible")) {
                        switch (t.keyCode) {
                            case 37:
                                e.prettyPhoto.changePage("previous");
                                t.preventDefault();
                                break;
                            case 39:
                                e.prettyPhoto.changePage("next");
                                t.preventDefault();
                                break;
                            case 27:
                                if (!settings.modal) e.prettyPhoto.close();
                                t.preventDefault();
                                break
                        }
                    }
                }
            })
        }
        e.prettyPhoto.initialize = function () {
            settings = s;
            if (settings.theme == "pp_default") settings.horizontal_padding = 16;
            theRel = e(this).attr(settings.hook);
            galleryRegExp = /\[(?:.*)\]/;
            isSet = galleryRegExp.exec(theRel) ? true : false;
            pp_images = isSet ? jQuery.map(o, function (t, n) {
                if (e(t).attr(settings.hook).indexOf(theRel) != -1) return e(t).attr("href")
            }) : e.makeArray(e(this).attr("href"));
            pp_titles = isSet ? jQuery.map(o, function (t, n) {
                if (e(t).attr(settings.hook).indexOf(theRel) != -1) return e(t).find("img").attr("alt") ? e(t).find("img").attr("alt") : ""
            }) : e.makeArray(e(this).find("img").attr("alt"));
            pp_descriptions = isSet ? jQuery.map(o, function (t, n) {
                if (e(t).attr(settings.hook).indexOf(theRel) != -1) return e(t).attr("tmp_title") ? e(t).attr("tmp_title") : ""
            }) : e.makeArray(e(this).attr("tmp_title"));
            if (pp_images.length > settings.overlay_gallery_max) settings.overlay_gallery = false;
            set_position = jQuery.inArray(e(this).attr("href"), pp_images);
            rel_index = isSet ? set_position : e("a[" + settings.hook + "^='" + theRel + "']").index(e(this));
            k(this);
            if (settings.allow_resize) e(window).bind("scroll.prettyphoto", function () {
                x()
            });
            e.prettyPhoto.open();
            return false
        };
        e.prettyPhoto.open = function (t) {
            if (typeof settings == "undefined") {
                settings = s;
                pp_images = e.makeArray(arguments[0]);
                pp_titles = arguments[1] ? e.makeArray(arguments[1]) : e.makeArray("");
                pp_descriptions = arguments[2] ? e.makeArray(arguments[2]) : e.makeArray("");
                isSet = pp_images.length > 1 ? true : false;
                set_position = arguments[3] ? arguments[3] : 0;
                k(t.target)
            }
            if (settings.hideflash) e("object,embed,iframe[src*=youtube],iframe[src*=vimeo]").css("visibility", "hidden");
            b(e(pp_images).size());
            e(".pp_loaderIcon").show();
            if (settings.deeplinking) n();
            if (settings.social_tools) {
                facebook_like_link = settings.social_tools.replace("{location_href}", encodeURIComponent(location.href));
                $pp_pic_holder.find(".pp_social").html(facebook_like_link)
            }
            if ($ppt.is(":hidden")) $ppt.css("opacity", 0).show();
            $pp_overlay.show().fadeTo(settings.animation_speed, settings.opacity);
            $pp_pic_holder.find(".currentTextHolder").text(set_position + 1 + settings.counter_separator_label + e(pp_images).size());
            if (typeof pp_descriptions[set_position] != "undefined" && pp_descriptions[set_position] != "") {
                $pp_pic_holder.find(".pp_description").show().html(unescape(pp_descriptions[set_position]))
            } else {
                $pp_pic_holder.find(".pp_description").hide()
            }
            movie_width = parseFloat(i("width", pp_images[set_position])) ? i("width", pp_images[set_position]) : settings.default_width.toString();
            movie_height = parseFloat(i("height", pp_images[set_position])) ? i("height", pp_images[set_position]) : settings.default_height.toString();
            u = false;
            if (movie_height.indexOf("%") != -1) {
                movie_height = parseFloat(e(window).height() * parseFloat(movie_height) / 100 - 150);
                u = true
            }
            if (movie_width.indexOf("%") != -1) {
                movie_width = parseFloat(e(window).width() * parseFloat(movie_width) / 100 - 150);
                u = true
            }
            $pp_pic_holder.fadeIn(function () {
                settings.show_title && pp_titles[set_position] != "" && typeof pp_titles[set_position] != "undefined" ? $ppt.html(unescape(pp_titles[set_position])) : $ppt.html("Â ");
                imgPreloader = "";
                skipInjection = false;
                switch (S(pp_images[set_position])) {
                    case "image":
                        imgPreloader = new Image;
                        nextImage = new Image;
                        if (isSet && set_position < e(pp_images).size() - 1) nextImage.src = pp_images[set_position + 1];
                        prevImage = new Image;
                        if (isSet && pp_images[set_position - 1]) prevImage.src = pp_images[set_position - 1];
                        $pp_pic_holder.find("#pp_full_res")[0].innerHTML = settings.image_markup.replace(/{path}/g, pp_images[set_position]);
                        imgPreloader.onload = function () {
                            a = w(imgPreloader.width, imgPreloader.height);
                            g()
                        };
                        imgPreloader.onerror = function () {
                            alert("Image cannot be loaded. Make sure the path is correct and image exist.");
                            e.prettyPhoto.close()
                        };
                        imgPreloader.src = pp_images[set_position];
                        break;
                    case "youtube":
                        a = w(movie_width, movie_height);
                        movie_id = i("v", pp_images[set_position]);
                        if (movie_id == "") {
                            movie_id = pp_images[set_position].split("youtu.be/");
                            movie_id = movie_id[1];
                            if (movie_id.indexOf("?") > 0) movie_id = movie_id.substr(0, movie_id.indexOf("?"));
                            if (movie_id.indexOf("&") > 0) movie_id = movie_id.substr(0, movie_id.indexOf("&"))
                        }
                        movie = "http://www.youtube.com/embed/" + movie_id;
                        i("rel", pp_images[set_position]) ? movie += "?rel=" + i("rel", pp_images[set_position]) : movie += "?rel=1";
                        if (settings.autoplay) movie += "&autoplay=1";
                        toInject = settings.iframe_markup.replace(/{width}/g, a["width"]).replace(/{height}/g, a["height"]).replace(/{wmode}/g, settings.wmode).replace(/{path}/g, movie);
                        break;
                    case "vimeo":
                        a = w(movie_width, movie_height);
                        movie_id = pp_images[set_position];
                        var t = /http(s?):\/\/(www\.)?vimeo.com\/(\d+)/;
                        var n = movie_id.match(t);
                        movie = "http://player.vimeo.com/video/" + n[3] + "?title=0&byline=0&portrait=0";
                        if (settings.autoplay) movie += "&autoplay=1;";
                        vimeo_width = a["width"] + "/embed/?moog_width=" + a["width"];
                        toInject = settings.iframe_markup.replace(/{width}/g, vimeo_width).replace(/{height}/g, a["height"]).replace(/{path}/g, movie);
                        break;
                    case "quicktime":
                        a = w(movie_width, movie_height);
                        a["height"] += 15;
                        a["contentHeight"] += 15;
                        a["containerHeight"] += 15;
                        toInject = settings.quicktime_markup.replace(/{width}/g, a["width"]).replace(/{height}/g, a["height"]).replace(/{wmode}/g, settings.wmode).replace(/{path}/g, pp_images[set_position]).replace(/{autoplay}/g, settings.autoplay);
                        break;
                    case "flash":
                        a = w(movie_width, movie_height);
                        flash_vars = pp_images[set_position];
                        flash_vars = flash_vars.substring(pp_images[set_position].indexOf("flashvars") + 10, pp_images[set_position].length);
                        filename = pp_images[set_position];
                        filename = filename.substring(0, filename.indexOf("?"));
                        toInject = settings.flash_markup.replace(/{width}/g, a["width"]).replace(/{height}/g, a["height"]).replace(/{wmode}/g, settings.wmode).replace(/{path}/g, filename + "?" + flash_vars);
                        break;
                    case "iframe":
                        a = w(movie_width, movie_height);
                        frame_url = pp_images[set_position];
                        frame_url = frame_url.substr(0, frame_url.indexOf("iframe") - 1);
                        toInject = settings.iframe_markup.replace(/{width}/g, a["width"]).replace(/{height}/g, a["height"]).replace(/{path}/g, frame_url);
                        break;
                    case "ajax":
                        doresize = false;
                        a = w(movie_width, movie_height);
                        doresize = true;
                        skipInjection = true;
                        e.get(pp_images[set_position], function (e) {
                            toInject = settings.inline_markup.replace(/{content}/g, e);
                            $pp_pic_holder.find("#pp_full_res")[0].innerHTML = toInject;
                            g()
                        });
                        break;
                    case "custom":
                        a = w(movie_width, movie_height);
                        toInject = settings.custom_markup;
                        break;
                    case "inline":
                        myClone = e(pp_images[set_position]).clone().append('<br clear="all" />').css({
                            width: settings.default_width
                        }).wrapInner('<div id="pp_full_res"><div class="pp_inline"></div></div>').appendTo(e("body")).show();
                        doresize = false;
                        a = w(e(myClone).width(), e(myClone).height());
                        doresize = true;
                        e(myClone).remove();
                        toInject = settings.inline_markup.replace(/{content}/g, e(pp_images[set_position]).html());
                        break
                }
                if (!imgPreloader && !skipInjection) {
                    $pp_pic_holder.find("#pp_full_res")[0].innerHTML = toInject;
                    g()
                }
            });
            return false
        };
        e.prettyPhoto.changePage = function (t) {
            currentGalleryPage = 0;
            if (t == "previous") {
                set_position--;
                if (set_position < 0) set_position = e(pp_images).size() - 1
            } else if (t == "next") {
                set_position++;
                if (set_position > e(pp_images).size() - 1) set_position = 0
            } else {
                set_position = t
            }
            rel_index = set_position;
            if (!doresize) doresize = true;
            if (settings.allow_expand) {
                e(".pp_contract").removeClass("pp_contract").addClass("pp_expand")
            }
            y(function () {
                e.prettyPhoto.open()
            })
        };
        e.prettyPhoto.changeGalleryPage = function (e) {
            if (e == "next") {
                currentGalleryPage++;
                if (currentGalleryPage > totalPage) currentGalleryPage = 0
            } else if (e == "previous") {
                currentGalleryPage--;
                if (currentGalleryPage < 0) currentGalleryPage = totalPage
            } else {
                currentGalleryPage = e
            }
            slide_speed = e == "next" || e == "previous" ? settings.animation_speed : 0;
            slide_to = currentGalleryPage * itemsPerPage * itemWidth;
            $pp_gallery.find("ul").animate({
                left: -slide_to
            }, slide_speed)
        };
        e.prettyPhoto.startSlideshow = function () {
            if (typeof m == "undefined") {
                $pp_pic_holder.find(".pp_play").unbind("click").removeClass("pp_play").addClass("pp_pause").click(function () {
                    e.prettyPhoto.stopSlideshow();
                    return false
                });
                m = setInterval(e.prettyPhoto.startSlideshow, settings.slideshow)
            } else {
                e.prettyPhoto.changePage("next")
            }
        };
        e.prettyPhoto.stopSlideshow = function () {
            $pp_pic_holder.find(".pp_pause").unbind("click").removeClass("pp_pause").addClass("pp_play").click(function () {
                e.prettyPhoto.startSlideshow();
                return false
            });
            clearInterval(m);
            m = undefined
        };
        e.prettyPhoto.close = function () {
            if ($pp_overlay.is(":animated")) return;
            e.prettyPhoto.stopSlideshow();
            $pp_pic_holder.stop().find("object,embed").css("visibility", "hidden");
            e("div.pp_pic_holder,div.ppt,.pp_fade").fadeOut(settings.animation_speed, function () {
                e(this).remove()
            });
            $pp_overlay.fadeOut(settings.animation_speed, function () {
                if (settings.hideflash) e("object,embed,iframe[src*=youtube],iframe[src*=vimeo]").css("visibility", "visible");
                e(this).remove();
                e(window).unbind("scroll.prettyphoto");
                r();
                settings.callback();
                doresize = true;
                f = false;
                delete settings
            })
        };
        if (!pp_alreadyInitialized && t()) {
            pp_alreadyInitialized = true;
            hashIndex = t();
            hashRel = hashIndex;
            hashIndex = hashIndex.substring(hashIndex.indexOf("/") + 1, hashIndex.length - 1);
            hashRel = hashRel.substring(0, hashRel.indexOf("/"));
            setTimeout(function () {
                e("a[" + s.hook + "^='" + hashRel + "']:eq(" + hashIndex + ")").trigger("click")
            }, 50)
        }
        return this.unbind("click.prettyphoto").bind("click.prettyphoto", e.prettyPhoto.initialize)
    };
})(jQuery);
var pp_alreadyInitialized = false

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/jquery.prettyPhoto.js'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/jquery.prettyPhoto.js');
(function(n,t){"use strict";var tt=n.document,i=n.Modernizr,o=function(n){return n.charAt(0).toUpperCase()+n.slice(1)},p="Moz Webkit O Ms".split(" "),f=function(n){var r=tt.documentElement.style,i,t,u;if(typeof r[n]=="string")return n;for(n=o(n),t=0,u=p.length;t<u;t++)if(i=p[t]+n,typeof r[i]=="string")return i},s=f("transform"),w=f("transitionProperty"),e={csstransforms:function(){return!!s},csstransforms3d:function(){var n=!!f("perspective");if(n){var r=" -o- -moz- -ms- -webkit- -khtml- ".split(" "),u="@media ("+r.join("transform-3d),(")+"modernizr)",e=t("<style>"+u+"{#modernizr{height:3px}}<\/style>").appendTo("head"),i=t('<div id="modernizr" />').appendTo("html");n=i.height()===3;i.remove();e.remove()}return n},csstransitions:function(){return!!w}},r,h,c,b,l,k,d,u,g,a,nt,v,y;if(i)for(r in e)i.hasOwnProperty(r)||i.addTest(r,e[r]);else{i=n.Modernizr={_version:"1.6ish: miniModernizr for Isotope"};h=" ";for(r in e)c=e[r](),i[r]=c,h+=" "+(c?"":"no-")+r;t("html").addClass(h)}i.csstransforms&&(b=i.csstransforms3d?{translate:function(n){return"translate3d("+n[0]+"px, "+n[1]+"px, 0) "},scale:function(n){return"scale3d("+n+", "+n+", 1) "}}:{translate:function(n){return"translate("+n[0]+"px, "+n[1]+"px) "},scale:function(n){return"scale("+n+") "}},l=function(n,i,r){var u=t.data(n,"isoTransform")||{},o={},f,e={},h;o[i]=r;t.extend(u,o);for(f in u)h=u[f],e[f]=b[f](h);var c=e.translate||"",l=e.scale||"",a=c+l;t.data(n,"isoTransform",u);n.style[s]=a},t.cssNumber.scale=!0,t.cssHooks.scale={set:function(n,t){l(n,"scale",t)},get:function(n){var i=t.data(n,"isoTransform");return i&&i.scale?i.scale:1}},t.fx.step.scale=function(n){t.cssHooks.scale.set(n.elem,n.now+n.unit)},t.cssNumber.translate=!0,t.cssHooks.translate={set:function(n,t){l(n,"translate",t)},get:function(n){var i=t.data(n,"isoTransform");return i&&i.translate?i.translate:[0,0]}});i.csstransitions&&(k={WebkitTransitionProperty:"webkitTransitionEnd",MozTransitionProperty:"transitionend",OTransitionProperty:"oTransitionEnd otransitionend",transitionProperty:"transitionend"}[w],d=f("transitionDuration"));u=t.event;g=t.event.handle?"handle":"dispatch";u.special.smartresize={setup:function(){t(this).bind("resize",u.special.smartresize.handler)},teardown:function(){t(this).unbind("resize",u.special.smartresize.handler)},handler:function(n,t){var i=this,r=arguments;n.type="smartresize";a&&clearTimeout(a);a=setTimeout(function(){u[g].apply(i,r)},t==="execAsap"?0:100)}};t.fn.smartresize=function(n){return n?this.bind("smartresize",n):this.trigger("smartresize",["execAsap"])};t.Isotope=function(n,i,r){this.element=t(i);this._create(n);this._init(r)};nt=["width","height"];v=t(n);t.Isotope.settings={resizable:!0,layoutMode:"masonry",containerClass:"isotope",itemClass:"isotope-item",hiddenClass:"isotope-hidden",hiddenStyle:{opacity:0,scale:.001},visibleStyle:{opacity:1,scale:1},containerStyle:{position:"relative",overflow:"hidden"},animationEngine:"best-available",animationOptions:{queue:!1,duration:800},sortBy:"original-order",sortAscending:!0,resizesContainer:!0,transformsEnabled:!0,itemPositionDataEnabled:!1};t.Isotope.prototype={_create:function(n){var e,r,i,u,o,s,f;this.options=t.extend({},t.Isotope.settings,n);this.styleQueue=[];this.elemCount=0;e=this.element[0].style;this.originalStyle={};r=nt.slice(0);for(i in this.options.containerStyle)r.push(i);for(u=0,o=r.length;u<o;u++)i=r[u],this.originalStyle[i]=e[i]||"";this.element.css(this.options.containerStyle);this._updateAnimationEngine();this._updateUsingTransforms();s={"original-order":function(n,t){return t.elemCount++,t.elemCount},random:function(){return Math.random()}};this.options.getSortData=t.extend(this.options.getSortData,s);this.reloadItems();this.offset={left:parseInt(this.element.css("padding-left")||0,10),top:parseInt(this.element.css("padding-top")||0,10)};f=this;setTimeout(function(){f.element.addClass(f.options.containerClass)},0);this.options.resizable&&v.bind("smartresize.isotope",function(){f.resize()});this.element.delegate("."+this.options.hiddenClass,"click",function(){return!1})},_getAtoms:function(n){var i=this.options.itemSelector,t=i?n.filter(i).add(n.find(i)):n,r={position:"absolute"};return t=t.filter(function(n,t){return t.nodeType===1}),this.usingTransforms&&(r.left=0,r.top=0),t.css(r).addClass(this.options.itemClass),this.updateSortData(t,!0),t},_init:function(n){this.$filteredAtoms=this._filter(this.$allAtoms);this._sort();this.reLayout(n)},option:function(n){var i,r;if(t.isPlainObject(n)){this.options=t.extend(!0,this.options,n);for(r in n)i="_update"+o(r),this[i]&&this[i]()}},_updateAnimationEngine:function(){var t=this.options.animationEngine.toLowerCase().replace(/[ _\-]/g,""),n;switch(t){case"css":case"none":n=!1;break;case"jquery":n=!0;break;default:n=!i.csstransitions}this.isUsingJQueryAnimation=n;this._updateUsingTransforms()},_updateTransformsEnabled:function(){this._updateUsingTransforms()},_updateUsingTransforms:function(){var n=this.usingTransforms=this.options.transformsEnabled&&i.csstransforms&&i.csstransitions&&!this.isUsingJQueryAnimation;n||(delete this.options.hiddenStyle.scale,delete this.options.visibleStyle.scale);this.getPositionStyles=n?this._translate:this._positionAbs},_filter:function(n){var t=this.options.filter===""?"*":this.options.filter,e;if(!t)return n;var i=this.options.hiddenClass,u="."+i,f=n.filter(u),r=f;return t!=="*"&&(r=f.filter(t),e=n.not(u).not(t).addClass(i),this.styleQueue.push({$el:e,style:this.options.hiddenStyle})),this.styleQueue.push({$el:r,style:this.options.visibleStyle}),r.removeClass(i),n.filter(t)},updateSortData:function(n,i){var e=this,u=this.options.getSortData,f,r;n.each(function(){f=t(this);r={};for(var n in u)r[n]=i||n!=="original-order"?u[n](f,e):t.data(this,"isotope-sort-data")[n];t.data(this,"isotope-sort-data",r)})},_sort:function(){var t=this.options.sortBy,n=this._getSorter,i=this.options.sortAscending?1:-1,r=function(r,u){var f=n(r,t),e=n(u,t);return f===e&&t!=="original-order"&&(f=n(r,"original-order"),e=n(u,"original-order")),(f>e?1:f<e?-1:0)*i};this.$filteredAtoms.sort(r)},_getSorter:function(n,i){return t.data(n,"isotope-sort-data")[i]},_translate:function(n,t){return{translate:[n,t]}},_positionAbs:function(n,t){return{left:n,top:t}},_pushPosition:function(n,t,i){t=Math.round(t+this.offset.left);i=Math.round(i+this.offset.top);var r=this.getPositionStyles(t,i);this.styleQueue.push({$el:n,style:r});this.options.itemPositionDataEnabled&&n.data("isotope-item-position",{x:t,y:i})},layout:function(n,t){var i=this.options.layoutMode,r;this["_"+i+"Layout"](n);this.options.resizesContainer&&(r=this["_"+i+"GetContainerSize"](),this.styleQueue.push({$el:this.element,style:r}));this._processStyleQueue(n,t);this.isLaidOut=!0},_processStyleQueue:function(n,r){var f=this.isLaidOut?this.isUsingJQueryAnimation?"animate":"css":"css",u=this.options.animationOptions,l=this.options.onLayout,a,e,o,s,b;if(e=function(n,t){t.$el[f](t.style,u)},this._isInserting&&this.isUsingJQueryAnimation)e=function(n,t){a=t.$el.hasClass("no-transition")?"css":f;t.$el[a](t.style,u)};else if(r||l||u.complete){var v=!1,y=[r,l,u.complete],p=this;if(o=!0,s=function(){var i,t,r;if(!v){for(t=0,r=y.length;t<r;t++)i=y[t],typeof i=="function"&&i.call(p.element,n,p);v=!0}},this.isUsingJQueryAnimation&&f==="animate")u.complete=s,o=!1;else if(i.csstransitions){for(var g=0,w=this.styleQueue[0],h=w&&w.$el,c;!h||!h.length;){if(c=this.styleQueue[g++],!c)return;h=c.$el}b=parseFloat(getComputedStyle(h[0])[d]);b>0&&(e=function(n,t){t.$el[f](t.style,u).one(k,s)},o=!1)}}t.each(this.styleQueue,e);o&&s();this.styleQueue=[]},resize:function(){this["_"+this.options.layoutMode+"ResizeChanged"]()&&this.reLayout()},reLayout:function(n){this["_"+this.options.layoutMode+"Reset"]();this.layout(this.$filteredAtoms,n)},addItems:function(n,t){var i=this._getAtoms(n);this.$allAtoms=this.$allAtoms.add(i);t&&t(i)},insert:function(n,t){this.element.append(n);var i=this;this.addItems(n,function(n){var r=i._filter(n);i._addHideAppended(r);i._sort();i.reLayout();i._revealAppended(r,t)})},appended:function(n,t){var i=this;this.addItems(n,function(n){i._addHideAppended(n);i.layout(n);i._revealAppended(n,t)})},_addHideAppended:function(n){this.$filteredAtoms=this.$filteredAtoms.add(n);n.addClass("no-transition");this._isInserting=!0;this.styleQueue.push({$el:n,style:this.options.hiddenStyle})},_revealAppended:function(n,t){var i=this;setTimeout(function(){n.removeClass("no-transition");i.styleQueue.push({$el:n,style:i.options.visibleStyle});i._isInserting=!1;i._processStyleQueue(n,t)},10)},reloadItems:function(){this.$allAtoms=this._getAtoms(this.element.children())},remove:function(n,t){this.$allAtoms=this.$allAtoms.not(n);this.$filteredAtoms=this.$filteredAtoms.not(n);var r=this,i=function(){n.remove();t&&t.call(r.element)};n.filter(":not(."+this.options.hiddenClass+")").length?(this.styleQueue.push({$el:n,style:this.options.hiddenStyle}),this._sort(),this.reLayout(i)):i()},shuffle:function(n){this.updateSortData(this.$allAtoms);this.options.sortBy="random";this._sort();this.reLayout(n)},destroy:function(){var r=this.usingTransforms,n=this.options,i,t;this.$allAtoms.removeClass(n.hiddenClass+" "+n.itemClass).each(function(){var n=this.style;n.position="";n.top="";n.left="";n.opacity="";r&&(n[s]="")});i=this.element[0].style;for(t in this.originalStyle)i[t]=this.originalStyle[t];this.element.unbind(".isotope").undelegate("."+n.hiddenClass,"click").removeClass(n.containerClass).removeData("isotope");v.unbind(".isotope")},_getSegments:function(n){var t=this.options.layoutMode,r=n?"rowHeight":"columnWidth",u=n?"height":"width",s=n?"rows":"cols",f=this.element[u](),i,e=this.options[t]&&this.options[t][r]||this.$filteredAtoms["outer"+o(u)](!0)||f;i=Math.floor(f/e);i=Math.max(i,1);this[t][s]=i;this[t][r]=e},_checkIfSegmentsChanged:function(n){var t=this.options.layoutMode,i=n?"rows":"cols",r=this[t][i];return this._getSegments(n),this[t][i]!==r},_masonryReset:function(){this.masonry={};this._getSegments();var n=this.masonry.cols;for(this.masonry.colYs=[];n--;)this.masonry.colYs.push(0)},_masonryLayout:function(n){var r=this,i=r.masonry;n.each(function(){var f=t(this),u=Math.ceil(f.outerWidth(!0)/i.columnWidth),o,e,s,n;if(u=Math.min(u,i.cols),u===1)r._masonryPlaceBrick(f,i.colYs);else{for(o=i.cols+1-u,e=[],n=0;n<o;n++)s=i.colYs.slice(n,n+u),e[n]=Math.max.apply(Math,s);r._masonryPlaceBrick(f,e)}})},_masonryPlaceBrick:function(n,t){for(var e,o,s,h,r=Math.min.apply(Math,t),u=0,i=0,f=t.length;i<f;i++)if(t[i]===r){u=i;break}for(e=this.masonry.columnWidth*u-1,o=r,this._pushPosition(n,e,o),s=r+n.outerHeight(!0),h=this.masonry.cols+1-f,i=0;i<h;i++)this.masonry.colYs[u+i]=s},_masonryGetContainerSize:function(){var n=Math.max.apply(Math,this.masonry.colYs);return{height:n}},_masonryResizeChanged:function(){return this._checkIfSegmentsChanged()},_fitRowsReset:function(){this.fitRows={x:0,y:0,height:0}},_fitRowsLayout:function(n){var r=this,u=this.element.width(),i=this.fitRows;n.each(function(){var f=t(this),n=f.outerWidth(!0),e=f.outerHeight(!0);n=n-1;i.x!==0&&n+i.x>u&&(i.x=0,i.y=i.height);r._pushPosition(f,i.x,i.y);i.height=Math.max(i.y+e,i.height);i.x+=n})},_fitRowsGetContainerSize:function(){return{height:this.fitRows.height}},_fitRowsResizeChanged:function(){return!0},_cellsByRowReset:function(){this.cellsByRow={index:0};this._getSegments();this._getSegments(!0)},_cellsByRowLayout:function(n){var r=this,i=this.cellsByRow;n.each(function(){var n=t(this),u=i.index%i.cols,f=Math.floor(i.index/i.cols),e=(u+.5)*i.columnWidth-n.outerWidth(!0)/2,o=(f+.5)*i.rowHeight-n.outerHeight(!0)/2;r._pushPosition(n,e,o);i.index++})},_cellsByRowGetContainerSize:function(){return{height:Math.ceil(this.$filteredAtoms.length/this.cellsByRow.cols)*this.cellsByRow.rowHeight+this.offset.top}},_cellsByRowResizeChanged:function(){return this._checkIfSegmentsChanged()},_straightDownReset:function(){this.straightDown={y:0}},_straightDownLayout:function(n){var i=this;n.each(function(){var n=t(this);i._pushPosition(n,0,i.straightDown.y);i.straightDown.y+=n.outerHeight(!0)})},_straightDownGetContainerSize:function(){return{height:this.straightDown.y}},_straightDownResizeChanged:function(){return!0},_masonryHorizontalReset:function(){this.masonryHorizontal={};this._getSegments(!0);var n=this.masonryHorizontal.rows;for(this.masonryHorizontal.rowXs=[];n--;)this.masonryHorizontal.rowXs.push(0)},_masonryHorizontalLayout:function(n){var r=this,i=r.masonryHorizontal;n.each(function(){var f=t(this),u=Math.ceil(f.outerHeight(!0)/i.rowHeight),o,e,s,n;if(u=Math.min(u,i.rows),u===1)r._masonryHorizontalPlaceBrick(f,i.rowXs);else{for(o=i.rows+1-u,e=[],n=0;n<o;n++)s=i.rowXs.slice(n,n+u),e[n]=Math.max.apply(Math,s);r._masonryHorizontalPlaceBrick(f,e)}})},_masonryHorizontalPlaceBrick:function(n,t){for(var e,o,s,h,r=Math.min.apply(Math,t),u=0,i=0,f=t.length;i<f;i++)if(t[i]===r){u=i;break}for(e=r,o=this.masonryHorizontal.rowHeight*u,this._pushPosition(n,e,o),s=r+n.outerWidth(!0),h=this.masonryHorizontal.rows+1-f,i=0;i<h;i++)this.masonryHorizontal.rowXs[u+i]=s},_masonryHorizontalGetContainerSize:function(){var n=Math.max.apply(Math,this.masonryHorizontal.rowXs);return{width:n}},_masonryHorizontalResizeChanged:function(){return this._checkIfSegmentsChanged(!0)},_fitColumnsReset:function(){this.fitColumns={x:0,y:0,width:0}},_fitColumnsLayout:function(n){var r=this,u=this.element.height(),i=this.fitColumns;n.each(function(){var n=t(this),e=n.outerWidth(!0),f=n.outerHeight(!0);i.y!==0&&f+i.y>u&&(i.x=i.width,i.y=0);r._pushPosition(n,i.x,i.y);i.width=Math.max(i.x+e,i.width);i.y+=f})},_fitColumnsGetContainerSize:function(){return{width:this.fitColumns.width}},_fitColumnsResizeChanged:function(){return!0},_cellsByColumnReset:function(){this.cellsByColumn={index:0};this._getSegments();this._getSegments(!0)},_cellsByColumnLayout:function(n){var r=this,i=this.cellsByColumn;n.each(function(){var n=t(this),u=Math.floor(i.index/i.rows),f=i.index%i.rows,e=(u+.5)*i.columnWidth-n.outerWidth(!0)/2,o=(f+.5)*i.rowHeight-n.outerHeight(!0)/2;r._pushPosition(n,e,o);i.index++})},_cellsByColumnGetContainerSize:function(){return{width:Math.ceil(this.$filteredAtoms.length/this.cellsByColumn.rows)*this.cellsByColumn.columnWidth}},_cellsByColumnResizeChanged:function(){return this._checkIfSegmentsChanged(!0)},_straightAcrossReset:function(){this.straightAcross={x:0}},_straightAcrossLayout:function(n){var i=this;n.each(function(){var n=t(this);i._pushPosition(n,i.straightAcross.x,0);i.straightAcross.x+=n.outerWidth(!0)})},_straightAcrossGetContainerSize:function(){return{width:this.straightAcross.x}},_straightAcrossResizeChanged:function(){return!0}};t.fn.imagesLoaded=function(n){function o(){n.call(i,r)}function s(n){var i=n.target;i.src!==f&&t.inArray(i,e)===-1&&(e.push(i),--u<=0&&(setTimeout(o),r.unbind(".imagesLoaded",s)))}var i=this,r=i.find("img").add(i.filter("img")),u=r.length,f="data:image/gif;base64,R0lGODlhAQABAIAAAAAAAP///ywAAAAAAQABAAACAUwAOw==",e=[];return u||o(),r.bind("load.imagesLoaded error.imagesLoaded",s).each(function(){var n=this.src;this.src=f;this.src=n}),i};y=function(t){n.console&&n.console.error(t)};t.fn.isotope=function(n,i){if(typeof n=="string"){var r=Array.prototype.slice.call(arguments,1);this.each(function(){var i=t.data(this,"isotope");if(!i){y("cannot call methods on isotope prior to initialization; attempted to call method '"+n+"'");return}if(!t.isFunction(i[n])||n.charAt(0)==="_"){y("no such method '"+n+"' for isotope instance");return}i[n].apply(i,r)})}else this.each(function(){var r=t.data(this,"isotope");r?(r.option(n),r._init(i)):t.data(this,"isotope",new t.Isotope(n,this,i))});return this}})(window,jQuery);
/*
//# sourceMappingURL=jquery.isotope.min.js.map
*/

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/jquery.isotope.min.js'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/jquery.isotope.min.js');
jQuery(function($) {'use strict';

	// Navigation Scroll
	$(window).scroll(function(event) {
		Scroll();
	});

	//$('.navbar-collapse ul li a').on('click', function() {  
	//	$('html, body').animate({scrollTop: $(this.hash).offset().top - 5}, 1000);
	//	return false;
	//});

	// User define function
	function Scroll() {
	    var contentTop = [];
	    var contentBottom = [];
	    var winTop = $(window).scrollTop();
	    var rangeTop = 200;
	    var rangeBottom = 500;
	    $('.navbar-collapse').find('.scroll a').each(function () {
	        if ($($(this).attr('href')).offset()) {
	            contentTop.push($($(this).attr('href')).offset().top);
	            contentBottom.push($($(this).attr('href')).offset().top + $($(this).attr('href')).height());
	        }
	    })
	   // alert(winTop);
	    $.each(contentTop, function (i) {
	        if (winTop > contentTop[i] - rangeTop) {
	            $('.navbar-collapse li.scroll')
				.removeClass('active')
				.eq(i).addClass('active');
	        }
	    })
	};
	

	$('#tohash').on('click', function(){
		$('html, body').animate({scrollTop: $(this.hash).offset().top - 5}, 1000);
		return false;
	});

	// accordian
	$('.accordion-toggle').on('click', function(){
		$(this).closest('.panel-group').children().each(function(){
		$(this).find('>.panel-heading').removeClass('active');
		 });
	 	$(this).closest('.panel-heading').toggleClass('active');
	});



	//Initiat WOW JS
	//new WOW().init();
	//smoothScroll
	smoothScroll.init();

	// portfolio filter
	$(window).load(function(){'use strict';
	    var $portfolio_selectors = $('.portfolio-filter >li>a');
	    var $portfolio_selectors_li = $('.portfolio-filter >li>ul>li>a');
		var $portfolio = $('.portfolio-items');
		$portfolio.isotope({
			itemSelector : '.portfolio-item',
			layoutMode : 'fitRows'
		});
		$portfolio_selectors.on('click', function(){
			$portfolio_selectors.removeClass('active');
			$(this).addClass('active');
			var selector = $(this).attr('data-filter');
			$portfolio.isotope({ filter: selector });
			return false;
		});
		$portfolio_selectors_li.on('click', function () {
		    //alert("123");
		    $portfolio_selectors_li.removeClass('active');
		    $(this).addClass('active');
		    var selector = $(this).attr('data-filter');
		    $portfolio.isotope({ filter: selector });
		    return false;
		});
	});
    // meet-team filter
	$(window).load(function () {
	    'use strict';
	    var $portfolio_selectors = $('.meet-team-filter >li>a');
	    //var $portfolio_selectors_li = $('.meet-team-filter >li>ul>li>a');
	    var $portfolio = $('.meet-team-items');
	    $portfolio.isotope({
	        itemSelector: '.meet-team-item',
	        itemInfo: '.meet-team-info',
	        layoutMode: 'fitRows'
	    });

	    $portfolio_selectors.on('click', function () {
	        $portfolio_selectors.removeClass('active');
	        $(this).addClass('active');
	        var selector = $(this).attr('data-filter');
	        $portfolio.isotope({ filter: selector });
	        return false;
	    });
	   
	});

	$(document).ready(function() {
		//Animated Progress
		$('.progress-bar').bind('inview', function(event, visible, visiblePartX, visiblePartY) {
			if (visible) {
				$(this).css('width', $(this).data('width') + '%');
				$(this).unbind('inview');
			}
		});

		//Animated Number
		$.fn.animateNumbers = function(stop, commas, duration, ease) {
			return this.each(function() {
				var $this = $(this);
				var start = parseInt($this.text().replace(/,/g, ""));
				commas = (commas === undefined) ? true : commas;
				$({value: start}).animate({value: stop}, {
					duration: duration == undefined ? 1000 : duration,
					easing: ease == undefined ? "swing" : ease,
					step: function() {
						$this.text(Math.floor(this.value));
						if (commas) { $this.text($this.text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")); }
					},
					complete: function() {
						if (parseInt($this.text()) !== stop) {
							$this.text(stop);
							if (commas) { $this.text($this.text().replace(/(\d)(?=(\d\d\d)+(?!\d))/g, "$1,")); }
						}
					}
				});
			});
		};

		$('.animated-number').bind('inview', function(event, visible, visiblePartX, visiblePartY) {
			var $this = $(this);
			if (visible) {
				$this.animateNumbers($this.data('digit'), false, $this.data('duration')); 
				$this.unbind('inview');
			}
		});
	});

	// Contact form
	var form = $('#main-contact-form');
	form.submit(function(event){
		event.preventDefault();
		var form_status = $('<div class="form_status"></div>');
		$.ajax({
			url: $(this).attr('action'),
			beforeSend: function(){
				form.prepend( form_status.html('<p><i class="fa fa-spinner fa-spin"></i> Email is sending...</p>').fadeIn() );
			}
		}).done(function(data){
			form_status.html('<p class="text-success">Thank you for contact us. As early as possible  we will contact you</p>').delay(3000).fadeOut();
		});
	});

    //Pretty Photo
    /*theme = light_square / dark_rounded / light_square / dark_square / facebook */
	$("a[rel^='prettyPhoto']").prettyPhoto({
	    social_tools: false,
	});



});




                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/main.js'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/main.js');
�  (                   �    LP                       ׍K�                   l g    R e g u l a r    V e r s i o n   1 . 0    l g          �  0OS/2   �   `cmap��3o     �gasp     �   glyfZ	+�  �  	�head	t�>  X   6hhea��  �   $hmtxJ Q  �   TlocavX     ,maxp  �  4    name���M  T  �post          ��   ��   ���  � 3	                               @  ���� @� @                                      �         ���3�p�������������      ���3�p������������� ������t �                                  ��             79               79               79     V �U   # '  327654'&#"2#"'&54763*V��eeee��eeee��}}}}��}}}}0VT���ee��eeee��ee }}��}}}}��}}��T��  V �U   "  %27654'&#"2#"'&5476 �eeee��eeee��}}}}��}}}}Z Uee��eeee��ee }}��}}}}��}}����     U  �U  ( =  !2#!"'&547633!#!"'&5476%!"3!27654'&#��5%&&%5�U5&%%&5�$!!)�U5%&��U�U%&5�V5&%%&5�5&%���%&%5�)!!j�V�     � �*�   ''7'77*��<��<��<�����<��<��<��  U U�  "  2!2#!#"'&54763����g���* ��*+   U U�  "  2#"'&54?!"'&54763!'&54763U*����g�� ������   � +V+  
  7!!'33���T ���T�VV����V 	 � UV         #  %53535373#53!535335353�����T�T��� ��T���T��T�U�� �� ����� ����� ���� ��   � �*�      3#5#53#553#3#5V�T��T���Ԁ���Ԁ�T��T,�T���T�  � �*�      3#5353#53#553#5���TTԀ��T��TUT����T�Ԁ�T��TԀ     � Aj+   2  ##5#5353327654'&#"!'5'#"'&547632 V*VV*VjP8888PP8888P�@�LhtQQQQttPPBVV*VV�88PP8888PP88�@�"BPPttQQQQthL    � Aj+   *  3#27654'&#"!'5'#"'&547632*��lP8888PP8888P�@�LhtQQQQttPPB+*�88PP8888PP88�@�"BPPttQQQQthL    � �U 3  %2#"&5<7%#"&54632%.54632#"&'> 3II33I��,4LK5-,K54LK5-��0,�I33KK3�K54L�4LL45K��   ����  )  "32>54.##"3##5#53546; f��NN��ff��NN��ftI\OWOO<.I�M��ff��NN��ff��M��6L��L-0EQ  ����  N [ n �  "32>54.##*10"#"&546;.1*#"&'.54673%##5#53533*#7>'.#7.#*3:7>' f��NN��ff��NN��f-	iu
 ww	%L4LL4L��4##+)!-

#	�M��ff��NN��ff��M�BDC!
*R
' %	+##3�MM3MM3;
%#� #7  ����  A  "32>54.#.'&67&6>&'..7>76' f��NN��ff��NN��f"
 %&*/
$&4
"ZM1,l@R�+C+�M��ff��NN��ff��M��5_Q�@&k>C:6QV")O1!
@-Ka	KL,UC'   ����  T  "32>54.##"&'23267.'3267.=.5467.54632>7>7 f��NN��ff��NN��f�$FfC)K!"= 1
	!-
$g=9($	�M��ff��NN��ff��M�n0bO2&5#+,7(9

        �K��_<�      �4��    �4��  ����             ���       �                                V  V  U  �  U  U  �  �  �  �  �  �  �             
   ^ � �H����"l��4�N�     � 	                                 �                ;       /       P              5      
 V       -         �       " �  	    �  	     	  B  	  1  	  R  	    	  7  	 
 4p  	  Z 3  	   �  	  D �lg l ghttps://github.com/sachinchoolur/lightGallery h t t p s : / / g i t h u b . c o m / s a c h i n c h o o l u r / l i g h t G a l l e r ysachin s a c h i nMLT M L Thttp://opensource.org/licenses/MIT h t t p : / / o p e n s o u r c e . o r g / l i c e n s e s / M I TVersion 1.0 V e r s i o n   1 . 0lg l glg l gRegular R e g u l a rlg l gFont generated by IcoMoon. F o n t   g e n e r a t e d   b y   I c o M o o n .                                 

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.eot'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.eot');
<?xml version="1.0" standalone="no"?>
<!DOCTYPE svg PUBLIC "-//W3C//DTD SVG 1.1//EN" "http://www.w3.org/Graphics/SVG/1.1/DTD/svg11.dtd" >
<svg xmlns="http://www.w3.org/2000/svg">
<metadata>
<json>
<![CDATA[
{
	"fontFamily": "lg",
	"majorVersion": 1,
	"minorVersion": 0,
	"fontURL": "https://github.com/sachinchoolur/lightGallery",
	"copyright": "sachin",
	"license": "MLT",
	"licenseURL": "http://opensource.org/licenses/MIT",
	"version": "Version 1.0",
	"fontId": "lg",
	"psName": "lg",
	"subFamily": "Regular",
	"fullName": "lg",
	"description": "Font generated by IcoMoon."
}
]]>
</json>
</metadata>
<defs>
<font id="lg" horiz-adv-x="1024">
<font-face units-per-em="1024" ascent="960" descent="-64" />
<missing-glyph horiz-adv-x="1024" />
<glyph unicode="&#x20;" horiz-adv-x="512" d="" />
<glyph unicode="&#xe01a;" glyph-name="pause_circle_outline" data-tags="pause_circle_outline" d="M554 256.667v340h86v-340h-86zM512 84.667q140 0 241 101t101 241-101 241-241 101-241-101-101-241 101-241 241-101zM512 852.667q176 0 301-125t125-301-125-301-301-125-301 125-125 301 125 301 301 125zM384 256.667v340h86v-340h-86z" />
<glyph unicode="&#xe01d;" glyph-name="play_circle_outline" data-tags="play_circle_outline" d="M512 84.667q140 0 241 101t101 241-101 241-241 101-241-101-101-241 101-241 241-101zM512 852.667q176 0 301-125t125-301-125-301-301-125-301 125-125 301 125 301 301 125zM426 234.667v384l256-192z" />
<glyph unicode="&#xe033;" glyph-name="stack-2" data-tags="stack-2" d="M384 853.334h426.667q53 0 90.5-37.5t37.5-90.5v-426.667q0-53-37.5-90.5t-90.5-37.5h-426.667q-53 0-90.5 37.5t-37.5 90.5v426.667q0 53 37.5 90.5t90.5 37.5zM170.667 675.334v-547.333q0-17.667 12.5-30.167t30.167-12.5h547.333q-13.333-37.667-46.333-61.5t-74.333-23.833h-426.667q-53 0-90.5 37.5t-37.5 90.5v426.667q0 41.333 23.833 74.333t61.5 46.333zM810.667 768h-426.667q-17.667 0-30.167-12.5t-12.5-30.167v-426.667q0-17.667 12.5-30.167t30.167-12.5h426.667q17.667 0 30.167 12.5t12.5 30.167v426.667q0 17.667-12.5 30.167t-30.167 12.5z" />
<glyph unicode="&#xe070;" glyph-name="clear" data-tags="clear" d="M810 664.667l-238-238 238-238-60-60-238 238-238-238-60 60 238 238-238 238 60 60 238-238 238 238z" />
<glyph unicode="&#xe094;" glyph-name="arrow-left" data-tags="arrow-left" d="M426.667 768q17.667 0 30.167-12.5t12.5-30.167q0-18-12.667-30.333l-225.667-225.667h665q17.667 0 30.167-12.5t12.5-30.167-12.5-30.167-30.167-12.5h-665l225.667-225.667q12.667-12.333 12.667-30.333 0-17.667-12.5-30.167t-30.167-12.5q-18 0-30.333 12.333l-298.667 298.667q-12.333 13-12.333 30.333t12.333 30.333l298.667 298.667q12.667 12.333 30.333 12.333z" />
<glyph unicode="&#xe095;" glyph-name="arrow-right" data-tags="arrow-right" d="M597.333 768q18 0 30.333-12.333l298.667-298.667q12.333-12.333 12.333-30.333t-12.333-30.333l-298.667-298.667q-12.333-12.333-30.333-12.333-18.333 0-30.5 12.167t-12.167 30.5q0 18 12.333 30.333l226 225.667h-665q-17.667 0-30.167 12.5t-12.5 30.167 12.5 30.167 30.167 12.5h665l-226 225.667q-12.333 12.333-12.333 30.333 0 18.333 12.167 30.5t30.5 12.167z" />
<glyph unicode="&#xe0f2;" glyph-name="vertical_align_bottom" data-tags="vertical_align_bottom" d="M170 128.667h684v-86h-684v86zM682 384.667l-170-172-170 172h128v426h84v-426h128z" />
<glyph unicode="&#xe1ff;" glyph-name="apps" data-tags="apps" d="M682 84.667v172h172v-172h-172zM682 340.667v172h172v-172h-172zM426 596.667v172h172v-172h-172zM682 768.667h172v-172h-172v172zM426 340.667v172h172v-172h-172zM170 340.667v172h172v-172h-172zM170 84.667v172h172v-172h-172zM426 84.667v172h172v-172h-172zM170 596.667v172h172v-172h-172z" />
<glyph unicode="&#xe20c;" glyph-name="fullscreen" data-tags="fullscreen" d="M598 724.667h212v-212h-84v128h-128v84zM726 212.667v128h84v-212h-212v84h128zM214 512.667v212h212v-84h-128v-128h-84zM298 340.667v-128h128v-84h-212v212h84z" />
<glyph unicode="&#xe20d;" glyph-name="fullscreen_exit" data-tags="fullscreen_exit" d="M682 596.667h128v-84h-212v212h84v-128zM598 128.667v212h212v-84h-128v-128h-84zM342 596.667v128h84v-212h-212v84h128zM214 256.667v84h212v-212h-84v128h-128z" />
<glyph unicode="&#xe311;" glyph-name="zoom_in" data-tags="zoom_in" d="M512 512.667h-86v-86h-42v86h-86v42h86v86h42v-86h86v-42zM406 340.667q80 0 136 56t56 136-56 136-136 56-136-56-56-136 56-136 136-56zM662 340.667l212-212-64-64-212 212v34l-12 12q-76-66-180-66-116 0-197 80t-81 196 81 197 197 81 196-81 80-197q0-104-66-180l12-12h34z" />
<glyph unicode="&#xe312;" glyph-name="zoom_out" data-tags="zoom_out" d="M298 554.667h214v-42h-214v42zM406 340.667q80 0 136 56t56 136-56 136-136 56-136-56-56-136 56-136 136-56zM662 340.667l212-212-64-64-212 212v34l-12 12q-76-66-180-66-116 0-197 80t-81 196 81 197 197 81 196-81 80-197q0-104-66-180l12-12h34z" />
<glyph unicode="&#xe80d;" glyph-name="share" data-tags="share" d="M768 252.667c68 0 124-56 124-124s-56-126-124-126-124 58-124 126c0 10 0 20 2 28l-302 176c-24-22-54-34-88-34-70 0-128 58-128 128s58 128 128 128c34 0 64-12 88-34l300 174c-2 10-4 20-4 30 0 70 58 128 128 128s128-58 128-128-58-128-128-128c-34 0-64 14-88 36l-300-176c2-10 4-20 4-30s-2-20-4-30l304-176c22 20 52 32 84 32z" />
<glyph unicode="&#xe901;" glyph-name="facebook-with-circle" data-tags="facebook-with-circle" d="M512 952.32c-271.462 0-491.52-220.058-491.52-491.52s220.058-491.52 491.52-491.52 491.52 220.058 491.52 491.52-220.058 491.52-491.52 491.52zM628.429 612.659h-73.882c-8.755 0-18.483-11.52-18.483-26.829v-53.35h92.416l-13.978-76.083h-78.438v-228.403h-87.194v228.403h-79.104v76.083h79.104v44.749c0 64.205 44.544 116.378 105.677 116.378h73.882v-80.947z" />
<glyph unicode="&#xe902;" glyph-name="google-with-circle" data-tags="google+-with-circle" d="M512 952.32c-271.462 0-491.52-220.058-491.52-491.52s220.058-491.52 491.52-491.52 491.52 220.058 491.52 491.52-220.058 491.52-491.52 491.52zM483.686 249.805c-30.874-15.002-64.102-16.589-76.954-16.589-2.458 0-3.84 0-3.84 0s-1.178 0-2.765 0c-20.070 0-119.962 4.608-119.962 95.59 0 89.395 108.8 96.41 142.131 96.41h0.87c-19.251 25.702-15.258 51.61-15.258 51.61-1.69-0.102-4.147-0.205-7.168-0.205-12.544 0-36.762 1.997-57.549 15.411-25.498 16.384-38.4 44.288-38.4 82.893 0 109.107 119.142 113.51 120.32 113.613h118.989v-2.611c0-13.312-23.91-15.923-40.192-18.125-5.53-0.819-16.64-1.894-19.763-3.482 30.157-16.128 35.021-41.421 35.021-79.104 0-42.906-16.794-65.587-34.611-81.51-11.059-9.882-19.712-17.613-19.712-28.006 0-10.189 11.878-20.582 25.702-32.717 22.579-19.917 53.555-47.002 53.555-92.723 0-47.258-20.326-81.050-60.416-100.454zM742.4 460.8h-76.8v-76.8h-51.2v76.8h-76.8v51.2h76.8v76.8h51.2v-76.8h76.8v-51.2zM421.018 401.92c-2.662 0-5.325-0.102-8.038-0.307-22.733-1.69-43.725-10.189-58.88-24.013-15.053-13.619-22.733-30.822-21.658-48.179 2.304-36.403 41.37-57.702 88.832-54.323 46.694 3.379 77.824 30.31 75.571 66.714-2.15 34.202-31.898 60.109-75.827 60.109zM465.766 599.808c-12.39 43.52-32.358 56.422-63.386 56.422-3.328 0-6.707-0.512-9.933-1.382-13.466-3.84-24.166-15.053-30.106-31.744-6.093-16.896-6.451-34.509-1.229-54.579 9.472-35.891 34.97-61.901 60.672-61.901 3.379 0 6.758 0.41 9.933 1.382 28.109 7.885 45.722 50.79 34.048 91.802z" />
<glyph unicode="&#xe903;" glyph-name="pinterest-with-circle" data-tags="pinterest-with-circle" d="M512 952.32c-271.462 0-491.52-220.058-491.52-491.52s220.058-491.52 491.52-491.52 491.52 220.058 491.52 491.52-220.058 491.52-491.52 491.52zM545.638 344.32c-31.539 2.406-44.749 18.022-69.427 32.973-13.568-71.219-30.157-139.52-79.309-175.206-15.206 107.725 22.221 188.518 39.629 274.381-29.645 49.92 3.533 150.323 66.099 125.645 76.954-30.515-66.662-185.6 29.747-205.005 100.659-20.173 141.773 174.694 79.36 237.978-90.214 91.494-262.502 2.099-241.306-128.87 5.12-32 38.246-41.728 13.21-85.914-57.702 12.8-74.957 58.317-72.704 118.989 3.533 99.328 89.242 168.909 175.155 178.483 108.698 12.083 210.688-39.885 224.819-142.182 15.821-115.405-49.101-240.282-165.274-231.27z" />
<glyph unicode="&#xe904;" glyph-name="twitter-with-circle" data-tags="twitter-with-circle" d="M512 952.32c-271.462 0-491.52-220.058-491.52-491.52s220.058-491.52 491.52-491.52 491.52 220.058 491.52 491.52-220.058 491.52-491.52 491.52zM711.936 549.683c0.205-4.198 0.256-8.397 0.256-12.493 0-128-97.331-275.507-275.405-275.507-54.682 0-105.574 15.974-148.378 43.52 7.526-0.922 15.258-1.28 23.091-1.28 45.363 0 87.091 15.411 120.218 41.421-42.342 0.819-78.080 28.774-90.419 67.174 5.888-1.075 11.93-1.69 18.176-1.69 8.806 0 17.408 1.178 25.498 3.379-44.288 8.909-77.67 48.026-77.67 94.925v1.178c13.056-7.219 28.006-11.622 43.878-12.134-26.010 17.408-43.059 47.002-43.059 80.64 0 17.715 4.762 34.406 13.107 48.691 47.77-58.573 119.040-97.075 199.526-101.222-1.69 7.117-2.509 14.49-2.509 22.118 0 53.402 43.315 96.819 96.819 96.819 27.802 0 52.992-11.776 70.656-30.618 22.067 4.403 42.752 12.39 61.44 23.501-7.219-22.579-22.528-41.574-42.547-53.606 19.61 2.406 38.246 7.578 55.603 15.309-12.954-19.405-29.389-36.506-48.282-50.125z" />
</font></defs></svg>

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.svg'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.svg');
     �  0OS/2   �   `cmap��3o     �gasp     �   glyfZ	+�  �  	�head	t�>  X   6hhea��  �   $hmtxJ Q  �   TlocavX     ,maxp  �  4    name���M  T  �post          ��   ��   ���  � 3	                               @  ���� @� @                                      �         ���3�p�������������      ���3�p������������� ������t �                                  ��             79               79               79     V �U   # '  327654'&#"2#"'&54763*V��eeee��eeee��}}}}��}}}}0VT���ee��eeee��ee }}��}}}}��}}��T��  V �U   "  %27654'&#"2#"'&5476 �eeee��eeee��}}}}��}}}}Z Uee��eeee��ee }}��}}}}��}}����     U  �U  ( =  !2#!"'&547633!#!"'&5476%!"3!27654'&#��5%&&%5�U5&%%&5�$!!)�U5%&��U�U%&5�V5&%%&5�5&%���%&%5�)!!j�V�     � �*�   ''7'77*��<��<��<�����<��<��<��  U U�  "  2!2#!#"'&54763����g���* ��*+   U U�  "  2#"'&54?!"'&54763!'&54763U*����g�� ������   � +V+  
  7!!'33���T ���T�VV����V 	 � UV         #  %53535373#53!535335353�����T�T��� ��T���T��T�U�� �� ����� ����� ���� ��   � �*�      3#5#53#553#3#5V�T��T���Ԁ���Ԁ�T��T,�T���T�  � �*�      3#5353#53#553#5���TTԀ��T��TUT����T�Ԁ�T��TԀ     � Aj+   2  ##5#5353327654'&#"!'5'#"'&547632 V*VV*VjP8888PP8888P�@�LhtQQQQttPPBVV*VV�88PP8888PP88�@�"BPPttQQQQthL    � Aj+   *  3#27654'&#"!'5'#"'&547632*��lP8888PP8888P�@�LhtQQQQttPPB+*�88PP8888PP88�@�"BPPttQQQQthL    � �U 3  %2#"&5<7%#"&54632%.54632#"&'> 3II33I��,4LK5-,K54LK5-��0,�I33KK3�K54L�4LL45K��   ����  )  "32>54.##"3##5#53546; f��NN��ff��NN��ftI\OWOO<.I�M��ff��NN��ff��M��6L��L-0EQ  ����  N [ n �  "32>54.##*10"#"&546;.1*#"&'.54673%##5#53533*#7>'.#7.#*3:7>' f��NN��ff��NN��f-	iu
 ww	%L4LL4L��4##+)!-

#	�M��ff��NN��ff��M�BDC!
*R
' %	+##3�MM3MM3;
%#� #7  ����  A  "32>54.#.'&67&6>&'..7>76' f��NN��ff��NN��f"
 %&*/
$&4
"ZM1,l@R�+C+�M��ff��NN��ff��M��5_Q�@&k>C:6QV")O1!
@-Ka	KL,UC'   ����  T  "32>54.##"&'23267.'3267.=.5467.54632>7>7 f��NN��ff��NN��f�$FfC)K!"= 1
	!-
$g=9($	�M��ff��NN��ff��M�n0bO2&5#+,7(9

        �K��_<�      �4��    �4��  ����             ���       �                                V  V  U  �  U  U  �  �  �  �  �  �  �             
   ^ � �H����"l��4�N�     � 	                                 �                ;       /       P              5      
 V       -         �       " �  	    �  	     	  B  	  1  	  R  	    	  7  	 
 4p  	  Z 3  	   �  	  D �lg l ghttps://github.com/sachinchoolur/lightGallery h t t p s : / / g i t h u b . c o m / s a c h i n c h o o l u r / l i g h t G a l l e r ysachin s a c h i nMLT M L Thttp://opensource.org/licenses/MIT h t t p : / / o p e n s o u r c e . o r g / l i c e n s e s / M I TVersion 1.0 V e r s i o n   1 . 0lg l glg l gRegular R e g u l a rlg l gFont generated by IcoMoon. F o n t   g e n e r a t e d   b y   I c o M o o n .                                 

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.ttf'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.ttf');
wOFF     t     (                       OS/2     `   `cmap  h   �   ���3ogasp           glyf    	�  	�Z	+�head  �   6   6	t�>hhea  �   $   $��hmtx      T   TJ Qloca  T   ,   ,vXmaxp  �          �name  �  �  ����Mpost  T            ��   ��   ���  � 3	                               @  ���� @� @                                      �         ���3�p�������������      ���3�p������������� ������t �                                  ��             79               79               79     V �U   # '  327654'&#"2#"'&54763*V��eeee��eeee��}}}}��}}}}0VT���ee��eeee��ee }}��}}}}��}}��T��  V �U   "  %27654'&#"2#"'&5476 �eeee��eeee��}}}}��}}}}Z Uee��eeee��ee }}��}}}}��}}����     U  �U  ( =  !2#!"'&547633!#!"'&5476%!"3!27654'&#��5%&&%5�U5&%%&5�$!!)�U5%&��U�U%&5�V5&%%&5�5&%���%&%5�)!!j�V�     � �*�   ''7'77*��<��<��<�����<��<��<��  U U�  "  2!2#!#"'&54763����g���* ��*+   U U�  "  2#"'&54?!"'&54763!'&54763U*����g�� ������   � +V+  
  7!!'33���T ���T�VV����V 	 � UV         #  %53535373#53!535335353�����T�T��� ��T���T��T�U�� �� ����� ����� ���� ��   � �*�      3#5#53#553#3#5V�T��T���Ԁ���Ԁ�T��T,�T���T�  � �*�      3#5353#53#553#5���TTԀ��T��TUT����T�Ԁ�T��TԀ     � Aj+   2  ##5#5353327654'&#"!'5'#"'&547632 V*VV*VjP8888PP8888P�@�LhtQQQQttPPBVV*VV�88PP8888PP88�@�"BPPttQQQQthL    � Aj+   *  3#27654'&#"!'5'#"'&547632*��lP8888PP8888P�@�LhtQQQQttPPB+*�88PP8888PP88�@�"BPPttQQQQthL    � �U 3  %2#"&5<7%#"&54632%.54632#"&'> 3II33I��,4LK5-,K54LK5-��0,�I33KK3�K54L�4LL45K��   ����  )  "32>54.##"3##5#53546; f��NN��ff��NN��ftI\OWOO<.I�M��ff��NN��ff��M��6L��L-0EQ  ����  N [ n �  "32>54.##*10"#"&546;.1*#"&'.54673%##5#53533*#7>'.#7.#*3:7>' f��NN��ff��NN��f-	iu
 ww	%L4LL4L��4##+)!-

#	�M��ff��NN��ff��M�BDC!
*R
' %	+##3�MM3MM3;
%#� #7  ����  A  "32>54.#.'&67&6>&'..7>76' f��NN��ff��NN��f"
 %&*/
$&4
"ZM1,l@R�+C+�M��ff��NN��ff��M��5_Q�@&k>C:6QV")O1!
@-Ka	KL,UC'   ����  T  "32>54.##"&'23267.'3267.=.5467.54632>7>7 f��NN��ff��NN��f�$FfC)K!"= 1
	!-
$g=9($	�M��ff��NN��ff��M�n0bO2&5#+,7(9

        �K��_<�      �4��    �4��  ����             ���       �                                V  V  U  �  U  U  �  �  �  �  �  �  �             
   ^ � �H����"l��4�N�     � 	                                 �                ;       /       P              5      
 V       -         �       " �  	    �  	     	  B  	  1  	  R  	    	  7  	 
 4p  	  Z 3  	   �  	  D �lg l ghttps://github.com/sachinchoolur/lightGallery h t t p s : / / g i t h u b . c o m / s a c h i n c h o o l u r / l i g h t G a l l e r ysachin s a c h i nMLT M L Thttp://opensource.org/licenses/MIT h t t p : / / o p e n s o u r c e . o r g / l i c e n s e s / M I TVersion 1.0 V e r s i o n   1 . 0lg l glg l gRegular R e g u l a rlg l gFont generated by IcoMoon. F o n t   g e n e r a t e d   b y   I c o M o o n .                                 

                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.woff'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/custom/font/lg.woff');
