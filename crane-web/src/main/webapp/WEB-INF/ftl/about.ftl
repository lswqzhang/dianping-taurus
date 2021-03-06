<!DOCTYPE html >
<html >
<head>
	
	<title>Taurus</title>
	<#include "segment/html_header.ftl">
	<#include "segment/html_header2.ftl">
	<link href="${rc.contextPath}/css/docs.css" rel="stylesheet">
</head>
<body>
<#include "segment/header.ftl">
<#include "segment/left.ftl">

<div class="main-content ">
<div class="breadcrumbs" id="breadcrumbs">
    <script type="text/javascript">
        try {
            ace.settings.check('breadcrumbs', 'fixed')
        } catch (e) {
        }
    </script>
    <ul class="breadcrumb">
        <li>
            <i class="icon-home home-icon"></i>
            <a href="${rc.contextPath}/index">HOME</a>
        </li>
        <li class="active">
            <a href="${rc.contextPath}/about">使用帮助</a>
        </li>
    </ul>
</div>

<div class="page-content ">
<div class="row">
<div class="col-sm-12">
    <ul class="nav nav-tabs ">
        <li><a href="#q1"><i class="icon-chevron-down"></i>
            taurus能干什么？</a></li>
        <li><a href="#q2"><i class="icon-chevron-down"></i>
            创建一个普通任务？</a></li>
        <#--<li><a href="#q3"><i class="icon-chevron-down"></i>-->
            <#--创建一个hadoop任务？</a></li>-->
        <li><a href="#q3"><i class="icon-chevron-down"></i>
            创建一个一次性脚本？</a></li>
        <li><a href="#config"><i
                class="icon-chevron-down"></i> 配置</a></li>
        <li><a href="#status"><i class="icon-chevron-down"></i>
            状态</a></li>
        <li><a href="#crontab"><i class="icon-chevron-down"></i>
            定时器</a></li>
        <li><a href="#apijob"><i class="icon-chevron-down"></i>
            API调用</a></li>
        <li><a href="#agent"><i class="icon-chevron-down"></i>
            安装agent</a></li>
    </ul>
</div>
<br>

