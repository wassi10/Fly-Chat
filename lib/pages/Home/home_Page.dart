import 'package:flutter/material.dart';
import 'package:more_practice/pages/Home/chat.dart';
import 'package:more_practice/pages/Home/recent_chat.dart';
import 'package:more_practice/pages/Home/profile_page.dart';

import '../../theme/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        title: const Text('Chat', textAlign: TextAlign.center,),
        backgroundColor: primaryColor,

        actions: [

          IconButton(

              onPressed: (){
                showSearch(context: context, delegate: CustomSearch());

              },
              icon: Icon(Icons.search, size: 25,),
          ),
        ],
      ),

     floatingActionButton: null,
     body: DefaultTabController(
         length: 3,

         child: Stack(
           children: [
             const SizedBox(
               height: double.infinity,
               width: double.infinity,

             ),

             Scaffold(
               backgroundColor: primaryColor,
               bottomNavigationBar: const Padding(
                   padding: EdgeInsets.only(bottom: 8.0),

                 child:  TabBar(
                     labelColor: blackColor,

                     // indicatorColor: blackColor,
                     indicator: UnderlineTabIndicator(
                       borderSide: BorderSide(color: blackColor, width: 4),
                       insets: EdgeInsets.only(bottom: 46)
                     ),
                     unselectedLabelColor: whiteColor,
                     tabs: [

                       Tab(
                         icon: Icon(Icons.chat_bubble, size:30, ),
                       ),
                       Tab(
                         icon: Icon(Icons.people, size: 30,),
                       ),

                       Tab(
                         icon: Icon(Icons.person, size:30,),
                       ),
                     ]
                 ),
                  ),
               body: TabBarView(children: [
                  ChatBubble(),
                 ChatPage(),
                 ProfilePage(),

               ]),

             ),
           ],
         )
     ),

    );
  }
}

//search button
class CustomSearch extends SearchDelegate {
  List<String> allData = [
    'Wassi',
    'khadiza',
    'Bangladesh',
    'America',
    'UK',
    'Qatar'
  ];

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(onPressed: () {
        query = '';
      }, icon: Icon(Icons.clear),),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {
      close(context, null);
    }, icon: Icon(Icons.arrow_back),);
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var item in allData) {
      if (item.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return ListTile(
            title: Text(result),
          );
        }
    );
  }

}


// import 'package:flutter/material.dart';
// import 'package:more_practice/pages/Home/recent_chat.dart';
// import 'package:more_practice/pages/Home/profile_page.dart';
// import 'package:more_practice/theme/colors.dart';
//
// import 'chat.dart';
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           backgroundColor: primaryColor,
//           appBar: AppBar(
//             centerTitle: true,
//             title: const Text('Chat', textAlign: TextAlign.center,),
//             backgroundColor: primaryColor,
//           ),
//
//           body: Column(
//             children: [
//               TabBar(
//                 unselectedLabelColor: whiteColor,
//                 indicatorColor: blackColor,
//                 labelColor: blackColor,
//                   tabs: [
//
//                     Tab(
//
//                       icon: Icon(Icons.home, size: 30,),
//
//                     ),
//                     Tab(
//                       icon: Icon(Icons.chat_bubble, size:30, ),
//
//                     ),
//                     Tab(
//                       icon: Icon(Icons.person, size:30,),
//
//                     ),
//                   ]
//               ),
//               Expanded(child: TabBarView(children: [
//                 ChatPage(),
//                 ChatBubble(),
//                 ProfilePage(),
//               ])),
//             ],
//           ),
//         )
//     );
//   }
// }
