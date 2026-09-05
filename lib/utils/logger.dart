import 'dart:io';
import 'package:logger/logger.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

class AppLogger {
  static Logger? _logger;

  static Future<void> init() async {
    List<LogOutput> outputs = [ConsoleOutput()];
    String? logPath;

    if (!kIsWeb) {
      try {
        final directory = await getApplicationDocumentsDirectory();
        final logFile = File('${directory.path}/app_logs.txt');
        outputs.add(FileOutput(
          file: logFile,
          overrideExisting: false,
        ));
        logPath = logFile.path;
      } catch (e) {
        debugPrint("File logging not supported or failed: $e");
      }
    }

    _logger = Logger(
      filter: ProductionFilter(),
      printer: PrettyPrinter(
        methodCount: 2,
        errorMethodCount: 8,
        lineLength: 120,
        colors: true,
        printEmojis: true,
      ),
      output: MultiOutput(outputs),
    );
    
    if (logPath != null) {
      _logger?.i("Logger initialized at $logPath");
    } else {
      _logger?.i("Logger initialized (Console only)");
    }
  }

  static void t(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.t(message, error: error, stackTrace: stackTrace);
  }

  static void d(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.d(message, error: error, stackTrace: stackTrace);
  }

  static void i(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.i(message, error: error, stackTrace: stackTrace);
  }

  static void w(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.w(message, error: error, stackTrace: stackTrace);
  }

  static void e(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.e(message, error: error, stackTrace: stackTrace);
  }

  static void f(dynamic message, [dynamic error, StackTrace? stackTrace]) {
    _logger?.f(message, error: error, stackTrace: stackTrace);
  }
}
