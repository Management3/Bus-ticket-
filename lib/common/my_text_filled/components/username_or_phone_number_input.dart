import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_bloc.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_event.dart";
import "package:ezy_transport/common/my_text_filled/bloc/my_form_bloc/my_form_state.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";

class UsernameOrPhoneNumberInput extends StatelessWidget {
  const UsernameOrPhoneNumberInput({required this.focusNode, super.key});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyFormBloc, MyFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextFormField(
            initialValue: state.usernameOrPhone.value,
            focusNode: focusNode,
            decoration: InputDecoration(
              hintText: "Username/Phone number",
              errorText: state.usernameOrPhone.displayError != null
                  ? "Please enter a valid number or username"
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
            ),
            keyboardType: TextInputType.name,
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
