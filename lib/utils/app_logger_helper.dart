import 'package:logger/logger.dart';

class AppLoggerHelper {
  static final Logger _logger = Logger(
    level: Level.debug,
    printer: PrettyPrinter(
      methodCount: 0,
      errorMethodCount: 3,
      colors: true,
      lineLength: 80,
      printEmojis: true,
    ),
  );

  static bool _isInitialized = false;

  static void initialize() {
    _isInitialized = true;
  }

  static void debug(String message) {
    if (_isInitialized) _logger.d(message);
  }
    static void info(String message) {
    if (_isInitialized) _logger.i(message);
  }

  static void warning(String message) {
    if (_isInitialized) _logger.w(message);
  }

  static void error(String message, [dynamic error, StackTrace? stackTrace]) {
    if (_isInitialized) {
      _logger.e(message, error: error, stackTrace: stackTrace);
    }
  }
}
