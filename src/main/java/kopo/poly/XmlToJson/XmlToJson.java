package kopo.poly.XmlToJson;

import org.json.JSONObject;
import org.json.XML;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

public class XmlToJson {
    public static int INDENT_FACTOR = 4;
    public static void main(String args[]) throws MalformedURLException,
            IOException {
        HttpURLConnection conn = (HttpURLConnection) new URL("http://apis.data.go.kr/B090041/openapi/service/AstroEventInfoService/getAstroEventInfo?"
                + "ServiceKey=oThJMbfU%2FWNX0OaMTfVfg7iP%2FysoIW9p%2FtfgGFtccPJjgvoMlTXF%2BEKwsesm%2Bneiugst4PREez3oA2MOkIcCgQ%3D%3D&solYear=2017&solMonth=09").openConnection();
        conn.connect();
        BufferedInputStream bis = new BufferedInputStream(conn.getInputStream());
        BufferedReader reader = new BufferedReader(new InputStreamReader(bis));
        StringBuffer st = new StringBuffer();
        String line;
        while ((line = reader.readLine()) != null) {
            st.append(line);
        }

        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);
        System.out.println(jsonPrettyPrintString);



    }
}