<div class="col-sm-12 padding-14">
<section id="new">
    <div class="page-header">

        <h1>入门导引</h1>
    </div>
    <div id="login">
        <h3>一、Login</h3>
        <hr style="padding:15px 0px">
        <h4>Taurus 各环境入口</h4>
        <ul>
            <li>
                <a href="http://alpha.taurus.dp:8080/">Alpha 环境:alpha.taurus.dp/</a>
            </li>
            <li>
                <a href="http://beta.taurus.dp/">Beta 环境:beta.taurus.dp/</a>
            </li>
            <li>
                <a href="http://ppe.taurus.dp/">PPE环境:ppe.taurus.dp/</a>
            </li>
            <li>
                <a href="http://taurus.dp/">线上环境:taurus.dp/</a>
            </li>

        </ul>
        <h4>Taurus 登陆</h4>
        Taurus 登陆采用域账户登录，如下图所示：
        <img src="${rc.contextPath}/img/login.png" style="width: 800px;height: 500px"/>
    </div>
    <div id="dashboad">
        <h3>二、导航栏</h3>
        <hr style="padding:15px 0px">
        新版Taurus Web 导航栏改到左侧栏，各功能说明如下表：
        <table class="table table-striped table-bordered table-condensed">
            <tr>
                <th align="left" width="12%">导航项</th>
                <th align="left" width="88%">说明</th>
            </tr>
            <tr>
                <td align="left">监控中心</td>
                <td align="left">查看当前taurus job机器状态，负载情况，任务执行情况；
                </td>
            </tr>
            <tr>
                <td align="left">新建任务</td>
                <td align="left">创建新的任务，在创建任务时执行身份必须为nobody
                </td>
            </tr>
            <tr>
                <td align="left">调度中心</td>
                <td align="left">对自己的任务进行【删除】、【暂停】、【执行】、【修改】操作，查看调度历史及7天内日志
                </td>
            </tr>
            <tr>
                <td align="left">任务监控</td>
                <td align="left">主要是监控当前taurus 任务状态：【RUNNING】、【FAILED】、【SUBMIT FAILED】、【DEPENDENCY_TIMEOUT】、【TIMEOUT】
                </td>
            </tr>
            <tr>
                <td align="left">主机监控</td>
                <td align="left">对job机器的状态，日志，任务进行详细的监控
                </td>
            </tr>
            <tr>
                <td align="left">用户设置</td>
                <td align="left">设置用户组,E-mail,手机号
                </td>
            </tr>
            <tr>
                <td align="left">更新日志</td>
                <td align="left">Taurus 升级新特性日志说明
                </td>
            </tr>
            <tr>
                <td align="left">使用帮助</td>
                <td align="left">你所在的页面，帮助你更好的使用taurus
                </td>
            </tr>
        </table>
    </div>
    <br>

    <div id="qa">
        <h3>Q&A</h3>
        <hr style="padding:15px 0px">
        <div id="q1">
            <h4><font color="#a52a2a">Q1.我能用taurus干什么？</font></h4>

            <h4>答：</h4><br>

            <div class="well">
                <font color="#5f9ea0">taurus可以帮你创建定时任务，按照crontab表达式来调度你的任务。<br>
                    你可以使用taurus做以下事情：
                    <br>
                    &nbsp;&nbsp;&nbsp;
                    <ul>
                        <li>
                            创建crontab表达式任务，任务类型default，请用ci上传job
                        </li>
                        <li>
                            创建hadoop任务，在创建时任务类型选择default，使用HadoopRun方式进行认证，详见<a href="http://wiki.sankuai.com/pages/viewpage.action?pageId=484271776">hadoop认证</a>
                        </li>
                        <li>
                            执行一次性脚本，一般是用了初始化任务环境，比如创建任务需要的目录，文件，等等。在ci上传脚本，在taurus上设置命令选择执行任务，执行完成后，回到调度中心，删除该任务。
                        </li>
                        <li>
                            还有更多等待你去挖掘。。。
                        </li>
                    </ul>
                </font>
            </div>
        </div>
        <br><br><br><br>

        <div id="q2">
            <h4><font color="#a52a2a">Q2.我要创建一个普通任务，怎么操作？</font></h4>
            <h4>答：</h4><br>

            <div class="well">
                <font color="#5f9ea0">taurus是和ci一起使用的，你需要在[code.dianpingoa.com]上你的项目点ci 如下图<br>
                    <img src="${rc.contextPath}/img/citask.png" style="width: 950px;height: 580px"/>
                    <br>
                    <br>
                    <br>
                    job发布到job机器后配置，跳转到taurus.dp上来,如下图：
                    <br>
                    <br>
                    <img src="${rc.contextPath}/img/task1.png" style="width: 950px;height: 400px"/>
                    <br>
                    <br>
                    点击【下一步】后进行相关设置，注意按照自己任务需求，填写crontab表达式和命令，如下图所示：
                    <br>
                    <br>
                    <img src="${rc.contextPath}/img/task2.png" style="width: 980px;height: 450px"/>
                    <br><br>
                    这时你可以选择直接提交，或者点击下一步进行可选项设置，如下图：
                    <br><br>
                    <img src="${rc.contextPath}/img/task3.png" style="width: 980px;height: 550px"/>
                    <br><br>
                    设置完毕后，点击提交。此时任务就创建完毕，taurus会按照你设置的crontab对你的任务进行调度执行。
                </font>
            </div>
        </div>
        <br><br><br><br>

        <#--<div id="q3">-->
            <#--<h4><font color="#a52a2a">Q3.我要创建一个Hadoop任务，怎么操作？</font></h4>-->
            <#--<h4>答：</h4><br>-->

            <#--<div class="well">-->
                <#--<font color="#5f9ea0">taurus是和ci一起使用的，你需要在[code.dianpingoa.com]上你的项目点ci 如下图<br>-->
                    <#--<img src="${rc.contextPath}/img/citask.png" style="width: 950px;height: 580px"/>-->
                    <#--<br>-->
                    <#--<br>-->
                    <#--<br>-->
                    <#--job发布到job机器后配置，跳转到taurus.dp上来,注意作业类型选择[hadoop],并且保证keytab文件已经上传到job机器的/data/home/hadoop用户名/.keytab上。如下图：-->
                    <#--<br>-->
                    <#--<br>-->
                    <#--<img src="${rc.contextPath}/img/task4.png" style="width: 950px;height: 420px"/>-->
                    <#--<br>-->
                    <#--<br>-->
                    <#--点击【下一步】后进行相关设置，注意按照自己任务需求，填写crontab表达式和命令;执行身份如无特别要求请填nobody,如果有特别需求请联系运维，如下图所示：-->
                    <#--<br>-->
                    <#--<br>-->
                    <#--<img src="${rc.contextPath}/img/task5.png" style="width: 980px;height: 450px"/>-->
                    <#--<br><br>-->
                    <#--这时你可以选择直接提交，或者点击下一步进行可选项设置，如下图：-->
                    <#--<br><br>-->
                    <#--<img src="${rc.contextPath}/img/task3.png" style="width: 980px;height: 550px"/>-->
                    <#--<br><br>-->
                    <#--设置完毕后，点击提交。此时任务就创建完毕，taurus会按照你设置的crontab对你的任务进行调度执行。-->
                <#--</font>-->
            <#--</div>-->
        <#--</div>-->
        <div id="q3">
            <h4><font color="#a52a2a">Q3.我要创建一个一次性脚本，怎么操作？</font></h4>
            <h4>答：</h4><br>

            <div class="well">
                <font color="#5f9ea0">脚本程序确保你的项目有以下文件zipfile.json 如下图<br>
                    <img src="${rc.contextPath}/img/zipfile.jpg" style="width: 800px;height: 340px"/>
                    <br>
                    <font color="#5f9ea0">php程序确保你的项目有以下文件config.json 如下图<br>
                        <img src="${rc.contextPath}/img/config.png" style="width: 800px;height: 340px"/>
                    <br>
                    剩余操作和Q1相同，如有疑问请联系运维。
                </font>
            </div>
        </div>
    </div>
