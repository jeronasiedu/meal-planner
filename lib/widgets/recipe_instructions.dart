import 'package:flutter/material.dart';

showRecipeInstructions({required BuildContext context, required String instructions}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    showDragHandle: true,
    builder: (context) {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            instructions,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    },
  );
}
