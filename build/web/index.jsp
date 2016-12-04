<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<!--THIS WEB APPLICATION IS STRICTLY ONLY FOR THE EDUCATIONAL PURPOSE ONLY-->

<%@page import="java.io.BufferedWriter"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="Handler.FileHandler"%>
<%@page import="Extractor.JobScrap"%>
<%@page import="Extractor.JobClass"%>
<%@page import="java.util.regex.Matcher"%>
<%@page import="java.util.regex.Pattern"%>
<%@page import="Extractor.Extractor"%>
<%@page import="Extractor.ContentExtractor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Scrap the Jobs</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

        <!-- Optional theme -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="jumbotron">
            <center><h1><strong>JOB SCRAPPER</strong></h1>
                <h3>This web Application scraps the jobs for the following sites:
                    <ul style="list-style: none">
                        <li>http://www.merojob.com</li>
                        <li>http://www.jobsnepal.com</li>
                    </ul></h3>
                <h4><strong>This application is only for the Educational purpose only</strong></h4>
                <center>
                    <form method="get" action="index.jsp">
                        <strong>Job Title</strong><input type="text" placeholder="eg:Java" name="keyword"><br/>
                        <div class="dropdown">
                            <!--<button id="dLabel" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Search at
                            <!--<span class="caret"></span>-->
                            <!--</button>-->
                            <ul class="dropdown-menu" aria-labelledby="dLabel">
                                <li value="JobsNepal">Jobs Nepal</li>
                                <li value="MeroJob">Mero Job</li>
                            </ul>
                        </div>
                        
                        <b>Search at:</b><select id="Jobsite" name="jobsite">
                            <option value="JobsNepal">Jobs Nepal</option>
                            <option value="MeroJob">Mero Job</option>
                        </select>
                        <button type="submit" name="submit" value="Scrap" class="btn btn-primary"><span class="glyphicon glyphicon-search"></span></button>
                        <button type="button" class="btn btn-success" onclick="<%new FileHandler().export();%>"><span class="glyphicon glyphicon-export" ></span></button>
                    </form>
                    </div>
                    <table class="table table-striped table table-bordered">

                        <%
                            int i = 0;
                            String value = null;
                            String keyvalue = null;
                            try {
                                if (request.getParameter("jobsite") != null && request.getParameter("keyword") != null) {
                                    value = request.getParameter("jobsite");
                                    keyvalue = request.getParameter("keyword");
                                }
                                //String keyword = request.getParameter("keyword").toString();
                                Extractor ext = new ContentExtractor();
                                JobScrap jb = new JobScrap();
                                if (value.equalsIgnoreCase("JobsNepal")) {
                                    out.println("Extraction from URL:www.jobsnepal.com");
                        %>
                        <tr style="background-color:#87CEEB">
                            <th><strong>Sno</strong>.</th>
                            <th><strong>Job Title</strong></th>
                            <th><strong>Company</strong></th>
                            <th><strong>Type</strong></th>
                        </tr>
                        <%
                            String content = ext.scrap("http://www.jobsnepal.com/simple-job-search", keyvalue);
                            //out.println(content);
                            String regEx = "<a class=\"job-item\" (.*?)>(.*?)</a>(.*?)</td>(.*?)<td >(.*?)<a href=\"(.*?)\" (.*?)>(.*?)</a>(.*?)<td class=\"center\" >(.*?)</td>";
                            Pattern p = Pattern.compile(regEx);
                            Matcher m = p.matcher(content);
                            while (m.find()) {
                                i++;
                                JobClass jc = new JobClass(i, m.group(2), m.group(8), m.group(10));
                                jb.add(jc);

                        %>
                        <tr>
                            <td><%out.println("" + i);%></td>
                            <td><%out.println(m.group(2));%></td>
                            <td><%out.println(m.group(8));%></td>
                            <td><%out.println(m.group(10));%></td>
                        </tr>

                        <%
                            }
                            /*List<JobClass> joblist= new ArrayList<>();
                            joblist=jb.get();
                            for(int j=0;j<joblist.size();j++){
                                out.println(joblist.get(i));
                            }*/
                        } else if (value.equalsIgnoreCase("MeroJob")) {
                            out.println("Extraction from URL:www.merojob.com");
                        %>
                        <tr style="background-color:#87CEEB">
                            <th><strong>Sno</strong>.</th>
                            <th><strong>Job Title</strong></th>
                            <th><strong>Company</strong></th>
                            <th><strong>Deadline</strong></th>
                        </tr>
                        <%
                            String content = ext.scrap(("http://www.merojob.com/search-new/index.php?search=" + keyvalue), keyvalue);
                            //out.println(content);
                            //String regEx = "<a href='http://www.merojob.com/hotjob/(.*?)><img src='(.*?)'(.*?)<strong(.*?)>(.*?)</strong>(.*?)'>(.*?)</a>";
                            String regEx = "<h4 class='title changefont'>(.*?)<img(.*?)</h4>(.*?)<p class(.*?)>(.*?)</p>(.*?)<span class=\"text-error\">Deadline:(.*?)</span></p>";
                            Pattern p = Pattern.compile(regEx);
                            Matcher m = p.matcher(content);
                            while (m.find()) {
                                i++;
                        %>
                        <tr>
                            <td><%out.println("" + i);%></td>
                            <td><%out.println(m.group(1));%></td>
                            <td><%out.println(m.group(5));%></td>
                            <td><%out.println(m.group(7));%></td>
                        </tr>
                        <%

                                    }

                                }

                            } catch (Exception e) {
                                out.println(e.getMessage());
                            }
                        %>
                    </table>
                    <script type="text/javascript">
                        function export(){
                            alert("file exported");
                            <%
                               out.println("hello");
                               
                            %>
                        }
                    </script>
                        <script src="jquery-3.0.0.min.js" type="text/javascript"></script>
                        </body>
                        </html>
