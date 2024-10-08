import 'package:flutter/material.dart';
import 'package:wallet_app/pages/settings.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          // User's Image (Profile or Icon)
          CircleAvatar(
            radius: 20,  
            backgroundImage: NetworkImage('https://yt3.googleusercontent.com/uucuH7R67rx2LXSY5W_e_c_Bx2yrHzdBjMFDidsB0nSzS2ew0MCCRIz5srstvo0ukjCCIheX=s160-c-k-c0x00ffffff-no-rj'), 
            onBackgroundImageError: (_, __) => Icon(Icons.person),  
          ),

          // Search bar
          Expanded(  
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],  
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),  
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),

          //settings
          IconButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            }, 
            icon: Icon(Icons.settings)),


          //notifications button
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
            },
          ),

          

          
        ],
      ),
    );
  }
}



