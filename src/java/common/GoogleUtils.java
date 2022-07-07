package common;

import java.io.IOException;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import sample.users.UserDTO;
public class GoogleUtils {
  public static String getToken(final String code) throws ClientProtocolException, IOException {
    String response = Request.Post(KeyLoginGoogle.GOOGLE_LINK_GET_TOKEN)
        .bodyForm(Form.form().add("client_id", KeyLoginGoogle.GOOGLE_CLIENT_ID)
            .add("client_secret", KeyLoginGoogle.GOOGLE_CLIENT_SECRET)
            .add("redirect_uri",KeyLoginGoogle.GOOGLE_REDIRECT_URI).add("code", code)
            .add("grant_type", KeyLoginGoogle.GOOGLE_GRANT_TYPE).build())
        .execute().returnContent().asString();
      JsonObject jobj = new Gson().fromJson(response, JsonObject.class);
      String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
      return accessToken;
  }
  public static UserDTO getUserInfo(final String accessToken) throws ClientProtocolException, IOException {
    String link = KeyLoginGoogle.GOOGLE_LINK_GET_USER_INFO + accessToken;
    String response = Request.Get(link).execute().returnContent().asString();
    UserDTO googlePojo = new Gson().fromJson(response, UserDTO.class);
    System.out.println(googlePojo);
    return googlePojo;
  }
}