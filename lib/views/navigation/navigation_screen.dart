import 'package:flutter/material.dart';
import 'package:infinity/core/utils/app_assets.dart';
import 'package:infinity/core/utils/app_color.dart';
import 'package:infinity/provider/login_type/login_type_provider.dart';
import 'package:infinity/provider/navigator/navigator_provider.dart';
import 'package:provider/provider.dart';

class NavigationScreen extends StatefulWidget {
  NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<NavigatorProvider>(
      builder: (context, provider , _) => Scaffold(
        appBar: AppBar(
          title:  Text(
            "Infinity",
            textAlign: TextAlign.start,
            style: TextStyle(fontWeight: FontWeight.w500,color: AppColor.primary),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Image.asset(
                AppAssets.logo,
                width: 100,
                height: 100,
                alignment: Alignment.topRight,
              ),
            ),

          ],
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: provider.screens[provider.currentIndex],
        backgroundColor: Colors.white,
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                // color: AppColors.lightGrey,
              ),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_outlined,
              ),
              label: "committees",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.event,
                // color: AppColors.lightGrey,
              ),
              label: "Events",
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_pin,
                // color: AppColors.lightGrey,
              ),
              label: "Profile",
            ),


          ],
          elevation: 0.0,
          unselectedItemColor: AppColor.primary.withOpacity(0.5),
          selectedItemColor: AppColor.primary,
          onTap: (value) => provider.changeScreen(index: value),
          currentIndex: provider.currentIndex,
          iconSize: 25.0,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: true,
        ),
        floatingActionButton: context.read<LoginTypeProvider>().isAdmin
            ? FloatingActionButton(
                onPressed: () {},
                backgroundColor: AppColor.primary,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              )
            : Container(),
      ),
    );
  }
}