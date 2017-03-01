<%@ page language="java" import="java.util.*,com.wzbcbbs.db.*,java.sql.*" pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<head>
    
    <title>总纲-在温言商-商学院自己的BBS</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>

<link type="image/png" rel="shortcut icon" href="assets/images/favicon.png">
    <!-- <link rel="stylesheet" href="http://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css"> -->
    <link type="text/css" rel="stylesheet" href="assets/plugins/awesome/css/font-awesome.min.css" />
    <!--Import styles-->
    <link type="text/css" rel="stylesheet" href="assets/plugins/materialize/css/materialize.min.css" />
    <link type="text/css" rel="stylesheet" href="assets/plugins/prism/prism.css" />
    <link type="text/css" rel="stylesheet" href="assets/css/screen.css" />

<body >


    <!-- 头部导航区 -->
    <header class="navbar-fixed">
        <nav id="headNav" class="bf-color none-shadow">
            <div id="navContainer" class="container">
                <div class="nav-wrapper hide-on-med-and-down" >
                    <div class="brand-logo">
                        <a href="index.jsp" class="waves-effect waves-light">
                            <img src="assets/images/logo.png" class="logo-img hide-on-small-only">
                            <span class="logo-span">在温言商</span>
                        </a>
                    </div>
                    <a href="#" data-activates="mobile-nav" class="button-collapse"><i class="fa fa-navicon"></i></a>
                    <ul class="right">
                        <li class="hide-on-med-and-down">
                            <a href="index.jsp" class="waves-effect waves-light">首页</a>
                        </li>
                    </ul>
                    <div class="side-nav" id="mobile-nav">
                        <ul class="menu-list">
                            <li>
                                <a href="index.jsp" class="waves-effect waves-light">
                                    <i class="fa fa-home fa-lg fa-fw"></i>首 页
                                </a>
                            </li>
                        </ul>
                        <div class="social-link">
                            <a href="https://github.com/blinkfox" class="tooltipped" target="_blank" data-tooltip="访问我的GitHub" data-position="top" data-delay="50">
                                <i class="fa fa-github fa-lg"></i>
                            </a>
                            <a href="mailto:chenjiayin1990@163.com" class="tooltipped" target="_blank" data-tooltip="邮件联系我" data-position="top" data-delay="50">
                                <i class="fa fa-envelope fa-lg"></i>
                            </a>
                            <a href="#!" class="tooltipped" data-tooltip="QQ号：1181062873" data-position="top" data-delay="50">
                                <i class="fa fa-qq fa-lg"></i>
                            </a>
                            <a href="#!" class="tooltipped" data-tooltip="RSS" target="_blank" data-position="top" data-delay="50">
                                <i class="fa fa-rss fa-lg"></i>
                            </a>
                        </div>
                    </div>
                </div>
               
            </div>
        </nav>
    </header>


    <!-- 主要内容 -->
    <main class="content">
        <!-- 头部融合背景标题 -->
        <div class="content-heading bf-color">
        <center>
            <div class="container">
                <div class="row">
                    <div class="col s12 m12 l12">
                        <h2 class="heading">温州商学院BBS总则</h2>
                    </div>
                </div>
            </div>
        </div>
        </center>

        <!-- 文章内容详情 -->
        <div id="artDetail" class="container ">
            <div class="card">
                <div class="article-card-content">
                          <p><h2>第一章&nbsp;总则</h2></p>
			<p><br/></p>
			<p>第一条：本站</p>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;在温言商BBS&nbsp;站（以下简称&quot;本站&quot;）是温州商学院的正式BBS&nbsp;站，由温州商学院提供
			域名、设备及运作经费，所有权和管理权属于温州商学院。温州商学院的法定代表人自动
			成为本站站长，代表温州商学院行使本站最高权力。
			<p><br/></p>
			<p>第二条：总纲</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;在温言商BBS&nbsp;站总纲（以下简称&quot;本总纲&quot;），依据中华人民共和国《互联网信息
