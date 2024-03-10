import "package:auto_route/annotations.dart";
import "package:auto_route/auto_route.dart";
import "package:ezy_transport/common/constants.dart";
import "package:ezy_transport/common/hyperlink_text_button.dart";
import "package:ezy_transport/common/my_submit_button.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart";
import "package:ezy_transport/common/my_text_filled/components/email_input.dart";
import "package:ezy_transport/common/my_text_filled/components/password_input.dart";
import "package:ezy_transport/common/question_text.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

@RoutePage()
class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _usernameOrPhoneNumber = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _usernameOrPhoneNumber.addListener(() {
      if (!_usernameOrPhoneNumber.hasFocus) {
        context.read<MyFormBloc>().add(const SignInEmailUnfocused());
        FocusScope.of(context).requestFocus(_passwordFocusNode);
      }
    });
    _passwordFocusNode.addListener(() {
      if (!_passwordFocusNode.hasFocus) {
        context.read<MyFormBloc>().add(const SignInPasswordUnfocused());
      }
    });
  }

  @override
  void dispose() {
    _usernameOrPhoneNumber.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //Get screen height of device
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
              "Sign in",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            const Spacer(),
            const Text(
              "Welcome back!\nSign in and let’s get going",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            UsernameOrPhoneNumberlInput(focusNode: _usernameOrPhoneNumber),
            const SizedBox(height: 10),
            PasswordInput(
              focusNode: _passwordFocusNode,
              errorText: "Password is incorrect. Please try again.",
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: const Text(
                    "Forgot Password?",
                    style: kQuestionTextStyle,
                  ),
                  onTap: () {
                    //context.pushRoute(const ForgotPasswordRoute());
                  },
                ),
              ),
            ),
            BlocBuilder<MyFormBloc, MyFormState>(
              builder: (context, state) {
                final isButtonDisabled =
                    !state.email.isValid || !state.password.isValid;
                //final email = state.email.value;
                //final password = state.password.value;
                return MySubmitButton(
                  label: "Sign In",
                  onPressed: isButtonDisabled ? null : () {},
                );
              },
            ),
            const Spacer(flex: 6),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const QuestionText(
                  text: "Don't have an account yet?",
                ),
                HyperlinkTextButton(
                  text: "Sign Up",
                  onPressed: () {
                    //context.replaceRoute(const SignUpRoute());
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
