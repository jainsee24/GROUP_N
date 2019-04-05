<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,javax.mail.*"%>
<%@ page import="javax.mail.internet.*,javax.activation.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
 <%@ page import="java.sql.*" %> 
 <%@ page import="java.util.Date" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int[] count={-1,-1,-1};
int[] remainder={1,1,1};
 String[] persons_list=new String[3];
persons_list[0]="ajit";
persons_list[1]="seemandhar";
persons_list[2]="sharma";
String[] users_list=new String[1];
users_list[0]="ajit";
Connection con= null;
PreparedStatement ps = null;
ResultSet rs = null;
String driverName = "com.mysql.jdbc.Driver";
String url = "jdbc:mysql://localhost:3306/COMPANY";
String user11 = "root";
String dbpsw = "ajit123q";
try{
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user11, dbpsw);
	Statement stmt = con.createStatement();
	String sql="INSERT INTO approval VALUES(?,?,?,?,?);";
	PreparedStatement p=con.prepareStatement(sql);
	for(int i=0;i<3;i++)
	{
		p.setString(1,(String)session.getAttribute("name"));
		p.setString(2,null);
		p.setString(3,"false");
		p.setString(5,"false");
		p.setString(4,persons_list[i]);
		int i1=p.executeUpdate();
		System.out.println(i1+"records inserted");
	}
}
catch(Exception e)
{
	System.out.println("OOPS");
}
//users_list[1]="sharma";
for(int ii=0;ii<persons_list.length;ii++){ 
int abc=1;
int i=1;
String emails=(String)session.getAttribute("all_emails");
System.out.println(emails);
String[] to = emails.split(",");
 while(abc==1){ 
 if(count[0]==-1)
  {	  
	  try{
		    String host ="smtp.gmail.com" ;
		    String user = "kasturiajit123@gmail.com";
		    String pass = "ajit123q";
		    
		    String from = "kasturiajit123@gmail.com";
		    String subject = (String)session.getAttribute("subject");
		    String messageText = "Check out the thesis of " + (String)session.getAttribute("name");
		    messageText+="\nHere is the link http://localhost:8080/Academic_portal/approval_page_modified.jsp";
		    boolean sessionDebug = false;

		    Properties props = System.getProperties();

		    props.put("mail.smtp.starttls.enable", "true");
		    props.put("mail.smtp.host", host);
		    props.put("mail.smtp.port", "587");
		    props.put("mail.smtp.auth", "true");
		    props.put("mail.smtp.starttls.required", "true");

		    java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
		    Session mailSession = Session.getDefaultInstance(props, null);
		    mailSession.setDebug(sessionDebug);
		    Message msg = new MimeMessage(mailSession);
		    msg.setFrom(new InternetAddress(from));
		    //InternetAddress[] address = {new InternetAddress(to)};
		    InternetAddress[] toAddress = new InternetAddress[to.length];
		    //msg.setRecipients(Message.RecipientType.TO, address);
		    InternetAddress[] bccAddress = new InternetAddress[to.length];
		    for( int i1 = 0; i1 < to.length; i1++ ) {
                bccAddress[i1] = new InternetAddress(to[i1]);
            }
		    for(int i1=0;i1<to.length;i1++)
		    {
		    	msg.addRecipient(Message.RecipientType.BCC,bccAddress[i1]);
		    }
		    msg.setSubject(subject); msg.setSentDate(new Date());
		    //Create message part
		    MimeBodyPart messageBodyPart=new MimeBodyPart();
		   messageBodyPart.setContent(messageText,"text/html");
		   //Creates multipart
		   Multipart multipart=new MimeMultipart();
		   multipart.addBodyPart(messageBodyPart);
		   //adds attachments
	 String filePath=(String)session.getAttribute("thesis_link");
	 MimeBodyPart attachPart=new MimeBodyPart();
	try{
	  attachPart.attachFile(filePath);
	 }
	  catch(IOException ex)
	 {
		   ex.printStackTrace();
	   }
	  catch(Exception e)
	{
		  e.printStackTrace();
	}
	   multipart.addBodyPart(attachPart);
	   //end attachment
		    Transport transport=mailSession.getTransport("smtp");
		   transport.connect(host, user, pass);
		   msg.setContent(multipart);
		   transport.sendMessage(msg, msg.getAllRecipients());
		   transport.close();
		   System.out.println("message send successfully");
		    String res="Success";
		}catch(Exception ex)
		{
		    System.out.println("OOps");
			System.out.println(ex);
		}
  for(int j=0;j<3;j++)
  count[j]++;	  
  }
 else
 {
	 System.out.println("Entered this loop");
	 String sql = "SELECT * FROM approval WHERE phd_name=? AND person_approving=?;";
	 for(int j=0;j<3;j++){
	 try{
		 System.out.println("Entered into try block");
		 Class.forName(driverName);
			//con = DriverManager.getConnection(url, user11, dbpsw);
			PreparedStatement p=con.prepareStatement(sql);
			p.setString(1,(String)session.getAttribute("name"));
			p.setString(2,persons_list[j]);
			System.out.println("prep");	 
			ResultSet res=p.executeQuery();
			String str="";
			System.out.println("j value is "+j);
			if(res.next())
			{
				String str1=res.getString("action_done");
				if(str1.equals("true"))
				{
					String str2=res.getString("is_approved");
					if(str2.equals("true"))
					System.out.println("Thesis approved by "+persons_list[j]);
					else
					System.out.println("Thesis disapproved by "+persons_list[j]);
					count[j]=1;
					
				}
				else
				{
					try{
					    String host ="smtp.gmail.com" ;
					    String user = "kasturiajit123@gmail.com";
					    String pass = "ajit123q";
					    String to1 = to[j];
					    String from = "kasturiajit123@gmail.com";
					    String subject = "PHD thesis evaluation";
					    String messageText = "Remainder "+ remainder[j] + " for checking the thesis of " + (String)session.getAttribute("name");
					    boolean sessionDebug = false;
                        remainder[j]++;	
					    Properties props = System.getProperties();
					    props.put("mail.smtp.starttls.enable", "true");
					    props.put("mail.smtp.host", host);
					    props.put("mail.smtp.port", "587");
					    props.put("mail.smtp.auth", "true");
					    props.put("mail.smtp.starttls.required", "true");

					    java.security.Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
					    Session mailSession = Session.getDefaultInstance(props, null);
					    mailSession.setDebug(sessionDebug);
					    Message msg = new MimeMessage(mailSession);
					    msg.setFrom(new InternetAddress(from));
					    InternetAddress[] address = {new InternetAddress(to1)};
					    msg.setRecipients(Message.RecipientType.TO, address);
					    msg.setSubject(subject); msg.setSentDate(new Date());
					    //msg.setText(messageText);
					    //Create message part
					    MimeBodyPart messageBodyPart=new MimeBodyPart();
					   messageBodyPart.setContent(messageText,"text/html");
					   //Creates multipart
					   Multipart multipart=new MimeMultipart();
					   multipart.addBodyPart(messageBodyPart);
				
					    Transport transport=mailSession.getTransport("smtp");
					   transport.connect(host, user, pass);
					   msg.setContent(multipart);
					   transport.sendMessage(msg, msg.getAllRecipients());
					   transport.close();
					   System.out.println("remainder message sent successfully for "+persons_list[j]);
					}catch(Exception ex)
					{
					    System.out.println(ex);
					}
				}
			}
			//System.out.println("Database updated successfully");
		}
		catch(Exception e)
		{
			e.printStackTrace();		}
	 }
 }
 if(count[0]==1 && count[1]==1 && count[2]==1)
 {
	 abc=0;
	 break;	 
 }
	 
 System.out.println("abc is "+abc);
 Thread.sleep(60000);
 }
}
  out.println("Email processing is successful");
%>
</body>
</html>