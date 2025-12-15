import 'package:sentry_flutter/sentry_flutter.dart';

/// Utility class for error handling and reporting to Sentry
class ErrorHandler {
  /// Report an error to Sentry with context
  static Future<void> reportError(
    dynamic error,
    StackTrace? stackTrace, {
    Map<String, dynamic>? context,
    String? level,
  }) async {
    await Sentry.captureException(
      error,
      stackTrace: stackTrace,
      hint: Hint.withMap({
        'context': context ?? {},
        'level': level ?? 'error',
      }),
    );
  }

  /// Report a message to Sentry
  static Future<void> reportMessage(
    String message, {
    SentryLevel level = SentryLevel.info,
    Map<String, dynamic>? context,
  }) async {
    await Sentry.captureMessage(
      message,
      level: level,
      hint: Hint.withMap({
        'context': context ?? {},
      }),
    );
  }

  /// Add breadcrumb for debugging context
  static void addBreadcrumb(
    String message, {
    String? category,
    SentryLevel level = SentryLevel.info,
    Map<String, String>? data,
  }) {
    Sentry.addBreadcrumb(
      Breadcrumb(
        message: message,
        category: category,
        level: level,
        data: data,
      ),
    );
  }

  /// Set user context for error tracking
  static Future<void> setUser({
    String? id,
    String? email,
    String? username,
    Map<String, dynamic>? data,
  }) async {
    await Sentry.configureScope((scope) {
      scope.setUser(
        SentryUser(
          id: id,
          email: email,
          username: username,
          data: data,
        ),
      );
    });
  }

  /// Set additional context
  static Future<void> setContext(
    String key,
    Map<String, dynamic> context,
  ) async {
    await Sentry.configureScope((scope) {
      scope.setContexts(key, context);
    });
  }
}

