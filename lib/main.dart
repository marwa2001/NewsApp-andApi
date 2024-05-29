import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:news_app/home_layout.dart';
import 'package:news_app/network/local/cash_helper.dart';
import 'package:news_app/network/remot/dio.dart';
import 'package:news_app/shared/cubit/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

void main()async {
  // علشان يتنفذو قبل run
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
 await CashHelper.init();
 bool? isDark =CashHelper.getData(Key: 'isDark');
  Bloc.observer = MyBlocObserver();
  runApp( MyApp());
}

class MyApp extends StatelessWidget {



  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>NewsCubit()..getSport()..getScinece()..getBusiness()),
        BlocProvider(create: (context)=>NewsCubit()..ChangeAppMode()),
      ],
        child: BlocConsumer<NewsCubit,NewsStates>(
          listener: (context,state){},
      builder:(context,state) {
        return MaterialApp(

          title: 'Flutter Demo',
          theme: ThemeData(

            colorScheme: ColorScheme.fromSeed(seedColor: Colors.red
            ),
            primarySwatch: Colors.red,
            primaryColor: Colors.red,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.black
                  //
                ),

                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.light,
                    statusBarColor: Colors.white),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                )),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.red,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.red,
              unselectedItemColor: Colors.black,
              elevation: 20,
              backgroundColor: Colors.white,
            ),
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                )
            ),
          ),

          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
            primarySwatch: Colors.grey,
            primaryColor: Colors.yellow,

            scaffoldBackgroundColor: Colors.grey[600],
            appBarTheme: AppBarTheme(
                iconTheme: IconThemeData(color: Colors.grey
                  //
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarIconBrightness: Brightness.dark,
                    statusBarColor: Colors.red[700]),
                backgroundColor: Colors.grey[600],
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.yellow,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,

                )),

            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.orangeAccent,

            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.red[700],
              unselectedItemColor: Colors.cyanAccent,
              elevation: 20,
              backgroundColor: Colors.yellow,

            ),
            textTheme: TextTheme(
                bodyLarge: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                )
            ),
          ),
          themeMode: NewsCubit.get(context).isDark? ThemeMode.light : ThemeMode.light,
          debugShowCheckedModeBanner: false,
          home: Directionality(
              textDirection: TextDirection.ltr, child: HomeLayout()),
        );
      }
        ),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
