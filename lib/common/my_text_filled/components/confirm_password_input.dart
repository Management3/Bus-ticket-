import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";

class ConfirmPasswordInput extends StatelessWidget {
  const ConfirmPasswordInput({
    required this.focusNode,
    super.key,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: "Re-enter password",
              errorMaxLines: 2,
              errorText: state.confirmPassword.value != state.password.value
                  ? "Both passwords must match"
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              suffixIcon: IconButton(
                onPressed: () {
                  BlocProvider.of<MyFormBloc>(context)
                      .add(const ConfirmPasswordObscureChanged());
                },
                icon: state.isConfirmPasswordObscure
                    ? SvgPicture.asset(
                        "assets/images/eye-slash.svg",
                      )
                    : const Icon(
                        Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
              ),
            ),
            obscureText: state.isConfirmPasswordObscure,
            onChanged: (value) {
              context
                  .read<MyFormBloc>()
                  .add(ConfirmPasswordChanged(confirmPassword: value));
            },
            textInputAction: TextInputAction.done,
          ),
        );
      },
    );
  }
}