</section>
<br><br><br><br><br><br><br><br>
<section id="config">
    <div class="page-header">
        <h1>配置说明</h1>
    </div>
    <div id="content">

        <table class="table table-striped table-bordered table-condensed">
            <tr>
                <th align="left" width="12%">配置项</th>
                <th align="left" width="88%">说明</th>
            </tr>
            <tr>
                <td align="left">作业类型</td>
                <td align="left">hadoop:
                    需要访问hadoop的作业。这种类型的作业，taurus会管理作业的hadoop ticket的申请和销毁。<br/>
                    spring: 在spring容器中运行的作业，较特殊，一般用不到。<br/> default:
                    上述两种类型以外所有类型。
                </td>
            </tr>
            <tr>
                <td align="left">hadoop用户名</td>
                <td align="left">hadoop类型的作业，需要提供一个用于访问hadoop的principle
                    name。<br/>
                    为此，taurus需要读取这个principle的keytab文件，一般情况下这个keytab已经放到相应的目录。<br/>
                    如果你不确定这一点，请联系我们。
                </td>
            </tr>
            <tr>
                <td align="left">作业最长执行时间</td>
                <td align="left">作业正常情况下预计最长的执行时间，超过这个时间，作业的状态会变为TIMEOUT，但是仍然会继续执行。<br/>
                    有相应告警设置的作业人会收到报警。
                </td>
            </tr>
            <tr>
                <td align="left">自动kill执行超时实例</td>
                <td align="left">系统中同一个作业在同一时间只能有一个实例执行。因此当有实例执行超时时，后续的实例是无法执行的。<br/>
                    选择是，如果有实例执行超时了，并且已经有新的实例在等待执行，那么系统将自动将这个Timeout的实例杀死。
                </td>
            </tr>
            <tr>
                <td align="left">作业依赖</td>
                <td align="left">用于配置依赖的作业，形式为依赖表达式：[作业名][作业的倒数第几次执行][作业返回值]。<br/>
                    比如：[A][1][0]表示当前作业在被触发的时间点上，依赖作业名为A的作业的前一次执行，并且这一次返回值为0。<br/>
                    可以用&或者|来连接依赖表达式，例如：[A][1][0] & [B][1][0] & [C][1][0]。
                </td>
            </tr>
            <tr>
                <td align="left">依赖最长等待时间</td>
                <td align="left">与依赖联合起来使用，表示对依赖的作业最长的等待时间。<br/>
                    超过这个时间，作业的状态变为DEPENDENCY_TIMEOUT，相关人员会收到报警。<br/>
                    但是作业会继续等待，一旦依赖的作业完成，该作业会立即执行。<br/> 对于没有依赖的作业，该选项无效。
                </td>
            </tr>
            <tr>
                <td align="left">作业失败重试次数</td>
                <td align="left">作业在执行失败的情况下，重新执行的次数。<br/> 默认为0，表示不重试。
                </td>
            </tr>
            <tr>
                <td align="left">丢弃拥塞实例</td>
                <td align="left">当任务发生拥塞时，后续的任务将被忽略，不予执行。<br/>
                    选择是，如果有任务实例发生拥塞了，后续的实例不再执行调度。直到拥塞任务停止。
                </td>
            </tr>
            <tr>
                <td align="left">上次未执行完不启动新任务</td>
                <td align="left">在丢弃拥塞实例为否的前提下，如果上次未执行完不启动新任务设置为是，那么任务实例不会被丢弃，会等待上次任务结束后开始调度；如果如果上次未执行完不启动新任务设置为否，则多个调度实例会同时调度。
                </td>
            </tr>
            <tr>
                <td align="left">组名</td>
                <td align="left">你所属的组的名字。<br/>
                    如果提示中没有合适的选项，你可以填写一个合适的组名，这个组名请尽可能地细化。<br/>
                    这个选项的重要性在于，你可以在作业的通知选项中，选择通知一个组的人。<br/> 并且你可以看到并操作同组人员的作业。
                </td>
            </tr>
        </table>
    </div>
    <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
    <br/>
</section>
<section id="status">
    <div class="page-header">
        <h1>状态说明</h1>
    </div>
    <table class="table table-striped table-bordered table-condensed">
        <tr>
            <th align="left">状态名</th>
            <th align="left">解释</th>
        </tr>
        <tr>
            <td align="left">RUNNING</td>
            <td align="left">这个实例正在运行</td>
        </tr>
        <tr>
            <td align="left">DEPENDENCY_PASS</td>
            <td align="left">这个实例等待被调度运行</td>
        </tr>
        <tr>
            <td align="left">DEPENDENCY_TIMEOUT</td>
            <td align="left">实例等待被调度超时，但它依然可被调度。只要当它依赖的作业完成，或者它的前一次实例完成，即可被调度执行</td>
        </tr>
        <tr>
            <td align="left">SUCCEEDED</td>
            <td align="left">这个实例已经成功执行</td>
        </tr>
        <tr>
            <td align="left">FAILED</td>
            <td align="left">这个实例因为返回值不为0而被系统认为执行失败</td>
        </tr>
        <tr>
            <td align="left">KILLED</td>
            <td align="left">这个实例被杀死</td>
        </tr>
        <tr>
            <td align="left">TIMEOUT</td>
            <td align="left">当运行的实例执行时间超过配置的最大执行时间时，将被认为超时，但这个实例依然继续运行</td>
        </tr>
    </table>
    <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
    <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
    <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>
    <br/>
</section>

<section id="crontab">
<div class="page-header">
    <h1>Crontab表达式</h1>
</div>
<h4>
    Taurus的crontab表达式使用的是Quartz的格式。<span style="color: red">特别注意的是，如果指定小时级别的范围，一定要首先指定分钟域，分钟域不能为*
    如：* * 0/1 * * ? 这个不是每小时执行，而是每分钟，因为分钟域没指定，默认为秒域</span><br/>
</h4>
<h4>以下是Taurus表达式的规范文档:</h4>

<p>
    Taurus(Quartz) cron 表达式的格式十分类似于 UNIX cron 格式，但还是有少许明显的区别。区别之一就是 Taurus(Quartz)
    的格式向下支持到秒级别的计划，而 UNIX cron 计划仅支持至分钟级。<br> 在 UNIX cron
    里，要执行的作业（或者说命令）是存放在 cron 表达式中的，在第六个域位置上。Taurus(Quartz) 用 cron
    表达式存放执行计划。引用了 cron 表达式的<span style="color: #800080">CronTrigger</span>
    在计划的时间里会与 job 关联上。<br> 另一个与 UNIX cron
    表达式的不同点是在表达式中支持域的数目。UNIX 给出五个域(<span style="color: #800080">分、时、日、月和周</span>)，Taurus(Quartz)
    提供七个域。表 5.1 列出了 Taurus(Quartz)  cron 表达式支持的七个域。<br>
