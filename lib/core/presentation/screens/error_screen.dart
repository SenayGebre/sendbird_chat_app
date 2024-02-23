import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// [ErrorScreen] used for displaying errors in the app. It is used by the [AppRouter] to display errors. It is only shown in debug mode.
class ErrorScreen extends StatelessWidget {
  const ErrorScreen(this.error, {Key? key}) : super(key: key);

  /// The error to display.
  final Exception error;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Routing Error Screen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (kDebugMode)
                SelectableText(
                  error.toString(),
                ),
              const Text("There is an error in the routing system."),
            ],
          ),
        ),
      );
}
