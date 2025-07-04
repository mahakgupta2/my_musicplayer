import 'package:app/common/widget/button/basic_app_button.dart';
import 'package:app/presentation/signup_or_signin.dart';
import 'package:flutter/material.dart';
import 'package:app/core/configs/assets/app_images.dart';

class GetStartedPage extends StatefulWidget {
  const GetStartedPage({super.key});

  @override
  State<GetStartedPage> createState() => _GetStartedPageState();
}

class _GetStartedPageState extends State<GetStartedPage> {
@override
Widget build(BuildContext context) {
  return Scaffold(
    body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(AppImages.introBG),
            ),
          ),
        ),

        // Semi-transparent black overlay
        Container(
          color: Colors.black.withOpacity(0.15),
        ),

        // Bottom content
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Music Love Being Jovial',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 21),
                Text(
                  'Hello Jovials Outthere',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[300],
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                BasicAppButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:(BuildContext Context)=>const SignupOrSignin()
                        )
                    );
                  },
                  title: 'Get Started',
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
}
