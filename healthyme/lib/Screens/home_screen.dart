import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:healthyme/utils/data.dart';
import 'package:healthyme/utils/home_page_button.dart';
import 'package:healthyme/utils/menus.dart';
import '../utils/app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
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
            Menu(title: 'Programs for you',tag: tag1,programTitle: programTitle1, additionalText: additionalText1,imgLink: imgLink[0],),
            Menu(title: 'Events and Experiences',tag: tag2, programTitle: programTitle2, additionalText: additionalText2,imgLink: imgLink[1], isbook: true,),
            Menu(title: 'Lessons for you',tag: tag2, programTitle: programTitle2, additionalText: additionalText3,imgLink: imgLink[1], islock: true,),
          ],
        ),
      ),
    );
  }
}