服务管理办法》、《互联网电子公告服务管理规定》、《中国教育和科研计算机网管理办法》、《中国教育和科研计算机网安全管理协议》、《中国教育和科研计算机网用户守则》以及国家其他相关法律法规和温州商学院的相关规定制定，旨在为本站建立
			良好秩序，保障本站用户合法权益，维护和促进本站信息交流之畅通。
			<p><br/></p>
			<p>第三条：用户</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;通过温州商学院校园网或国际互联网连接进入本站，并使用本站电子或网络服务的
			个人或组织即为本站用户；在本站注册帐号并通过本站规定的身份认证手续的本站用
			户，即为本站合法用户。合法用户受本总纲及本站各项规定的保护，对本站各项管理
			行为享有监督权。若未注明，下文中所有&quot;用户&quot;均指本站合法用户。
			<p><br/></p>
			<p>第四条：站务委员会和仲裁团</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会和仲裁团由本站合法用户经过本总纲与站规规定的程序组成，依据本
			总纲和站规对站长和全体用户负责。站务委员会及其下属的相关职能机构（简称&nbsp;&quot;全
			站公职人员&quot;&nbsp;。全站公职人员与版务合称&quot;管理者&quot;）依据本总纲与相关规定行使本站
			日常管理职能和用户之间的争议解决职能。仲裁团依据本总纲与站规行使用户与管理
			者之间因管理行为产生的争议解决职能和对管理者管理行为是否合乎职责的裁定职能。
			<p><br/></p>
			<p>第五条：版权的界定</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;在本站讨论区发表的原创文章，其版权归发表者个人所有，未经版权所有人许可，
			任何人不得擅自用于商业目的。用户转载文章应标明作者姓名与出处，转载非网络媒
			体的文章、图片，应遵守《中华人民共和国著作权法》等相关法律法规。对用户个人
			所造成的著作权侵权及其他侵权行为，本站不承担法律责任。
			<p><br/></p>
			<p>第六条：总纲的效力</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;本站全体管理者受本总纲约束，本站全体用户平等地受总纲约束和保护。除国家
			 法律法规、温州商学院相关规定外，本总纲在本站具有最高效力。本站其他管理规定与
			 本总纲相抵触部分无效。</p>
			<p><br/></p>
			<p><h2>第二章&nbsp;用户</h2></p>
			<p><br/></p>
			<p>第七条：用户的基本权利</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;本站用户在遵守本总纲及相关规定的前提下拥有使用本站提供的基本上站、发表
			 文章、进入聊天室、呼叫他人聊天、给他人发信息、给他人发信的基本权利。
			<p><br/></p>
			<p>第八条：用户个人资料不受侵犯</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;用户的个人资料不受侵犯。本站有责任为用户保密。除非依照相应法律及站规程
			 序，并获得本站站长书面批准，否则本站不接受任何单位或者个人的关于用户个人资
			 料的查询。
			<p><br/></p>
			<p>第九条：用户的隐私权</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;用户在本站内有维护个人隐私、不受人身攻击的权利。用户的私人信件、消息记
			 录等涉及个人隐私的信息在本站范围内受本站保护。
			<p><br/></p>
			<p>第十条：用户参与本站管理的权利</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;用户享有对本站事务的建议权、监督权。用户按规定行使投票表决权、投诉权、
			 仲裁权、弹劾权、提请复议权与被选举担任公职的权利。
			<p><br/></p>
			<p>第十一条：用户有使用真实资料的义务</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;用户必须使用个人真实资料注册帐号。同一用户只能注册不超过三个帐号。
			<p><br/></p>
			<p>第十二条：用户有遵守本站规定的义务</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;所有接受本站服务的用户，须表明已阅读并愿意遵守本站现行的各项管理规定。
			 用户应对自己在本站的言行负责，并承担因此而带来的各种站内、站外的相关责任。
			<p><br/></p>
			<p>第十三条：用户有维护系统安全的义务</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;所有用户都有向站务委员会及时反映本站系统程序及管理规定漏洞的义务。不得
			 利用漏洞获取不当利益、扰乱站内秩序、攻击本站。
			<p><br/></p>
			<p><h2>第三章&nbsp;站长和站务委员会</h2></p>
			<p><br/></p>
			<p>第十四条：站长</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;温州商学院的法人代表自动成为本站站长。站长可经规定程序委托温州商学院有关人
			 员代为行使站长权力。本总纲发布时，受权代为行使站长权力的是温州商学院在温言商
			 BBS&nbsp;发展委员会主任。
			<p><br/></p>
			<p>第十五条：站长拥有本站最高权力</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站长对本站重大事宜拥有最终决策权，对总监、副总监的任命拥有否决权。站长
			 不接受用户投诉或弹劾。
			<p><br/></p>
			<p>第十六条：站务委员会的组成</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站长委托站务委员会负责本站的日常管理。站务委员会由统称&quot;站务&quot;的常任站务、
			 技术站务、美工站务、实习站务组成，并由在常任站务中选举产生的站务总监与副总
			 监组织并主持工作。
			<p><br/></p>
			<p>第十七条：工作小组</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会可根据工作需要设立下属工作小组，并由工作小组代行部分站务职权。
			 各下属工作小组由站务委员会指定一至两名常任站务和（或）实习站务担任主管站务
			 或直接出任组长（下统称&quot;主管站务&quot;），主管站务代表站务委员会领导并主持小组内
			 各项工作。各工作小组通过主管站务向站务委员会负责。工作小组成员属于全站公职
			 人员。
			<p><br/></p>
			<p>第十八条：站务委员会的职责</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;经站长授权，站务委员会负责本站的发展规划、技术维护及开发、用户体验和用
			 户界面设计、用户管理、版面管理、组织并协调线上线下活动及对外交流等具体事宜。
			 站务委员会负责处理对版务组及其成员、下属工作小组及其成员、站务及站务委员会
			 的决定的复议申请。站务委员会有执行仲裁团决议的职责。在针对区长及站务的仲裁
			 案的复议过程中，与在对站务、仲裁的弹劾案裁决过程中，站务委员会联合仲裁团开
			 展复议、调查和裁决工作。
			<p><br/></p>
			<p>第十九条：站务委员会提交工作总结的义务</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会与其下属各工作小组需定期提交工作总结，接受全体用户的监督。站
			 务委员会的工作总结需在每学期开学后第一个月内向全站公开提交，总结之前一学期
			 的工作情况。</p>
			<p><br/></p>
			<p>第二十条：站务委员会的外部监督</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会的外部监督由全体用户进行。本站用户针对管理者工作的不当行为，
			 可以向站务委员会或该管理者所属的工作小组提出投诉。用户若认为某名管理者不能
			 胜任其职，可以对其提起弹劾。站务委员会不接受集体弹劾案。
			<p><br/></p>
			<p><h2>第四章&nbsp;仲裁团</h2></p>
			<p><br/></p>
			<p>第二十一条：仲裁团的组成</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;本站常设仲裁团，受理站内仲裁工作。仲裁团由统称&quot;仲裁&quot;的正式仲裁和实习仲
			 裁组成，并由在正式仲裁中选举产生的仲裁团主席组织并主持工作。仲裁团依据本总
			 纲和站规对站长和全体用户负责。
			<p><br/></p>
			<p>第二十二条：仲裁团受理仲裁案</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;仲裁团受理本站用户因基本权利受管理者侵害而提出的仲裁案。通过对仲裁案的
			 受理，仲裁团以本总纲及相关规定为依据，解决基于站内管理行为的站内纠纷，并最
			 终裁定管理者的管理行为之合理性。
			<p><br/></p>
			<p>第二十三条：仲裁团受理弹劾案和复议</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;仲裁团独立受理用户提起的对管理者的仲裁和对除站务外的管理者的弹劾案，联
			 合站务委员会受理用户提起的对站务或仲裁的弹劾案。仲裁团有权受理案件当事用户
			 提起的对仲裁案件的复议申请。
			<p><br/></p>
			<p>第二十四条：仲裁团的解释权</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;仲裁团在案件审理过程中，有权对本总纲及相关规定进行解释，有权因下位规定
			 中相关条款违背上位规定或其精神而宣布该条款无效，有权援引以往判例作为依据。
			<p><br/></p>
			<p>第二十五条：仲裁团决议的执行</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;仲裁团所做出的决议，由站务委员会负责执行。
			<p><br/></p>
			<p>第二十六条：仲裁团的外部监督</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;仲裁团的外部监督由全体用户进行。本站用户针对仲裁工作的不当行为，可以向
			 仲裁团提出投诉。用户若认为某名仲裁不能胜任其职，可以对其提起弹劾。仲裁不因
			 其职务行为而受投诉。仲裁团不接受集体弹劾案。
			<p><br/></p>
			<p><h2>第五章&nbsp;版面及其管理</h2></p>
			<p><br/></p>
			<p>第二十七条：版面</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;版面是本站的基本组成单位，一个版面应具备相对确定的版面主题。版面按照其
			 主题和职能分区进行管理。由用户在版面发表，或由系统自动在版面发表的文章，称
			 为版面文章。
			<p><br/></p>
			<p>第二十八条：版务组与版务</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;版务组是版面的自治机构，管理版面内事务，对站务委员会和用户负责。版务组
			 成员称为版务。版务组一般由一至三名版务组成。必要时，经站务委员会讨论通过并
			 向全站公示后，得设立三名以上版务。
			<p><br/></p>
			<p>第二十九条：分区与区务组</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;版面按照其主题和职能形成分区，分区由称为区务组的工作小组进行管理。部分
			 分区可以因性质相似而共设一个区务组。未设立区务组的分区，由站务委员会直接管
			 理。区务组除主管站务外的成员称为区长，分区的主管站务和区长统称为该区区务。
			<p><br/></p>
			<p>第三十条：版务的职责</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;版务依照相关规定从用户中产生，由站务委员会授予版面管理权力。版务组应依
			 照相关上位规定，结合版面发展需要制定版面规定。版务负责按照版面规定进行版面
			 日常管理，维护版面讨论气氛，引导版面发展方向，促进版面文章质量和数量的提升，
			 发展版面用户群体，并建设、管理精华区与文摘区。版务的工作受站务委员会监督评
			 定。
			<p><br/></p>
			<p>第三十一条：部分版面站务直接行使版面职权</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;经站务委员会讨论，认为有特殊需要的某些版面，可由站务直接行使版面职权。
			 此类版面的列表必须向全站公示，并将&nbsp;&nbsp;SYSOP&nbsp;写入其版务列表。写入版面版务列表
			 的SYSOP&nbsp;不计入第二十八条所述的版务数目。
			<p><br/></p>
			<p>第三十二条：版务组的最终裁定与全站公职人员介入版面管理的例外</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;在管理行为受到仲裁或复议之前，版务组是版面内事务的最终裁定者，站务委员
			 会及版面所在区区务组不得干涉版务对版面内事务的裁定。除非出现以下情况并且版
			 务无法及时处理，全站公职人员不得介入版面内事务的管理：
			<p><br/></p>
			 &nbsp;&nbsp;&nbsp;&nbsp;1.发生恶性灌水，且情节严重的；
			 &nbsp;&nbsp;&nbsp;&nbsp;2.出现大量与该版版面主题无直接联系的讨论的；
			 &nbsp;&nbsp;&nbsp;&nbsp;3.版面上出现违反本总纲及相关站规的文章，情节特别严重的（如泄漏他人隐私，
			 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;或包含威胁到本站生存的言论的）；
			 &nbsp;&nbsp;&nbsp;&nbsp;4.依照本总纲第三十一条规定站务可直接行使版务职权的。
			<p><br/></p>
			 &nbsp;&nbsp;&nbsp;&nbsp;全站公职人员直接介入版务管理时，可暂时封禁有不当行为的用户在版面上的发
			 表文章权利。除以上第&nbsp;4条外，封禁应设定为手动解封，由版务进行最终的处罚调整。
			<p><br/></p>
			<p>第三十三条：区务组的职责</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;区长依照相关规定从用户中产生，由站务委员会授予其分区管理权力。区务组应
			 依照相关上位规定制定分区规定。区务组负责分区内的日常管理，管理分区内的版面
			 和版务。在分区事务决策过程中，各区务有等同的权力。
			<p><br/></p>
			<p>第三十四条：版务组和区务组的外部监督</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;版务接受区务组及全体用户的监督，区务接受站务委员会及全体用户的监督。
			<p><br/></p>
			<p><h2>第六章&nbsp;附则</h2></p>
			<p><br/></p>
			<p>第三十五条：休站及相关免责条款</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;本站如因系统维护而需休站时，应事先公告。若因不可抗力或意外事件导致休站
			 而造成的一切损失，本站不承担任何责任。
			 &nbsp;&nbsp;&nbsp;&nbsp;前款所称&quot;不可抗力&quot;是指客观上不能避免或克服的情况；&quot;意外事件&quot;是指主观上
			 无法预见的情况。
			<p><br/></p>
			<p>第三十六条：信息丢失的免责条款</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;对于本站用户信息存储失败、删除本人所发布信息、信息按照规定被删除或其他
			 不可抗拒因素导致的信息丢失，本站不承担任何责任。
			<p><br/></p>
			<p>第三十七条：用户违法违规的免责条款</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;本站合法用户在使用本站资源时触犯中华人民共和国法律、法规的，一切后果由
			 用户自行负责，本站不承担任何责任。
			<p><br/></p>
			<p>第三十八条：站规及其细则的制定与修改</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会有权制定和修改站规，有权作出决定授权其下属职能机构、仲裁团根
			 据实际需要制定规则，补充站规，但不得同总纲的规定相抵触。
			<p><br/></p>
			<p>第三十九条：总纲的修订</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;总纲的修订案应由站务委员会与仲裁团分别通过，在为期一周的全站投票中取得
			 有效票数三分之二或以上支持，并经站长批准后生效。</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;前款所称&quot;有效票数&quot;，指在投票中选择支持或反对的投票。
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会与仲裁团有权就总纲修订案生效后，在其他相关规定未及修订的过渡
			 期间的相关问题共同发布临时管理办法。临时管理办法的内容应包括但不限于该过渡
			 期间的规则效力、相关规则的修订进程、争议问题的处理等。
			<p><br/></p>
			<p>第四十条：总纲的解释</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;站务委员会对本总纲享有解释权。
			 &nbsp;&nbsp;&nbsp;&nbsp;当本总纲的规定需要明确具体含义，或者出现新情况需要明确适用依据时，由站
			 务委员会发布解释文件。</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;总纲解释与本总纲具有同等效力。
			<p><br/></p>
			<p>第四十一条：总纲的时效性</p>
			 &nbsp;&nbsp;&nbsp;&nbsp;本总纲自生效之日起实施。</p>
			<p><br/></p>

                
                	</div>
        </div>
    </main>

    
    <footer class="page-footer bf-color">
        <div class="container row center-align">
            <div class="col s12 m12 l8 copy-right">
                本站由&copy;<a  target="_blank">VEBLEN</a>基于
                <a target="_blank">JSP</a> 搭建. 
            </div>
            <div class="col s12 m12 l4 social-link hide-on-med-and-down">
                <a href="https://github.com/blv-suellen" class="tooltipped" target="_blank" data-tooltip="访问我的GitHub" data-position="top" data-delay="50">
                    <i class="fa fa-github fa-lg"></i>
                </a>
                <a href="mailto:400823823@qq.com" class="tooltipped" target="_blank" data-tooltip="邮件联系我" data-position="top" data-delay="50">
                    <i class="fa fa-envelope fa-lg"></i>
                </a>
                <a href="#!" class="tooltipped" data-tooltip="QQ号：400823823" data-position="top" data-delay="50">
                    <i class="fa fa-qq fa-lg"></i>
                </a>
                <a href="http://www.wzbc.edu.cn/" class="tooltipped" data-tooltip="温州商学院" target="_blank" data-position="top" data-delay="50">
                    <i class="fa fa-rss fa-lg"></i>
                </a>
            </div>
        </div>
    </footer>

    <!-- 搜索遮罩框 -->
    <div id="search-mask" style="display: none;">
        <form class="search-form" action="#!" autocomplete="off">
            <a href="#!" onclick="return false;" class="search-close">
                <i class="mdi-navigation-close"></i>
            </a>
            <div class="container row search-container">
                <div class="col offset-s1 s10 offset-m3 m8 offset-l4 l8">
                    <div class="search-label center-align">
                        <label for="s">输入关键字后‘回车’即可</label>
                    </div>
                    <div>
                        <input type="search" id="searchKey" name="s" class="search-input" autofocus="">
                    </div>
                </div>
            </div>
        </form>
    </div>

    <!-- 主题颜色设置 -->
    <div id="theme-change" left="-200" class="hide-on-med-and-down">
        <div class="theme-change-handle">
            <i class="fa fa-gear fa-lg fa-spin bf-text-color"></i>
        </div>
        <div class="theme-change-container">
            <h6>主题颜色面板</h6>
            <div id="theme-panel">
                <ul>
                    <li class="bf-blue" data-colors="blue"></li>
                    <li class="bf-pink" data-colors="pink"></li>
                    <li class="bf-orange" data-colors="orange"></li>
                    <li class="bf-green" data-colors="green"></li>
                    <li class="bf-red" data-colors="red"></li>
                    <li class="bf-purple" data-colors="purple"></li>
                </ul>
            </div>
        </div>
    </div>

    <!-- 移动端分享模态框 -->
    <div id="shareModal" class="modal bottom-sheet">
        <div class="modal-content">
            <h4>分 享</h4>
            <!-- JiaThis Button BEGIN -->
            <div class="jiathis_style_m"></div>
            <script type="text/javascript" src="http://v3.jiathis.com/code/jiathis_m.js" charset="utf-8"></script>
            <!-- JiaThis Button END -->
        </div>
        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">关 闭</a>
        </div>
    </div>

    <!-- 回到顶部按钮 -->
    <div id="backTop" class="top-scroll">
        <a class="btn-floating btn-large waves-effect waves-light red accent-3" href="#!">
            <i class="fa fa-angle-double-up"></i>
        </a>
    </div>

    <!--Import jQuery before materialize.js-->
    <!--<script type="text/javascript" src="http://cdn.bootcss.com/jquery/2.2.0/jquery.js"></script> -->
    <script>
        window.jQuery || document.write('<script src="assets/plugins/jquery/jquery-2.2.0.min.js"><\/script>')
    </script>
    <script type="text/javascript" src="assets/plugins/materialize/js/materialize.js"></script>
    <script type="text/javascript" src="assets/plugins/masonry/masonry.pkgd.js"></script>
    <!-- <script type="text/javascript" src="http://cdn.bootcss.com/masonry/4.0.0/masonry.pkgd.min.js"></script> -->
    <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>
    <script type="text/javascript" src="assets/js/index.js"></script>
</body>

</html>
