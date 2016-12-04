/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Extractor;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.List;

/**
 *
 * @author Shreeson Shrestha
 */
public  class ContentExtractor extends Extractor{
StringBuilder content;
int counter=0;
    @Override
    public String scrap(String Url,String keyword) {
        try {
            URL url= new URL(Url);
           
            HttpURLConnection connect=(HttpURLConnection)url.openConnection();
            //connect.addRequestProperty("User-Agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0)");
           connect.setDoOutput(true);
           connect.setRequestMethod("GET");
           connect.getOutputStream().write(("Keywords="+keyword).getBytes());
            System.out.println("Connecting to"+Url);
            String line="";
            content= new StringBuilder();
            BufferedReader ureader= new BufferedReader(new InputStreamReader(connect.getInputStream()));
            
            while((line=ureader.readLine())!=null){
                content.append(line).append("\n".trim());
            }
             ureader.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
        return content.toString();
    }
}
