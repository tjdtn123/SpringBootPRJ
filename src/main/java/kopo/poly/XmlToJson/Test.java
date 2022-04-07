package kopo.poly.XmlToJson;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

public class Test {
    public static void main(String[] args) {

        // 인증키 (개인이 받아와야함)
       String key = "oThJMbfU%2FWNX0OaMTfVfg7iP%2FysoIW9p%2FtfgGFtccPJjgvoMlTXF%2BEKwsesm%2Bneiugst4PREez3oA2MOkIcCgQ%3D%3D";

        // 파싱한 데이터를 저장할 변수
        String result = "";

        try {

            URL url = new URL("https://api.odcloud.kr/api/15067819/v1/uddi:bab0fa12-d7d7-4e47-975c-e35d424ae165?&returnType=JSON&serviceKey="+key);

            BufferedReader bf;

            bf = new BufferedReader(new InputStreamReader(url.openStream(), "UTF-8"));

            result = bf.readLine();

            JSONParser jsonParser = new JSONParser();
            JSONObject jsonObject = (JSONObject)jsonParser.parse(result);
            JSONArray data = (JSONArray)jsonObject.get("data");

            String Title = "";

            for(int i = 0; i < data.size(); i++) {
                JSONObject data_Title = (JSONObject)data.get(i);
                Title += data_Title.get("TITLE") + " ";
            }

            System.out.println("이름 : " + Title);
            System.out.println("총 개수: " + jsonObject.get("currentCount"));

            }catch(Exception e) {
            e.printStackTrace();
        }
    }
}