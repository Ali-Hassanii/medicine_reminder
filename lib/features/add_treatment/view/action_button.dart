import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    super.key,
    required String? label,
    TextEditingController? controller,
    void Function()? onPressed,
    TextInputType? keyboardType,
  })  : _label = label,
        _controller = controller,
        _onPressed = onPressed,
        _keyboardType = keyboardType;

  final String? _label;
  final TextEditingController? _controller;
  final void Function()? _onPressed;
  final TextInputType? _keyboardType;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Theme.of(context).colorScheme.onSecondaryContainer,
    );
    return TextField(
      controller: _controller,
      onTap: () => _onTap(context),
      // If onPressed is null, the text field is readOnly
      readOnly: _onPressed != null,
      style: textStyle,
      keyboardType: _keyboardType,
      decoration: InputDecoration(
        labelText: _label,
        labelStyle: textStyle,
        fillColor: Theme.of(context).colorScheme.secondaryContainer,
        filled: true,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(8),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (_onPressed != null) {
      FocusScope.of(context).unfocus(); // Close the keyboard
      _onPressed();
    }
  }
}

class ActionButtonOld extends StatelessWidget {
  const ActionButtonOld({
    super.key,
    required void Function()? onPressed,
    required Widget? child,
    bool expand = false,
  })  : _onPressed = onPressed,
        _child = child,
        _expand = expand;

  final void Function()? _onPressed;
  final Widget? _child;
  final bool _expand;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        //* Border
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(8),
            ),
          ),
        ),

        //* Text style
        //! Experimental: User might have already changed the font size
        // textStyle: WidgetStatePropertyAll(
        //   Theme.of(context).textTheme.headlineMedium,
        // ),

        //* Padding
        padding: WidgetStatePropertyAll(
          EdgeInsets.symmetric(vertical: 18),
        ),

        //*
        fixedSize: _expand
            ? WidgetStatePropertyAll(Size.fromWidth(double.maxFinite))
            : null,

        //* Color
        backgroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.primaryContainer,
        ),
        foregroundColor: WidgetStatePropertyAll(
          Theme.of(context).colorScheme.onPrimaryContainer,
        ),
      ),
      onPressed: _onPressed,
      child: _child,
    );
  }
}
