import 'package:toastification/toastification.dart';
import 'package:flutter/cupertino.dart';

import '../../generated/l10n.dart';

class ToastTools {
  const ToastTools._();

  static void showToast({required BuildContext context, required String message}) {
    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.flatColored,
      title: Text(S.current.alert),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static void showSuccess({required BuildContext context, required String message}) {
    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.flatColored,
      title: Text(S.current.success),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static void showError({required BuildContext context, required String message}) {
    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.flatColored,
      title: Text(S.current.error),
      description: Text(message),
      alignment: Alignment.topRight,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
