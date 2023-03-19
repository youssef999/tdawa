

 import 'package:doctors_app/presentaion/resources/color_manager.dart';
import 'package:doctors_app/presentaion/views/User/Home/user_home_view.dart';
import 'package:doctors_app/presentaion/views/User/profile/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../booking/user_boking_view.dart';



class DashBoardFragment extends StatelessWidget {
  const DashBoardFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    List<Widget> fragmentScreens = [
      const UserHomeView(),
      const UserBookingView(),
      //const UserBookingView(),
      const ProfileView()


    ];

    List _navigationButtonProperties = [
      {
        "active_icon": (Icons.home),
        "non_active_icon": (Icons.home_outlined),
        "label": "الرئيسية "
      },
      {
        "active_icon": (Icons.book),
        "non_active_icon": (Icons.book_outlined),
        "label": "حجوزاتي"
      },

      {
        "active_icon": (Icons.person),
        "non_active_icon": (Icons.person_outline),
        "label": "صفحتي "
      },
    ];

    RxInt indexNumber = 0.obs;
    return Scaffold(
        //backgroundColor: ColorsManager.white,
        appBar: AppBar(
          toolbarHeight: 1,
          backgroundColor: ColorsManager.primary,
        ),
        body: SafeArea(child: Obx(() => fragmentScreens[indexNumber.value])),
        bottomNavigationBar: Obx(() => Container(
         //  color:Colors.grey[200],
          padding: const EdgeInsets.all(10.0),
          child: BottomNavigationBar(
            currentIndex: indexNumber.value,
            onTap: (value) {
              indexNumber.value = value;
            },
            showSelectedLabels: true,
            backgroundColor: ColorsManager.primary,
            showUnselectedLabels: true,
            selectedItemColor: ColorsManager.white,
            unselectedItemColor: Colors.grey,
            items: List.generate(3, (index) {
              var BtnProp = _navigationButtonProperties[index];
              return BottomNavigationBarItem(
                  backgroundColor: ColorsManager.primary,
                  icon: Icon(BtnProp["non_active_icon"]),
                  activeIcon: Icon(BtnProp["active_icon"]),
                  label: BtnProp["label"]);
            }),
          ),
        )));
  }
}
