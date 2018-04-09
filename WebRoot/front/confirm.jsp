<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <link rel="stylesheet" type="text/css" href="front/css/confirm.css">
    <link rel="icon" href="front/images/icon.ico">
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

    <!-- 确认订单 -->
    <div class="fonfirm">
        <h3>确认订单信息</h3>
        <table class="fonfirm_table">
            <tr>
                <th>序号</th>
                <th>闲置信息</th>
                <th>单价</th>
                <th>数量</th>
                <th>总价</th>
            </tr>
            <tr>
                <td>1</td>
                <td><img src="idleimg/${imap.idleimg }">${imap.name }</td>
                <td>￥${imap.transfer_price }</td>
                <td>${imap.amount }</td>
                <td>￥${imap.transfer_price*imap.amount }</td>
            </tr>
            
        </table>
        <form  name="alipayment" action="alipay.trade.page.pay.jsp" method="post">
	        <div class="clearfix">
	            <ul class="confirm_q">
	                <li class="confirm_q_f">实付款：<span>￥</span><i>${imap.transfer_price*imap.amount }</i></li>
	                <li>寄送至：
	                	<span>
			                <input type="text" name="address" />
			                <input type="hidden" name="WIDtotal_amount" value="${imap.transfer_price*imap.amount }"/>
			                <input type="hidden" name="WIDsubject" value="<%=new Random().nextInt(99999) %>"/>
			                <input type="hidden" name="WIDout_trade_no"  value="<%=new Random().nextInt(99999) %>"/>
			                <input type="hidden" name="WIDbody" />
			                <input type="hidden" name="u_idle_id" value="${imap.id}"/>
	                	</span>
	                </li>
	                <li>收货人：<span><input type="text" name="receive"></span></li>
	            	<li>联系方式：<span><input type="text" name="receive_phone"></span></li>
	            </ul>
	        </div>
	        <div class="clearfix">
	            <!-- <a href="" target="_blank" class="tijiao">提交订单</a> -->
	            <button type="submit" class="tijiao">提交订单</button>
	        </div>
        </form>
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