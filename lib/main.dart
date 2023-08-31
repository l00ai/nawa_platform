import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:nawa_platform/block/authentication/authentication_bloc.dart';
import 'package:nawa_platform/network/portal_service.dart';
import 'package:nawa_platform/repository/portal_repository.dart';
import 'package:nawa_platform/ui/screen/home_screen.dart';
import 'package:nawa_platform/ui/screen/splash_screen.dart';
import 'package:logging/logging.dart';
import 'package:nawa_platform/ui/widgets/reload_indicator.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Logger.root.level = Level.ALL ;
  Logger.root.onRecord.listen((event) {
    print('${event.level.name} ${event.message}');
  });

  runApp(
      RepositoryProvider<PortalRepository>(
          create: (context) {
            return PortalRepositoryImpl();
          },
        child: MyApp(),
      )
     );

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PortalService.create(),
      dispose: (_, PortalService service) => service.client.dispose(),
      child: BlocProvider<AuthenticationBloc>(
          create: (context) {
            final portalService = RepositoryProvider.of<PortalRepository>(context);
            return AuthenticationBloc(portalService)..add(AppLoaded(context: context));
          },
        child: MaterialApp(
          title: 'منصة النوى',
          theme: ThemeData(
            pageTransitionsTheme: PageTransitionsTheme(
                builders: {
                  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
                  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
                }
            ),
            primarySwatch: Colors.blue,
            accentColor: Color(0xff930708),
            primaryColor: Colors.white,
            fontFamily: 'Cairo',
          ),
          localizationsDelegates: [
            GlobalCupertinoLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            Locale("ar", "AE"), // OR Locale('ar', 'AE') OR Other RTL locales
          ],
          locale: Locale("ae", "AE"),
          debugShowCheckedModeBanner: false,
          home:
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {

              void reload() {
                BlocProvider.of<AuthenticationBloc>(context)
                    .add(AppLoaded(context: context));
              }

              if (state is AuthenticationAuthenticated) {
                return HomeScreen(titles: state.titles,);
              }

              if(state is AuthenticationNotAuthenticated){
                return SplashScreen(titles: state.titles,);
             }

              if(state is AuthenticationFailure){
                return Scaffold(body: ReloadIndicator(context: context, msg: state.message, reload: reload,));
              }
              return Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
