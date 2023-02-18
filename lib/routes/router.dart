import 'package:auto_route/auto_route.dart';
import 'package:deep_shield_hack/pages/auth/login_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
    path: '/login',
    page: LoginPage,
  ),
])
class $AppRouter {}
