import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tpmquiz/screens/geometri_kalkulator_page.dart';
import 'package:tpmquiz/screens/konversi_hari._page.dart';
import 'package:tpmquiz/screens/kubus_page.dart';
import 'package:tpmquiz/screens/main_wrapper.dart';
import 'package:tpmquiz/screens/profile_page.dart';
import 'package:tpmquiz/screens/trapesium_page.dart';

class AppNavigation {
  AppNavigation._();

  static String initial = "/geometri";

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKonversiHari =
  GlobalKey<NavigatorState>(debugLabel: 'shellKonversiHari');
  static final _shellNavigatorGeometri =
  GlobalKey<NavigatorState>(debugLabel: 'shellGeometri');
  static final _shellNavigatorProfile =
  GlobalKey<NavigatorState>(debugLabel: 'shellProfile');

  // GoRouter configuration
  static final GoRouter router = GoRouter(
    initialLocation: initial,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      /// MainWrapper
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[
          /// Konversi Hari
          StatefulShellBranch(
            navigatorKey: _shellNavigatorKonversiHari,
            routes: <RouteBase>[
              GoRoute(
                path: "/hitunghari",
                name: "hitunghari",
                builder: (BuildContext context, GoRouterState state) =>
                const KonversiHariPage(),
              ),
            ],
          ),

          /// Geometri
          StatefulShellBranch(
            navigatorKey: _shellNavigatorGeometri,
            routes: <RouteBase>[
              GoRoute(
                path: "/geometri",
                name: "geometri",
                builder: (BuildContext context, GoRouterState state) =>
                const GeometriPage(),
                routes: [
                  GoRoute(
                    path: 'trapesium',
                    name: 'trapesium',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: const TrapesiumPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                  GoRoute(
                    path: 'kubus',
                    name: 'kubus',
                    pageBuilder: (context, state) => CustomTransitionPage<void>(
                      key: state.pageKey,
                      child: const KubusPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                          FadeTransition(opacity: animation, child: child),
                    ),
                  ),
                ],
              ),
            ],
          ),

          /// Profile
          StatefulShellBranch(
            navigatorKey: _shellNavigatorProfile,
            routes: <RouteBase>[
              GoRoute(
                path: "/profile",
                name: "profile",
                builder: (BuildContext context, GoRouterState state) =>
                const ProfilePage(),
              ),
            ],
          ),

        ],
      ),
    ],
  );
}