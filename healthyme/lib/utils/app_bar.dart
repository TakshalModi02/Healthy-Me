import 'package:flutter/material.dart';

import 'appbarbutton.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  CustomAppBar({super.key, this.scrollOffset=0.0});

  showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(content),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        color: Color(0xffDBE6FB),
      // color: Colors.black.withOpacity((scrollOffset/350).clamp(0, 1).toDouble()),
      child: SafeArea(
        child: Row(
          children: [
            AppBarButton( onPress: () {
              showSnackBar(context, "This will open menu screen");
            }, icon: Icons.menu_outlined,),
            SizedBox(width: size.width/1.75,),
            AppBarButton( onPress: () {
              showSnackBar(context, "This will open chat screen");
            }, icon: Icons.chat_bubble_outline,),
            AppBarButton( onPress: () => {
            showSnackBar(context, "This will open notification screen")
            }, icon: Icons.notifications_none,)
          ],
        ),
      ),
    );
  }
}


