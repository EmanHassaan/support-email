

import 'package:flutter/material.dart';
import 'componant/displaycustomcircular.dart';
import 'componant/showcustomerror.dart';
import 'package:url_launcher/url_launcher.dart';

import 'roundButton.dart';
import 'package:toast/toast.dart';

void main()=>runApp(
  MaterialApp(
home:Support_email(),
debugShowCheckedModeBanner: false,
  )
);

class Support_email extends StatefulWidget {
  @override
  _Support_emailState createState() => _Support_emailState();
}

class _Support_emailState extends State<Support_email> {
  TextEditingController _namecontroller = new TextEditingController();
  TextEditingController _addresscontroller = new TextEditingController();
  TextEditingController _phonecontroller = new TextEditingController();
  TextEditingController _massagecontroller = new TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   String name;
   String phone;
   String message;
   String address;
   String mail ="220160105@fa-hists.edu.eg";
  
  bool _validatePhone = false;
  bool _validatename = false;
  bool _validateaddress =false;
  bool _validatmessage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title:Text(" Support Email"),
        backgroundColor:Colors.blue,
        leading:IconButton(icon: Icon(Icons.arrow_back),
        onPressed:(){

        },
        ),
      ),
      
    body: SingleChildScrollView(
      child: Container(
        color:Color(0xffE5E5E5),
        child:Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              ),

              Container(
                child:Align(
                  child: Material(
                    color:Colors.white,
                    elevation:14.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color.fromRGBO(143, 148, 250, 1),
                    child:Container(
                      width:355.0,
                      height:550.0,
                      child: Form(
                        key: _formKey,
                         child: Column(
                          children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top:10),
                            child: Container(
                              child:TextField(
                                controller:_namecontroller,
                                decoration:InputDecoration(
                                  errorText: _validatename
                                  ?"Please enter your name"
                                  :null  ,
                                  hintText:"Name" ,
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20.0) 
                                    )
                                  ),
                                  onChanged: (newname)=>name=newname,
                                 // style: TextStyle(height:2.0),
                              )
                            ),
                            ),
                            Padding(
                            padding: EdgeInsets.only(top:20),
                            child: Container(
                              child:TextField(
                                controller:_addresscontroller,
                                decoration:InputDecoration(
                                  errorText: _validateaddress
                                  ? "Please enter your address"
                                  : null,
                                  hintText:"Address" ,
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20.0) 
                                    )
                                  ),
                                  onChanged: (newaddress)=>address=newaddress,
                                 // style: TextStyle(height:2.0),
                              )
                            ),
                            ),
                            Padding(
                            padding: EdgeInsets.only(top:20),
                            child: Container(
                              child:TextField(
                                controller:_phonecontroller,
                                decoration:InputDecoration(
                                  errorText: _validatePhone
                                  ?"please, enter your phone number "
                                  :null,
                                  hintText:"Phone Number" ,
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20.0) 
                                    )
                                  ),
                                  onChanged: (newphone)=> phone=newphone,
                                 style: TextStyle(height:1.0),
                              )
                            ),
                            ),
                             Padding(
                            padding: EdgeInsets.only(top:20),
                            child: Container(
                              child:TextField(
                                controller: _massagecontroller,
                                decoration:InputDecoration(
                                  errorText: _validatmessage
                                  ?"please enter message "
                                  :null,
                                  hintText:"message" ,
                                  border:OutlineInputBorder(
                                    borderRadius:BorderRadius.circular(20.0) 
                                    )
                                  ),
                                  onChanged: (newemessage)=> message= newemessage,
                                  style: TextStyle(height:5.0),
                              )
                            ),
                            ),
                             Padding(
                            padding: EdgeInsets.only(top:20),
                            child: Container(
                              child:RoundedButton(
                                text:"Send",
                                press:(){
                                  formValidation();
                                   customLaunch(
                        'mailto:220160105@fa-hists.edu.eg?subject=your%20subject&body=your%20body');
                        //_sendMail(name, phone, address, message)

                                  }
                                
                              )
                            ),
                            ),
                    
                          ],
                        ),
                      ),
                    )
                  ) ,
                  )
              ),
             
          ]
        )
      ),
    ),
      
    );
  }
//customLaunch(
    //                    'mailto:your@email.com?subject=test%20subject&body=test%20body');
void _sendMail(mail, String name,String phone,String address,String message)async{
  final url =" mailto :$mail?name=$name&address=$address&phone=$phone&message=$message";
  if(await canLaunch(url)){
    await launch(url);

  } else{
    
  print("could not be launch" );
  }

 }



void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }







 showToast(String msg,{int duration,int gravity}){
Toast.show(msg, context,duration: duration,gravity: gravity);
 }
  formValidation() {
    setState(() {
      if (_namecontroller.text.isEmpty && _addresscontroller.text.isEmpty&&_phonecontroller.text.isEmpty&&_massagecontroller.text.isEmpty) {
        setState(() {
          _validatePhone = true;
          _validateaddress = true;
          _validatename = true;
          _validatmessage = true;
        });
      } else if (_namecontroller.text.isEmpty) {
        setState(() {
          _validatePhone = false;
          _validateaddress = false;
          _validatmessage= false;
          _validatename = true;
        });
      } else if (_addresscontroller.text.isEmpty) {
        setState(() {
          _validatePhone = false;
          _validatename = false;
          _validatmessage = false;
          _validateaddress = true;
        });
        }else if(_massagecontroller.text.isEmpty){
         setState(() {
           _validatePhone = false;
           _validateaddress =false;
           _validatename = false;
           _validatmessage = true;
         });
        }
       else {
        displayCustomCircular(scaffoldKey.currentContext);
        setState(() {
          _validatePhone = false;
          _validateaddress = false;
          _validatename = false;
        });

        
      }});
  }
  
  

}