</p>
<table border="0" width="650">
    <caption>
        <strong>表 5.1. Taurus(Quartz) Cron 表达式支持到七个域</strong>
    </caption>
    <caption></caption>
    <tbody>
    <tr>
        <td><strong>名称</strong></td>
        <td><strong>是否必须</strong></td>
        <td><strong>允许值</strong></td>
        <td><strong><span style="color: #800080">特殊字符</span></strong></td>
    </tr>
    <tr>
        <td>秒</td>
        <td>是</td>
        <td>0-59</td>
        <td><span style="color: #800080">, - * /</span></td>
    </tr>
    <tr>
        <td>分</td>
        <td>是</td>
        <td>0-59</td>
        <td><span style="color: #800080">, - * /</span></td>
    </tr>
    <tr>
        <td>时</td>
        <td>是</td>
        <td>0-23</td>
        <td><span style="color: #800080">, - * /</span></td>
    </tr>
    <tr>
        <td>日</td>
        <td>是</td>
        <td>1-31</td>
        <td><span style="color: #800080">, - * ? / L W C</span></td>
    </tr>
    <tr>
        <td>月</td>
        <td>是</td>
        <td>1-12 或 JAN-DEC</td>
        <td><span style="color: #800080">, - * /</span></td>
    </tr>
    <tr>
        <td>周</td>
        <td>是</td>
        <td>1-7 或 SUN-SAT</td>
        <td><span style="color: #800080">, - * ? / L C #</span></td>
    </tr>
    <tr>
        <td>年</td>
        <td>否</td>
        <td>空 或 1970-2099</td>
        <td><span style="color: #800080">, - * /</span></td>
    </tr>
    </tbody>
</table>
<p>
    <br> 月份和星期的名称是不区分大小写的。<span style="color: #800080">FRI</span>
    和 <span style="color: #800080"> fri</span> 是一样的。<br> <br>
    域之间有空格分隔，这和 UNIX cron 一样。无可争辩的，我们能写的最简单的表达式看起来就是这个了：<br> <br>
						<span style="color: #800080">* * * ? * *<br>
						</span><br> 这个表达会每秒钟(每分种的、每小时的、每天的)激发一个部署的 job。<br> <br> <strong>·理解特殊字符</strong><br>
    <br> 同 UNIX cron 一样，Quartz cron
    表达式支持用特殊字符来创建更为复杂的执行计划。然而，Taurus(Quartz) 在特殊字符的支持上比标准 UNIX cron 表达式更丰富了。<br>
    <br> <strong><span style="color: #800080">* </span>星号</strong><br>
    <br> 使用星号(*) 指示着你想在这个域上包含所有合法的值。例如，在月份域上使用星号意味着每个月都会触发这个
    trigger。<br> <br> 表达式样例：<br> <br> <span
        style="color: #800080">0 0/1 17 * * ?<br>
						</span><br> 意义：每天从下午5点到下午5:59中的每分钟激发一次 trigger。它停在下午 5:59 是因为值 17
    在小时域上，在下午 6 点时，小时变为 18 了，也就不再理会这个 trigger，直到下一天的下午5点。<br> <br>
    在你希望 trigger 在该域的所有有效值上被激发时使用 <span style="color: #800080">*</span>
    字符。<br> <br> <strong><span
        style="color: #800080">? </span>问号</strong><br> <br> <span
        style="color: #800080">?</span> 号只能用在<span style="color: #800080">日</span>和<span
        style="color: #800080">周域</span>上，但是不能在这两个域上同时使用。你可以认为<span
        style="color: #800080">?</span> 字符是 "我并不关心在该域上是什么值。"
    这不同于星号，星号是指示着该域上的每一个值。? 是说不为该域指定值。<br> <br>
    不能同时这两个域上指定值的理由是难以解释甚至是难以理解的。基本上，假定同时指定值的话，意义就会变得含混不清了：考虑一下，如果一个表达式在<span
        style="color: #800080">日</span>域上有值11，同时在<span
        style="color: #800080">周</span>域上指定了<span style="color: #800080">WED</span>。那么是要
    trigger
    仅在每个月的11号，且正好又是星期三那天被激发？还是在每个星期三的11号被激发呢？要去除这种不明确性的办法就是不能同时在这两个域上指定值。<br>
    <br> 只要记住，假如你为这两域的其中一个指定了值，那就必须在另一个字值上放一个 <span
        style="color: #800080">?</span>。<br> <br> 表达式样例：<br>
    <br> <span style="color: #800080">0 10,44 14 ? 3 WEB</span><br>
    <br> 意义：在三月中的每个星期三的下午 2:10 和 下午 2:44 被触发。<br> <br>
    <strong><span style="color: #800080">,</span> 逗号</strong><br>
    <br> 逗号 (<span style="color: #800080">,</span>)
    是用来在给某个域上指定一个值列表的。例如，使用值 0,15,30,45 在分钟域上意味着每15分触发一个 trigger。<br>
    <br> 表达式样例：<br> <br> <span style="color: #800080">
							0 0,15,30,45 * * * ?</span><br> <br> 意义：每刻钟触发一次 trigger。<br>
    <br> <strong><span style="color: #800080">/</span>
    斜杠</strong><br> <br> 斜杠 (<span style="color: #800080">/</span>)
    是用于时间表的递增的。我们刚刚用了逗号来表示每15分钟的递增，但是我们也能写成这样<span
        style="color: #800080">0/15</span>。<br> <br> 表达式样例：<br>
    <br> <span style="color: #800080">0 0/15 0/30 * * ?<br>
						</span><br> 意义：在整点和半点时每15分触发 trigger。<br> <br> <strong>-
    中划线</strong><br> <br> 中划线 (<span style="color: #800080">-</span>)
    用于指定一个范围。例如，在小时域上的 3-8 意味着 "3,4,5,6,7 和 8 点。" 域的值不允许回卷，所以像 50-10
    这样的值是不允许的。<br> <br> 表达式样例：<br> <br> <span
        style="color: #800080">0 45 3-8 ? * *<br>
						</span><br> 意义：在上午的3点至上午的8点的45分时触发 trigger。<br> <br> <strong><span
        style="color: #800080">L</span> 字母<br> </strong><br> <span
        style="color: #800080">L</span> 说明了某域上允许的最后一个值。它仅被<span
        style="color: #800080">日</span>和<span style="color: #800080">周</span>域支持。当用在日域上，表示的是在<span
        style="color: #800080">月</span>域上指定的月份的最后一天。例如，当月域上指定了<span
        style="color: #800080">JAN</span> 时，在<span style="color: #800080">日</span>域上的<span
        style="color: #800080">L</span> 会促使 trigger 在1月31号被触发。假如<span
        style="color: #800080">月</span>域上是<span style="color: #800080">SEP</span>，那么
    L 会预示着在9月30号触发。换句话说，就是不管指定了哪个月，都是在相应月份的时最后一天触发 trigger。<br> <br>
    表达式 <span style="color: #800080">0 0 8 L * ?</span> 意义是在每个月最后一天的上午
    8:00 触发 trigger。在<span style="color: #800080">月</span>域上的 * 说明是
    "每个月"。<br> <br> 当 <span style="color: #800080">L</span>
    字母用于周域上，指示着周的最后一天，就是星期六 (或者数字7)。所以如果你需要在每个月的最后一个星期六下午的 11:59 触发
    trigger，你可以用这样的表达式<span style="color: #800080">0 59 23 ? *
							L</span>。<br> <br> 当使用于<span style="color: #800080">周</span>域上，你可以用一个数字与
    <span style="color: #800080"> L</span> 连起来表示月份的最后一个星期 X。例如，表达式 <span
        style="color: #800080">0 0 12 ? * 2L</span> 说的是在每个月的最后一个星期一触发
    trigger。<br>
