import 'package:auto_route/auto_route.dart';
import 'package:ezy_transport/common/hyperlink_text_button.dart';
import 'package:ezy_transport/common/my_submit_button.dart';
import 'package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart';
import 'package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart';
import 'package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart';
import 'package:ezy_transport/common/my_text_filled/components/confirm_password_input.dart';
import 'package:ezy_transport/common/my_text_filled/components/password_input.dart';
import 'package:ezy_transport/common/my_text_filled/components/username_or_phone_number_input.dart';
import 'package:ezy_transport/common/question_text.dart';
import 'package:ezy_transport/routes/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _usernameOrPhoneNumber = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameOrPhoneNumber.addListener(() {
      if (!_usernameOrPhoneNumber.hasFocus) {
        context.read<MyFormBloc>().add(const SignUpEmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(const SignUpPasswordUnfocused());
      }
    });
    _confirmPasswordFocusNode.addListener(() {
      if (!_confirmPasswordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(const ConfirmPasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _usernameOrPhoneNumber.dispose();
    _passwordFocusNode.dispose();
    _confirmPasswordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF0094FF),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.white,
              height: screenHeight / 5,
              width: double.infinity,
              child: Image.asset("images/logo_png.png"),
            ),
            const Spacer(flex: 2),
            const Text(
              "Sign Up",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Text(
              "New to the EzyTransport mobile app?\nSign up and let’s get started",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            UsernameOrPhoneNumberInput(focusNode: _usernameOrPhoneNumber),
            const SizedBox(height: 10),
            PasswordInput(
              focusNode: _passwordFocusNode,
              errorText: "Password is incorrect. Please try again.",
            ),
            const SizedBox(height: 10),
            ConfirmPasswordInput(
              focusNode: _confirmPasswordFocusNode,
            ),
            const SizedBox(height: 10),
            BlocBuilder<MyFormBloc, MyFormState>(
              builder: (context, state) {
                final isButtonDisabled =
                    !state.usernameOrPhone.isValid || !state.password.isValid;
                //final email = state.email.value;
                //final password = state.password.value;
                return MySubmitButton(
                  label: "Sign Up",
                  onPressed: isButtonDisabled
                      ? null
                      : () {
                          context.pushRoute(const VerifyNumberRoute());
                        },
                );
              },
            ),
            const Spacer(flex: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const QuestionText(
                  text: "Already have an account?",
                ),
                HyperlinkTextButton(
                  text: "Sign in",
                  onPressed: () {
                    context.replaceRoute(const SignInRoute());
                  },
                ),
              ],
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
