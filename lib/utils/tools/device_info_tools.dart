import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class DeviceInfoTools {
  final DeviceInfoPlugin _deviceInfoPlugin = DeviceInfoPlugin();

  Future<String> getDeviceInfo() async {
    late String deviceInfo;
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        {
          deviceInfo = await _readAndroidBuildData();
          break;
        }
      case TargetPlatform.iOS:
        {
          deviceInfo = await _readIosDeviceInfo();
          break;
        }
      default:
        {
          deviceInfo = _getDefaultDeviceInfo();
          break;
        }
    }
    return deviceInfo;
  }

  Future<String> _readIosDeviceInfo() async {
    final iosInfo = await _deviceInfoPlugin.iosInfo;
    return iosInfo.identifierForVendor ?? const Uuid().v1();
  }

  Future<String> _readAndroidBuildData() async {
    const androidIdPlugin = AndroidId();
    final id = await androidIdPlugin.getId() ?? const Uuid().v1();
    return id;
  }

  String _getDefaultDeviceInfo() {
    return const Uuid().v1();
  }
}