import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xtreme/core/alert_dialog/top_notification.dart';
import 'package:xtreme/core/buttons/button.dart';
import 'package:xtreme/core/constants/colors.dart';
import 'package:xtreme/core/constants/text_styles.dart';
import 'package:xtreme/core/textfields/textfields.dart';
import 'package:xtreme/sign_in/providers/authentication_provider.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  late TextEditingController pass;
  late TextEditingController email;
  @override
  void initState() {
    pass = TextEditingController();
    email = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/ui/svgs/KFUPM_log.svg",
                color: primaryColor,
                width: 300,
              ),
              Text.rich(TextSpan(text: "Sign In To your KFUPM ID", style: h1.copyWith(color: accentColor))),
              const SizedBox(
                height: 50,
              ),
              RoundedTextField(
                label: "Email",
                controller: email,
              ),
              const SizedBox(
                height: 20,
              ),
              RoundedTextField(
                label: "Password",
                controller: pass,
              ),
              SizedBox(
                height: 20,
              ),
              Button(
                  width: 160,
                  height: 50,
                  onPress: () async {
                    try {
                      ref.read(authProvider).signInWithEmailAndPassword(email.text, pass.text);
                    } catch (e) {
                      TopNotification(message: e.toString(), context: context);
                    }
                  },
                  text: "Login In"),
            ],
          ),
        ),
      ],
    ));
  }
}
