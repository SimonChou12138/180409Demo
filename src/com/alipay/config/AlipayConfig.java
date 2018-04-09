package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091100486244";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQDg3iwzN39uXhDAlwinBbbHReqCXZFfA/VvW+Zpjl+MT+zhhgu2mMwH0UspcBDnRpXbEiY4ng0jFNI8MVTwKV0sKqJXn6jkEbkjnRpPIH3qL8sySIWC9TZfpE9urIsZQrMo00r/aD1BZ7FTK3GM+gPPNpxVJckf+/yV8IwkkKSPhTrI5pSswxHLLq7s5gxRV9jngu9RQsD8bxfcQ6f6pqT1FT4uE9MUW0Br0sTnTm6nOMQSt5x2IjAdmO/ZqtDFLIlQkZE5NelVeSnhCGsluPFc5JTfXnqB25tW0ZOgxga6j0CNA+ps6N/nJZXINd7AmhlH09sill7f6Zowa+ZQSYsJAgMBAAECggEALjX6J1xUV74E+08OfCR0d2cq1jecVEZf/c6I/1A+2nriV0ZQyemEpGaiZ5WcI6shyK9mI2R3lqoEulH4/pHBj/4C9rbc4mGyBluWuIQY3DOOMnss1MjHr8f4euoCe+J1JwKk+u/VBsfkbQ8UesA2YDL81ZK6TlReiAGzCyCecM+xsonQAqOvAjfSbOg6dtgh0qaOPsxCS5ABQw2mSUDU24ioC+NtyHztWX0MJ1o8g5BXTqMW5BNpdZy+c7Mmtftvagr4DuBVmvGPORLRGqIsMqbDazv9831egZU5XfU9Pg1+nuyJ7fZl036F/IDFeVZe2E5O6ItC6RYcuTnYSqx+AQKBgQDyY8We4nZfuQIa3EumCdIDe3+Fp/Zs4Z3ciahPUgLQW9m/oN5Td7qzJ5zlBith9NWs4UO+f1sSmA0/qjxgO9uyYoWys3PLI8SRJh7YppL+mxdwEcpHfq8RMn9HRwisC475q0hJ94ri6CywddR8+jLFP/033tL4oU9RKIKBOP2T2QKBgQDtfohkLiKxzocezz26dureHNtTqY3/3Vb0292LeBJ+OBxURHTNKocL0F43Yn+B0/ocnGJZwpN12fm0ljJAnVjyzjg7Zguhvk3892UotV9zYzy4MPbKU3oN7OYzWf6HZ2cirrs6+/AMxlJbfoCraPaRt8E2LjR4LnblXY0QJz+isQKBgBl0BLKUkV2n7eKoM4FyEo2vEEsWwjfY0VzxT61UrVr36jvHRtF5By/8/urF5RRaQ33uAdElSoj/UpTW6ZQpdP6cffGwCn7QeLnNSPvzMghufN2V4Kn1Uaj6pobznKOEazUomWS7C+ib/OVi2jdthptUBuExEvJs7glVua6cL3SxAoGAZiQXUM6uyT4DyvJioAFo/eH3SkIP+k0diu3MmKEpgvNq66sNePejYSdafgN0x0d9uDRh8CzI8tSumkZGkpeZm8OpV5KJyiRosjVMYneu95dkk+srGNVSFw8d6lP4LhAAwV/Y0oNsOHJLFWKQwCfCc+VNyZmRo2aIaBkWBC59JeECgYB/1738HBG0qjAt5TErPY8KDSeXLk/5r7yf9miH2e9z5kPNMvLo7vvOBFjL8Sex8XNz0uFbrN09UtNwbuP9sYjsOAnhi0qR9ukxfMm3QMxnoUJJpmrgkLzsPZylE9iDmreb3/2txiHY7LPS1RVPjGX5oJRaA/9gucHeH3TKd6v0/Q==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4N4sMzd/bl4QwJcIpwW2x0Xqgl2RXwP1b1vmaY5fjE/s4YYLtpjMB9FLKXAQ50aV2xImOJ4NIxTSPDFU8CldLCqiV5+o5BG5I50aTyB96i/LMkiFgvU2X6RPbqyLGUKzKNNK/2g9QWexUytxjPoDzzacVSXJH/v8lfCMJJCkj4U6yOaUrMMRyy6u7OYMUVfY54LvUULA/G8X3EOn+qak9RU+LhPTFFtAa9LE505upzjEErecdiIwHZjv2arQxSyJUJGROTXpVXkp4QhrJbjxXOSU3156gdubVtGToMYGuo9AjQPqbOjf5yWVyDXewJoZR9PbIpZe3+maMGvmUEmLCQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	/*public static String return_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/return_url.jsp";*/
	public static String return_url = "http://localhost:8080/offcn_idle_sys/PayServlet";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

