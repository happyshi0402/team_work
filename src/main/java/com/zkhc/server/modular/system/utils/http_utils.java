package com.zkhc.server.modular.system.utils;

import cn.stylefeng.roses.core.reqres.response.SuccessResponseData;
import com.alibaba.fastjson.JSONObject;
import jdk.nashorn.internal.runtime.logging.Logger;
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.HttpStatus;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

public class http_utils {
    /**
    * http post 请求
    * */

    public SuccessResponseData post(String url, JSONObject jsonObj) {
        try {
            HttpClient httpclient = HttpClients.createDefault();
            HttpPost httppost = new HttpPost(url);
            httppost.addHeader("Content-Type", "application/json; charset=utf-8");

            StringEntity se = new StringEntity(jsonObj.toString(), "utf-8");
            httppost.setEntity(se);

            HttpResponse response = httpclient.execute(httppost);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                HttpEntity result = response.getEntity();
                return new SuccessResponseData(response.getStatusLine().getStatusCode(), response.getStatusLine().getReasonPhrase(), result);
            }else{
                return new SuccessResponseData(500, response.getStatusLine().getReasonPhrase(), response.getEntity());
            }
        } catch (IOException e) {
            return new SuccessResponseData(500, e.getMessage(), null);
        }
    }
}
