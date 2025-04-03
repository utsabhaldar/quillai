import 'package:flutter/material.dart';
import 'package:quillai/widgets/hint_text_widget.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final bool isPassword;
  final Widget? content;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final IconData? icon;
  final ValueChanged<String>? onChanged;
  final List<String> dropdownItems;
  final String? selectedValue;
  final Function(String?)? onDropdownChanged;

  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPassword = false,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.icon,
    this.onChanged,
    this.content,
    this.dropdownItems = const [],
    this.selectedValue,
    this.onDropdownChanged,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  FocusNode _focusNode = FocusNode();
  String? _selectedDropdownValue;
  bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _selectedDropdownValue = widget.selectedValue ??
        (widget.dropdownItems.isNotEmpty ? widget.dropdownItems.first : null);
    _obscureText = widget.isPassword; // Set initial obscure state
  }

  @override
  Widget build(BuildContext context) {
    return HintTextWidget(
      text: widget.hintText,
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Stack(
          children: [
            // TextField part
            TextField(
              controller: widget.controller,
              obscureText: widget.isPassword ? _obscureText : false,
              keyboardType: widget.keyboardType,
              style: const TextStyle(color: Colors.white),
              onChanged: widget.onChanged,
              focusNode: _focusNode,
              decoration: InputDecoration(
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.transparent,
                prefixIcon: widget.icon != null
                    ? Icon(widget.icon, color: Colors.white70)
                    : null,
                suffixIcon: widget.isPassword
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.white70,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                    width: 1,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
              ),
            ),
            if (widget.content != null)
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: widget.content!,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
