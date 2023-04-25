import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/Screens/error_screen.dart';
import 'package:healthyme/utils/data.dart';
import 'package:healthyme/utils/home_page_button.dart';
import 'package:healthyme/utils/menus.dart';
import '../utils/app_bar.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  Map<String, dynamic> programData = {};
  Map<String, dynamic> lessonData = {};

  void onLoad () async {
    Map<String, dynamic> d1 = {'String': "data"};
    Map<String, dynamic> d2 = {'String': "data"};
    try {
      String url =
          "https://632017e19f82827dcf24a655.mockapi.io/api/programs";
      Response res = await http.get(Uri.parse(url));
      String data = res.body;
      programData = jsonDecode(data);

      url =
      "https://632017e19f82827dcf24a655.mockapi.io/api/lessons";
      res = await http.get(Uri.parse(url));
      data = res.body;
      lessonData = jsonDecode(data);
      setState(() {
        isLoading = false;
      });
    } catch (e) {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ErrorPage(errorMessage: e.toString(),)));
    }
    
  }

  @override
  void initState() {
    onLoad();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: isLoading?
      Container(
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(
            color:  Colors.lightBlueAccent,
            backgroundColor: Colors.white,
          ),
        ),
      )
          : Scaffold(
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: Size(screenSize.width, 50.0),
          child: CustomAppBar(),
        ),
        body: ListView(
          children: [
            Container(
              color: Color(0xffDBE6FB),
              height: screenSize.height/2.6,
              padding: EdgeInsets.fromLTRB(screenSize.width/20, screenSize.height/30, screenSize.width/20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text("Hello, Priya!",style: GoogleFonts.tinos(fontSize: screenSize.height/25, fontWeight: FontWeight.w600),),
                  ),
                  SizedBox(height: screenSize.height/65,),
                  Container(
                    child: Text("What do you wanna learn today?", style: GoogleFonts.alexandria(fontSize:screenSize.height/55 ),),
                  ),
                  SizedBox(height: screenSize.height/20,),
                  Row(
                    children: [
                      HomePageButton(icon: Icons.bookmark, text: 'Programs', onPressed: (){}),
                      SizedBox(width: screenSize.width/20,),
                      HomePageButton(icon: Icons.help_outlined, text: 'Get help', onPressed: (){})
                    ],
                  ),
                  SizedBox(height: screenSize.width/20,),
                  Row(
                    children: [
                      HomePageButton(icon: Icons.menu_book, text: 'Learn', onPressed: (){}),
                      SizedBox(width: screenSize.width/20,),
                      HomePageButton(icon: Icons.bar_chart, text: 'DD Tracker', onPressed: (){})
                    ],
                  )
                ],
              ),
            ),
            Menu(count:programData['count'], title: 'Programs for you', data: programData['items'],imgLink: imgLink[0],isDefault: true,),
            Menu(count:eventData.length, title: 'Events and Experiences', data:eventData,imgLink: imgLink[1], isDefault: false, isbook: true,),
            Menu(count:lessonData['count'], title: 'Lessons for you',data: lessonData['items'],imgLink: imgLink[1], isDefault: false),
          ],
        ),
      ),
    );
  }
}