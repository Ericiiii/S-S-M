$(function() {

	/**
	 * 初始化加载系统日期、周、时间
	 */
	window.startTimer = function() {
		var date = new Date();
		var message = "欢迎您登录系统！&nbsp;现在时间&nbsp;";
		message += date.getFullYear() + "年" + (date.getMonth() + 1) + "月" + date.getDate() + "日 ";
		message += ((date.getHours() < 10) ? "0" : "") + date.getHours() + ":";
		message += ((date.getMinutes() < 10) ? "0" : "") + date.getMinutes() + ":";
		message += ((date.getSeconds() < 10) ? "0" : "") + date.getSeconds() + " ";
		var weekday = [ "星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六" ];
		message += weekday[date.getDay()] + " ";
		$("#show-timer").html(message);
	};
	// 获取当前系统时间与星期信息.
	window.setInterval("window.startTimer()", 100);

	/**
	 * 显示系统菜单信息.
	 */
	$("#main-nav li a.nav-top-item").click(function() {
		// Slide up all sub menus except the one clicked
		$(this).parent().siblings().find("ul").slideUp("normal");
		// Slide down the clicked sub menu
		$(this).next().slideToggle("normal");
		// Just open the link instead of a sub menu
		window.location.href = (this.href);
		return false;
	});
	
	// 当光标放上菜单向左移动:
	$("#main-nav li .nav-top-item").hover(function() {
		$(this).stop().animate({
			paddingRight : "25px"
		}, 200);
	}, function() {
		$(this).stop().animate({
			paddingRight : "15px"
		});
	});
	
	/**
	 * 获取当前访问的地址栏进行解析,解析地址栏访问的路径.
	 */
	window.parseLocation = function(url) {
		var val, menu, submenu, pos = url.lastIndexOf("\/");
		// 获取地址栏中的请求路径,查找到匹配的二级菜单.
		val = url.substring(pos, url.length);
		if (val.length <= 1) {
			// 如果val长度小于或等于1，默认为首页.
			menu = $("a[title='home']");
			$(menu).next().slideToggle("normal");
			$(menu).addClass("current");
		} else {
			// 先获取二级子菜单，再通过二级子菜单选中样式.
			submenu = $("a[href*='" + val + "']");
			$(submenu).addClass("current");
			$(submenu).next().slideToggle("normal");
			// 通过二级菜单查找，选中一级菜单,设置背景为白色.
			menu = $("a[title='" + submenu.attr("name") + "']");
			$(menu).next().slideToggle("normal");
			$(menu).addClass("current");
		}
	}(window.location.href);

	/**
	 * 切放内容面板之上的表单信息.
	 */
	// Hide the content divs
	$('.content-box .content-box-content div.tab-content').hide();
	// Add the class "current" to the default tab
	$('ul.content-box-tabs li a.default-tab').addClass('current');
	// Show the div with class "default-tab"
	$('.content-box-content div.default-tab').show();
	$('.content-box ul.content-box-tabs li a').click(function() {
		// Remove "current" class from all tabs
		$(this).parent().siblings().find("a").removeClass('current');
		// Add class "current" to clicked tab
		$(this).addClass('current');
		// Set variable "currentTab" to the value of href of clicked tab
		var currentTab = $(this).attr('href');
		// Hide all content divs
		$(currentTab).siblings().hide();
		// Show the content div with the id equal to the id of clicked tab
		$(currentTab).show();
		return false;
	});

	/**
	 * 当单击样式为close按钮之后删除按钮.
	 */
	$(".close").click(function() {
		// Links with the class "close" will close parent
		$(this).parent().fadeTo(400, 0, function() {
			$(this).slideUp(400);
		});
		return false;
	});

});