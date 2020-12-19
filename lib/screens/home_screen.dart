import 'package:expenses/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import "package:expenses/models/message_model.dart";

class Homescreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      
      appBar:AppBar(
        brightness: Brightness.dark,
        elevation: 8,
        leading: IconButton(icon:Icon(Icons.arrow_back),color:Colors.white,onPressed:() {},
        ),
        title:Text("Inbox", style:TextStyle(color:Colors.white)),
        actions:<Widget>[
IconButton(icon:Icon(Icons.group), onPressed: (){},color: Colors.white,
),
        ]

      ),

      body:ListView.builder(itemCount: chats.length ,
        itemBuilder: (BuildContext context,int index){
          final Message chat= chats[index];
return  GestureDetector( 
  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (_)=>ChatScreen(
    user: chat.sender,
  ))),
  child:   Container(
  
              padding: EdgeInsets.symmetric(
  
                horizontal:20,
  
                vertical:15,
  
              ),
  
              child: Row(
  
                children: <Widget>[
  
                  Container(
  
                    padding: EdgeInsets.all(2),
  
                     decoration: chat.unread? BoxDecoration(
  
                       borderRadius: BorderRadius.all(Radius.circular(40)),
  
                       border: Border.all(width:2,color:Theme.of(context).primaryColor,
  
                       ),
  
                    // shape: BoxShape.circle,
  
                       boxShadow:[ BoxShadow(
  
                         color:Colors.grey.withOpacity(.5),
  
                         spreadRadius:2,
  
                         blurRadius:5,
  
                       )] 
  
                         
  
                     ):
  
            BoxDecoration(
  
                      shape: BoxShape.circle,
  
                       boxShadow:[ BoxShadow(
  
                         color:Colors.grey.withOpacity(.5),
  
                         spreadRadius:2,
  
                         blurRadius:5,
  
                       )] 
  
                         
  
                     ),
  
                    child:CircleAvatar(
  
                      radius:30,
  
                      backgroundImage: AssetImage(chat.sender.imageUrl),
  
                    )
  
                    
  
                  ),
  
                  Container(
  
                    width:MediaQuery.of(context).size.width*.65,
  
                    padding: EdgeInsets.only(left:20,),
  
                    child: Column(
  
                      children: [
  
                        Row(
  
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
  
                          children:[
  
                            Row(
  
                              children: [
  
                                Text(chat.sender.name, style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold,
  
                                ),
  
                                ),
  
                                chat.sender.isOnline ?
  
                                Container(
  
                                  margin:const EdgeInsets.only(left:5),
  
                                  width:7,
  
                                  height:7,
  
                                  decoration:BoxDecoration(
  
                                    shape:BoxShape.circle,
  
                                    color:Theme.of(context).primaryColor,
  
                                  ),
  
                                )
  
                                :
  
                                Container(child:null,),
  
                              ],
  
                            ),
  
                            Text(chat.time,style:TextStyle(fontSize: 11,fontWeight: FontWeight.w300,color:Colors.black54)),
  
  
  
                          ]
  
                        ),
  
                        SizedBox(
  
                          height:20,
  
                        ),
  
                        Container(
  
                          alignment: Alignment.topLeft,
  
                          child:Text(chat.text,style: TextStyle(
  
                          fontSize: 11,
  
                          color: Colors.black54
  
                        ),
  
                        overflow: TextOverflow.ellipsis,
  
                        maxLines: 2,
  
                        ),
  
                         ),
  
  
  
                      ],
  
                    ),
  
                  )
  
                ],
  
              ),
  
      ),
);
      },
      ),
      
      
    );
  }
}


