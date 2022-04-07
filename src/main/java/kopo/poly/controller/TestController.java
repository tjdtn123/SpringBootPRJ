package kopo.poly.controller;

import lombok.extern.slf4j.Slf4j;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.XML;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

@Slf4j
@Controller
public class TestController {
    public static int INDENT_FACTOR = 4;

    @GetMapping(value = "/test")

    public String test(ModelMap model) throws MalformedURLException,
            IOException, ParseException {
        //xml을 Json형식으로 변환
        log.info(this.getClass().getName() + ".xml to json start!");
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
        String avx = st.toString();

        JSONObject xmlJSONObj = XML.toJSONObject(st.toString());
        String jsonPrettyPrintString = xmlJSONObj.toString(INDENT_FACTOR);

//----------------------------------------------------------------------------------------
        //Json 파싱
        JSONObject Obj = new JSONObject(xmlJSONObj.toString(INDENT_FACTOR));
        JSONObject response = (JSONObject)Obj.get("response");
        JSONObject body = (JSONObject)response.get("body");
        JSONObject items = (JSONObject)body.get("items");
        JSONArray item = (JSONArray)items.get("item");

        String astroTitle = (String) ((JSONObject) item.get(0)).get("astroTitle");
        String locdate = String.valueOf(((JSONObject) item.get(0)).get("locdate"));
        String astroEvent = (String) ((JSONObject) item.get(0)).get("astroEvent");
        String astroTime = (String) ((JSONObject) item.get(0)).get("astroTime");

        model.addAttribute("astroTitle", astroTitle);
        model.addAttribute("locdate", locdate);
        model.addAttribute("astroEvent", astroEvent);
        model.addAttribute("astroTime", astroTime);

    return "Astro/test";
    }
}