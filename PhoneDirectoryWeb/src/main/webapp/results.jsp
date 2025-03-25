<%@ page import="com.google.gson.JsonArray, com.google.gson.JsonObject, com.google.gson.JsonElement" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>Search Results</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #001f3f, #003366);
            color: white;
            text-align: center;
            margin: 0;
            padding: 20px;
        }
        h2 {
            color: #f8f9fa;
        }
        .results-container {
            width: 70%;
            margin: auto;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .contact-card {
            background: rgba(255, 255, 255, 0.1);
            padding: 15px;
            border-radius: 8px;
            width: 800px;
            margin: 15px;
            text-align: left;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }
        .contact-card strong {
            color: #ffcc00;
        }
        .mb-2{
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <h2>Search Results</h2>
    <div class="results-container">
        <% 
            JsonArray contacts = (JsonArray) request.getAttribute("contacts");
            if (contacts != null && contacts.size() > 0) { 
                for (JsonElement element : contacts) { 
                    JsonObject contact = element.getAsJsonObject();
                    String fullName = contact.has("fullName") ? contact.get("fullName").getAsString() : "N/A";
                    String phone = contact.has("phoneNumber") ? contact.get("phoneNumber").getAsString() : "N/A";
                    String email = contact.has("email") ? contact.get("email").getAsString() : "N/A";
                    String idNumber = contact.has("idNumber") ? contact.get("idNumber").getAsString() : "N/A";
                    String dateOfBirth = contact.has("dateOfBirth") ? contact.get("dateOfBirth").getAsString() : "N/A";
                    String gender = contact.has("gender") ? contact.get("gender").getAsString() : "N/A";
                    String organization = contact.has("organization") ? contact.get("organization").getAsString() : "N/A";
                    String maskedName = contact.has("maskedName") ? contact.get("maskedName").getAsString() : "N/A";
                    String maskedPhone = contact.has("maskedPhone") ? contact.get("maskedPhone").getAsString() : "N/A";
                    String hashedPhone = contact.has("hashedPhone") ? contact.get("hashedPhone").getAsString() : "N/A";
        %>
            <div class="contact-card">
               <div class="mb-2">
                   <strong>ID:</strong> <%= contact.has("id") ? contact.get("id").getAsInt() : "N/A"%>
               </div>
               <div class="mb-2">
                   <strong>Full Name:</strong> <%= fullName%>
               </div>
               <div class="mb-2">
                   <strong>Phone:</strong> <%= phone%>
               </div>
               <div class="mb-2">
                   <strong>Email:</strong> <%= email%>
               </div>
               <div class="mb-2">
                   <strong>ID Number:</strong> <%= idNumber%>
               </div>
               <div class="mb-2">
                   <strong>Date of Birth:</strong> <%= dateOfBirth%>
               </div>
               <div class="mb-2">
                   <strong>Gender:</strong> <%= gender%>
               </div>
               <div class="mb-2">
                   <strong>Organization:</strong> <%= organization%>
               </div>
               <div class="mb-2">
                   <strong>Masked Name:</strong> <%= maskedName%>
               </div>
               <div class="mb-2">
                   <strong>Masked Phone:</strong> <%= maskedPhone%>
               </div>
               <div class="mb-2">
                   <strong>Hashed Phone:</strong> <%= hashedPhone%>
               </div>
            </div>
        <% 
                } 
            } else { 
        %>
            <p>No results found.</p>
        <% } %>
    </div>
</body>
</html>
