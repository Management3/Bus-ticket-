import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.focusNode,
    required this.errorText,
    super.key,
  });

  final FocusNode focusNode;
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "Password",
              errorMaxLines: 2,
              errorText: state.password.displayError != null ? errorText : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              suffixIcon: IconButton(
                onPressed: () {
                  BlocProvider.of<MyFormBloc>(context)
                      .add(const PasswordObscureChanged());
                },
                icon: state.isPasswordObscure
                    ? SvgPicture.asset(
                        "images/eye-slash.svg",
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
              ),
            ),
            obscureText: state.isPasswordObscure,
            onChanged: (value) {
              context.read<MyFormBloc>().add(PasswordChanged(password: value));
            },
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}
