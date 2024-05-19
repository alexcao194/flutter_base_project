import 'package:flutter/material.dart';

class DialogTools {
  static void showPopDialog({required BuildContext context, required Function onConfirm}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Xác nhận"),
          content: const Text("Bạn có chắc chắn muốn thoát không?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Hủy"),
            ),
            TextButton(
              onPressed: () {
                onConfirm();
              },
              child: const Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  static showQRDialog ({required BuildContext context, required String qrCode}) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("QR Code"),
          content: Image.network(qrCode),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Đóng"),
            ),
          ],
        );
      },
    );
  }
}