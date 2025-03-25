package com.zurion.phonedirectoryweb.servlets;

import com.google.gson.JsonArray;
import com.zurion.phonedirectoryweb.utils.ApiClient;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/search")
public class ContactSearchServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Get search parameters
        String phoneHash = request.getParameter("phoneHash");
        String maskedName = request.getParameter("maskedName");
        String maskedPhone = request.getParameter("maskedPhone");
        String organization = request.getParameter("organization");

        // Initialize the JsonArray to hold the results
        JsonArray contacts = new JsonArray();

        try {
            // Check and process each type of search
            if (phoneHash != null && !phoneHash.isEmpty()) {
                // Search by Phone Hash
                contacts = ApiClient.searchByPhoneHash(phoneHash);
            } else if (maskedName != null && !maskedName.isEmpty() && maskedPhone != null && !maskedPhone.isEmpty()) {
                // Search by Masked Name & Masked Phone
                contacts = ApiClient.searchByMaskedNameAndPhone(maskedName, maskedPhone);
            } else if (organization != null && !organization.isEmpty()) {
                // Search by Organization
                contacts = ApiClient.searchByOrganization(organization);
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Optionally log the error and set a meaningful message for the user
            request.setAttribute("errorMessage", "An error occurred while fetching contacts.");
        }

        // Set the contacts attribute to be used in the JSP
        request.setAttribute("contacts", contacts.size() > 0 ? contacts : null);

        // Forward the request to the results JSP to display the contacts
        request.getRequestDispatcher("results.jsp").forward(request, response);
    }
}
