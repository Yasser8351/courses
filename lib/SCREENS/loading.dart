import 'package:firebase/Home/main_nav.dart';
import 'package:firebase/providers/auth_p.dart';

import '/SCREENS/auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Loading extends StatefulWidget {
  static const routeName = '/loading';
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  bool isInit = true;

  @override
  void initState() {
    super.initState();
    // Provider.of<UserProvider>(context, listen: false).signOut();
    Provider.of<UserProvider>(context, listen: false)
        .getCurrentUser()
        .then((value) => {
              Provider.of<UserProvider>(context, listen: false)
                  .getUser()
                  .then((value) => {
                        print('$value returned'),
                        if (value != null)
                          {
                            Navigator.pushReplacementNamed(
                                context, MainNav.routeName)
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                              context,
                              Auth.routeName,
                            )
                          }
                      })
            });
  }

  @override
  Widget build(BuildContext context) {
    return (Container(
      width: double.infinity,
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    ));
  }
}
