<%@ page pageEncoding="UTF-8" language="java"%>
<%@page import="org.springframework.web.context.WebApplicationContext"%>
<%@page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%@page import="java.util.List"%>
<%@page import="com.pinhuba.web.controller.dwr.DwrSysProcessService"%>
<%@page import="com.pinhuba.core.pojo.SysLibraryInfo"%>
<%@page import="com.pinhuba.common.util.UtilTool"%>
<%
response.setHeader("Cache-Control","no-cache"); 
response.setHeader("Pragma","no-cache"); 
response.setDateHeader("Expires",0);
String upcode = request.getParameter("upcode");
if(upcode == null||upcode.length()==0){
	return;
}else{
	WebApplicationContext webAppContext = WebApplicationContextUtils.getWebApplicationContext(this.getServletContext());
	DwrSysProcessService sysService = (DwrSysProcessService)webAppContext.getBean("dwrSysProcessService");
	SysLibraryInfo info = new SysLibraryInfo();
	info.setLibraryInfoUpcode(upcode);
	List<SysLibraryInfo> libraylist = sysService.getSysLibraryInfoListBytree(request,info);
	if(libraylist!=null&& libraylist.size()>0){
		StringBuffer sb = new StringBuffer();
		sb.append("<?xml version=\"1.0\" encoding=\"utf-8\"?>\n");
		sb.append("<tree>\n");
		for(int i=0;i<libraylist.size();i++){
			SysLibraryInfo lbr = libraylist.get(i);
			//输出树节点
			sb.append("<tree type='radio' id =\""+lbr.getPrimaryKey()+"\" text=\""+lbr.getLibraryInfoName()+"\" value=\""+lbr.getLibraryInfoCode()+"\"/>\n");
		}
		sb.append("</tree>");
		UtilTool.writeTextXml(response,sb.toString());
	}
}
%>
