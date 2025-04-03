import 'package:get/get.dart';
import 'package:quillai/presentation/dashboard_screen/binding/dashboard_binding.dart';
import 'package:quillai/presentation/dashboard_screen/screen/dashboard_screen.dart';
import 'package:quillai/presentation/profile/binding/profile_binding.dart';
import 'package:quillai/presentation/profile/screen/profile_screen.dart';
import 'package:quillai/presentation/settings/binding/settings_binding.dart';
import 'package:quillai/presentation/settings/screen/settings_screen.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/privacy_policy_screen/binding/privacy_policy_binding.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/privacy_policy_screen/screen/privacy_policy_screen.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/terms_and_conditions/binding/terms_and_conditions_binding.dart';
import 'package:quillai/presentation/sidebar_screen_details/dashboard_sidebar_details/terms_and_conditions/screen/terms_and_conditions_screen.dart';
import 'package:quillai/presentation/sign_in_screen/binding/sign_in_binding.dart';
import 'package:quillai/presentation/sign_in_screen/screen/sign_in_screen.dart';
import 'package:quillai/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:quillai/presentation/sign_up_screen/screen/sign_up_screen.dart';
import 'package:quillai/presentation/splash_screen/binding/splash_binding.dart';
import 'package:quillai/presentation/splash_screen/screen/splash_screen.dart';
import 'package:quillai/presentation/verification_screen/binding/verification_binding.dart';
import 'package:quillai/presentation/verification_screen/screen/verification_screen.dart';

class AppRoutes {
  // Flow 1
  static const splashScreen = '/splash_screen';
  static const signInScreen = '/sign_in_screen';
  static const signUpScreen = '/sign_up_screen';
  static const verificationScreen = '/verification_screen';
  static const dashboardScreen = '/dashboard_screen';

  // Flow 2
  static const privacyPolicyScreen = '/privacy_policy_screen';
  static const termsAndConditionsScreen = '/terms_and_conditions';
  static const multiFactorAuthenticationScreen = '/multi_factor_authentication';
  static const settings = '/settings';
  static const profile = '/profile';

  static List<GetPage> pages = [
    // Flow 1
    // main screens
    GetPage(
      name: splashScreen,
      page: () => const SplashScreen(),
      bindings: [SplashBinding()],
    ),
    GetPage(
      name: signInScreen,
      page: () => const SignInScreen(),
      bindings: [SignInBinding()],
    ),
    GetPage(
      name: signUpScreen,
      page: () => const SignUpScreen(),
      bindings: [SignUpBinding()],
    ),
    GetPage(
      name: verificationScreen,
      page: () => const VerificationScreen(),
      bindings: [VerificationBinding()],
    ),
    GetPage(
      name: dashboardScreen,
      page: () => const DashboardScreen(),
      bindings: [DashboardBinding()],
    ),

    // sidebar details screens
    GetPage(
      name: privacyPolicyScreen,
      page: () => const PrivacyPolicyScreen(),
      bindings: [PrivacyPolicyBinding()],
    ),
    GetPage(
      name: termsAndConditionsScreen,
      page: () => const TermsAndConditionsScreen(),
      bindings: [TermsAndConditionsBinding()],
    ),
    GetPage(
      name: settings,
      page: () => const SettingsScreen(),
      bindings: [SettingsBinding()],
    ),
    GetPage(
      name: profile,
      page: () => ProfileScreen(),
      bindings: [ProfileBinding()],
    ),
  ];
}
