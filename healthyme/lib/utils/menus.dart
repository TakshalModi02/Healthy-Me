import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Menu extends StatelessWidget {
  final String title;
  final List<String> tag;
  final List<String> programTitle;
  final List<String> additionalText;
  final String imgLink;
  bool isbook;
  bool islock;
  Menu({required this.title, required this.tag, required this.programTitle, required this.additionalText, required this.imgLink, this.isbook=false, this.islock=false, super.key});

  showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.height;

    return Container(
      height: screenHeight / 2.2,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.tinos(fontSize: screenHeight/34, fontWeight: FontWeight.bold),
                  // style: TextStyle(fontSize: screenHeight/33, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      'View all',
                      style: TextStyle(fontSize: screenHeight/47,color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: screenHeight/55,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: screenHeight/200,),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5, // replace with your own data list length
              itemBuilder: (context, index) {
                return SizedBox(
                  width: screenWidth/3,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Card(
                      elevation: 10,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 15, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 150, // set the height of the image container
                              child: Image.asset(imgLink,),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  tag[index],
                                  style: GoogleFonts.alexandria(fontSize: screenHeight/52.5, fontWeight: FontWeight.bold, color: Color(0xff598BED)),
                                ),
                              ),
                            ),
                            SizedBox(height: screenHeight/200,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                programTitle[index],
                                style: GoogleFonts.alexandria(fontSize: screenHeight/49, fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(height: screenHeight/500,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      additionalText[index],
                                      style: TextStyle(color: Colors.grey, fontSize: screenHeight/58.34),
                                    ),
                                  ),
                                ),
                                SizedBox(width: screenWidth/40,),
                                isbook?ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    maximumSize: Size(70, 25),
                                    minimumSize: Size(30, 25),
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Color(0xff598BED)),
                                    ),
                                  ),
                                  onPressed: (){
                                    showSnackBar(context, "Booking will be available soon!!");
                                  },
                                  child: Text(
                                    'Book',
                                    style: TextStyle(
                                      color:Color(0xff598BED),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ):
                                    islock?Expanded(child: Align(alignment: Alignment.centerRight,child: Icon(Icons.lock, color: Colors.grey,),)):Container(),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
