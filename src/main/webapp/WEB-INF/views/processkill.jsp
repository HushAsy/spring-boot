<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include  file="/WEB-INF/share/header.jsp"%>
<h2 class="contentTitle">java进程退出</h2>
<div class="pageContent">

    <div class="pageFormContent" layoutH="97">
        <dl class="nowrap">
            <dt>测试说明：</dt>
            <dd>
                本页面主要是测试java进程异常退出。
                <ul>
                    <li>jvm参数配置</li>
                    <li>为达到测试效果，jvm参数请按照如下规则配置：栈区和持久代正常设置，调大堆区大小，使三者之和接近linux内存大小。</li>
                    <li>查看linux内存大小，可使用命令:free -m。</li>
                    <li>其它测试请将堆区内存调小，为linux系统预留足够的空间(一般为1G左右)。</li>
                    <li>在tomcat的bin目录下创建setenv.sh脚本文件:vim setenv.sh</li>
                    <li>添加如下命令行(参数值仅做参考): JAVA_OPTS="-Xms512m -Xmx1024m -XX:PermSize=64m -XX:MaxPermSize=128m -Xss:128k" 注:Xms:堆区初始化大小，Xmx最大堆大小，PermSize:持久代初始值，MaxPermSize：持久代最大值,Xss:线程堆栈大小</li>
                    <li>每次设置完成后，重启tomcat生效</li>
                    <li>1.[本系统]点击[开启压测]</li>
                    <li>2.[本系统]停止压测</li>
                </ul>
            </dd>
        </dl>
        <dl class="nowrap">
            <dt>测试功能：</dt>
            <dd>
                <a target="ajaxTodo" href="${pageContext.request.contextPath}/test/processkillStart.json" class="button"><span>开启压测</span></a>
                <a target="ajaxTodo" href="${pageContext.request.contextPath}/test/processkillStop.json" class="button"><span>停止压测</span></a>
            </dd>
        </dl>
        <%--<dl class="nowrap">--%>
        <%--<dt>当前状态：</dt>--%>
        <%--<dd>--%>
        <%--<ul>--%>
        <%--<li>压测开始时间:<%=DateFormatUtils.getDateTimeStr(OomStackTimer.BEGIN_TIME)%></li>--%>
        <%--<li>压测总次数：<%=OomStackTimer.TOTAL.get()%></li>--%>
        <%--<li>压测错误次数：<%=OomStackTimer.ERROR.get()%></li>--%>
        <%--</ul>--%>
        <%--</dd>--%>
        <%--</dl>--%>
        <div class="divider"></div>
        <dl class="nowrap">
            <dt>排查步骤：</dt>
            <dd>
                <ul>
                    <li>具体表现:java进程被系统杀掉</li>
                    <li>检查相关的日志文件切换到/var/log目录下查看messages，使用grep kill messages命令查看是否有类似的 Out of memory: Kill process 信息</li>
                    <li>检查jvm参数，设置的堆区，栈区，永久代等内存之和是否超过系统能给出的最大值，若超出，则在tomcat的bin目录下脚本setenv.sh重新设置适当的参数值(具体可参照上方测试说明)</li>
                </ul>
            </dd>
        </dl>
    </div>
</div>