</p>
<table border="1" width="70%" align="center"
       style="border-right-width: 1px; border-top-width: 1px; border-bottom-width: 1px; border-left-width: 1px">
    <tbody>
    <tr>
        <td><strong>不要让范围和列表值与 L 连用</strong><br> <br>
            虽然你能用星期数(<span style="color: #800080">1-7</span>)与 L
            连用，但是不允许你用一个范围值和列表值与 L 连用。这会产生不可预知的结果。
        </td>
    </tr>
    </tbody>
</table>
<p>
    <br> <strong><span style="color: #800080">W</span>
    字母</strong><br> <br> <span style="color: #800080">W</span>
    字符代表着平日 (<span style="color: #800080">Mon-Fri</span>)，并且仅能用于日域中。它用来指定离指定日的最近的一个平日。大部分的商业处理都是基于工作周的，所以
    W 字符可能是非常重要的。例如，日域中的<span style="color: #800080">15W</span> 意味着
    "离该月15号的最近一个平日。" 假如15号是星期六，那么 trigger
    会在14号(星期五)触发，因为星期四比星期一（这个例子中是17号）离15号更近。<span
        style="color: #0000ff">（译者Unmi注：不会在17号触发的，如果是<span
        style="color: #800080">15W</span>，可能会是在14号(15号是星期六)或者15号(15号是星期天)触发，也就是只能出现在邻近的一天，如果15号当天为平日直接就会当日执行）
						</span>。<span style="color: #800080">W</span> 只能用在指定的<span
        style="color: #800080">日</span>域为单天，不能是范围或列表值。<br> <br>
    <strong><span style="color: #800080">#</span> 井号</strong><br>
    <br> <span style="color: #800080">#</span> 字符仅能用于<span
        style="color: #800080">周</span>域中。它用于指定月份中的第几周的哪一天。例如，如果你指定周域的值为<span
        style="color: #800080">6#3</span>，它意思是某月的第三个周五 (<span
        style="color: #800080">6</span>=星期五，<span style="color: #800080">#3</span>意味着月份中的第三周)。另一个例子<span
        style="color: #800080">2#1</span> 意思是某月的第一个星期一 (<span
        style="color: #800080">2</span>=星期一，<span style="color: #800080">#1</span>意味着月份中的第一周)。注意，假如你指定<span
        style="color: #800080">#5</span>，然而月份中没有第 5 周，那么该月不会触发。
</p>

<p></p>

<p>
    此处的 Cron 表达式 cookbook
    旨在为常用的执行需求提供方案。尽管不可能列举出所有的表达式，但下面的应该为满足你的业务需求提供了足够的例子。<br> <br>
    <strong>·分钟的 Cron 表达式</strong><br> <br>
</p>
<table border="0" cellspacing="5" width="600">
    <caption>
        <strong>表 5.1. 包括了分钟频度的任务计划 Cron 表达式</strong>
    </caption>
    <tbody>
    <tr>
        <td><strong>用法</strong></td>
        <td width="150"><strong>表达式</strong></td>
    </tr>
    <tr>
        <td>每天的从 5:00 PM 至 5:59 PM 中的每分钟触发</td>
        <td><span style="color: #800080">0 0/1 17 * * ?</span></td>
    </tr>
    <tr>
        <td>每天的从 11:00 PM 至 11:55 PM 中的每五分钟触发</td>
        <td><span style="color: #800080">0 0/5 23 * * ?<br>
								</span></td>
    </tr>
    <tr>
        <td>每天的从 3:00 至 3:55 PM 和 6:00 PM 至 6:55 PM 之中的每五分钟触发</td>
        <td><span style="color: #800080">0 0/5 15,18 * * ?<br>
								</span></td>
    </tr>
    <tr>
        <td>每天的从 5:00 AM 至 5:05 AM 中的每分钟触发</td>
        <td><span style="color: #800080">0 0-5 5 * * ?</span></td>
    </tr>
    </tbody>
</table>
<br> <strong>·日上的 Cron 表达式</strong><br>
<table border="0" cellspacing="5" width="600">
    <caption>
        <strong><br> 表 5.2. 基于日的频度上任务计划的 Cron 表达式</strong>
    </caption>
    <tbody>
    <tr>
        <td><strong>用法</strong></td>
        <td width="150"><strong>表达式</strong></td>
    </tr>
    <tr>
        <td>每天的 3:00 AM</td>
        <td><span style="color: #800080">0 0 3 * * ?</span></td>
    </tr>
    <tr>
        <td>每天的 3:00 AM (另一种写法)</td>
        <td><span style="color: #800080">0 0 3 ? * *</span></td>
    </tr>
    <tr>
        <td>每天的 12:00 PM (中午)</td>
        <td><span style="color: #800080">0 0 12 * * ?</span></td>
    </tr>
    <tr>
        <td>在 2015 中每天的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 * * ? 2015</span></td>
    </tr>
    </tbody>
