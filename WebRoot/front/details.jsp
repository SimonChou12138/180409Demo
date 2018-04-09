<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
	<base href="<%=basePath%>">
    <meta charset="UTF-8">
    <title>U闲交易平台</title>
	<link rel="stylesheet" type="text/css" href="front/css/xiangqing.css">
    <link rel="icon" href="front/images/icon.ico">
    <script type="text/javascript" src="front/js/jquery1.42.min.js"></script>
</head>
<body>
    <!-- header -->
    <div class="header">
        <div class="header_main wrap">
            <h1><a href="#"><img src="front/images/logo-2.png"></a></h1>
            <h2>让你的闲置游起来!</h2>
            <ul class="header_menu clearfix">
                <li><a href="front/index.jsp" target="_blank">首页</a></li>
                <li><a href="ListLikeServlet">手机二手</a></li>
                <li><a href="#">二手车估价</a></li>
                <li><a href="#">降降降</a></li>
                <li><a href="front/publish.jsp" target="_blank">发布闲置</a></li>
                <li class="header_wdxz">
                    <a href="#">我的闲置</a>
                    <ul class="header_xz">  
                        <li><a href="#">出售中：<span>0</span></a></li>  
                        <li><a href="#">交易中：<span>0</span></a></li>  
                        <li><a href="#">新留言：<span>0</span></a></li>
                        <li><a href="#">新会话：<span>0</span></a></li>    
                    </ul> 
                </li>
                <li class="header_mycenter">
                    <a href="#">个人中心</a>
                    <ul class="header_center">  
                        <li><a href="front/Updateinformation.jsp">完善个人信息</a></li>  
                        <li><a href="front/UpdataPwd_front.jsp">修改密码</a></li>  
                        <li><a href="#">我的收藏</a></li>  
                    </ul> 
                </li>
                <li class="quit"><a href="javascript:void(0)">退出</a></li>
            </ul>
        </div>
    </div> 

    <!-- 宝贝详情 -->
    <div class="xiangqing wrap clearfix">
        <div class="fl">
            <div class="xiangqing_img">
                <img src="idleimg/${map.idleimg}">
            </div>
                <ul class="bbjs">
                    <li>宝贝介绍</li>
                </ul>
                <div class="baobeixingqing">
                   ${map.presentation}
            </div>
        </div>
        <div class="xiangqing_right fr">
            <h1 class="xiangqing_title">${map.name}</h1>
            <ul class="price">
                <li class="price_first">转  卖  价：<span>¥</span><i>${map.transfer_price}</i></li>
                <li>成　　色：${map.percentage}</li>
                <li>所  在  地：${map.location}</li>
                <li class="address">
                    <div class="address_on">至 <span>北京</span></div>
                    <div class="address_none">
                            <h3>选择你的收货城市</h3>
                            <div class="cha">x</div>
                            <div class="city clearfix">
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                                <a href="#">北京</a>
                            </div>
                    </div>
                    <script type="text/javascript">
                        $(function(){
                            $(".address_on").click(function(){                                                              
                                $(".address_none").css("display","block");                           
                            })
                            $(".cha").click(function(){                                                              
                                $(".address_none").css("display","none");                           
                            })
                        })
                    </script>
                   
                </li>
            </ul>
            <a href="ConfirmOrderServlet?id=${map.id}" target="_blank" class="xingqing_buy">立即购买</a>
            <div class="danbao">
                    <div class="danbao_first"><img src="front/images/danbao.png" > 担保交易<span>由支付宝先行保管,验货OK再付款到卖家账户。</span></div>
                    <div><img src="front/images/jiaoyi.png" > 实名认证<span>经支付宝核实会员身份和银行账户信息,真实可靠。</span></div>                    
            </div>
        </div>
    </div>

    <!-- footer -->
    <div class="footer">
        <ul class="wrap clearfix">
            <li>
                <img src="front/images/footer_03.png" alt="">
                <span>卖家实名认证</span>
            </li>
            <li>
                <img src="front/images/footer_05.png" alt="">
                <span>支付宝担保交易</span>
            </li>
            <li>
                <img src="front/images/footer_07.png" alt="">
                <span>专业团队支撑</span>
            </li>
            <li>
                <img src="front/images/footer_09.jpg" alt="">
                <span>官方微博</span>
            </li>
        </ul>
    </div>
    <!-- 底部一堆 -->
    <div class="footer_1 wrap">
        <a href="#" target="_blank">关于我们</a>
        <a href="#" target="_blank">合作伙伴</a>
        <a href="#" target="_blank">营销中心</a>
        <a href="#" target="_blank">廉正举报</a>
        <a href="#" target="_blank">联系客服</a>
        <a href="#" target="_blank">开放平台</a>
        <a href="#" target="_blank">诚征英才</a>
        <a href="#" target="_blank">联系我们</a>
        <a href="#" target="_blank">网站地图</a>
        <a href="#" target="_blank">法律声明及隐私权政策</a>
        <a href="#" target="_blank">知识产权</a>
        <span>1999-<i id="year"></i> ujiuye.com 版权所有</span>
        <script type="text/javascript">
            var day = new Date();
            var year = day.getFullYear();
            document.getElementById('year').innerHTML=year;
        </script>
    </div>
    <div class="footer_2 wrap">
        <a href="#" target="_blank"><img src="front/images/ft1.gif"></a>
        <a href="#" target="_blank"><img src="front/images/ft_01.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_03.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_05.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_07.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_09.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_11.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_13.jpg"></a>
        <a href="#" target="_blank"><img src="front/images/ft_15.jpg"></a>
    </div>
</body>
</html>