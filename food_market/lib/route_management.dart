import 'package:food_market/custom_scafford.dart';
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
  GetPage(name: Routes.splash, page:()=>const CustomScaffold( body: SplashPage() )),
  GetPage(name: Routes.onboarding, page:()=>const CustomScaffold( body: OnBoardingPage() )),
  GetPage(name: Routes.signin, page:()=>const CustomScaffold( body: SignInPage() )),
  GetPage(name: Routes.signinwithemail, page:()=>const CustomScaffold( body: SignInWithEmailPage() )),
  GetPage(name: Routes.signup, page:()=>const CustomScaffold( body: SignUpPage() )),
  GetPage(name: Routes.signupaddress, page:()=>const CustomScaffold( body: SignUpUserAddressPage() )),
  GetPage(name: Routes.forgotpassword, page:()=>const CustomScaffold( body: ForgotPasswordPage() )),
  GetPage(name: Routes.home, page:()=>const CustomScaffold( body: BottomNavPage() )),
  GetPage(name: Routes.favorite, page:()=>const CustomScaffold( body: BottomNavPage(initialIndex: 1) )),
  GetPage(name: Routes.order, page:()=>const CustomScaffold( body: BottomNavPage(initialIndex: 2) )),
  GetPage(name: Routes.profile, page:()=>const CustomScaffold( body: BottomNavPage(initialIndex: 3) )),
  GetPage(name: Routes.fooddetail, page:()=>const CustomScaffold( body: FoodDetailPage() )),
  GetPage(name: Routes.checkout, page:()=>const CustomScaffold( body: CheckoutPage() )),
  GetPage(name: Routes.ordersuccess, page:()=>const CustomScaffold( body: OrderSuccessPage() )),
  GetPage(name: Routes.payment, page:()=>const CustomScaffold( body: PaymentPage() )),
  GetPage(name: Routes.orderdetail, page:()=>const CustomScaffold( body: OrderDetailPage() )),
  GetPage(name: Routes.paypal, page:()=>const CustomScaffold( body: PayPalPaymentPage() )),
  GetPage(name: Routes.settings, page:()=>const CustomScaffold( body: SettingPage() )),
  GetPage(name: Routes.changeLanguage, page:()=>const CustomScaffold( body: ChangeLanguage() )),
];
