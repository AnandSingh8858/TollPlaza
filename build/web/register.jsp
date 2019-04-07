<%-- 
    Document   : index
    Created on : Mar 2, 2019, 9:12:01 AM
    Author     : Administrator
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Toll Plaza</title>
        <script>
            function validate()
            {
                a1=document.getElementById("t1");
                a2=document.getElementById("t2");
                a3=document.getElementById("t3");
                a4=document.getElementById("t4");
                a5=document.getElementById("t5");
                a6=document.getElementById("t6");
                a7=document.getElementById("t7");
                a8=document.getElementById("t8");
                if(a1.value.length<10)
                {
                    alert("Invalid Email!!!!");
                    a1.focus();
                    return false;
                }
                if(a2.value.length<8)
                {
                    alert("Minimum Password length is 8");
                    a2.focus();
                    return false;
                }
                if(a2.value!=a3.value)
                {
                    alert("Both Password must be same");
                    a3.focus();
                    return false;
                }
                if(a4.value.length<4)
                {
                    alert("Name is must");
                    a4.focus();
                    return false;
                }
                if(a5.value.length<4)
                {
                    alert("Father name is compulsory");
                    a5.focus();
                    return false;
                }
                if(a6.value=="")
                {
                    alert("Date of Birth is Compulsory");
                    a6.focus();
                    return false;
                }
                if(a7.value.length<10)
                {
                    alert("Please enter valid Address with state and City");
                    a7.focus();
                    return false;
                }
                if(a8.value.length!=10)
                {
                    alert("Invalid Maobile Number");
                    a8.focus();
                    return false;
                }
                return true;
            }
        </script>
    </head>
    <body>
        <img src="images/banner.jpg" width="100%" height="250px"><hr>
        <form method="post" action="thanks.jsp">
        <table align="center">
            <tr>
                <th colspan="2">User Registration</th>
            </tr>
            <tr>
                <td>Email:</td><td><input type="email" name="t1" id="t1"></td><td></td>
            </tr>
            <tr>
                <td>Password:</td><td><input type="password" name="t2" id="t2"></td><td></td>
            </tr>
            <tr>
                <td>Re-Type Password:</td><td><input type="password" name="t3" id="t3"></td><td></td>
            </tr>
            <tr>
                <td>Name:</td><td><input type="text" name="t4" id="t4"></td><td></td>
            </tr>
            <tr>
                <td>Father:</td><td><input type="father" name="t5" id="t5"></td><td></td>
            </tr>
            <tr>
                <td>Date of Birth:</td><td><input type="date" name="t6" id="t6"></td><td></td>
            </tr>
            <tr>
                <td>Address:</td><td><textarea name="t7" id="t7"></textarea></td><td></td>
            </tr>
            <tr>
                <td>Mobile:</td><td><input type="number" name="t8" id="t8"></td><td></td>
            </tr>
            <tr>
                <td></td><td><input type="submit" onClick="return validate()" name="b1" value="Register"></td><td></td>
            </tr>
        </table>
            </form>
        <hr><img src="images/footer.jpg" width="100%" height="200px">
    </body>
</html>
