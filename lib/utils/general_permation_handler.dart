// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:device_info_plus/device_info_plus.dart';

// class GeneralPermissionHandler {

//   // Permission status variables for location, media, storage, and notification
//   PermissionStatus _locationPermissionStatus = PermissionStatus.denied;
//   PermissionStatus _mediaPermissionStatus = PermissionStatus.denied;
//   PermissionStatus _storagePermissionStatus = PermissionStatus.denied;
//   PermissionStatus _notificationPermissionStatus = PermissionStatus.denied;

//   // Function to check location permission
//   Future<void> checkLocationPermission() async {
//     if (await Permission.location.isDenied) {
//       _locationPermissionStatus = PermissionStatus.denied;
//     } else {
//       _locationPermissionStatus = PermissionStatus.granted;
//     }
//   }

//   // Function to request location permission
//   Future<void> requestLocationPermission(BuildContext context) async {
//     if (await Permission.location.isDenied) {
//       await Permission.location.request();
//       if (await Permission.location.isDenied) {
//         await _showPermissionDeniedDialog(context, 'Location');
//       }
//     }
//   }

//   // Function to check media permission
//   Future<bool> checkMediaPermission() async {
//     var hasMediaPermission;
// if (Platform.isAndroid) {
//    final androidInfo = await DeviceInfoPlugin().androidInfo;
//     if (androidInfo.version.sdkInt <= 32) { 
//        hasMediaPermission = await Permission.storage.isGranted;
//       } else { 
//         // use [Permissions.photos.status]
//          hasMediaPermission = await Permission.photos.isGranted && await Permission.videos.isGranted;
//          }
//         }else { 
//           // use [Permissions.photos.status]
//          hasMediaPermission = await Permission.photos.isGranted && await Permission.videos.isGranted;
        
//          }
//    _mediaPermissionStatus = hasMediaPermission ? PermissionStatus.granted : PermissionStatus.denied;
//    return _mediaPermissionStatus.isGranted ? true : false;
//   }

//   // Function to request media permission
//   Future<void> requestMediaPermission(BuildContext context) async {
//     if ((await Permission.photos.isDenied || await Permission.videos.isDenied) && await Permission.storage.isDenied) {
//       await Permission.photos.request();
//       await Permission.videos.request();
//       await Permission.storage.request();
//       if ((await Permission.photos.isDenied || await Permission.videos.isDenied) && await Permission.storage.isDenied) {
//         await _showPermissionDeniedDialog(context, 'Media');
//       }
//     }
//   }

//   // Function to check storage permission
//   Future<void> checkStoragePermission() async {
//     if (await Permission.storage.isDenied) {
//       _storagePermissionStatus = PermissionStatus.denied;
//     } else {
//       _storagePermissionStatus = PermissionStatus.granted;
//     }
//   }

//   // Function to request storage permission
//   Future<void> requestStoragePermission(BuildContext context) async {
//     if (await Permission.storage.isDenied) {
//       await Permission.storage.request();
//       if (await Permission.storage.isDenied) {
//         await _showPermissionDeniedDialog(context, 'Storage');
//       }
//     }
//   }

//   // Function to check notification permission
//   Future<void> checkNotificationPermission() async {
//     if (await Permission.notification.isDenied) {
//       _notificationPermissionStatus = PermissionStatus.denied;
//     } else {
//       _notificationPermissionStatus = PermissionStatus.granted;
//     }
//   }

//   // Function to request notification permission
//   Future<void> requestNotificationPermission(BuildContext context) async {
//     if (await Permission.notification.isDenied) {
//       await Permission.notification.request();
//       if (await Permission.notification.isDenied) {
//         await _showPermissionDeniedDialog(context, 'Notification');
//       }
//     }
//   }

//   // Function to show dialog when permission is denied
//   Future<void> _showPermissionDeniedDialog(BuildContext context, String permissionName) async {
//     return showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Permission Denied'),
//           content: Text('You have denied $permissionName permission. Please grant the permission in settings to continue.'),
//           actions: <Widget>[
//             TextButton(
//               child: Text('OK'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//             TextButton(
//               child: Text('Open Settings'),
//               onPressed: () {
//                 openAppSettings();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }

//   // Function to check if location permission is granted
//   bool isLocationPermissionGranted() {
//     return _locationPermissionStatus.isGranted;
//   }

//   // Function to check if media permission is granted
//   bool isMediaPermissionGranted() {
//     return _mediaPermissionStatus.isGranted;
//   }

//   // Function to check if storage permission is granted
//   bool isStoragePermissionGranted() {
//     return _storagePermissionStatus.isGranted;
//   }

//   // Function to check if notification permission is granted
//   bool isNotificationPermissionGranted() {
//     return _notificationPermissionStatus.isGranted;
//   }

//   // Function to check if location permission is permanently denied
//   bool isLocationPermissionPermanentlyDenied() {
//     return _locationPermissionStatus.isPermanentlyDenied;
//   }

//   // Function to check if media permission is permanently denied
//   bool isMediaPermissionPermanentlyDenied() {
//     return _mediaPermissionStatus.isPermanentlyDenied;
//   }

//   // Function to check if storage permission is permanently denied
//   bool isStoragePermissionPermanentlyDenied() {
//     return _storagePermissionStatus.isPermanentlyDenied;
//   }

//   // Function to check if notification permission is permanently denied
//   bool isNotificationPermissionPermanentlyDenied() {
//     return _notificationPermissionStatus.isPermanentlyDenied;
//   }

//   // Function to check if location permission is denied
//   bool isLocationPermissionDenied() {
//     return _locationPermissionStatus.isDenied;
//   }

//   // Function to check if media permission is denied
//   bool isMediaPermissionDenied() {
//     return _mediaPermissionStatus.isDenied;
//   }

//   // Function to check if storage permission is denied
//   bool isStoragePermissionDenied() {
//     return _storagePermissionStatus.isDenied;
//   }

//   // Function to check if notification permission is denied
//   bool isNotificationPermissionDenied() {
//     return _notificationPermissionStatus.isDenied;
//   }

//   // Function to check if location permission is provisional
//   bool isLocationPermissionProvisional() {
//     return _locationPermissionStatus.isProvisional;
//   }

//   // Function to check if media permission is provisional
//   bool isMediaPermissionProvisional() {
//     return _mediaPermissionStatus.isProvisional;
//   }

//   // Function to check if storage permission is provisional
//   bool isStoragePermissionProvisional() {
//     return _storagePermissionStatus.isProvisional;
//   }

//   // Function to check if notification permission is provisional
//   bool isNotificationPermissionProvisional() {
//     return _notificationPermissionStatus.isProvisional;
//   }
// }
