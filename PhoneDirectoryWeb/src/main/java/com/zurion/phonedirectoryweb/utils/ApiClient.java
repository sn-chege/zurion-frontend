package com.zurion.phonedirectoryweb.utils;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class ApiClient {
    private static final String API_URL = "http://localhost:8087/RestContactRegistry/contacts";

    // Search by Phone Hash
    public static JsonArray searchByPhoneHash(String phoneHash) throws Exception {
        return fetchContacts("?hashedPhone=" + phoneHash);
    }

    // Search by Masked Name & Masked Phone
    public static JsonArray searchByMaskedNameAndPhone(String maskedName, String maskedPhone) throws Exception {
        return fetchContacts("?maskedName=" + maskedName + "&maskedPhone=" + maskedPhone);
    }

    // Search by Organization
    public static JsonArray searchByOrganization(String organization) throws Exception {
        System.out.println("Searching for Organization: " + organization);
        return fetchContacts("?organization=" + URLEncoder.encode(organization, "UTF-8"));
    }

    // Common method to make API requests
    private static JsonArray fetchContacts(String queryParams) throws Exception {
        String requestUrl = API_URL + queryParams;
        System.out.println("Request URL: " + requestUrl);  // Debugging line
        HttpURLConnection conn = (HttpURLConnection) new URL(requestUrl).openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Accept", "application/json");

        if (conn.getResponseCode() != 200) {
            throw new RuntimeException("HTTP error: " + conn.getResponseCode());
        }

        // Parse response as JsonArray
        JsonElement jsonElement = JsonParser.parseReader(new InputStreamReader(conn.getInputStream()));
        conn.disconnect();

        return jsonElement.isJsonArray() ? jsonElement.getAsJsonArray() : new JsonArray();
    }
}
