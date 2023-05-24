
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../global/global.dart';
import '../splashScreen/my_splash_screen.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black54,
      child: ListView(
        children: [
          //header
            Padding(
            padding: const EdgeInsets.only(top: 26, bottom: 12),
            child: Column(
              children: [
                //user profile image
                SizedBox(
                  height: 130,
                  width: 130,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      sharedPreferences!.getString('photoUrl')!
                        ),
                  ),
                ),
                const SizedBox(height: 12),
                //user name
                Text(
                  sharedPreferences!.getString('name')!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          //body
          Container(
            height: 900,
            decoration:  BoxDecoration(
                gradient: LinearGradient(
              colors: [
                Colors.amber.shade300,
                Colors.amber.shade800,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            )),
            child:  Column(
              children: [
                const Divider(
                  height:.1,
                  color: Colors.white,
                  thickness: 3,
                ),
                //home
                ListTile(
                  leading: const Icon(Icons.home, color: Colors.black87,),
                  title: const Text(
                    "Home",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 3,
                ),
                //my orders
                ListTile(
                  leading: const Icon(Icons.reorder, color: Colors.black87,),
                  title: const Text(
                    "My Orders",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 3,
                ),
                //not yet received orders
                ListTile(
                  leading: const Icon(Icons.picture_in_picture_alt_rounded,  color: Colors.black87,),
                  title: const Text(
                    "Not Yet Received Orders",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 3,
                ),
                //history
                ListTile(
                  leading: const Icon(Icons.access_time, color: Colors.black87,),
                  title: const Text(
                    "History",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 3,
                ),
                //search
                ListTile(
                  leading: const Icon(Icons.search, color: Colors.black87,),
                  title: const Text(
                    "Search",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {},
                ),
                const Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 3,
                ),
                //logout
                ListTile(
                  leading: const Icon(Icons.exit_to_app,color: Colors.black87,),
                  title: const Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.black87),
                  ),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
                  },
                ),
                const Divider(
                  height: 20,
                  color: Colors.black87,
                  thickness: 3,
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
