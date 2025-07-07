import 'package:app/common/widget/button/basic_app_button.dart';
import 'package:app/core/configs/assets/app_vectors.dart';
import 'package:app/helpers/widget/appbar/app_bar.dart';
import 'package:app/presentation/sign%20up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SigninPage extends StatelessWidget {
  const SigninPage ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height:100,
          width: 100,
        ),
      ),
      body:Padding(
        padding:EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            SizedBox(height: 50),
            _fullNameField(context),
            SizedBox(height: 20),
            _emailField(context),
            SizedBox(height: 20),
            BasicAppButton(onPressed: (){},
                title:'Sign In'),

          ],
        ),
      ),
    );
  }
  Widget _registerText(){
    return Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }
  Widget _fullNameField(BuildContext context){
    return TextField(
      decoration: InputDecoration(
        hintText: 'Full Name',
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _emailField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _passwordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Password',
      ).applyDefaults(
          Theme.of(context).inputDecorationTheme
      ),
    );
  }
  Widget _confirmpasswordField(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: ' Confirm Password',
      ).applyDefaults(
          Theme
              .of(context)
              .inputDecorationTheme
      ),
    );
  }
  Widget _signinText(BuildContext context) {
    return Padding(
      padding:EdgeInsets.symmetric(
        vertical: 30,
      ),
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Not A Member',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(onPressed:(){
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                builder:(BuildContext Context)=>SigninPage()
                ),
            );
          },
            child:Text(
                'Register Now'
            ) ,
          ),
        ],
      ),
    );
  }
}
