
package be.utils;

public class Constants {

    public static String GOOGLE_CLIENT_ID = "366836700778-sk5esi4kmfmc7h7b4gkd8g9pq9nca1h8.apps.googleusercontent.com";

    public static String GOOGLE_CLIENT_SECRET = "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";

    public static String GOOGLE_REDIRECT_URI_LOGIN = "http://localhost:8084/ShopAccount/LoginGoogleHandler";
    
    public static String GOOGLE_REDIRECT_URI_SIGNUP = "http://localhost:8084/ShopAccount/SignUpGoogleHandler";

    public static String GOOGLE_LINK_GET_TOKEN = "https://accounts.google.com/o/oauth2/token";

    public static String GOOGLE_LINK_GET_USER_INFO = "https://www.googleapis.com/oauth2/v1/userinfo?access_token=";

    public static String GOOGLE_GRANT_TYPE = "authorization_code";
}
