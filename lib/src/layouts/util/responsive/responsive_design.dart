import 'package:flutter/material.dart';

class ResponsiveDesign {
  /// Returns the screen width of the device.
  ///
  /// [context] is the BuildContext used to retrieve the screen width.
  ///
  /// The function retrieves the screen width from the MediaQuery of the given
  /// BuildContext.
  static double screenWidth(BuildContext context) {
    // Retrieve the screen width from the MediaQuery of the given BuildContext.
    return MediaQuery.of(context).size.width;
  }

  /// Returns the screen height of the device.
  ///
  /// [context] is the BuildContext used to retrieve the screen height.
  ///
  /// The function retrieves the screen height from the MediaQuery of the
  /// given BuildContext.
  static double screenHeight(BuildContext context) {
    // Retrieve the screen height from the MediaQuery of the given BuildContext.
    return MediaQuery.of(context).size.height;
  }

  /// Constants for screen width and height.
  static const double mobileWidth = 480;
  static const double tabletWidth = 768;
  static const double desktopWidth = 950;

  // Constants for mobile screen widths.
  double get mobileSmall => 320;
  double get mobileNormal => 375;
  double get mobileLarge => 414;
  double get mobileExtraLarge => 480;

  // Constants for tablet screen widths.
  double get tabletSmall => 600;
  double get tabletNormal => 768;
  double get tabletLarge => 850;
  double get tabletExtraLarge => 900;

  //Constants for desktop screen widths.

  double get desktopSmall => 950;
  double get desktopNormal => 1920;
  double get desktopLarge => 3840;
  double get desktopExtraLarge => 4096;

  /// Returns whether the device is a mobile device based on the screen width.
  ///
  /// The function checks if the device's screen width is less than the
  /// [tabletWidth] constant.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a mobile device.
  bool isMobile(BuildContext context) {
    // Check if the device's screen width is less than the [tabletWidth]
    // constant.
    return MediaQuery.of(context).size.width < tabletSmall;
  }

  /// Returns whether the device is a tablet device based on the screen width.
  ///
  /// The function checks if the device's screen width is greater than or equal
  /// to the [tabletWidth] constant and less than the [desktopWidth] constant.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a tablet device.
  bool isTablet(BuildContext context) {
    // Check if the device's screen width is greater than or equal
    // to the [tabletWidth] constant and less than the [desktopWidth] constant.
    return MediaQuery.of(context).size.width >= tabletSmall &&
        MediaQuery.of(context).size.width <= tabletExtraLarge;
  }

  /// Returns whether the device is a desktop device based on the screen width.
  ///
  /// The function checks if the device's screen width is greater than or equal
  /// to the [desktopWidth] constant.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a desktop device.
  bool isDesktop(BuildContext context) {
    // Check if the device's screen width is greater than or equal to the
    // [desktopWidth] constant.
    return MediaQuery.of(context).size.width >= desktopSmall;
  }

  /// Checks if the device is either a mobile or a tablet device.
  ///
  /// This function takes a [BuildContext] object as a parameter to retrieve
  /// the screen width. It uses the [isMobile] and [isTablet] functions to
  /// determine if the device is a mobile or a tablet device, respectively.
  ///
  /// Parameters:
  ///   - [context]: The build context used to retrieve the screen width.
  ///
  /// Returns:
  ///   - A boolean indicating whether the device is a mobile or a tablet
  ///     device.
  bool isMobileAndTablet(BuildContext context) {
    // The function checks if the device is a mobile device or a tablet
    // device. It uses the isMobile and isTablet functions to determine
    // the device type.
    return isMobile(context) || isTablet(context);
  }
}

class ContainerResponsive extends ResponsiveDesign {
  static const double mobileWidth = 480;
}

class CredentialResponsive extends ResponsiveDesign with ChangeNotifier {
  static const double CredentialResponse = 480;
}
