<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>付款</title>
</head>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.alipay.api.*"%>
<%@ page import="com.alipay.api.request.*"%>
<%@ page import="java.util.*" %>
<%
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
 %>
<%
	//获得初始化的AlipayClient
	AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
	
	//设置请求参数
	AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
	alipayRequest.setReturnUrl(AlipayConfig.return_url);
	alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
	
	//商户订单号，商户网站订单系统中唯一订单号，必填
	String out_trade_no = new String(request.getParameter("WIDout_trade_no").getBytes("ISO-8859-1"),"UTF-8");
	//付款金额，必填
	String total_amount = new String(request.getParameter("WIDtotal_amount").getBytes("ISO-8859-1"),"UTF-8");
	//订单名称，必填
	String subject = new String(request.getParameter("WIDsubject").getBytes("ISO-8859-1"),"UTF-8");
	//商品描述，可空
	String body = new String(request.getParameter("WIDbody").getBytes("ISO-8859-1"),"UTF-8");
	
	alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
			+ "\"total_amount\":\""+ total_amount +"\"," 
			+ "\"subject\":\""+ subject +"\"," 
			+ "\"body\":\""+ body +"\"," 
			+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	
	//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
	//alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
	//		+ "\"total_amount\":\""+ total_amount +"\"," 
	//		+ "\"subject\":\""+ subject +"\"," 
	//		+ "\"body\":\""+ body +"\"," 
	//		+ "\"timeout_express\":\"10m\"," 
	//		+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
	//请求参数可查阅【电脑网站支付的API文档-alipay.trade.page.pay-请求参数】章节
	
	//请求
	String result = alipayClient.pageExecute(alipayRequest).getBody();
	
	//输出
	out.println(result);
%>
<%


//生成订单信息
		//实付款金额
		String money = request.getParameter("WIDtotal_amount");
		//收货地址
		String address = request.getParameter("address");
		//收货人姓名
		String receive = request.getParameter("receive");
		//收货人联系方式
		String receive_phone = request.getParameter("receive_phone");
		
		//闲置信息id
		String u_idle_id = request.getParameter("u_idle_id");
		Map<String,Object> map = (Map<String,Object>)request.getSession().getAttribute("map_front");
		
		//当前用户id
		String uid = map.get("u_id")+"";
		
		String sql = "INSERT INTO u_idle_orders(u_idle_id,purchaser_id,create_datetime,receiver_address,receiver_name,receiver_phonenum,pay_money,order_state) "
				+ " VALUES("+u_idle_id+"  , "+uid+" , NOW(),'"+address+"','"+receive+"','"+receive_phone+"' ,'"+money+"' ,0 ) ";
		
		request.getSession().setAttribute("order_sql",sql);
		request.getSession().setAttribute("u_idle_id", u_idle_id);
		System.out.println(sql);
		System.out.println(u_idle_id);

 %>
<body>
</body>
</html>