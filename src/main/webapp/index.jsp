<%@page import="java.util.*" %>
    <%!
        public double compute(double a, double b) {
            return a + b;
        }
    %>
<html>
<head>
    <meta charset="UTF-8">
    <title>lab3</title>
</head>
<body>
<%
    Double aFrom = (Double) session.getAttribute("aFrom");
    Double aTo = (Double) session.getAttribute("aTo");
    Double aStep = (Double) session.getAttribute("aStep");

    Double bFrom = (Double) session.getAttribute("bFrom");
    Double bTo = (Double) session.getAttribute("bTo");
    Double bStep = (Double) session.getAttribute("bStep");

    if (aFrom == null) {
        aFrom = 0.0;
    }
    if (aTo == null) {
        aTo = 1.0;
    }
    if (aStep == null) {
        aStep = 1.0;
    }

    if (bFrom == null) {
        bFrom = 0.0;
    }
    if (bTo == null) {
        bTo = 2.0;
    }
    if (bStep == null) {
        bStep = 1.0;
    }



    String aFromParam = request.getParameter("aFrom");
    if (aFromParam != null) {
        aFrom = Double.parseDouble(aFromParam);
        session.setAttribute("aFrom", aFrom);
    }
    String aToParam = request.getParameter("aTo");
    if (aToParam != null) {
        aTo = Double.parseDouble(aToParam);
        session.setAttribute("aTo", aTo);
    }
    String aStepParam = request.getParameter("aStep");
    if (aStepParam != null) {
        aStep = Double.parseDouble(aStepParam);
        session.setAttribute("aStep", aStep);
    }

    String bFromParam = request.getParameter("bFrom");
    if (bFromParam != null) {
        bFrom = Double.parseDouble(bFromParam);
        session.setAttribute("bFrom", bFrom);
    }
    String bToParam = request.getParameter("bTo");
    if (bToParam != null) {
        bTo = Double.parseDouble(bToParam);
        session.setAttribute("bTo", bTo);
    }
    String bStepParam = request.getParameter("bStep");
    if (bStepParam != null) {
        bStep = Double.parseDouble(bStepParam);
        session.setAttribute("bStep", bStep);
    }

    if (aFromParam != null && aToParam != null && aStepParam != null &&
            bFromParam != null && bToParam != null && bStepParam != null) {
        aFrom = Double.parseDouble(aFromParam);
        aTo   = Double.parseDouble(aToParam);
        aStep = Double.parseDouble(aStepParam);

        bFrom = Double.parseDouble(bFromParam);
        bTo   = Double.parseDouble(bToParam);
        bStep = Double.parseDouble(bStepParam);

        session.setAttribute("aFrom", aFrom);
        session.setAttribute("aTo",   aTo);
        session.setAttribute("aStep", aStep);

        session.setAttribute("bFrom", bFrom);
        session.setAttribute("bTo",   bTo);
        session.setAttribute("bStep", bStep);
    }

    out.println("<table border='1'>");
    out.println("<tr>");
    out.println("<th>a</th>");
    out.println("<th>b</th>");
    out.println("<th>c</th>");
    out.println("<th>result</th>");
    out.println("</tr>");

    for (double a = aFrom; a <= aTo; a += aStep) {
        for (double b = bFrom; b <= bTo; b += bStep) {
                out.println("<tr>");
                out.println("<td>" + a + "</td>");
                out.println("<td>" + b + "</td>");
                out.println("<td>" + compute(a, b) + "</td>");
                out.println("</tr>");
        }
    }

    out.println("</table>");
%>
<h2>Input:</h2>
<form method="get" action="index.jsp">
<p>
    a: from
    <input type="number" step="any" name="aFrom" value="<%= aFrom %>"/>
    to
    <input type="number" step="any" name="aTo" value="<%= aTo %>"/>
    step
    <input type="number" step="any" name="aStep" value="<%= aStep %>"/>
</p>
<p>
    b: from
    <input type="number" step="any" name="bFrom" value="<%= bFrom %>"/>
    to
    <input type="number" step="any" name="bTo" value="<%= bTo %>"/>
    step
    <input type="number" step="any" name="bStep" value="<%= bStep %>"/>
</p>
<p>
    <input type="submit" value="Calculate"/>
</p>
</form>

<%
    if (aFromParam != null) {
%>
<h2>Results</h2>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>a</th>
        <th>b</th>
        <th>c = a + b</th>
    </tr>
    <%
        for (double A = aFrom; A <= aTo; A += aStep) {
            for (double B = bFrom; B <= bTo; B += bStep) {
                double C = compute(A, B);
    %>
    <tr>
        <td><%= A %></td>
        <td><%= B %></td>
        <td><%= C %></td>
    </tr>
    <%
            }
        }
    %>
</table>
<%
    }
%>

</body>
</html>
