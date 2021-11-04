import 'package:catcher/catcher.dart';

class CatcherConfig {
  final EmailAutoHandler emailAutoHandler;
  final bool enableInDebugMode;

  CatcherConfig({
    this.enableInDebugMode = false,
    EmailAutoHandler? emailAutoHandler,
  }) : emailAutoHandler = emailAutoHandler ?? ElkoodEmailAutoHandler();
}

class ElkoodEmailAutoHandler extends EmailAutoHandler {
  ElkoodEmailAutoHandler({
    String smtpHost = 'mail.elkood.com',
    int smtpPort = 465,
    String senderEmail = 'bugreport@elkood.com',
    String senderName = 'Anonymous Elkood App',
    String senderPassword = 'oyhzC0hCB1rD',
    List<String> recipients = const [
      'abdalqader27.najjar@gmailcom',
    ],
    bool enableSsl = true,
    bool sendHtml = true,
    bool printLogs = false,
    String? emailTitle,
    String? emailHeader,
    bool enableDeviceParameters = true,
    bool enableApplicationParameters = true,
    bool enableStackTrace = true,
    bool enableCustomParameters = true,
  }) : super(
          smtpHost,
          smtpPort,
          senderEmail,
          senderName,
          senderPassword,
          recipients,
          enableSsl: enableSsl,
          sendHtml: sendHtml,
          printLogs: printLogs,
          emailTitle: emailTitle,
          emailHeader: emailHeader,
          enableDeviceParameters: enableDeviceParameters,
          enableApplicationParameters: enableApplicationParameters,
          enableStackTrace: enableStackTrace,
          enableCustomParameters: enableCustomParameters,
        );
}
