///*
// * To change this license header, choose License Headers in Project Properties.
// * To change this template file, choose Tools | Templates
// * and open the template in the editor.
// */
//package sendEmail;
//
//import java.util.Properties;
//import java.util.Random;
//import java.util.logging.Level;
//import java.util.logging.Logger;
//import javax.mail.Authenticator;
//import javax.mail.Message;
//import javax.mail.MessagingException;
//import javax.mail.PasswordAuthentication;
//import javax.mail.Session;
//import javax.mail.Transport;
//import javax.mail.internet.InternetAddress;
//import javax.mail.internet.MimeMessage;
//
//public class SendMail {
//
//    public String getRandom() {
//        Random rm = new Random();
//        int number = rm.nextInt(999999);
//        return String.format("%06d", number);
//    }
//
//    public boolean sendEmail(UserSendMailDTO user) throws MessagingException {
//        boolean check = false;
//        Properties pr = new Properties();
//        pr.put("mail.smtp.auth", "true");
//        pr.put("mail.smtp.starttls.enable", "true");
//        pr.put("mail.smtp.host", "smtp.gmail.com");
//        pr.put("mail.smtp.port", "587");
//
//        String myAccountEmail = "vuntnse151234@fpt.edu.vn";
//        String password = "cutkhoiacctao";
//
//        Session session = Session.getInstance(pr, new Authenticator() {
//            @Override
//            protected PasswordAuthentication getPasswordAuthentication() {
//                return new PasswordAuthentication(myAccountEmail, password);
//            }
//        });
//        Message message = prepareMessage(session, myAccountEmail, user);
//        if (message != null) {
//            Transport.send(message);
//            check = true;
//        }
//        return check;
//    }
//
//    private static Message prepareMessage(Session session, String myAccountEmail, UserSendMailDTO user) {
//        try {
//            Message message = new MimeMessage(session);
//            message.setFrom(new InternetAddress(myAccountEmail, "Vegetable Shop"));
//            message.setRecipient(Message.RecipientType.TO, new InternetAddress(user.getEmail()));
//            message.setSubject("Email Verification Code Regarding Member account Registration");
//            message.setText("Registered successfully. Please verify your account using this code:" + user.getCode());
//            return message;
//        } catch (Exception ex) {
//            Logger.getLogger(SendMail.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return null;
//    }
//}