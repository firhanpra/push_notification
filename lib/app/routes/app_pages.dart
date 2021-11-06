import 'package:get/get.dart';

import 'package:push_notification/app/modules/home/bindings/home_binding.dart';
import 'package:push_notification/app/modules/home/views/home_view.dart';
import 'package:push_notification/app/modules/nextPage/bindings/next_page_binding.dart';
import 'package:push_notification/app/modules/nextPage/views/next_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.NEXT_PAGE,
      page: () => NextPageView(),
      binding: NextPageBinding(),
    ),
  ];
}
