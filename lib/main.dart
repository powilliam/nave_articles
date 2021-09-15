import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nave_articles/app/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LicenseRegistry.addLicense(() async* {
    final String license = await rootBundle.loadString(
        'google_fonts/OFL.txt', cache: true);
    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
  });
  runApp(const App());
}
