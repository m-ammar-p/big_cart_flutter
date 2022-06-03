import 'package:e_commerce/services/carousel_services.dart';
import 'package:e_commerce/views/home/home_view.dart';
import 'package:e_commerce/views/login/login_view.dart';
import 'package:e_commerce/views/products/products_view.dart';
import 'package:e_commerce/views/signup/signup_view.dart';
import 'package:e_commerce/views/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

// generate from build runner
@StackedApp(
  routes: [
    MaterialRoute(page: SplashView, initial: true),
    MaterialRoute(page: LoginView,),
    MaterialRoute(page: SignupView,),
    MaterialRoute(page: HomeView,),
    MaterialRoute(page: ProductsView,),

  ],  // routes

  dependencies: [

    LazySingleton(classType: CarouselService),

    // we have to register NavigationService
    // get_it
    Singleton(classType: NavigationService),

    ] // dependencies

) // StackedApp

class App {
  /** This class has no puporse besides housing the annotation that generates the required functionality **/
}