<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.alibaba.edas.testcase.timer.*,com.alibaba.edas.testcase.common.*" %>
<%@ include  file="/WEB-INF/share/header.jsp"%>
<h2 class="contentTitle">cpu iowait高</h2>
<div class="pageContent">

    <div class="pageFormContent" layoutH="97">
        <dl class="nowrap">
            <dt>测试说明：</dt>
            <dd>
                本页面主要是测试iowait高。
                <ul>
                    <li>jvm参数配置</li>
                    <li>1.[本系统]点击[开启压测]</li>
                    <li>2.[本系统]停止压测</li>
                </ul>
            </dd>
        </dl>
        <dl class="nowrap">
            <dt>测试功能：</dt>
            <dd>
                <a target="ajaxTodo" href="${pageContext.request.contextPath}/test/cpuIoWaitStart.json" class="button"><span>开启压测</span></a>
                <a target="ajaxTodo" href="${pageContext.request.contextPath}/test/cpuIoWaitStop.json" class="button"><span>停止压测</span></a>
            </dd>
        </dl>

        <div class="divider"></div>
        <dl class="nowrap">
            <dt>排查步骤：</dt>
            <dd>
                <ul>
                    <li>1.通过iotop命令，可以查看磁盘的读写，并且可以查看到IO使用比较大的一些线程的具体信息。</li>
                    <li>2.将占用IO较高的线程的TID，转化为16线程nid:printf '0x%x\n' {tid}</li>
                    <li>3.在线程的信息中可以获得进程的名称COMMAND</li>
                    <li>4.通过进程名获得pid:ps -ef | grep {name}</li>
                    <li>5.通过jstack -l {pid} > {pid}.stack ，在输出到文件中的栈信息中找出步骤2获得的线程nid对应的线程信息，分析该线程信息。</li>
                </ul>
            </dd>
        </dl>
    </div>
</div>
