import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Image(image: NetworkImage('https://media.istockphoto.com/id/1223918677/photo/delivery-of-medicines-home-from-the-pharmacy.jpg?s=612x612&w=0&k=20&c=FsW1jqYwNsYuPitcAI99A9B--LLkPQ9P2SvA9o3eKjI=')),
            SizedBox(
              height: 20,
            ),
            Text('Add Medicine in The Box',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () async {
              await FirebaseAuth.instance.signOut();
            }, child: Text("LogOut"))
          ],
        ),
      )
    );
  }
}

