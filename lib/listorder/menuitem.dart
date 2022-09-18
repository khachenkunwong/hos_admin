import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hos_admin/edited_profile/edited_profile_widget.dart';
import 'package:hos_admin/flutter_flow/flutter_flow_theme.dart';

import '../app_state.dart';
import '../backend/api_requests/api_calls.dart';
import '../custom_code/actions/index.dart' as actions;
import '../firstscreen/firstscreen_widget.dart';

class CustomButtonTest extends StatefulWidget {
  const CustomButtonTest({Key? key}) : super(key: key);

  @override
  State<CustomButtonTest> createState() => _CustomButtonTestState();
}

class _CustomButtonTestState extends State<CustomButtonTest> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(17, 5, 0, 5),
          child: Container(
            width: 53,
            height: 53,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: Image.network(
              'https://picsum.photos/seed/492/600',
            ),
          ),
        ),
        customItemsIndexes: const [3],
        customItemsHeight: 50,
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          MenuItems.onChanged(context, value as MenuItem);
        },
        itemHeight: 45,
        itemPadding: const EdgeInsets.only(left: 16, right: 16),
        dropdownWidth: 160,
        dropdownPadding: const EdgeInsets.symmetric(vertical: 6),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        dropdownElevation: 8,
        offset: const Offset(0, 8),
      ),
    );
  }
}

class MenuItem {
  final String text;
  final IconData icon;

  const MenuItem({
    required this.text,
    required this.icon,
  });
}

class MenuItems {
  static const List<MenuItem> firstItems = [profile, editProfile];
  static const List<MenuItem> secondItems = [logout];

  static const profile = MenuItem(text: 'โปรไฟล์', icon: Icons.people);
  static const editProfile = MenuItem(text: 'แก้ไขโปรไฟล์', icon: Icons.edit);
  static const logout = MenuItem(text: 'ออกจากระบบ', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Color(0xFF727272), size: 22),
        const SizedBox(
          width: 10,
        ),
        Text(
          item.text,
          style: const TextStyle(
            color: Color(0xFF727272),
          ),
        ),
      ],
    );
  }

  static onChanged(BuildContext context, MenuItem item) async {
    ApiCallResponse? logoutCallOutput;
    switch (item)  {
      case MenuItems.profile:
        //Do something

        break;
      case MenuItems.editProfile:
        //Do something
        Navigator.push(context,
            MaterialPageRoute(builder: (context) =>  EditProfileWidget(fisrtname: "admin",lastname: "admin1",actor: "admin",)));
        break;
      case MenuItems.logout:
        //Do something
                
                logoutCallOutput = await LogoutCall.call(
                  token: FFAppState().tokenStore,
                );
                // setState(() => FFAppState().tokenStore = '');
                if (logoutCallOutput.statusCode  == 200) {
                  FFAppState().tokenStore = '';
                  await actions.notifica(
                    context,
                    'ออกจากระบบแล้ว',
                    color: Colors.green
                  );
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FirstscreenWidget(),
                      ));
                } else {
                  FFAppState().tokenStore = '';
                  await actions.notifica(
                    context,
                    'ออกจากระบบไม่สำเร็จ',
                  );
                }
              

        break;
    }
  }
}
