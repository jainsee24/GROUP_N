<%@ page import = "java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import = "javax.servlet.http.*" %>
<%@ page import = "org.apache.commons.fileupload.*" %>
<%@ page import = "org.apache.commons.fileupload.disk.*" %>
<%@ page import = "org.apache.commons.fileupload.servlet.*" %>
<%@ page import = "org.apache.commons.io.output.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<script>
function loadfiles()
{
    var imageFiles = document.getElementById("thesis"),
    filesLength = imageFiles.files.length;
    for (var i = 0; i < filesLength; i++) {
      document.write(imageFiles.files[i].name);
    }
    
}
</script>
<%
   File file ;
   int maxFileSize = 1024 * 1024 * 10;
   int maxMemSize = 1024 * 1024 * 10;
   ServletContext context = pageContext.getServletContext();
   String filePath = "D:\\uploadDir2";
   //String abc=request.getParameter("all_emails");
   //System.out.println(abc);
   // Verify the content type
   String contentType = request.getContentType();
   
   if ((contentType.indexOf("multipart/form-data") >= 0)) {
      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      
      // maximum file size to be uploaded.
      upload.setSizeMax( maxFileSize );
      
      try { 
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();

         
         while ( i.hasNext () ) {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () ) {
               // Get the uploaded file parameters
               String fieldName = fi.getFieldName();
               System.out.println(fieldName);
               System.out.println("Heisn");
               
               String fileName = fi.getName();
               boolean isInMemory = fi.isInMemory();
               long sizeInBytes = fi.getSize();
            
               // Write the file
               if( fileName.lastIndexOf("\\") >= 0 ) {
                  file = new File( filePath + 
                  fileName.substring( fileName.lastIndexOf("\\"))) ;
               } else {
            	  continue; 
                 // file = new File( filePath + 
                  //fileName.substring(fileName.lastIndexOf("\\")+1)) ;
               
               }
               fi.write( file ) ;
               out.println("Uploaded Filename: " + filePath + " " + 
               fileName + "<br>");
               String fileLink=filePath + "\\"+ fileName.substring( fileName.lastIndexOf("\\")) ;
               if(fieldName.equals("thesis"))
               {   
               session.setAttribute("thesis_link",fileLink);
               //session.setAttribute("file_name",fileName1);
               }
               }
            else
            {
            	String name = fi.getFieldName();
                String value = fi.getString();
                System.out.println("hey "+name+"  "+value);
                session.setAttribute(name,value);
            }
         }
         
         //response.sendRedirect("automate_gmail.jsp");
         
         //MultipartRequest req=new MultipartRequest(request,filePath,1024*1024*1024);
  	   //session.setAttribute("all_emails",(String)req.getParameter("all_emails"));
  	   //session.setAttribute("subject",(String)req.getParameter("subject"));
  	   //System.out.println(req.getParameter("all_emails"));
      } catch(Exception ex) {
      System.out.println(ex);
      }
   } else {
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
%>
<center><h1><a href="automate_gmail.jsp">Click here to automate the approval process</a></h1></center>
</body>