</table>
<br> <strong>·周和月的 Cron 表达式</strong><br> <br>
<table border="0" cellspacing="5" width="600">
    <caption>
        <strong>表 5.3. 基于周和/或月的频度上任务计划的 Cron 表达式</strong>
    </caption>
    <tbody>
    <tr>
        <td><strong>用法</strong></td>
        <td width="150"><strong>表达式</strong></td>
    </tr>
    <tr>
        <td>在每个周一,二, 三和周四的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 ? * 1-5</span></td>
    </tr>
    <tr>
        <td>每月15号的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 15 * ?</span></td>
    </tr>
    <tr>
        <td>每月最后一天的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 L * ?</span></td>
    </tr>
    <tr>
        <td>每月最后一个周五的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 ? * 6L</span></td>
    </tr>
    <tr>
        <td>在 2012, 2013, 2014, 和 2015 年中的每月最后一个周五的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 ? * 6L
										2012-2015</span></td>
    </tr>
    <tr>
        <td>每月第三个周五的 10:15 AM</td>
        <td><span style="color: #800080">0 15 10 ? * 6#3</span></td>
    </tr>
    <tr>
        <td>每月从第一天算起每五天的 12:00 PM (中午)</td>
        <td><span style="color: #800080">0 0 12 1/5 * ?</span></td>
    </tr>
    <tr>
        <td>每一个 11 月 11 号的 11:11 AM</td>
        <td><span style="color: #800080">0 11 11 11 11 ?</span></td>
    </tr>
    <tr>
        <td>三月份每个周三的 2:10 PM 和 2:44 PM</td>
        <td><span style="color: #800080">0 10,44 14 ? 3 WED</span></td>
    </tr>
    </tbody>
