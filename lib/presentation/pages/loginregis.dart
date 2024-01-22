
import 'package:flutter/material.dart';
import 'package:todo_app/core/utils/mediaquery.dart';
import 'package:todo_app/presentation/pages/login.dart';
import 'package:todo_app/presentation/pages/regis.dart';

import '../../core/utils/colors.dart';
import '../../core/utils/locator.dart';

class LoginRegisPage extends StatefulWidget {
  const LoginRegisPage({super.key});

  @override
  State<LoginRegisPage> createState() => _LoginRegisPageState();
}

class _LoginRegisPageState extends State<LoginRegisPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: Color(sl.get<Colorss>().colors1),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             const Text(
                "Todo App",
                style: TextStyle(fontSize: 48, color: Colors.white70,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: displayHeight(context)*0.2,),
              Center(
                child: Container(
                  height: displayHeight(context)*0.5,
                  decoration: BoxDecoration(
                      color: Color(sl.get<Colorss>().colors1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TabBar(
                        indicator: BoxDecoration(
                          // border: Border.all(color: Colors.transparent),
                            color: Color(sl.get<Colorss>().colors2),
                            borderRadius:  BorderRadius.circular(10)
                          ) ,
                          labelColor: Colors.white70,
                          controller: _tabController,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          // indicatorWeight: 10,
                          indicatorSize: TabBarIndicatorSize.tab,
                          tabs: const [
                            Tab(
                              text: "Login",
                            ),
                            Tab(text: "Regis")
                          ]),
                          Expanded(child: TabBarView(
                            controller: _tabController,
                            children:const [
                              LoginPage(),
                              RegisPage()
                          ],))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
