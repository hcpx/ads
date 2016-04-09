package com.edu.ads.common.page;

/**
 * 页面定义
 * @author wjc
 *
 */
public class Page {

	
	private int currentPage=1;
	
	private int pageLength = 2;

	private int startIndex;
	
	private int endIndex;

	
	public Page(int currentPage, int pageLength){
		super();
		this.currentPage = currentPage;
		this.pageLength = pageLength;
		this.startIndex = (currentPage-1)*pageLength;
		this.endIndex = this.startIndex+pageLength;
	}
	
	public Page(int currentPage, int pageLength, int startIndex, int endIndex) {
		super();
		this.currentPage = currentPage;
		this.pageLength = pageLength;
		this.startIndex = startIndex;
		this.endIndex = endIndex;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPageLength() {
		return pageLength;
	}

	public void setPageLength(int pageLength) {
		this.pageLength = pageLength;
	}

	public int getStartIndex() {
		return startIndex;
	}

	public void setStartIndex(int startIndex) {
		this.startIndex = startIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}
	
	
}
