package com.zkhc.server.modular.system.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.io.BufferedInputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/httpConnect")
public class HttpConnectController {
    @RequestMapping(value="/httpConnectTest")
    @ResponseBody
    public Object testConnect(@RequestParam String urlStr){
        Map<String,Object> map=new HashMap<>();
        URL url;
        Reader reader;
        StringBuffer sb=new StringBuffer();
        try {
            url = new URL(urlStr);
            reader = new InputStreamReader(new BufferedInputStream(url.openStream()));
            int c;
            while ((c = reader.read()) != -1) {
                sb.append((char) c);
                map.put("status","可用");
            }
            map.put("description",sb.toString());
            reader.close();
        } catch (Exception e) {
            //e.printStackTrace();
            map.put("status","不可用");
            map.put("description",e.getMessage());
        } finally {

        }
        return JSON.toJSON(map);
    }
}
