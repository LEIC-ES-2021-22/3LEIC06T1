import 'package:flutter/material.dart';
import '../helpers/colors.dart';
import '../helpers/iconManager.dart';
import '../widgets/iconFont.dart';
import 'PageList.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            child: Stack(
                children: [
                  Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                width: 180,
                                height: 180,
                                color: Colors.black,
                                alignment: Alignment.center,
                                child: const Icon(Icons.account_balance_outlined ,color: Colors.white, size: 100)
                                ) ,
                              ),
                            const SizedBox(height:50),
                            const Text('Welcome to UniServices!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            const SizedBox(height:20),
                            const Text('Never get lost again',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: AppColors.textColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold
                                )
                            ),
                            const SizedBox(height:100),
                            FlatButton (
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => PageList()
                                  )
                                );
                              },
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              color: AppColors.textColor,
                              padding: EdgeInsets.all(25),
                              child: const Text('About Us',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                ),
                              ),
                            )
                          ]
                      )
                  )
                ]
            )
        )
    );
  }

}