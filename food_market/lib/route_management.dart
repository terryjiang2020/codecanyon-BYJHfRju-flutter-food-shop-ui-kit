import 'package:food_market/helpers/routes.dart';
import 'package:food_market/pages/Sign_in/sign_in_page.dart';
import 'package:food_market/pages/Sign_in/sign_in_with_email_page.dart';
import 'package:food_market/pages/bottom_nav_page.dart';
import 'package:food_market/pages/food/food_detail.dart';
import 'package:food_market/pages/forgot_password/forgot_password_page.dart';
import 'package:food_market/pages/on_boarding/on_boarding_page.dart';
import 'package:food_market/pages/order/checkout_page.dart';
import 'package:food_market/pages/order/order_detail_page.dart';
import 'package:food_market/pages/order/order_success_page.dart';
import 'package:food_market/pages/order/payment_page.dart';
import 'package:food_market/pages/order/paypal_payment_page.dart';
import 'package:food_market/pages/profile/change_language_page.dart';
import 'package:food_market/pages/profile/setting_page.dart';
import 'package:food_market/pages/sign_up/sign_up_user_address_page.dart';
import 'package:food_market/pages/sign_up/signup_page.dart';
import 'package:food_market/pages/splash_page.dart';
import 'package:get/get.dart';

List<GetPage<dynamic>> allPages = [
  GetPage(name: Routes.splash, page:()=>const SplashPage()),
  GetPage(name: Routes.onboarding, page:()=>const OnBoardingPage()),
  GetPage(name: Routes.signin, page:()=>const SignInPage()),
  GetPage(name: Routes.signinwithemail, page:()=>const SignInWithEmailPage()),
  GetPage(name: Routes.signup, page:()=>const SignUpPage()),
  GetPage(name: Routes.signupaddress, page:()=>const SignUpUserAddressPage()),
  GetPage(name: Routes.forgotpassword, page:()=>const ForgotPasswordPage()),
  GetPage(name: Routes.home, page:()=>const BottomNavPage()),
  GetPage(name: Routes.favorite, page:()=>const BottomNavPage(initialIndex: 1)),
  GetPage(name: Routes.order, page:()=>const BottomNavPage(initialIndex: 2)),
  GetPage(name: Routes.profile, page:()=>const BottomNavPage(initialIndex: 3)),
  GetPage(name: Routes.fooddetail, page:()=>const FoodDetailPage()),
  GetPage(name: Routes.checkout, page:()=>const CheckoutPage()),
  GetPage(name: Routes.ordersuccess, page:()=>const OrderSuccessPage()),
  GetPage(name: Routes.payment, page:()=>const PaymentPage()),
  GetPage(name: Routes.orderdetail, page:()=>const OrderDetailPage()),
  GetPage(name: Routes.paypal, page:()=>const PayPalPaymentPage()),
  GetPage(name: Routes.settings, page:()=>const SettingPage()),
  GetPage(name: Routes.changeLanguage, page:()=>const ChangeLanguage()),
];
