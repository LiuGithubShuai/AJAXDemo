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
		 * ʹ��post�������п�������
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
		 * ʹ��get�������п�������
		 */
		//����һ�����Է�������Ŀͻ���
		CloseableHttpClient httpClient = HttpClients.createDefault();
		//����һ��get����ʽ
		HttpGet httpGet = new HttpGet("http://ww1.sinaimg.cn/mw690/824de770jw1epwcnivby6j20go0p00x4.jpg");
		//�������󲢽��ܷ���˵���Ӧ
		HttpResponse response = httpClient.execute(httpGet);
		
		//�ж�״̬��
		if(response.getStatusLine().getStatusCode() == 200){
			
			InputStream inputStream = response.getEntity().getContent();
			OutputStream outputStream = new FileOutputStream("E:/a.jpg");
			
			IOUtils.copy(inputStream, outputStream);
			
			outputStream.flush();
			outputStream.close();
			inputStream.close();
			
		}else{
			System.out.println("����������"+response.getStatusLine().getStatusCode());
		}
		
		httpClient.close();
		
		
		
	}

}
