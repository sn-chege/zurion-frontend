<%@ page contentType="text/html; charset=UTF-8" %>
<html>
    <head>
        <title>Phone Directory</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background: linear-gradient(to right, #001f3f, #003366);
                color: white;
                text-align: center;
                margin: 0;
                padding: 20px;
            }
            h2, h3 {
                color: #f8f9fa;
            }
            form {
                background: rgba(255, 255, 255, 0.1);
                padding: 15px;
                border-radius: 8px;
                width: 40%;
                margin: 10px auto;
                box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            }
            input[type="text"] {
                width: 90%;
                padding: 8px;
                border: none;
                border-radius: 4px;
                margin-top: 5px;
            }
            input[type="submit"] {
                background: #ffcc00;
                color: black;
                border: none;
                padding: 8px 15px;
                margin-top: 10px;
                cursor: pointer;
                font-weight: bold;
                border-radius: 4px;
            }
            input[type="submit"]:hover {
                background: #ff9900;
            }
            .mb-1{
                margin-bottom: 5px;
            }
        </style>
    </head>
    <body>
        <h2>Phone Directory</h2>

        <!-- Phone Hash Search Form -->
        <h3>Search by Phone Hash</h3>
        <form action="search" method="GET" onsubmit="return validatePhoneHashSearch();">
            <div class="mb-1">
                <label>Phone Hash:</label>
            </div>
            <div class="mb-1">
                <input type="text" name="phoneHash">
            </div>
            <input type="submit" value="Search">
        </form>

        <!-- Masked Name and Masked Phone Search Form -->
        <h3>Search by Masked Name and Masked Phone</h3>
        <form action="search" method="GET" onsubmit="return validateMaskedSearch();">
            <div class="mb-1">
                <label>Masked Name:</label>
            </div> 
            <div class="mb-1"> 
                <input type="text" name="maskedName">
            </div>
            <div class="mb-1"> 
                <label>Masked Phone:</label>
            </div>
            <div class="mb-1">
                <input type="text" name="maskedPhone"><br>
            </div>
            <div class="mb-1"> 
                <input type="submit" value="Search">
            </div>
        </form>

        <!-- Organization Search Form -->
        <h3>Search by Organization</h3>
        <form action="search" method="GET" onsubmit="return validateOrganizationSearch();">
            <div class="mb-1"> 
                <label>Organization:</label>
            </div>
            <div class="mb-1"> 
                <input type="text" name="organization">
            </div>
            <div class="mb-1">
                <input type="submit" value="Search">
            </div>
        </form>

        <script>
            function validatePhoneHashSearch() {
                let phoneHash = document.getElementsByName("phoneHash")[0].value.trim();
                if (!phoneHash) {
                    alert("Please enter a phone hash.");
                    return false;
                }
                return true;
            }
            function validateMaskedSearch() {
                let maskedName = document.getElementsByName("maskedName")[0].value.trim();
                let maskedPhone = document.getElementsByName("maskedPhone")[0].value.trim();
                if (!maskedName && !maskedPhone) {
                    alert("Please enter both masked name and masked phone.");
                    return false;
                }
                return true;
            }
            function validateOrganizationSearch() {
                let organization = document.getElementsByName("organization")[0].value.trim();
                if (!organization) {
                    alert("Please enter an organization.");
                    return false;
                }
                return true;
            }
        </script>
    </body>
</html>
