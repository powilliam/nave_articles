import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nave_articles/app/app.dart';
import 'package:nave_articles/app/di/app.dart';
import 'package:nave_articles/app/viewmodels/articles/event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final String license =
        await rootBundle.loadString('google_fonts/OFL.txt', cache: true);
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AppContainer.provideArticlesViewModel
            ..add(ArticlesEvent.gotten()),
        ),
      ],
      child: const App(),
    ),
  );
}
