import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project_card_game/core/common/constants/app_colors.dart';

class Input extends StatefulWidget {
  final Widget? label;
  final TextInputType keyboard;
  final TextEditingController controller;
  final String? Function(String?)? validation;
  final AutovalidateMode autovalidateMode;
  final List<TextInputFormatter>? formatter;
  final String? hint;
  final int? minLines;
  final int? maxLines;
  final bool readOnly;
  final bool showError;
  final Function(String?)? onChange;
  final Function()? onTap;
  final FocusNode? focusNode;
  final Widget? prefixIcon;
  final bool? hasError;

  final bool isSearch;
  final void Function()? searchAction;

  const Input(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.text,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.hasError = false,
  })  : isSearch = false,
        searchAction = null;

  const Input.email(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.emailAddress,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.hasError = false,
  })  : isSearch = false,
        searchAction = null;

  const Input.password(
    this.controller, {
    super.key,
    this.label,
    this.keyboard = TextInputType.visiblePassword,
    this.formatter,
    this.validation,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.hint,
    this.minLines,
    this.maxLines,
    this.readOnly = false,
    this.showError = true,
    this.onTap,
    this.onChange,
    this.focusNode,
    this.prefixIcon,
    this.hasError = false,
  })  : isSearch = false,
        searchAction = null;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool visible = false;

  @override
  Widget build(BuildContext context) {
    Widget? suffix;

    if (widget.keyboard == TextInputType.visiblePassword) {
      suffix = widget.keyboard == TextInputType.visiblePassword
          ? IconButton(
              color: AppColors.black.withOpacity(0.5),
              splashColor: Colors.transparent,
              splashRadius: 0.1,
              icon: Icon(visible ? Icons.visibility : Icons.visibility_off),
              onPressed: () => setState(() => visible = !visible),
            )
          : null;
    } else if (widget.isSearch) {
      suffix = IconButton(
        color: AppColors.black.withOpacity(0.8),
        icon: const Icon(Icons.search),
        onPressed: widget.searchAction,
      );
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          key: widget.key,
          controller: widget.controller,
          autovalidateMode: widget.autovalidateMode,
          validator: widget.validation,
          inputFormatters: widget.formatter,
          keyboardType: widget.keyboard,
          minLines: widget.minLines,
          maxLines: widget.maxLines ?? 1,
          readOnly: widget.readOnly,
          obscureText: widget.keyboard == TextInputType.visiblePassword ? !visible : false,
          onChanged: widget.onChange,
          onTap: widget.onTap,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          focusNode: widget.focusNode,
          style: TextStyle(
            color: AppColors.black.withOpacity(0.8),
            fontSize: 18,
          ),
          decoration: InputDecoration(
            fillColor: AppColors.backgroundColor,
            suffixIcon: suffix,
            label: widget.label,
            prefixIcon: widget.prefixIcon,
            hintText: widget.hint,
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: AppColors.backgroundColor),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: widget.hasError ?? false ? Colors.red : AppColors.backgroundColor),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(width: 1, color: Colors.red),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
