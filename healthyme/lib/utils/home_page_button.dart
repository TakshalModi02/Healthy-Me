import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePageButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function onPressed;

  HomePageButton({required this.icon, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        maximumSize: Size(size.width/2.4, size.height/12),
        minimumSize: Size(size.width/8.5, size.height/12),
        backgroundColor: Color(0xffDBE6FB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Color(0xff598BED)),
        ),
      ),
      onPressed: onPressed as void Function()?,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, color: Color(0xff598BED)),
          SizedBox(width: 10),
          Text(
            text,
            style: GoogleFonts.alexandria(fontSize:size.width/24,color: Color(0xff598BED), fontWeight: FontWeight.bold,),
          ),
        ],
      ),
    );
  }
}