<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ include file="../common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>浏览相册</title>
<%
String aid = request.getParameter("aid");
String txtid = request.getParameter("textid");
 %>
<script type="text/javascript" src="<%=contextPath %>/dwr/interface/dwrOACompanyResourcesService.js"></script>
<script type="text/javascript">
//查询方法
	function queryData(){
		startQuery();
		var album = getQueryParam();
		var pager = getPager();
		album.primaryKey = <%=aid%>;
		dwrOACompanyResourcesService.getAlbumListByPager(album,pager,queryCallback);
	}
	
	function queryCallback(data){
		if(data.success == true){
			initGridData(data.resultList,data.pager);
		}else{
			alertmsg(data);
		}
		endQuery();
	}
	function dblCallback(obj){
	}
	function getAlbumId(myfrmname,method){
		if(getOneRecordArray() != false){
			var win = Sys.getfrm();//获取index页面iframe window对象	
		    if(myfrmname!=null&&myfrmname != "undefined" && myfrmname != undefined){
		    	win = win.document.getElementById(myfrmname).contentWindow;	
		    }
		    var textid=win.document.getElementById("<%=txtid%>");
		    textid.value = getOneRecordArray();
		    Sys.close();
		    eval("win."+method);
	   	}else{
			alertmsg("请选择要转入的相册...",null,null,window);
			return;
	   	}
	}
</script>
</head>
<body>
<%
	SysGrid grid = new SysGrid(request,"公司相册");
	grid.setBorder(1);
	grid.setShowView(SysGrid.SHOW_IMAGE);
	
	//放入列
	ArrayList<SysGridColumnBean> colList = UtilTool.getGridColumnList(UtilTool.getColumnShow(this.getServletContext(),"公司相册-管理"));
	//进行高级查询显示处理
	for(int i=0;i<colList.size();i++){
		SysGridColumnBean bc =colList.get(i);
		if("albumType".equalsIgnoreCase(bc.getDataName())){
	SelectType select = new SelectType(UtilTool.getLibraryInfoList(this.getServletContext(),request,"-1,-请选择相册类型-","09"));
	select.setCustomerFunction(new String[]{"onchange=\"queryData();\""});
	bc.setColumnTypeClass(select);
		}
		if("albumTime".equalsIgnoreCase(bc.getDataName())){
	DateType date = new DateType();
	bc.setColumnTypeClass(date);
	
	bc.setColumnStyle("text-align:center");
		}
	}
	grid.setColumnList(colList);
	
	//设置图片显示信息
	grid.setImgShowUrl("oaPhoto.imageId");//显示img的属性字段，没有填写-1
	grid.setImgShowText("albumName");
	grid.setImgheight("64");//不设置为自动
	grid.setImgShowTextLen(15);//显示文本的最大长度,不设置为8个字符
	//设置附加信息
	grid.setQueryFunction("queryData");	//查询的方法名
	grid.setDblFunction("dblCallback");	//双击列的方法名，又返回值，为列对象
	grid.setDblBundle("primaryKey");	//双击列的绑定的列值
	
	//开始创建
	out.print(grid.createTable());
%>	
</body>
</html>