</table>
<br>
<section id="apijob">
    <div class="page-header">
        <h1>API调用</h1>
    </div>
    本api接口是提供给想直接通过接口方式对job进行添加、编辑、查询、启动、停止、单次执行、查看历史纪录的使用方，请求方式为带有BA认证的Http请求，BA认证参见<a href="http://wiki.sankuai.com/pages/viewpage.action?pageId=196864772">wiki链接</a>。API使用方首先在<a href="http://beta.taurus.dp/user">用户设置</a>中添加自己所在的组名，BA认证时将所在的组名提供给taurus值班人员，获得密钥。
    <div>
        <h3>
            API说明
        </h3>
    </div>
    <div class="table-wrap">
        <table class="confluenceTable">
            <thead>
            <tr>
                <th colspan="1" class="confluenceTh"><div class="tablesorter-header-inner">序号</div></th>
                <th colspan="1" class="confluenceTh"><div class="tablesorter-header-inner">模块</div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">功能</div></div></div></div></div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">URI</div></div></div></div></div></th>
                <th colspan="1" class="confluenceTh"><div class="tablesorter-header-inner">参数</div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">HTTP方法</div></div></div></div></div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">返回值</div></div></div></div></div></th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td colspan="1" class="confluenceTd">1</td>
                <td colspan="1" class="confluenceTd"><span>批量查询</span></td>
                <td colspan="1" class="confluenceTd">依据 jobIds批量查询</td>
                <td colspan="1" class="confluenceTd">/api/job/jobList</td>
                <td colspan="1" class="confluenceTd"><span>jobIds</span></td>
                <td colspan="1" class="confluenceTd">GET</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">2</td>
                <td colspan="1" class="confluenceTd">按条件查询</td>
                <td colspan="1" class="confluenceTd">按照taskid，调度人、任务状态</td>
                <td colspan="1" class="confluenceTd"><span>/api/job/quaryJobList</span></td>
                <td colspan="1" class="confluenceTd"><span>Task</span></td>
                <td colspan="1" class="confluenceTd"><span>GET</span></td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">3</td>
                <td colspan="1" class="confluenceTd">添加job</td>
                <td colspan="1" class="confluenceTd">新增job</td>
                <td colspan="1" class="confluenceTd">/<span>api</span>/job/addJob</td>
                <td colspan="1" class="confluenceTd">TaskApiDTO对象</td>
                <td colspan="1" class="confluenceTd">POST</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">4</td>
                <td colspan="1" class="confluenceTd">编辑job</td>
                <td colspan="1" class="confluenceTd">编辑job</td>
                <td colspan="1" class="confluenceTd">/<span>api</span>/job/modifyJob</td>
                <td colspan="1" class="confluenceTd">TaskApiDTO对象</td>
                <td colspan="1" class="confluenceTd">POST</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">5</td>
                <td colspan="1" class="confluenceTd">启动</td>
                <td colspan="1" class="confluenceTd">启动任务</td>
                <td colspan="1" class="confluenceTd">/<span>api</span>/<span>job</span>/startJob</td>
                <td colspan="1" class="confluenceTd">jobId</td>
                <td colspan="1" class="confluenceTd">POST</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">6</td>
                <td colspan="1" class="confluenceTd">停止</td>
                <td colspan="1" class="confluenceTd">停止任务</td>
                <td colspan="1" class="confluenceTd">/<span>api</span>/<span>job</span>/stopJob</td>
                <td colspan="1" class="confluenceTd">jobId</td>
                <td colspan="1" class="confluenceTd">POST</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">7</td>
                <td colspan="1" class="confluenceTd">单次执行</td>
                <td colspan="1" class="confluenceTd">单次执行一次任务</td>
                <td colspan="1" class="confluenceTd">/<span>api</span>/<span>job</span>/onceJob</td>
                <td colspan="1" class="confluenceTd">jobId</td>
                <td colspan="1" class="confluenceTd">POST</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">8</td>
                <td colspan="1" class="confluenceTd">trace</td>
                <td colspan="1" class="confluenceTd">查看任务执行记录</td>
                <td colspan="1" class="confluenceTd">/<span>api</span>/job/getJobTrace</td>
                <td colspan="1" class="confluenceTd"><span>jobId</span></td>
                <td colspan="1" class="confluenceTd">GET</td>
                <td colspan="1" class="confluenceTd">Result</td>
            </tr>
            </tbody>
        </table>
    </div>

    <div>
        <h3>
            参数和返回值对象说明
        </h3>
    </div>
    <div>
        <h4>
            Task
        </h4>
    </div>
    <div class="table-wrap">
        <table class="confluenceTable">
            <thead>
            <tr>
                <th colspan="1" class="confluenceTh"><div class="tablesorter-header-inner">参数</div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">描述</div></div></div></div></div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">是否必须</div></div></div></div></div></th>
            </tr>
            </thead>
        <tbody>
            <tr>
                <td colspan="1" class="confluenceTd">taskid</td>
                <td colspan="1" class="confluenceTd"><span>任务id，比如task_201604211612_0001</span></td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">creator</td>
                <td colspan="1" class="confluenceTd">调度人，比如mingdong.li</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">name</td>
                <td colspan="1" class="confluenceTd">任务名称，比如arch-test</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">status</td>
                <td colspan="1" class="confluenceTd">任务状态，比如1</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
        </tbody>
        </table>
    </div>

    <div>
        <h4>
            TaskApiDTO
        </h4>
    </div>
    <div class="table-wrap">
        <table class="confluenceTable">
            <thead>
            <tr>
                <th colspan="1" class="confluenceTh"><div class="tablesorter-header-inner">参数</div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">描述</div></div></div></div></div></th>
                <th class="confluenceTh"><div class="tablesorter-header-inner">是否必须</div></div></div></div></div></th>
            </tr>
            </thead>
        <tbody>
            <tr>
                <td colspan="1" class="confluenceTd">taskName</td>
                <td colspan="1" class="confluenceTd"><span>任务名称</span></td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">taskType</td>
                <td colspan="1" class="confluenceTd">任务类型，比如default</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">taskCommand</td>
                <td colspan="1" class="confluenceTd">taurus执行的命令，比如sh xx.sh</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">crontab</td>
                <td colspan="1" class="confluenceTd">cron表达式</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">creator</td>
                <td colspan="1" class="confluenceTd">调度人</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">proxyUser</td>
                <td colspan="1" class="confluenceTd">任务执行身份，比如nobody</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">hostName</td>
                <td colspan="1" class="confluenceTd">任务执行的机器，比如10.1.1.1</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">alertUser</td>
                <td colspan="1" class="confluenceTd">告警通知人，比如mingdong.li</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">alertCondition</td>
                <td colspan="1" class="confluenceTd">告警条件，比如TIMEOUT;FAILED</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">iskillcongexp</td>
                <td colspan="1" class="confluenceTd">任务拥塞时新任务是否执行，true表示不执行新任务</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">isautokill</td>
                <td colspan="1" class="confluenceTd">任务执行之间超过设置的最大时间是否自动kill</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">isnotconcurrency</td>
                <td colspan="1" class="confluenceTd">上次未执行完不启动新任务</td>
                <td colspan="1" class="confluenceTd"><span>是</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">dependency</td>
                <td colspan="1" class="confluenceTd">任务依赖关系，比如taskName[1][0]</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">maxExecutionTime</td>
                <td colspan="1" class="confluenceTd">任务执行最大时间</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">maxWaitTime</td>
                <td colspan="1" class="confluenceTd">任务依赖等待最大时间</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">retryTimes</td>
                <td colspan="1" class="confluenceTd">重试次数</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">description</td>
                <td colspan="1" class="confluenceTd">任务描述</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">alertType</td>
                <td colspan="1" class="confluenceTd">告警类型，1表示邮件；2表示微信；3表示大象；4表示以上全部</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
            <tr>
                <td colspan="1" class="confluenceTd">alertGroup</td>
                <td colspan="1" class="confluenceTd">告警分组</td>
                <td colspan="1" class="confluenceTd"><span>否</span></td>
            </tr>
        </tbody>
        </table>
    </div>

    <div>
        <h4>
            Result
        </h4>
    </div>
    <div class="table-wrap">
    <table class="confluenceTable">
        <thead>
        <tr>
            <th colspan="1" class="confluenceTh"><div class="tablesorter-header-inner">参数</div></th>
            <th class="confluenceTh"><div class="tablesorter-header-inner">描述</div></div></div></div></div></th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td colspan="1" class="confluenceTd">errCode</td>
            <td colspan="1" class="confluenceTd"><span>状态码，0表示请求成功，其他表示失败</span></td>
        </tr>
        <tr>
            <td colspan="1" class="confluenceTd">errMsg</td>
            <td colspan="1" class="confluenceTd">状态信息</td>
        </tr>
        <tr>
            <td colspan="1" class="confluenceTd">data</td>
            <td colspan="1" class="confluenceTd">json化后返回的数据</td>
        </tr>
    </tbody>
    </table>
    </div>
