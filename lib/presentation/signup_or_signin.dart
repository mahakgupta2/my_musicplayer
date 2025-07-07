import 'package:app/common/widget/button/basic_app_button.dart';
import 'package:app/core/configs/assets/app_images.dart';
import 'package:app/core/configs/assets/app_vectors.dart';
import 'package:app/core/configs/theme/app_colors.dart';
import 'package:app/helpers/is_dark.dart';
import 'package:app/presentation/sign%20up.dart';
import 'package:app/presentation/signin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignupOrSignin extends StatelessWidget {
  const SignupOrSignin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(AppImages.authBG),
              ),
            ),
          ),
          Align(
            alignment:Alignment.center,
            child:Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 40
              ),
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  AppVectors.logo,
                  width: 300,
                ),
                Text(
                  'Enjoy Listening To Jovial Music',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
                SizedBox(height:10),
                Text(
                  'Jovial is a joyful and seamless music experience.',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height:25),
                Row(
                  children: [
                    Expanded(
                      flex:1,
                        child:BasicAppButton(onPressed:(){
                          Navigator.push(context,
                          MaterialPageRoute(builder:(BuildContext Context)=>SignupPage()
                          )
                          );
                        },
                            title:
                            'Register',
                        ),
                    ),
                    SizedBox(width: 20),
                    Expanded(
                      flex: 1,
                      child: TextButton(onPressed: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder:(BuildContext Context)=>SigninPage()
                            ),
                        );
                        },
                          child:Text(
                            'Sign in',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color:context.isDarkMode ? Colors.white :Colors.black,
                          ),
                        )
                    ),
                    ),
                  ],
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
