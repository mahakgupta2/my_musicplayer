import 'package:app/common/widget/button/basic_app_button.dart';
import 'package:app/core/configs/assets/app_vectors.dart';
import 'package:app/core/configs/usecase/auth/signin.dart';
import 'package:app/data/models/auth/signin_user_req.dart';
import 'package:app/helpers/widget/appbar/app_bar.dart';
import 'package:app/main.dart';
import 'package:app/presentation/service_locator.dart';
import 'package:app/presentation/sign%20up.dart';
import 'package:app/admin_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SigninPage extends StatefulWidget {
  const SigninPage({super.key});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _signinText(context),
      appBar: BasicAppBar(
        title: SvgPicture.asset(
          AppVectors.logo,
          height: 100,
          width: 100,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 30,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _registerText(),
            const SizedBox(height: 50),
            _emailField(context),
            const SizedBox(height: 20),
            _passwordField(context),
            const SizedBox(height: 20),
            BasicAppButton(
              onPressed: () async {
                var result = await sl<SigninUseCase>().call(
                  params: SigninUserReq(
                    email: _email.text.trim(),
                    password: _password.text.trim(),
                  ),
                );

                result.fold(
                      (l) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(l)),
                    );
                  },
                        (r) async {
                      try {
                        final userId = FirebaseAuth.instance.currentUser?.uid;

                        if (userId == null) {
                          throw Exception("No user ID found after sign in.");
                        }

                        final doc = await FirebaseFirestore.instance
                            .collection('users')
                            .doc(userId)
                            .get();

                        final role = doc.data()?['role']?.toString().toLowerCase() ?? 'user';

                        print('✅ Firebase Role Fetched: $role');

                        if (role == 'admin') {
                          print('Navigating as: ADMIN');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const AdminDashboard()),
                          );
                        } else {
                          print('Navigating as: USER');
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (_) => const PlayerPage()),
                          );
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('❌ Error: $e')),
                        );
                      }
                    }


                );
              },
              title: 'Sign In',
            ),
          ],
        ),
      ),
    );
  }

  Widget _registerText() {
    return const Text(
      'Sign In',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration: const InputDecoration(
        hintText: 'Enter Email',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      obscureText: true,
      decoration: const InputDecoration(
        hintText: 'Enter Password',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not A Member?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => SignupPage(),
                ),
              );
            },
            child: const Text('Register Now'),
          ),
        ],
      ),
    );
  }
}
