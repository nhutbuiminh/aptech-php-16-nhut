(function(n){function f(f){var c=".smartmenus_mouse",h,s;u||f?u&&f&&(n(document).unbind(c),u=!1):(h=!0,s=null,n(document).bind(r([["mousemove",function(r){var u={x:r.pageX,y:r.pageY,timeStamp:(new Date).getTime()},e,o,f;s&&(e=Math.abs(s.x-u.x),o=Math.abs(s.y-u.y),(e>0||o>0)&&e<=2&&o<=2&&u.timeStamp-s.timeStamp<=300&&(i=!0,h&&(f=n(r.target).closest("a"),f.is("a")&&n.each(t,function(){if(n.contains(this.$root[0],f[0]))return this.itemEnter({currentTarget:f[0]}),!1}),h=!1)));s=u}],[o()?"touchstart":"pointerover pointermove pointerout MSPointerOver MSPointerMove MSPointerOut",function(n){e(n.originalEvent)&&(i=!1)}]],c)),u=!0)}function e(n){return!/^(4|mouse)$/.test(n.pointerType)}function o(){return"ontouchstart"in window}function r(t,i){i||(i="");var r={};return n.each(t,function(n,t){r[t[0].split(" ").join(i+" ")+i]=t[1]}),r}var t=[],s=!!window.createPopup,i=!1,u=!1;n.SmartMenus=function(t,i){this.$root=n(t);this.opts=i;this.rootId="";this.$subArrow=null;this.subMenus=[];this.activatedItems=[];this.visibleSubMenus=[];this.showTimeout=0;this.hideTimeout=0;this.scrollTimeout=0;this.clickActivated=!1;this.zIndexInc=0;this.$firstLink=null;this.$firstSub=null;this.disabled=!1;this.$disableOverlay=null;this.isTouchScrolling=!1;this.init()};n.extend(n.SmartMenus,{hideAll:function(){n.each(t,function(){this.menuHideAll()})},destroy:function(){while(t.length)t[0].destroy();f(!0)},prototype:{init:function(i){var e=this,u;if(i||(t.push(this),this.rootId=((new Date).getTime()+Math.random()+"").replace(/\D/g,""),this.$root.hasClass("sm-rtl")&&(this.opts.rightToLeftSubMenus=!0),u=".smartmenus",this.$root.data("smartmenus",this).attr("data-smartmenus-id",this.rootId).dataSM("level",1).bind(r([["mouseover focusin",n.proxy(this.rootOver,this)],["mouseout focusout",n.proxy(this.rootOut,this)]],u)).delegate("a",r([["mouseenter",n.proxy(this.itemEnter,this)],["mouseleave",n.proxy(this.itemLeave,this)],["mousedown",n.proxy(this.itemDown,this)],["focus",n.proxy(this.itemFocus,this)],["blur",n.proxy(this.itemBlur,this)],["click",n.proxy(this.itemClick,this)],["touchend",n.proxy(this.itemTouchEnd,this)]],u)),u+=this.rootId,this.opts.hideOnClick&&n(document).bind(r([["touchstart",n.proxy(this.docTouchStart,this)],["touchmove",n.proxy(this.docTouchMove,this)],["touchend",n.proxy(this.docTouchEnd,this)],["click",n.proxy(this.docClick,this)]],u)),n(window).bind(r([["resize orientationchange",n.proxy(this.winResize,this)]],u)),this.opts.subIndicators&&(this.$subArrow=n("<b/>")),f()),this.$firstSub=this.$root.find("ul").each(function(){e.menuInit(n(this))}).eq(0),this.$firstLink=this.$root.find("a").eq(0),this.opts.markCurrentItem){var o=/(index|default)\.[^#\?\/]*/i,s=window.location.href.replace(o,""),h=s.replace(/#.*/,"");this.$root.find("a").each(function(){var t=this.href.replace(o,""),i=n(this);(t==s||t==h)&&(i.addClass("current"),e.opts.markCurrentTree&&i.parent().parentsUntil("[data-smartmenus-id]","li").children("a").addClass("current"))})}},destroy:function(){var i,r;this.menuHideAll();i=".smartmenus";this.$root.removeData("smartmenus").removeAttr("data-smartmenus-id").removeDataSM("level").unbind(i).undelegate(i);i+=this.rootId;n(document).unbind(i);n(window).unbind(i);this.opts.subIndicators&&(this.$subArrow=null);r=this;n.each(this.subMenus,function(){this.hasClass("mega-menu")&&this.find("ul").removeDataSM("in-mega");this.dataSM("shown-before")&&((r.opts.subMenusMinWidth||r.opts.subMenusMaxWidth)&&this.css({width:"",minWidth:"",maxWidth:""}).removeClass("sm-nowrap"),this.dataSM("scroll-arrows")&&this.dataSM("scroll-arrows").remove(),this.css({zIndex:"",top:"",left:"",marginLeft:"",marginTop:"",display:""}));r.opts.subIndicators&&this.dataSM("parent-a").removeClass("has-submenu").children("span.sub-arrow").remove();this.removeDataSM("shown-before").removeDataSM("ie-shim").removeDataSM("scroll-arrows").removeDataSM("parent-a").removeDataSM("level").removeDataSM("beforefirstshowfired").parent().removeDataSM("sub")});this.opts.markCurrentItem&&this.$root.find("a.current").removeClass("current");this.$root=null;this.$firstLink=null;this.$firstSub=null;this.$disableOverlay&&(this.$disableOverlay.remove(),this.$disableOverlay=null);t.splice(n.inArray(this,t),1)},disable:function(t){if(!this.disabled){if(this.menuHideAll(),!t&&!this.opts.isPopup&&this.$root.is(":visible")){var i=this.$root.offset();this.$disableOverlay=n('<div class="sm-jquery-disable-overlay"/>').css({position:"absolute",top:i.top,left:i.left,width:this.$root.outerWidth(),height:this.$root.outerHeight(),zIndex:this.getStartZIndex(!0),opacity:0}).appendTo(document.body)}this.disabled=!0}},docClick:function(t){if(this.isTouchScrolling){this.isTouchScrolling=!1;return}(this.visibleSubMenus.length&&!n.contains(this.$root[0],t.target)||n(t.target).is("a"))&&this.menuHideAll()},docTouchEnd:function(){if(this.lastTouch){if(this.visibleSubMenus.length&&(this.lastTouch.x2===undefined||this.lastTouch.x1==this.lastTouch.x2)&&(this.lastTouch.y2===undefined||this.lastTouch.y1==this.lastTouch.y2)&&(!this.lastTouch.target||!n.contains(this.$root[0],this.lastTouch.target))){this.hideTimeout&&(clearTimeout(this.hideTimeout),this.hideTimeout=0);var t=this;this.hideTimeout=setTimeout(function(){t.menuHideAll()},350)}this.lastTouch=null}},docTouchMove:function(n){if(this.lastTouch){var t=n.originalEvent.touches[0];this.lastTouch.x2=t.pageX;this.lastTouch.y2=t.pageY}},docTouchStart:function(n){var t=n.originalEvent.touches[0];this.lastTouch={x1:t.pageX,y1:t.pageY,target:t.target}},enable:function(){this.disabled&&(this.$disableOverlay&&(this.$disableOverlay.remove(),this.$disableOverlay=null),this.disabled=!1)},getClosestMenu:function(t){for(var i=n(t).closest("ul");i.dataSM("in-mega");)i=i.parent().closest("ul");return i[0]||null},getHeight:function(n){return this.getOffset(n,!0)},getOffset:function(n,t){var u,i,r;return n.css("display")=="none"&&(u={position:n[0].style.position,visibility:n[0].style.visibility},n.css({position:"absolute",visibility:"hidden"}).show()),i=n[0].getBoundingClientRect&&n[0].getBoundingClientRect(),r=i&&(t?i.height||i.bottom-i.top:i.width||i.right-i.left),r||r===0||(r=t?n[0].offsetHeight:n[0].offsetWidth),u&&n.hide().css(u),r},getStartZIndex:function(n){var t=parseInt(this[n?"$root":"$firstSub"].css("z-index"));return!n&&isNaN(t)&&(t=parseInt(this.$root.css("z-index"))),isNaN(t)?1:t},getTouchPoint:function(n){return n.touches&&n.touches[0]||n.changedTouches&&n.changedTouches[0]||n},getViewport:function(n){var i=n?"Height":"Width",t=document.documentElement["client"+i],r=window["inner"+i];return r&&(t=Math.min(t,r)),t},getViewportHeight:function(){return this.getViewport(!0)},getViewportWidth:function(){return this.getViewport()},getWidth:function(n){return this.getOffset(n)},handleEvents:function(){return!this.disabled&&this.isCSSOn()},handleItemEvents:function(n){return this.handleEvents()&&!this.isLinkInMegaMenu(n)},isCollapsible:function(){return this.$firstSub.css("position")=="static"},isCSSOn:function(){return this.$firstLink.css("display")=="block"},isFixed:function(){var t=this.$root.css("position")=="fixed";return t||this.$root.parentsUntil("body").each(function(){if(n(this).css("position")=="fixed")return t=!0,!1}),t},isLinkInMegaMenu:function(n){return!n.parent().parent().dataSM("level")},isTouchMode:function(){return!i||this.isCollapsible()},itemActivate:function(t){var f=t.parent(),r=f.parent(),i=r.dataSM("level"),e,u;(i>1&&(!this.activatedItems[i-2]||this.activatedItems[i-2][0]!=r.dataSM("parent-a")[0])&&(e=this,n(r.parentsUntil("[data-smartmenus-id]","ul").get().reverse()).add(r).each(function(){e.itemActivate(n(this).dataSM("parent-a"))})),this.visibleSubMenus.length>i&&this.menuHideSubMenus(!this.activatedItems[i-1]||this.activatedItems[i-1][0]!=t[0]?i-1:i),this.activatedItems[i-1]=t,this.visibleSubMenus[i-1]=r,this.$root.triggerHandler("activate.smapi",t[0])!==!1)&&(u=f.dataSM("sub"),u&&(this.isTouchMode()||!this.opts.showOnClick||this.clickActivated)&&this.menuShow(u))},itemBlur:function(t){var i=n(t.currentTarget);this.handleItemEvents(i)&&this.$root.triggerHandler("blur.smapi",i[0])},itemClick:function(t){var i,r;if(this.isTouchScrolling)return this.isTouchScrolling=!1,t.stopPropagation(),!1;if(i=n(t.currentTarget),this.handleItemEvents(i)){if(i.removeDataSM("mousedown"),this.$root.triggerHandler("click.smapi",i[0])===!1)return!1;if(r=i.parent().dataSM("sub"),this.isTouchMode()){if(i.dataSM("href")&&i.attr("href",i.dataSM("href")).removeDataSM("href"),r&&(!r.dataSM("shown-before")||!r.is(":visible"))&&(this.itemActivate(i),r.is(":visible")))return!1}else if(this.opts.showOnClick&&i.parent().parent().dataSM("level")==1&&r)return this.clickActivated=!0,this.menuShow(r),!1;return i.hasClass("disabled")?!1:this.$root.triggerHandler("select.smapi",i[0])===!1?!1:void 0}},itemDown:function(t){var i=n(t.currentTarget);this.handleItemEvents(i)&&i.dataSM("mousedown",!0)},itemEnter:function(t){var i=n(t.currentTarget),r;this.handleItemEvents(i)&&(this.isTouchMode()||(this.showTimeout&&(clearTimeout(this.showTimeout),this.showTimeout=0),r=this,this.showTimeout=setTimeout(function(){r.itemActivate(i)},this.opts.showOnClick&&i.parent().parent().dataSM("level")==1?1:this.opts.showTimeout)),this.$root.triggerHandler("mouseenter.smapi",i[0]))},itemFocus:function(t){var i=n(t.currentTarget);this.handleItemEvents(i)&&(this.isTouchMode()&&i.dataSM("mousedown")||this.activatedItems.length&&this.activatedItems[this.activatedItems.length-1][0]==i[0]||this.itemActivate(i),this.$root.triggerHandler("focus.smapi",i[0]))},itemLeave:function(t){var i=n(t.currentTarget);this.handleItemEvents(i)&&(this.isTouchMode()||(i[0].blur&&i[0].blur(),this.showTimeout&&(clearTimeout(this.showTimeout),this.showTimeout=0)),i.removeDataSM("mousedown"),this.$root.triggerHandler("mouseleave.smapi",i[0]))},itemTouchEnd:function(t){var i=n(t.currentTarget),r;this.handleItemEvents(i)&&(r=i.parent().dataSM("sub"),i.attr("href").charAt(0)==="#"||!r||r.dataSM("shown-before")&&r.is(":visible")||(i.dataSM("href",i.attr("href")),i.attr("href","#")))},menuFixLayout:function(n){n.dataSM("shown-before")||n.hide().dataSM("shown-before",!0)},menuHide:function(n){var t,i;this.$root.triggerHandler("beforehide.smapi",n[0])!==!1&&(n.stop(!0,!0),n.is(":visible")&&(t=function(){n.css("z-index","")},this.isCollapsible()?this.opts.collapsibleHideFunction?this.opts.collapsibleHideFunction.call(this,n,t):n.hide(this.opts.collapsibleHideDuration,t):this.opts.hideFunction?this.opts.hideFunction.call(this,n,t):n.hide(this.opts.hideDuration,t),n.dataSM("ie-shim")&&n.dataSM("ie-shim").remove(),n.dataSM("scroll")&&(this.menuScrollStop(n),n.css({"touch-action":"","-ms-touch-action":""}).unbind(".smartmenus_scroll").removeDataSM("scroll").dataSM("scroll-arrows").hide()),n.dataSM("parent-a").removeClass("highlighted"),i=n.dataSM("level"),this.activatedItems.splice(i-1,1),this.visibleSubMenus.splice(i-1,1),this.$root.triggerHandler("hide.smapi",n[0])),n.css("margin-top",""),n.css("top",""))},menuHideAll:function(){this.showTimeout&&(clearTimeout(this.showTimeout),this.showTimeout=0);this.menuHideSubMenus();this.opts.isPopup&&(this.$root.stop(!0,!0),this.$root.is(":visible")&&(this.opts.hideFunction?this.opts.hideFunction.call(this,this.$root):this.$root.hide(this.opts.hideDuration),this.$root.dataSM("ie-shim")&&this.$root.dataSM("ie-shim").remove()));this.activatedItems=[];this.visibleSubMenus=[];this.clickActivated=!1;this.zIndexInc=0},menuHideSubMenus:function(n){n||(n=0);for(var t=this.visibleSubMenus.length-1;t>n;t--)this.menuHide(this.visibleSubMenus[t])},menuIframeShim:function(t){s&&this.opts.overlapControlsInIE&&!t.dataSM("ie-shim")&&t.dataSM("ie-shim",n("<iframe/>").attr({src:"javascript:0",tabindex:-9}).css({position:"absolute",top:"auto",left:"0",opacity:0,border:"0"}))},menuInit:function(n){if(!n.dataSM("in-mega")){this.subMenus.push(n);n.hasClass("mega-menu")&&n.find("ul").dataSM("in-mega",!0);for(var t=2,i=n[0];(i=i.parentNode.parentNode)!=this.$root[0];)t++;n.dataSM("parent-a",n.prevAll("a").eq(-1)).dataSM("level",t).parent().dataSM("sub",n);this.opts.subIndicators&&n.dataSM("parent-a").addClass("has-submenu")[this.opts.subIndicatorsPos](this.$subArrow.clone())}},menuPosition:function(t){var k=t.dataSM("parent-a"),nt=t.parent().parent(),tt=t.dataSM("level"),e=this.getWidth(t),i=this.getHeight(t),it=k.offset(),ft=it.left,et=it.top,d=this.getWidth(k),y=this.getHeight(k),rt=n(window),w=rt.scrollLeft(),l=rt.scrollTop(),ut=this.getViewportWidth(),a=this.getViewportHeight(),s=nt.hasClass("sm")&&!nt.hasClass("sm-vertical"),v=tt==2?this.opts.mainMenuSubOffsetX:this.opts.subMenusSubOffsetX,b=tt==2?this.opts.mainMenuSubOffsetY:this.opts.subMenusSubOffsetY,u,h,p,c,f,g;s?(u=this.opts.rightToLeftSubMenus?d-e-v:v,h=this.opts.bottomToTopSubMenus?-i-b:y+b):(u=this.opts.rightToLeftSubMenus?v-e:d-v,h=this.opts.bottomToTopSubMenus?y-b-i:b);this.opts.keepInViewport&&!this.isCollapsible()&&(p=ft+u,c=et+h,this.opts.rightToLeftSubMenus&&p<w?u=s?w-p+u:d-v:!this.opts.rightToLeftSubMenus&&p+e>w+ut&&(u=s?w+ut-e-p+u:v-e),s||(i<a&&c+i>l+a?h+=l+a-i-c:(i>=a||c<l)&&(h+=l-c)),(s&&(c+i>l+a+.49||c<l)||!s&&i>a+.49)&&(f=this,t.dataSM("scroll-arrows")||t.dataSM("scroll-arrows",n([n('<span class="scroll-up"><span class="scroll-up-arrow"><\/span><\/span>')[0],n('<span class="scroll-down"><span class="scroll-down-arrow"><\/span><\/span>')[0]]).bind({mouseenter:function(){t.dataSM("scroll").up=n(this).hasClass("scroll-up");f.menuScroll(t)},mouseleave:function(n){f.menuScrollStop(t);f.menuScrollOut(t,n)},"mousewheel DOMMouseScroll":function(n){n.preventDefault()}}).insertAfter(t)),g=".smartmenus_scroll",t.dataSM("scroll",{step:1,itemH:y,subH:i,arrowDownH:this.getHeight(t.dataSM("scroll-arrows").eq(1))}).bind(r([["mouseover",function(n){f.menuScrollOver(t,n)}],["mouseout",function(n){f.menuScrollOut(t,n)}],["mousewheel DOMMouseScroll",function(n){f.menuScrollMousewheel(t,n)}]],g)).dataSM("scroll-arrows").css({top:"auto",left:"0",marginLeft:u+(parseInt(t.css("border-left-width"))||0),width:e-(parseInt(t.css("border-left-width"))||0)-(parseInt(t.css("border-right-width"))||0),zIndex:t.css("z-index")}).eq(s&&this.opts.bottomToTopSubMenus?0:1).show(),this.isFixed()&&t.css({"touch-action":"none","-ms-touch-action":"none"}).bind(r([[o()?"touchstart touchmove touchend":"pointerdown pointermove pointerup MSPointerDown MSPointerMove MSPointerUp",function(n){f.menuScrollTouch(t,n)}]],g))));t.css({top:"auto",left:"0",marginLeft:u,marginTop:h-y});this.menuIframeShim(t);t.dataSM("ie-shim")&&t.dataSM("ie-shim").css({zIndex:t.css("z-index"),width:e,height:i,marginLeft:u,marginTop:h-y})},menuScroll:function(n,t,r){var u=n.dataSM("scroll"),c=n.dataSM("scroll-arrows"),e=parseFloat(n.css("margin-top")),o=u.up?u.upEnd:u.downEnd,f,h,s,l;if(!t&&u.velocity){if(u.velocity*=.9,f=u.velocity,f<.5){this.menuScrollStop(n);return}}else f=r||(t||!this.opts.scrollAccelerate?this.opts.scrollStep:Math.floor(u.step));h=n.dataSM("level");this.visibleSubMenus.length>h&&this.menuHideSubMenus(h-1);s=u.up&&o<=e||!u.up&&o>=e?e:Math.abs(o-e)>f?e+(u.up?f:-f):o;n.add(n.dataSM("ie-shim")).css("margin-top",s);i&&(u.up&&s>u.downEnd||!u.up&&s<u.upEnd)&&c.eq(u.up?1:0).show();s==o?(i&&c.eq(u.up?0:1).hide(),this.menuScrollStop(n)):t||(this.opts.scrollAccelerate&&u.step<this.opts.scrollStep&&(u.step+=.5),l=this,this.scrollTimeout=setTimeout(function(){l.menuScroll(n)},this.opts.scrollInterval))},menuScrollMousewheel:function(n,t){if(this.getClosestMenu(t.target)==n[0]){t=t.originalEvent;var i=(t.wheelDelta||-t.detail)>0;n.dataSM("scroll-arrows").eq(i?0:1).is(":visible")&&(n.dataSM("scroll").up=i,this.menuScroll(n,!0))}t.preventDefault()},menuScrollOut:function(t,r){i&&(/^scroll-(up|down)/.test((r.relatedTarget||"").className)||(t[0]==r.relatedTarget||n.contains(t[0],r.relatedTarget))&&this.getClosestMenu(r.relatedTarget)==t[0]||t.dataSM("scroll-arrows").css("visibility","hidden"))},menuScrollOver:function(n,t){if(i&&!/^scroll-(up|down)/.test(t.target.className)&&this.getClosestMenu(t.target)==n[0]){this.menuScrollRefreshData(n);var r=n.dataSM("scroll");n.dataSM("scroll-arrows").eq(0).css("margin-top",r.upEnd).end().eq(1).css("margin-top",r.downEnd+r.subH-r.arrowDownH).end().css("visibility","visible")}},menuScrollRefreshData:function(t){var i=t.dataSM("scroll"),u=n(window),r=u.scrollTop()-t.dataSM("parent-a").offset().top-i.itemH;n.extend(i,{upEnd:r,downEnd:r+this.getViewportHeight()-i.subH})},menuScrollStop:function(t){if(this.scrollTimeout)return clearTimeout(this.scrollTimeout),this.scrollTimeout=0,n.extend(t.dataSM("scroll"),{step:1,velocity:0}),!0},menuScrollTouch:function(t,i){var u,r,f;i=i.originalEvent;e(i)&&(u=this.getTouchPoint(i),this.getClosestMenu(u.target)==t[0]&&(r=t.dataSM("scroll"),/(start|down)$/i.test(i.type)?(this.menuScrollStop(t)?(i.preventDefault(),this.isTouchScrolling=!0):this.isTouchScrolling=!1,this.menuScrollRefreshData(t),n.extend(r,{touchY:u.pageY,touchTimestamp:i.timeStamp,velocity:0})):/move$/i.test(i.type)?(f=r.touchY,f!==undefined&&f!=u.pageY&&(this.isTouchScrolling=!0,n.extend(r,{up:f<u.pageY,touchY:u.pageY,touchTimestamp:i.timeStamp,velocity:r.velocity+Math.abs(u.pageY-f)*.5}),this.menuScroll(t,!0,Math.abs(r.touchY-f))),i.preventDefault()):r.touchY!==undefined&&(i.timeStamp-r.touchTimestamp<120&&r.velocity>0&&(r.velocity*=.5,this.menuScrollStop(t),this.menuScroll(t),i.preventDefault()),delete r.touchY)))},menuShow:function(n){var i,t;(n.dataSM("beforefirstshowfired")||(n.dataSM("beforefirstshowfired",!0),this.$root.triggerHandler("beforefirstshow.smapi",n[0])!==!1))&&this.$root.triggerHandler("beforeshow.smapi",n[0])!==!1&&(this.menuFixLayout(n),n.stop(!0,!0),n.is(":visible")||(n.css("z-index",this.zIndexInc=(this.zIndexInc||this.getStartZIndex())+1),(this.opts.keepHighlighted||this.isCollapsible())&&n.dataSM("parent-a").addClass("highlighted"),(this.opts.subMenusMinWidth||this.opts.subMenusMaxWidth)&&(n.css({width:"auto",minWidth:"",maxWidth:""}).addClass("sm-nowrap"),this.opts.subMenusMinWidth&&n.css("min-width",this.opts.subMenusMinWidth),this.opts.subMenusMaxWidth&&(i=this.getWidth(n),n.css("max-width",this.opts.subMenusMaxWidth),i>this.getWidth(n)&&n.removeClass("sm-nowrap").css("width",this.opts.subMenusMaxWidth))),this.menuPosition(n),n.dataSM("ie-shim")&&n.dataSM("ie-shim").insertBefore(n),t=function(){n.css("overflow","")},this.isCollapsible()?this.opts.collapsibleShowFunction?this.opts.collapsibleShowFunction.call(this,n,t):n.show(this.opts.collapsibleShowDuration,t):this.opts.showFunction?this.opts.showFunction.call(this,n,t):n.show(this.opts.showDuration,t),this.visibleSubMenus[n.dataSM("level")-1]=n,this.$root.triggerHandler("show.smapi",n[0])))},popupHide:function(n){this.hideTimeout&&(clearTimeout(this.hideTimeout),this.hideTimeout=0);var t=this;this.hideTimeout=setTimeout(function(){t.menuHideAll()},n?1:this.opts.hideTimeout)},popupShow:function(n,t){if(!this.opts.isPopup){alert('SmartMenus jQuery Error:\n\nIf you want to show this menu via the "popupShow" method, set the isPopup:true option.');return}if(this.hideTimeout&&(clearTimeout(this.hideTimeout),this.hideTimeout=0),this.menuFixLayout(this.$root),this.$root.stop(!0,!0),!this.$root.is(":visible")){this.$root.css({left:n,top:t});this.menuIframeShim(this.$root);this.$root.dataSM("ie-shim")&&this.$root.dataSM("ie-shim").css({zIndex:this.$root.css("z-index"),width:this.getWidth(this.$root),height:this.getHeight(this.$root),left:n,top:t}).insertBefore(this.$root);var r=this,i=function(){r.$root.css("overflow","")};this.opts.showFunction?this.opts.showFunction.call(this,this.$root,i):this.$root.show(this.opts.showDuration,i);this.visibleSubMenus[0]=this.$root}},refresh:function(){this.menuHideAll();this.$root.find("ul").each(function(){var t=n(this);t.dataSM("scroll-arrows")&&t.dataSM("scroll-arrows").remove()}).removeDataSM("in-mega").removeDataSM("shown-before").removeDataSM("ie-shim").removeDataSM("scroll-arrows").removeDataSM("parent-a").removeDataSM("level").removeDataSM("beforefirstshowfired");this.$root.find("a.has-submenu").removeClass("has-submenu").parent().removeDataSM("sub");this.opts.subIndicators&&this.$root.find("span.sub-arrow").remove();this.opts.markCurrentItem&&this.$root.find("a.current").removeClass("current");this.subMenus=[];this.init(!0)},rootOut:function(n){if(this.handleEvents()&&!this.isTouchMode()&&n.target!=this.$root[0]&&(this.hideTimeout&&(clearTimeout(this.hideTimeout),this.hideTimeout=0),!this.opts.showOnClick||!this.opts.hideOnClick)){var t=this;this.hideTimeout=setTimeout(function(){t.menuHideAll()},this.opts.hideTimeout)}},rootOver:function(n){this.handleEvents()&&!this.isTouchMode()&&n.target!=this.$root[0]&&this.hideTimeout&&(clearTimeout(this.hideTimeout),this.hideTimeout=0)},winResize:function(n){if(!this.handleEvents()){if(this.$disableOverlay){var t=this.$root.offset();this.$disableOverlay.css({top:t.top,left:t.left,width:this.$root.outerWidth(),height:this.$root.outerHeight()})}return}this.isCollapsible()||"onorientationchange"in window&&n.type!="orientationchange"||(this.activatedItems.length&&this.activatedItems[this.activatedItems.length-1][0].blur(),this.menuHideAll())}}});n.fn.dataSM=function(n,t){return t?this.data(n+"_smartmenus",t):this.data(n+"_smartmenus")};n.fn.removeDataSM=function(n){return this.removeData(n+"_smartmenus")};n.fn.smartmenus=function(t){var i,r,u;return typeof t=="string"?(i=arguments,r=t,Array.prototype.shift.call(i),this.each(function(){var t=n(this).data("smartmenus");t&&t[r]&&t[r].apply(t,i)})):(u=n.extend({},n.fn.smartmenus.defaults,t),this.each(function(){new n.SmartMenus(this,u)}))};n.fn.smartmenus.defaults={isPopup:!1,mainMenuSubOffsetX:0,mainMenuSubOffsetY:0,subMenusSubOffsetX:0,subMenusSubOffsetY:0,subMenusMinWidth:"250px",subMenusMaxWidth:"500px",subIndicators:!0,subIndicatorsPos:"prepend",subIndicatorsText:"+",scrollStep:30,scrollInterval:30,scrollAccelerate:!0,showTimeout:250,hideTimeout:500,showDuration:0,showFunction:null,hideDuration:0,hideFunction:function(n,t){n.fadeOut(200,t)},collapsibleShowDuration:0,collapsibleShowFunction:function(n,t){n.slideDown(200,t)},collapsibleHideDuration:0,collapsibleHideFunction:function(n,t){n.slideUp(200,t)},showOnClick:!1,hideOnClick:!0,keepInViewport:!0,keepHighlighted:!0,markCurrentItem:!1,markCurrentTree:!0,rightToLeftSubMenus:!1,bottomToTopSubMenus:!1,overlapControlsInIE:!0}})(jQuery);
(function (n) { n(function () { n("ul.navbar-nav").each(function () { var t = n(this); t.addClass("sm").smartmenus({ subMenusSubOffsetX: 2, subMenusSubOffsetY: -6, subIndicatorsPos: "append", subIndicatorsText: "...", rightToLeftSubMenus: t.hasClass("navbar-right"), bottomToTopSubMenus: t.closest(".navbar").hasClass("navbar-fixed-bottom") }).find("a.current").parent().addClass("active") }).bind({ "show.smapi": function (t, i) { var r = n(i), u = r.dataSM("scroll-arrows"), f = n(this).data("smartmenus"); u && u.css("background-color", n(document.body).css("background-color")); r.addClass("_effect"); r.parent().addClass("open" + (f.isCollapsible() ? " collapsible" : "")) }, "hide.smapi": function (t, i) { n(i).removeClass("_effect"); n(i).parent().removeClass("open collapsible") }, "click.smapi": function (t, i) { var u = n(this).data("smartmenus"), f, r; if (u.isCollapsible() && (f = n(i), r = f.parent().dataSM("sub"), r && r.dataSM("shown-before") && r.is(":visible"))) return u.itemActivate(f), u.menuHide(r), !1 } }) }); n.SmartMenus.prototype.isCollapsible = function () { return this.$firstLink.parent().css("float") != "left" } })(jQuery);

/*
//# sourceMappingURL=jquery.smartmenus.min.js.map
*/


                            if(typeof(Sys)!=='undefined') Array.add(Sys._ScriptLoader._getLoadedScripts(), 'https://www.sweetbouquet.vn/themes/default/js/system/jquery.smartmenus.min.js'); 
                            if( !window._combinedScripts ) { window._combinedScripts = []; } 
                            window._combinedScripts.push('https://www.sweetbouquet.vn/themes/default/js/system/jquery.smartmenus.min.js');
