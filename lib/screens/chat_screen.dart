

import 'package:expenses/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:expenses/models/user_model.dart';
class ChatScreen extends StatefulWidget {
  final User user;
  ChatScreen({this.user});
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _chatBubble(Message message,bool isMe,bool isSameUser){
    if (isMe){
      return  Column(children: [
                         
                      Container(
                        alignment: Alignment.topRight,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width*.80,
                                ),
                          padding: EdgeInsets.all(10),
                          margin:EdgeInsets.symmetric(vertical:10),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor ,
                            borderRadius: BorderRadius.circular(15),
                             boxShadow:[ BoxShadow(
  
                           color:Colors.grey.withOpacity(.5),
  
                           spreadRadius:2,
  
                           blurRadius:5,
  
                         ),
                         ] 
                          ),
                          child:Text(message.text,style: TextStyle(color:Colors.white),
                          ),
                          ),
                      ),
                    !isSameUser ?
                       Row(
                         mainAxisAlignment: MainAxisAlignment.end,
                         children: [
                           
                  Text(message.time,style: TextStyle(fontSize:12,color:Colors.black45,
                  ),),
                   SizedBox(width:10,),
                           Container(
  

  
                     decoration:   BoxDecoration(
  
                      shape: BoxShape.circle,
  
                           boxShadow:[ BoxShadow(
  
                             color:Colors.grey.withOpacity(.5),
  
                             spreadRadius:2,
  
                             blurRadius:5,
  
                           )] 
  
                             
  
                     ),
  
                    child:CircleAvatar(
  
                      radius:20,
  
                      backgroundImage: AssetImage(message.sender.imageUrl),
  
                    )
  
                    
  
                  ),
                 
                         ],
                       ):
                       Container(child:null),
                    
                    ],
                    );
            
    }
    else{
    return Column(children: [
                    Column(children: [
                      Container(
                        alignment: Alignment.topLeft,
                              child: Container(
                                constraints: BoxConstraints(
                                  maxWidth: MediaQuery.of(context).size.width*.80,
                                ),
                          padding: EdgeInsets.all(10),
                          margin:EdgeInsets.symmetric(vertical:10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                             boxShadow:[ BoxShadow(
  
                           color:Colors.grey.withOpacity(.5),
  
                           spreadRadius:2,
  
                           blurRadius:5,
  
                         ),
                         ] 
                          ),
                          child:Text(message.text,style: TextStyle(color:Colors.black45),),
                          ),
                      ),
                      !isSameUser ?
                       Row(
                         mainAxisAlignment: MainAxisAlignment.start,
                        
                         children: [
                        
                           Container(
  

  
                     decoration:   BoxDecoration(
  
                      shape: BoxShape.circle,
  
                           boxShadow:[ BoxShadow(
  
                             color:Colors.grey.withOpacity(.5),
  
                             spreadRadius:2,
  
                             blurRadius:5,
  
                           )] 
  
                             
  
                     ),
  
                    child:CircleAvatar(
  
                      radius:20,
  
                      backgroundImage: AssetImage(message.sender.imageUrl),
  
                    )
  
                    
  
                  ),
                  SizedBox(width:10,), 
                  Text(message.time,style: TextStyle(fontSize:12,color:Colors.black45,
                  ),)
                         ],
                       ):
                       Container(child:null,)
                    
                    ],
                    ),
                      
           
          ],);
    }
  }
  _sendMessage(){

    return Container(
      padding: EdgeInsets.symmetric(horizontal:8),
      height: 50,
      color: Colors.white,
      child: Row(
        
        children: [
        Expanded(
                      child: TextField(
              decoration:InputDecoration.collapsed(hintText:"Send a message"),
              textCapitalization: TextCapitalization.sentences,
            ),
          ),
          IconButton(icon:Icon(Icons.send),iconSize: 25,color: Theme.of(context).primaryColor, onPressed: (){},
          )
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    int prevUserid;
    return Scaffold(
      backgroundColor: Color(0xFFF6F6F6),
      appBar: AppBar(
        brightness: Brightness.dark,
        centerTitle: true,
        title: RichText(
          textAlign: TextAlign.center,
          text:TextSpan(children: [
            TextSpan(text: widget.user.name ,style:TextStyle(fontSize:16,fontWeight: FontWeight.w400),
            ),
            TextSpan(text: "\n"),
            TextSpan(text: "Online",style:TextStyle(fontWeight:FontWeight.w400,fontSize:11),
            ),
          ])
        ),
        leading:IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){
          Navigator.pop(context);
        },color:Colors.white,)
         ),
        
      body: Column(children: [
        Expanded(
                
                  child:ListView.builder(
                    reverse: true,
                    padding: EdgeInsets.all(20),
                    itemCount: messages.length,
                    itemBuilder: (BuildContext context,int index){
                      final Message message=messages[index];
                      final bool isMe=message.sender.id == currentUser.id;
                      final bool isSameUser=prevUserid==message.sender.id;
                      prevUserid=message.sender.id;


          
                      return _chatBubble(message, isMe,isSameUser);
                    },
            
            
         ),
        ),
        _sendMessage(),
      
      ],
      ),
    );

  }
}