</section>
</section>
<section id="agent">
    <div class="page-header">
        <h1>安装agent</h1>
    </div>
    Taurus agent已经升级到0.5.0版本，这版的agent需要部署在tomcat下，所以安装前请确认job机器有tomcat。<br/>
    <hr style="padding:15px 0px">
    <h4>运维操作</h4>
    如果是第一次安装，以root身份执行如下代码：
    <div class="well">
        <em>wget http://10.1.1.171/install-new-agent-war.sh; <br/>
            chmod 700 ./install-new-agent-war.sh; <br/> ./install-new-agent-war.sh;
        </em>
    </div>
    以上会初始化taurus agent的运行环境。
    然后ssh 到10.1.1.171 上执行

    <div class="well">
        cd /data/ftpupload <br>
        <em style="color: darkred"> python importcmdb.py 主机名</em><br>
        其中主机名为新增的job机器主机名

    </div>
    <hr style="padding:15px 0px">
  <h4>以下操作已经不需要了~</h4>
    在老cmdb中首先把服务器加入服务器列表，点deploy manage 然后输入taurus-agnet按回车,如下图所示
    <br><br>
    <img src="${rc.contextPath}/img/cmdb1.png" style="width: 876px;height: 455px"/>
    <br><br>
    添加服务器 如下图所示：
    <br><br>
    <img src="${rc.contextPath}/img/cmdb2.jpg" style="width: 876px;height: 455px"/>
    <br><br>
    添加完之后点下面的提交按钮，然后点旁边灰度定义按钮，进入后选择新增灰度组，然后默认组名为应用名，然后主机列表勾选刚刚加入的应用服务器。
    <br><br>
    <img src="${rc.contextPath}/img/cmdb3.jpg" style="width: 876px;height: 455px"/>
    <br><br>
    <hr style="padding:15px 0px">
    如果希望在该agent上，以多种身份运行作业<br/>
    修改配置文件/data/webapps/taurus-agent/current/taurus-agent.war/WEB-INF/classes/agentConf.properties
    <div class="well">
        <em> needSudoAuthority=true </em>
    </div>
    运维需要以root身份启动tomcat
    <hr style="padding:15px 0px">
    如果需要使用agent申请hadoop权限<br/>先修改配置文件/data/webapps/taurus-agent/current/taurus-agent.war/WEB-INF/classes/agentConf.properties
    <div class="well">
        <em> needHadoopAuthority=true
        </em>
    </div>
    keytab文件存放规则为
    <div class="well">
        <em> /data/home/${r"${hadoop-user-name}"}/.keytab </em>
    </div>
    /data/home/是keytab文件的根路径,如果不存在请联系运维创建。<br/>
    ${r"${hadoop-user-name}"}是hadoop中的用户身份。<br/>
    例如，以wwwcron的身份访问hadoop<br/>
    可以把wwwcron的keytab文件放在/data/home/wwwcron/.keytab<br/>
    在/data/webapps/taurus-agent/current/taurus-agent.war/WEB-INF/classes/agentConf.properties中配置
    <div class="well">
        <em> needHadoopAuthority=true<br/>
        </em>
    </div>
    最后启动agent时，需要保证执行agent的用户是taurus-agent目录的所有者。
</section>
<section>
    <h1>最新功能:我要报错</h1>
    <hr>
    <br>
    <table class="table align-center">
        <tr style="padding-left: 14px;padding-right: 20px">
            <td > <img src="${rc.contextPath}/img/qq.png" style="width: 300px;height: 300px"/><h1>Hi，大家好，我是小Q</h1></td>
            <td><h1>为了体验新功能，小Q恳请你在用户设置中设置你的QQ号</h1>
                <h2> <a href="http://shang.qq.com/v3/widget.html">点我开通QQ通讯组件</a></h2>
                <img src="${rc.contextPath}/img/ktqq.png" style="width: 720px;height: 400px"/>
                <img src="${rc.contextPath}/img/setqq.png" style="width: 720px;height: 400px"/>
            </td>
        </tr>



    </table>
    <table class="table align-center">
        <tr style="padding-left: 14px;">
            <td><h1>然后你在调度历史中可以看到：</h1> <hr><img src="${rc.contextPath}/img/feederror.png" style="width: 1020px;height: 300px"/></td>

        </tr>
    </table>
    <table class="table align-center">

        <tr style="padding-left: 14px;padding-right: 20px">
            <td><h1>你点击小Q我就可以看到：</h1><hr><img src="${rc.contextPath}/img/feedQQ.png" style="width: 720px;height: 300px"/></td>
            <td > <img src="${rc.contextPath}/img/qq.png" style="width: 300px;height: 300px"/></td>

        </tr>


    </table>
    <table class="table align-center">

        <tr style="padding-left: 14px;padding-right: 20px">
            <td > <img src="${rc.contextPath}/img/qq.png" style="width: 300px;height: 300px"/><br><h1>还在等什么，快去尝试一下吧~</h1></td>



        </tr>


    </table>




    <br>
    <h1>最新功能：我要反馈</h1>
    <hr>
    <br>
    <table class="table align-center">
        <tr style="padding-left: 14px;">
            <td><img src="${rc.contextPath}/img/qq.png" style="float:left;width: 300px;height: 300px"/></td>
            <td> <img src="${rc.contextPath}/img/feedback.png" style="width: 720px;height: 560px"/></td>


        </tr>
    </table>
    <br>
    <table class="table align-center">

        <tr style="padding-left: 14px;padding-right: 20px">
            <td > <img src="${rc.contextPath}/img/qq.png" style="width: 300px;height: 300px"/><br><h1>还在等什么，快去尝试一下吧~</h1></td>



        </tr>


    </table>
    <hr>


    <hr>
</section>
</div>

</div>
</div>
<div class="feedTool">

    <a target="_blank" style="color: white;" href="http://wpa.qq.com/msgrd?v=3&uin=767762405&site=qq&menu=yes"><img border="0" src="${rc.contextPath}/img/qq.png"  width="80" height="80" color="white" alt="点我报错" title="点我报错"/></a>
    <a target="_blank" style="float:right; padding-right:16px;color: white;" href="javascript:close_tool()"><img border="0" src="${rc.contextPath}/img/x_alt.png"  width="20" height="20" color="white" alt="关闭挂件" title="关闭挂件"/></a>
    <p style="text-align: center; padding-right:32px;color: firebrick">点我报错</p>
</div>
<a href="#" class="scrollup" style="display: inline;">
    <img src="${rc.contextPath}/img/betop.png" width="66" height="67">
</a>
</div>

<script>
    $('li[id="about"]').addClass("active");
    $('#menu-toggler').on(ace.click_event, function() {
        $('#sidebar').toggleClass('display');
        $(this).toggleClass('display');
        return false;
    });

    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.scrollup').fadeIn();
        } else {
            $('.scrollup').fadeOut();
        }
    });

    $('.scrollup').click(function () {
        $("html, body").scrollTop(0);
        return false;
    });

</script>

</body>
</html>