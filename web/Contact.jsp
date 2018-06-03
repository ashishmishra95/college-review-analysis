<%-- 
    Document   : Contact
    Created on : Oct 18, 2017, 12:43:55 PM
    Author     : Hp
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
      <script src="js/bootstrap.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
      <!-- <link href="css/styleNew.css" rel ="stylesheet" type="text/css">-->
       <!--mdl cdn files-->
       <script 
         src = "https://storage.googleapis.com/code.getmdl.io/1.0.6/material.min.js">
      </script>
      <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" />
        <script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
      <link rel = "stylesheet" 
         href = "https://storage.googleapis.com/code.getmdl.io/1.0.6/material.indigo-pink.min.css">
      <link rel = "stylesheet" 
         href = "https://fonts.googleapis.com/icon?family=Material+Icons">	  
        <title>Contact</title>
        <style>
            .wide-card.mdl-card {
            width: 390px;
            height:600px;
         }
         #b{
             
             text-align:center;
             
         }
         .mdl-typography--display-1, .mdl-typography--display-1-color-contrast {
            font-family: "Open Sans",Helvetica,Arial,sans-serif;
            font-size: 34px;
            font-weight: 400;
            line-height: 40px;
        }
        .mdl-color-text--grey-600 {
            color: #757575!important;
        }
        .mdl-typography--subhead, .mdl-typography--subhead-color-contrast {
            font-family: "Open Sans",Helvetica,Arial,sans-serif;
            font-size: 16px;
            font-weight: 400;
            line-height: 24px;
            letter-spacing: .04em;
        }
        
        </style>
        
   </head>
   <body>
    <center>
       <table>
           <tr>
               <td>
                   <div style="padding:4em 4em 4em">
               <div class = "wide-card mdl-card mdl-shadow--4dp">
               <div style="padding: 1.5em 2em 2em;">
                <div class="mdl-typography--display-1">Contact Us</div>
                <div class="mdl-typography--subhead mdl-color-text--grey-600">
                    Fill in your contact details followed by the message and we shall get in touch with as soon as possible
                </div>
               </div>   
                     <form action ="ReviewPredictor" method="POST">
                         
                           <div style="padding: 1em 3em 3em;">
                               <div class="input-group">${response}</div>
                  <div class = "mdl-textfield mdl-js-textfield mdl-textfiled--full-width mdl-textfield--floating-label">
                      <input class = "mdl-textfield__input" type = "text" id = "eid" name="email" required/>
                     <label class = "mdl-textfield__label" for = "eid">Email</label>
                  </div>
                         </div>
                         <div style="padding: 1em 3em 3em;">
                     <div class = "mdl-textfield mdl-js-textfield  mdl-textfield--floating-label">
                     <textarea class = "mdl-textfield__input" type = "text" rows =  "2" name="feedback"
                               id = "feedbk" required/></textarea>
                     <label class = "mdl-textfield__label" for = "feedbk">Message</label>
                     </div>
                         </div>
                         <div style="padding: 1em 3em; text-align: right;">
                             <button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="submit">Submit</button>
                        </div>
                   </form>
                  </div>
                       </div>
                                      

              
               
                  
               </td>
           </tr>
           
                      
           
           
       </table>
    </center>
     
       
            
     
   </body>
    
</html>
