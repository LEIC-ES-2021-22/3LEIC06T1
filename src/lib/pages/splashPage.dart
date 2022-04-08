import 'package:flutter/material.dart';

import '../helpers/colors.dart';
import '../widgets/iconFont.dart';

class SplashPage extends StatelessWidget {
  int duration = 0;
  Widget nextPage;

  SplashPage({required this.duration,required this.nextPage});

  @override
  Widget build(BuildContext context) {

    Future.delayed(Duration(seconds: this.duration), () {
      Navigator.push(
          context,  MaterialPageRoute(builder: (context) => this.nextPage)
      );
    });

    return Scaffold(
        body: Container(
            color: AppColors.textColor,
            alignment: Alignment.center,
            child: IconFont(
                color: Colors.white,
                size: 50,
                name: "UniServices"
            )
        )

    );
  }
}
