import "package:ezy_transport/common/my_text_filled/bloc/password_visibility_bloc/password_visibility_bloc.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_svg/svg.dart";

class GenericTextField extends StatefulWidget {
  const GenericTextField({
    required this.obscureText,
    this.initialValue,
    this.controller,
    this.hintText,
    this.errorText,
    super.key,
  });

  final String? initialValue;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final String? errorText;

  @override
  State<GenericTextField> createState() => _GenericTextFieldState();
}

class _GenericTextFieldState extends State<GenericTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: BlocBuilder<PasswordVisibilityBloc, PasswordVisibilityState>(
        builder: (context, state) {
          return TextFormField(
            onChanged: (value) {
              widget.controller?.text = value;
            },
            initialValue: widget.initialValue,
            controller: widget.controller,
            obscureText: widget.obscureText && state is PasswordHidden,
            decoration: InputDecoration(
              suffixIcon: widget.obscureText
                  ? IconButton(
                      onPressed: () {
                        BlocProvider.of<PasswordVisibilityBloc>(context)
                            .add(TogglePasswordVisibility());
                      },
                      icon: state is PasswordHidden
                          ? SvgPicture.asset(
                              "assets/images/eye-slash.svg",
                            )
                          : const Icon(
                              Icons.visibility_outlined,
                              color: Colors.grey,
                            ),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              hintText: widget.hintText,
              errorText: widget.errorText,
            ),
          );
        },
      ),
    );
  }
}
