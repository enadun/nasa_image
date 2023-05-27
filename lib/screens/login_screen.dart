import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nasa_images/constants/app_colors.dart';
import 'package:nasa_images/constants/app_strings.dart';
import 'package:nasa_images/state/app_data.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isLoading = true;
  String _message = AppStrings.siningIn;

  @override
  Widget build(BuildContext context) {
    _signInWithFirebase(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.signIn),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(
                color: _isLoading
                    ? AppColors.kColor192A53
                    : AppColors.kColorE40513,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            _isLoading
                ? const CircularProgressIndicator()
                : TextButton(
                    onPressed: () => setState(() {
                      _isLoading = true;
                      _message = AppStrings.siningIn;
                    }),
                    child: const Text(AppStrings.reTry),
                  ),
          ],
        ),
      ),
    );
  }

  void _signInWithFirebase(BuildContext context) async {
    try {
      final userCredentials = await FirebaseAuth.instance.signInAnonymously();
      if (context.mounted && (userCredentials.user?.isAnonymous ?? false)) {
        final appData = Provider.of<AppData>(context, listen: false);
        appData.setIsLogin(true);
      } else {
        setState(() {
          _isLoading = false;
          _message = AppStrings.somethingWentWrong;
        });
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        _isLoading = false;
        switch (e.code) {
          case "operation-not-allowed":
            _message = AppStrings.youDontHavePermission;
            break;
          default:
            _message = AppStrings.somethingWentWrong;
        }
      });
    }
  }
}
