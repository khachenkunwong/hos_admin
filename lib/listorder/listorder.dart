import 'package:expandable/expandable.dart';

import '../backend/api_requests/api_calls.dart';
import '../backend/pubilc_.dart';
import '../custom_code/actions/notifica.dart';

import '../edited_profile/edited_profile_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../model/group_manager_model.dart';
import '../model/not_manager_group_model.dart';
import 'creategroup_widget.dart';
import 'itemnotmanagegroup.dart';
import 'menuitem.dart';

class ListOrder extends StatefulWidget {
  const ListOrder({Key? key}) : super(key: key);

  @override
  _ListOrderState createState() => _ListOrderState();
}

class _ListOrderState extends State<ListOrder> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  ApiCallResponse? logoutCallOutput;
  int index = 0;
  int indexGroup = 0;
  int indexselete = 0;
  late String fristname;
  late String lastname;
  late String iduser;
  // อ่านไฟล์ json
  var contents;
  bool stataShowManagerGroup = false;

  // เก็บข้อมูลที่เข้าโมเดลแล้ว
  late GetGroupManagerModelAdmin dataGroup;
  late Future<List<MemberNotManagerGroup>> futureNotManagerGroup;
  late Future<GetGroupManagerModelAdmin> futureManagerGroup;

  String choiceChipsValue = "พยาบาล";

  // List<List<String>> textlsit = [
  //   [
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //   ],
  //   [
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //   ],
  //   [
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //     "หัวหน้าพยาบาล",
  //   ],
  //   [
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //     "หัวหน้าพยาบาล",
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //   ],
  //   [
  //     "หัวหน้าพยาบาล",
  //     "พยาบาล",
  //     "พยาบาล",
  //     "หัวหน้าพยาบาล",
  //     "หัวหน้าพยาบาล",
  //   ]
  // ];
  List<String> actorNotMangerGroup = [];
  List<List<String>> textlsit1 = [];
  List<String> grouplist = [];

  // แสดงข้อมูลที่ยังไม่ได้จัดกลุ่ม
  Future<List<MemberNotManagerGroup>> getManagerNotGroupModel(
      {required String token}) async {
    try {
      print(token);
      final res = await http.get(
        Uri.parse("$url/api/admin/member"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "x-access-token": "$token"
        },
      );
      print("getManagerModel state ${res.statusCode}");
      print("getManagerModel body ${res.body}");

      final body = convert.json.decode(res.body);
      final _futureNotManagerGroup =
          GetNotManagerGroup.fromJson(body as Map<String, dynamic>);
      final futureNotManagerGroup =
          _futureNotManagerGroup.members as List<MemberNotManagerGroup>;
      if (res.statusCode == 200) {
        for (int i = 0; i < futureNotManagerGroup.length; i++) {
          actorNotMangerGroup.add(futureNotManagerGroup[i].actor.toString());
        }

        await notifica(context, "แสดงข้อมูลที่ยังไม่ได้จัดกลุ่มเสำเร็จ",
            color: Colors.green);
        return futureNotManagerGroup;
      } else {
        await notifica(
          context,
          "แสดงข้อมูลที่ยังไม่ได้จัดกลุ่มไม่สำเร็จ",
        );
      }
      return futureNotManagerGroup;
    } catch (error) {
      print(error);
    }
    return [];
  }

  // แสดงข้อมูลที่จัดกลุ่มแล้ว
  Future<GetGroupManagerModelAdmin> getGroupManagerModel(
      {required String token}) async {
    try {
      print(token);
      final res = await http.get(
        Uri.parse("$url/api/admin/group"),
        headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*",
          "x-access-token": "$token"
        },
      );
      print("getGroupManagerModel state ${res.statusCode}");
      print("getGroupManagerModel body ${res.body}");
      setState(() {
        dataGroup = getGroupManagerModelAdminFromJson(res.body);
      });
      // final _futureManagerGroup =
      //     GetGroupManagerModelAdmin.fromJson(body as Map<String, dynamic>);
      final futureManagerGroup = dataGroup as GetGroupManagerModelAdmin;
      if (res.statusCode == 200) {
        for (int i = 0; i < futureManagerGroup.group!.length; i++) {
          textlsit1.add([]);
          grouplist.add("${futureManagerGroup.group![i].nameGroup}");
          for (int a = 0;
              a < futureManagerGroup.group![i].member!.length;
              a++) {
            textlsit1[i]
                .add(futureManagerGroup.group![i].member![a].actor as String);
          }
        }
        await notifica(context, "แสดงข้อมูลจัดกลุ่มเสำเร็จ",
            color: Colors.green);

        return futureManagerGroup;
      } else {
        await notifica(
          context,
          "แสดงข้อมูลไม่สำเร็จ",
        );
      }
      return futureManagerGroup;
    } catch (error) {
      print(error);
    }
    return GetGroupManagerModelAdmin();
  }

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});
    // FFAppState().tokenStore =
    //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjp7InN1YiI6IjYyY2JjNGU1NDIwYzllMWFmZjJkN2I4MCIsInYiOjE1fSwiaWF0IjoxNjYyNTQzMTk2LCJleHAiOjE2NjMxNDc5OTZ9.lT_pPstFB5YKUZdpMgeCAWFr46JFfaLmcpqPm37-sEA";

    // print(dataGroup.data!.first.group);

    futureNotManagerGroup =
        getManagerNotGroupModel(token: FFAppState().tokenStore);
    futureManagerGroup = getGroupManagerModel(token: FFAppState().tokenStore);
    print("textlsit1 ${textlsit1}");
  }

  // List<List<String>> _generateData() {
  //   // int numberOfGroups = 5;
  //   List<List<String>> results = <List<String>>[];
  //   for (int i = 0; i < textlsit1.length; i++) {
  //     List<String> items = <String>[];
  //     for (int j = 0; j < textlsit1[i].length; j++) {
  //       items.add(
  //           "${dataGroup.group![i].member![j].fristName} ${dataGroup.group![i].member![j].lastName} ${i} ${j} ${dataGroup.group![i].member![j].id}");
  //     }
  //     results.add(items);
  //   }
  //   return results;
  // }

  @override
  Widget build(BuildContext context) {
    // FFAppState().itemsduty = "";
    return Scaffold(
      key: scaffoldKey,
      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     SizedBox(
      //       width: 200.0,
      //       height: 40.0,
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
      //       child: FloatingActionButton.extended(
      //         heroTag: "CreateGroup",
      //         onPressed: () {
      //           print('สร้างกลุ่ม');
      //         },
      //         backgroundColor: FlutterFlowTheme.of(context).primaryBlue,
      //         icon: const Icon(
      //           Icons.add,
      //           size: 35,
      //         ),
      //         elevation: 10,
      //         label: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Text(
      //             "สร้างกลุ่ม",
      //             style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
      //           ),
      //         ),
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.fromLTRB(0, 0, 0, 80),
      //       child: FloatingActionButton.extended(
      //         heroTag: "Logout",
      //         onPressed: () async {
      //           logoutCallOutput = await LogoutCall.call(
      //             token: FFAppState().tokenStore,
      //           );
      //           // setState(() => FFAppState().tokenStore = '');
      //           if (((logoutCallOutput?.statusCode ?? 200)) == 200) {
      //             setState(() => FFAppState().tokenStore = '');
      //             await actions.notifica(
      //               context,
      //               'ออกจากระบบแล้ว',
      //             );
      //             Navigator.pushReplacement(
      //                 context,
      //                 MaterialPageRoute(
      //                   builder: (context) => FirstscreenWidget(),
      //                 ));
      //           } else {
      //             setState(() => FFAppState().tokenStore = '');
      //             await actions.notifica(
      //               context,
      //               'ออกจากระบบไม่สำเร็จ',
      //             );
      //           }
      //         },
      //         backgroundColor: FlutterFlowTheme.of(context).primaryRed,
      //         elevation: 10,
      //         label: Text(
      //           "ออกจากระบบ",
      //           style: GoogleFonts.mitr(fontSize: 24, color: Colors.white),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryWhite,
        automaticallyImplyLeading: false,
        actions: [
          Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              'Jonh Liam',
              textAlign: TextAlign.center,
              style: FlutterFlowTheme.of(context).title2.override(
                    fontFamily: FlutterFlowTheme.of(context).title2Family,
                    fontSize: 24,
                  ),
            ),
          ),
          const CustomButtonTest(),
          // TextButton(
          //     onPressed: () {
          //       Navigator.push(
          //           context,
          //           MaterialPageRoute(
          //               builder: (context) => CustomButtonTest()));
          //     },
          //     child: Text("aaa")),
        ],
        centerTitle: false,
        elevation: 2,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
          child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandableTheme(
              data: const ExpandableThemeData(
                  iconPadding: EdgeInsets.fromLTRB(0, 15, 8, 8),
                  animationDuration: Duration(milliseconds: 250)),
              child: ExpandablePanel(
                header: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "ยังไม่ได้จัดกลุ่ม",
                        style: GoogleFonts.mitr(
                            fontSize: 24, color: Color(0xFFF727272)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          await showDialog(
                              context: context,
                              builder: (alertDialogContext) {
                                return CreateGroupWidget();
                              });
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.add,
                              color: FlutterFlowTheme.of(context).primaryBlue,
                              size: 24,
                            ),
                            Text(
                              "เพิ่มสมาชิกเข้าโรงพยาบาล",
                              style: GoogleFonts.mitr(
                                fontSize: 24,
                                color: FlutterFlowTheme.of(context).primaryBlue,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                collapsed: FutureBuilder<List<MemberNotManagerGroup>>(
                    future: futureNotManagerGroup,
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      final listviewNotManagerGroup = snapshot.data!;
                      print(
                          "listviewNotManagerGroup ${listviewNotManagerGroup}");
                      return ItemNotManageGroup(
                        data: listviewNotManagerGroup,
                        actorNotMangerGroup: actorNotMangerGroup,
                        
                        grouplist: grouplist,
                      );
                    }),
                expanded: SizedBox(),
              ),
            ),
            ExpandableTheme(
              data: const ExpandableThemeData(
                  iconPadding: EdgeInsets.fromLTRB(0, 15, 8, 8),
                  animationDuration: Duration(milliseconds: 250)),
              child: ExpandablePanel(
                header: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 8, 8),
                      child: Text(
                        "จัดกลุ่มแล้ว",
                        style: GoogleFonts.mitr(
                            fontSize: 24, color: Color(0xFFF727272)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            stataShowManagerGroup = !stataShowManagerGroup;
                          });
                          print("$stataShowManagerGroup");
                        },
                        child: Text(
                          stataShowManagerGroup ? "ซ่อน" : "แสดงทั้งหมด",
                          style: GoogleFonts.mitr(
                            fontSize: 24,
                            color: FlutterFlowTheme.of(context).primaryBlue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                collapsed: FutureBuilder<GetGroupManagerModelAdmin>(
                    future: futureManagerGroup,
                    builder: ((context, dataManagerGroup) {
                      if (!dataManagerGroup.hasData) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      if (dataManagerGroup == null) {
                        return Center(
                          child: SizedBox(
                              width: 50, height: 50, child: Text("ว่าง")),
                        );
                      }
                      if (dataManagerGroup.hasError) {
                        return Center(
                          child: Text("เกิดข้อผิดพลาด"),
                        );
                      }

                      GetGroupManagerModelAdmin listviewdataManagerGroup =
                          dataManagerGroup.data!;
                      if (listviewdataManagerGroup.group == null) {
                        return Center(
                          child: SizedBox(
                            width: 50,
                            height: 50,
                            child: CircularProgressIndicator(
                              color: FlutterFlowTheme.of(context).primaryColor,
                            ),
                          ),
                        );
                      }
                      return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: listviewdataManagerGroup.group!.length,
                          itemBuilder: ((context, indexGroup) {
                            final indexnumber1 = indexGroup;
                            return ExpansionTile(
                                initiallyExpanded: stataShowManagerGroup,
                                title: const SizedBox(),
                                leading: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "${indexnumber1 + 1} ${listviewdataManagerGroup.group![indexGroup].nameGroup}",
                                    style: GoogleFonts.mitr(
                                      fontSize: 20,
                                      color: Color(0xFFF727272),
                                    ),
                                  ),
                                ),
                                children: [
                                  ItemGroup(
                                    listviewdataManagerGroup:
                                        listviewdataManagerGroup,
                                    stataShowManagerGroup:
                                        stataShowManagerGroup,
                                    textlsit1: textlsit1,
                                    indexGroup: indexGroup,
                                    grouplist: grouplist,
                                  ),
                                ]);
                          }));
                    })),
                expanded: SizedBox(),
              ),
            ),
            Container(
              height: 100.0,
              width: 100.0,
            )
          ],
        ),
      )),
    );
  }

  Widget _header(String name) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(name,
            style: GoogleFonts.mitr(fontSize: 24, color: Color(0xFFF727272))),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.add,
                      color: FlutterFlowTheme.of(context).primaryBlue,
                      size: 24,
                    ),
                    Text(
                      "เพิ่มสมาชิก",
                      style: GoogleFonts.mitr(
                        fontSize: 24,
                        color: FlutterFlowTheme.of(context).primaryBlue,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 24,
                    ),
                    Text(
                      "ลบ",
                      style: GoogleFonts.mitr(
                        fontSize: 24,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}

class ItemGroup extends StatefulWidget {
  GetGroupManagerModelAdmin listviewdataManagerGroup;
  bool stataShowManagerGroup;
  List<List<String>> textlsit1;
  int indexGroup;
  List<String> grouplist;
  ItemGroup(
      {super.key,
      required this.listviewdataManagerGroup,
      required this.stataShowManagerGroup,
      required this.textlsit1,
      required this.indexGroup,
      required this.grouplist});

  @override
  State<ItemGroup> createState() => _ItemGroupState();
}

class _ItemGroupState extends State<ItemGroup> {
  // แก้ไข actor
  updateMyUserActor({
    required String idUser,
    required String actor,
  }) async {
    try {
      final res = await http.patch(
        Uri.parse("$url/api/admin/updateUser/$idUser"),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Access-Control_Allow_Origin': '*',
          'x-access-token': '${FFAppState().tokenStore}',
        },
        body: convert.json.encode({"actor": "${actor}"}),
      );
      // await Future.delayed(Duration(seconds: 3));
      // print("getGroupManagerModel body ${res.body}");
      print("getGroupManagerModel state ${res.statusCode}");

      if (res.statusCode == 200) {
        await notifica(context, "แก้ไขบทบาทสำเร็จ", color: Colors.green);
      } else {
        await notifica(
          context,
          "แก้ไขบทบาทไม่สำเร็จ",
        );
        return res;
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: widget
            .listviewdataManagerGroup.group![widget.indexGroup].member!.length,
        itemBuilder: (context, indexName) {
          return ListTile(
            onTap: () {},
            title: Padding(
              padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${widget.listviewdataManagerGroup.group![widget.indexGroup].member![indexName].fristName} ${widget.listviewdataManagerGroup.group![widget.indexGroup].member![indexName].lastName}",
                    style: GoogleFonts.mitr(
                      fontSize: 20,
                      color: Color(0xFFF727272),
                    ),
                  ),
                  Text(
                    "${widget.listviewdataManagerGroup.group![widget.indexGroup].member![indexName].email}",
                    style: GoogleFonts.mitr(
                      fontSize: 20,
                      color: Color(0xFFF727272),
                    ),
                  ),
                  Row(
                    children: [
                      FlutterFlowChoiceChips(
                        initiallySelected: [
                          if (widget.textlsit1 != null)
                            widget.textlsit1[widget.indexGroup][indexName]
                        ],
                        options: [
                          ChipData('หัวหน้าพยาบาล'),
                          ChipData('พยาบาล'),
                        ],
                        onChanged: (val) async {
                          if (val != null) {
                            try {
                              final outputupdatemyuseractor = updateMyUserActor(
                                  idUser:
                                      "${widget.listviewdataManagerGroup.group![widget.indexGroup].member![indexName].id}",
                                  actor: "${val.first}");

                              print(
                                  "stataupdatamyuseractor ${outputupdatemyuseractor}");
                              setState(() {
                                widget.textlsit1[widget.indexGroup][indexName] =
                                    val.first;
                              });
                              print(
                                  "val  ${val.first}เปลียนแล้ว ${widget.textlsit1}");
                            } catch (error) {
                              await notifica(context, "เกิดข้อผิดพลาด $error");
                            }
                          }
                        },
                        selectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).primaryBlue01,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                  fontFamily: 'Mitr',
                                  color: Colors.white,
                                  fontSize: 24),
                          iconColor: Colors.white,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        unselectedChipStyle: ChipStyle(
                          backgroundColor:
                              FlutterFlowTheme.of(context).secondaryWhite,
                          textStyle: FlutterFlowTheme.of(context)
                              .bodyText2
                              .override(
                                fontFamily: 'Mitr',
                                color: FlutterFlowTheme.of(context).primaryGray,
                                fontSize: 24,
                              ),
                          iconColor: FlutterFlowTheme.of(context).primaryGray,
                          iconSize: 18,
                          elevation: 4,
                        ),
                        chipSpacing: 20,
                        multiselect: false,
                        alignment: WrapAlignment.start,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: ((context) => EditProfileWidget(
                                          fisrtname: widget
                                              .listviewdataManagerGroup
                                              .group![widget.indexGroup]
                                              .member![indexName]
                                              .fristName,
                                          lastname: widget
                                              .listviewdataManagerGroup
                                              .group![widget.indexGroup]
                                              .member![indexName]
                                              .lastName,
                                          actor: widget
                                              .listviewdataManagerGroup
                                              .group![widget.indexGroup]
                                              .member![indexName]
                                              .actor,
                                          group: widget
                                              .listviewdataManagerGroup
                                              .group![widget.indexGroup]
                                              .nameGroup,
                                          grouplist: widget.grouplist,
                                        ))));
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.edit,
                                color: Colors.green[600],
                              ),
                              Text(
                                "แก้ไข",
                                style: GoogleFonts.mitr(
                                  fontSize: 20,
                                  color: Colors.green[600],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            children: [
                              Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              Text(
                                "ลบ",
                                style: GoogleFonts.mitr(
                                  fontSize: 20,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          );
        });
    // subtitle: SizedBox(child: Text("tttttttt"),)
  }
}
