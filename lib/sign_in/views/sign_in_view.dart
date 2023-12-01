import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xtreme/core/buttons/button.dart';
import 'package:xtreme/sign_in/providers/authentication_provider.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Button(
          onPress: () {
            ref.read(authProvider).signInWithEmailAndPassword();
          },
          text: "Sign In"),
    );
  }
}
