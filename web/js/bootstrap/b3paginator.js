/**
 * @description bootstrap paginator扩展添加了每页显示条数<br>
 * 用法：
 * $(".page-list").b3paginatorext({
    	onPageSizeChange:function(){getAllUsersOfUserGroup();},
    	pagesizeinput:"#pageSize",
    	pagesize:data['pageSize']});
    	
    	$(".page-list")是存放的对象容器
    	三个必须参数为 {
    	onPageSizeChange：切换页大小回调函数，
    	pagesizeinput：表单里面要存放每页显示条数的
    	pagesize：初始页大小，切换后跟着变 }
 * @author Chan Lewis
 * @version 1.0
 * @date 2015-03-28
 * 
 */
!function ($) {
	"use strict"; // jshint ;_;
	
	var B3PaginatorExt = function(el, options) {
		this.options = options;
		this.$el = $(el);
		this.init(el, options);
	};

	B3PaginatorExt.prototype.init = function(el, options) {
		
		this.options = $.extend({},$.fn.b3paginatorext.defaults, options);
		var $pageList,
			that = this,
			pageNumber = [
				this.options.textbefore,
				' <span class="btn-group dropup">',
				'<button data-toggle="dropdown" class="btn btn-default  dropdown-toggle" type="button">',
				'<span class="page-size">', this.options.pagesize,
				'</span><span class="caret"></span></button>',
				'<ul role="menu" class="dropdown-menu">'], 
			pageList = this.options.pagelist;
					
		$.each(pageList, function(i, page) {
			var active;
			active = page == that.options.pagesize ? 'active' : '';
			pageNumber.push('<li class="' + active + '"><a href="javascript:void(0)">' + page + '</a></li>');
		});

		pageNumber.push('</ul></span>');
		if(this.options.totcount != null && this.options.totcount != "" && this.options.totcount > 0 ){
			pageNumber.push(' / ');
			pageNumber.push(this.options.totcount);
		}
		pageNumber.push(" " + this.options.textafter);

		this.$el.html(pageNumber.join(''));

		$pageList = this.$el.find('li a');
		$pageList.off('click').on('click', $.proxy(this.onPageListChange, this));
	};

	B3PaginatorExt.prototype.onPageListChange = function(event) {
		var $this = $(event.currentTarget);
		$this.parent().addClass('active').siblings().removeClass('active');
		//XXX 必须传入pagesize 而且每次都重新刷新了一下
		this.options.pagesize = $this.text().replace(/ /g, '');
		this.$el.find('.page-size').text(this.options.pagesize);
		
		var $pagesize = $(this.options.pagesizeinput);
		if ($pagesize) $pagesize.val(this.options.pagesize);

		if (this.options.onPageSizeChange) {
			$.fn.b3paginatorext.helpers.call(this.options.onPageSizeChange);
		}
	};
	
	$.fn.b3paginatorext = function (option){
		var result = null;
		
		//XXX 理论上this应该只有一个对象
        $(this).each(function (index, item) {
            var $this = $(item),
                data = $this.data('b3paginatorext'),
                options = (typeof option !== 'object') ? null : option;
				/*if (!data) {
					$this.data('b3paginatorext', (data = new B3PaginatorExt($this, options)));
	            }*/
				 
				try{
					//data = new B3PaginatorExt($this, options);
					$this.data('b3paginatorext', (data = new B3PaginatorExt($this, options)));
				}catch(e){
					//console.info(e);
				}
                result = data;
        });

        return result;
	};
	
	$.fn.b3paginatorext.Constructor = B3PaginatorExt;

	$.fn.b3paginatorext.defaults = {
		textbefore : "&#x6BCF;&#x9875;",//"&#x6BCF;&#x9875;&#x663E;&#x793A;",
		textafter : "&#x6761;&#x8BB0;&#x5F55;",
		pagesize : 5,
		pagelist : [5, 10, 25, 50, 100],
		pagesizeinput : "input[type='hidden'][name$='pageSize']",
		onPageSizeChange : null,
		totcount : 0
	};

	$.fn.b3paginatorext.helpers = {
		/**
		 * Execute a callback function
		 * 
		 * @param {String|Function}
		 *            functionName Can be - name of global function - name of
		 *            namespace function (such as A.B.C) - a function
		 * @param {Array}
		 *            args The callback arguments
		 */
		call : function(functionName, args) {
			if ('function' === typeof functionName) {
				return functionName.apply(this, args);
			} else if ('string' === typeof functionName) {
				if ('()' === functionName.substring(functionName.length - 2)) {
					functionName = functionName.substring(0,functionName.length - 2);
				}
				var ns = functionName.split('.'), func = ns.pop(), context = window;
				for (var i = 0; i < ns.length; i++) {
					context = context[ns[i]];
				}

				return (typeof context[func] === 'undefined') ? null : context[func].apply(this, args);
			}
		}
	};

}(jQuery);

function b3Paginator(pid, disPages, curPage, pageSize, totPage, onClickFun, pageUrlFun){
	var element = $('#'+pid);
    var options = {
        bootstrapMajorVersion:3,
        currentPage: curPage,
        numberOfPages: pageSize,
        totalPages: totPage,
        numberOfPages: disPages,
        pageUrl: pageUrlFun,
        onPageClicked: onClickFun,
        itemTexts: function (type, page, current) {
            switch (type) {
            case "first":
                return "<<";
            case "prev":
                return "<";
            case "next":
                return ">";
            case "last":
                return ">>";
            case "page":
                return page;
            }
        },
        tooltipTitles: function (type, page, current) {
            switch (type) {
            case "first":
                return "转到首页";
            case "prev":
                return "转到上一页";
            case "next":
                return "转到下一页";
            case "last":
                return "转到尾页";
            case "page":
                return (page === current) ? "当前面 " + page : "转到页 " + page;
            }
        }
    };
    element.bootstrapPaginator(options);
}