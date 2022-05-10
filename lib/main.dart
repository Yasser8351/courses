import 'package:firebase/providers/course_post.dart';

import 'Home/main_nav.dart';
import 'package:flutter/material.dart';

import 'Home/main_nav.dart';
import 'SCREENS/add_post_in_course.dart';
import 'SCREENS/auth.dart';
import 'SCREENS/feed.dart';
import 'SCREENS/create_course.dart';
import 'SCREENS/enrolled_course.dart';
import 'SCREENS/user_home.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'providers/auth_p.dart';
import 'providers/courses.dart';
import 'SCREENS/loading.dart';
import 'SCREENS/course_detail.dart';
import 'Home/main_nav.dart';
import 'Home/course_nav.dart';
import 'SCREENS/course_post_detail.dart';

void main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
  } catch (e) {
    print(e);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
        ChangeNotifierProxyProvider<UserProvider, CourseProvider>(
          create: (_) => CourseProvider(),
          update: (ctx, UserProvider, previous) =>
              CourseProvider(userProfile: UserProvider.userProfile),
        ),
        ChangeNotifierProxyProvider<UserProvider, CoursePostProvider>(
          create: (_) => CoursePostProvider(),
          update: (ctx, UserProvider, previous) =>
              CoursePostProvider(userProfile: UserProvider.userProfile),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.indigo)
              .copyWith(secondary: Colors.deepPurpleAccent),
        ),
        home: Loading(),
        routes: {
          Loading.routeName: (ctx) => Loading(),
          Auth.routeName: (ctx) => Auth(),
          CourseDetail.routeName: (ctx) => CourseDetail(),
          CreateCourse.routeName: (ctx) => CreateCourse(),
          AddPostCourse.routeName: (ctx) => CreateCourse(),
          MainNav.routeName: (ctx) => MainNav(),
          CourseNav.routeName: (ctx) => CourseNav(),
          Feed.routeName: (ctx) => CourseNav(),
          UserHomeFeed.routeName: (ctx) => CourseNav(),
          EnrolledCourse.routeName: (ctx) => CourseNav(),
        },
      ),
    );
  }
}
