package myPackage;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.Properties;  
import javax.mail.*;  
import javax.mail.internet.*;  
  
public class SendEmail {  
 public static void sendMailToStud() {  
	 /*User details retrieving from database*/
	 String name=null;
	 String email=null;
	 String username=null;
	 String stud_password=null;
	 HashMap<String, String> map=null;
	 try {
		
		 DatabaseClass obj=new DatabaseClass();
		map=obj.getLoginCredentials();
		name=map.get("name");
		email=map.get("email");
		username=map.get("user_name");
		stud_password=map.get("password");
		
	} catch (ClassNotFoundException | SQLException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
  
  String host="mail.google.com";  
  final String user="onlineexamination.info@gmail.com";//change accordingly  
  final String password="OnlineExam";//change accordingly  
  final String SSL_FACTORY = "javax.net.ssl.SSLSocketFactory"; 
  String to=email;//change accordingly  
  
   //Get the session object  
   Properties props = new Properties(); 
   props.setProperty("mail.smtp.host", "smtp.gmail.com");
   props.setProperty("mail.smtp.socketFactory.class", SSL_FACTORY);
   props.setProperty("mail.smtp.socketFactory.fallback", "false");
   props.setProperty("mail.smtp.port", "465");
   props.setProperty("mail.smtp.socketFactory.port", "465");
   props.put("mail.smtp.auth", "true");
   props.put("mail.debug", "true");
   props.put("mail.store.protocol", "pop3");
   props.put("mail.transport.protocol", "smtp");  
   Session session = Session.getDefaultInstance(props,  
    new javax.mail.Authenticator() {  
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(user,password);  
      }  
    });  
  
   //Compose the message  
    try {  
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("Online Examination Login Credentials");  
     message.setText("Dear "+name+",\r\n"
     		+ "Your registration successfully completed, here are your login credentials\r\n\n"
     		+ "Username: "+username+"\r\n"
     		+ "Password: "+stud_password+"\r\n\n"
     		+ "Visit the online exam portal to login and start giving exam.\r\n"
     		+ "Thank You!");  
       
    //send the message  
     Transport.send(message);  
  
     System.out.println("message sent successfully...");  
   
     } catch (MessagingException e) {e.printStackTrace();}  
 }  
}  