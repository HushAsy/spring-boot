<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include  file="/WEB-INF/share/header.jsp"%>
<h2 class="contentTitle">堆区溢出</h2>
<div class="pageContent">

    <div class="pageFormContent" layoutH="97">
        <dl class="nowrap">
            <dt>测试说明：</dt>
            <dd>
                本页面主要测试堆区溢出。
                <ul>
                    <li>1.[本系统]点击[开启压测]</li>
                    <li>2.[本系统]停止压测</li>
                </ul>
            </dd>
        </dl>
        <dl class="nowrap">
            <dt>测试功能：</dt>
            <dd>
                <a target="ajaxTodo" href="${pageContext.request.contextPath}/test/oomHeapStart.json" class="button"><span>开启压测</span></a>
                <%--<button type="submit">开始增删改查</button>--%>
                <a target="ajaxTodo" href="${pageContext.request.contextPath}/test/oomHeapStop.json" class="button"><span>停止压测</span></a>
            </dd>
        </dl>
        <%--<dl class="nowrap">--%>
            <%--<dt>当前状态：</dt>--%>
            <%--<dd>--%>
                <%--<ul>--%>
                    <%--<li>压测开始时间:<%=DateFormatUtils.getDateTimeStr(OomHeapTimer.BEGIN_TIME)%></li>--%>
                    <%--<li>压测总次数：<%=OomHeapTimer.TOTAL.get()%></li>--%>
                    <%--<li>压测错误次数：<%=OomHeapTimer.ERROR.get()%></li>--%>
                <%--</ul>--%>
            <%--</dd>--%>
        <%--</dl>--%>
        <dl class="nowrap">
            <dt>排查步骤：</dt>
            <dd>
                <ul>
                    <li>1.通过jstat命令查看gc情况: jstat -gcutil {pid}</li>
                    <li>2.将堆区信息通过命令:jmap -dump:live,format=b,file=/usr/local/heap.dmp {pid} 导出</li>
                    <li>3.在【实验软件\开发软件】中找到mat.rar，解压到当前文件夹下，运行exe文件。</li>
                    <li>4.将dump下的文件导入mat分析</li>
                </ul>
            </dd>
        </dl>
    </div>
</div>
