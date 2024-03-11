import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class UsernameOrPhoneNumberlInput extends StatelessWidget {
  const UsernameOrPhoneNumberlInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            initialValue: state.email.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "Username/Phone number",
              errorText: state.email.displayError != null
                  ? "Please enter a valid email"
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              context.read<MyFormBloc>().add(EmailChanged(email: value));
            },
            textInputAction: TextInputAction.next,
          ),
        );
      },
    );
  }
}
