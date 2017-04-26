package com.kaishengit;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.tomcat.util.http.fileupload.IOUtils;

public class Test {
	
	public static void main(String[] args) throws ClientProtocolException, IOException {
		
		/**
		 * 使用post方法进行跨域请求
		 */
		/*CloseableHttpClient httpClient = HttpClients.createDefault();
		HttpPost httpPost = new HttpPost("http://localhost/save");
		
		List<NameValuePair> params = new ArrayList<>();
		params.add(new BasicNameValuePair("username","tom"));
		params.add(new BasicNameValuePair("address","dongjing"));
		
		httpPost.setEntity(new UrlEncodedFormEntity(params));
		
		for(int i=0;i<5;i++){
			httpClient.execute(httpPost);
		}*/
		
		/**
		 * 使用get方法进行跨域请求
		 */
		//创建一个可以发送请求的客户端
		CloseableHttpClient httpClient = HttpClients.createDefault();
		//创建一个get请求方式
		HttpGet httpGet = new HttpGet("http://ww1.sinaimg.cn/mw690/824de770jw1epwcnivby6j20go0p00x4.jpg");
		//发出请求并接受服务端的响应
		HttpResponse response = httpClient.execute(httpGet);
		
		//判断状态码
		if(response.getStatusLine().getStatusCode() == 200){
			
			InputStream inputStream = response.getEntity().getContent();
			OutputStream outputStream = new FileOutputStream("E:/a.jpg");
			
			IOUtils.copy(inputStream, outputStream);
			
			outputStream.flush();
			outputStream.close();
			inputStream.close();
			
		}else{
			System.out.println("服务器错误"+response.getStatusLine().getStatusCode());
		}
		
		httpClient.close();
		
		
		
	}

}
