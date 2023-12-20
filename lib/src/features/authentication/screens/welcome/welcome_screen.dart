import 'package:flutter/material.dart';
import 'package:login_app/src/constants/image_strings.dart';
import 'package:login_app/src/constants/sizes.dart';
import 'package:login_app/src/constants/text_strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image(image: AssetImage(tWelcomeImage),height: height*0.6,),
            Column(
              children: [
                Text(tWelcomeTitle, style: Theme.of(context).textTheme.headline3,),
                Text(tWelcomeSubTitle, style: Theme.of(context).textTheme.bodyText1,textAlign: TextAlign.center,),
              ],
            ),
            Row(
              children: [
                OutlinedButton(onPressed: (){}, child: Text(tLogin)),
                ElevatedButton(onPressed: (){}, child: Text(tSignUp)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}