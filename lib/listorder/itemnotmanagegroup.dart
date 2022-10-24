import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hos_admin/app_state.dart';
import 'package:hos_admin/model/not_manager_group_model.dart';

import '../backend/api_requests/api_calls.dart';
import '../backend/pubilc_.dart';
import '../custom_code/actions/notifica.dart';
import '../edited_profile/edited_profile_widget.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ItemNotManageGroup extends StatefulWidget {
  List<MemberNotManagerGroup> data;
  List<String> actorNotMangerGroup;
  List<String> grouplist;

  ItemNotManageGroup(
      {super.key,
      required this.data,
      required this.actorNotMangerGroup,
      required this.grouplist});

  @override
  State<ItemNotManageGroup> createState() => _ItemNotManageGroupState();
}

class _ItemNotManageGroupState extends State<ItemNotManageGroup> {
  Future<ApiCallResponse>? outputupdataactor;
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
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.data.length,
      itemBuilder: ((context, indexNotManagerGroup) {
        if (widget.data[indexNotManagerGroup].email == FFAppState().myemail) {
          return SizedBox();
        }
        if (widget.data[indexNotManagerGroup].actor == "ผู้อำนวนการ" || widget.data[indexNotManagerGroup].actor == "admin") {
          return SizedBox();
        }
        return ListTile(
          onTap: () {},
          title: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${widget.data[indexNotManagerGroup].fristName} ${widget.data[indexNotManagerGroup].lastName}",
                  style: GoogleFonts.mitr(
                    fontSize: 20,
                    color: Color(0xFFF727272),
                  ),
                ),
                Text(
                  "${widget.data[indexNotManagerGroup].email}",
                  style: GoogleFonts.mitr(
                    fontSize: 20,
                    color: Color(0xFFF727272),
                  ),
                ),
                Row(
                  children: [
                    FlutterFlowChoiceChips(
                      initiallySelected: [
                        if (widget.actorNotMangerGroup != null)
                          widget.actorNotMangerGroup[indexNotManagerGroup]
                      ],
                      options: [
                        ChipData('หัวหน้าพยาบาล'),
                        ChipData('พยาบาล'),
                      ],
                      onChanged: (val) async {
                        print(
                            "val--- ${val} ${widget.data[indexNotManagerGroup].id}");

                        if (val != null) {
                          try {
                            final outputupdatemyuseractor = updateMyUserActor(
                                idUser:
                                    "${widget.data[indexNotManagerGroup].id}",
                                actor: "${val.first}");

                            print(
                                "stataupdatamyuseractor ${outputupdatemyuseractor}");
                            setState(() => widget
                                    .actorNotMangerGroup[indexNotManagerGroup] =
                                val.first);
                          } catch (error) {
                            await notifica(context, "เกิดข้อผิดพลาด $error");
                          }
                        }
                        print("val--- ${val} ${widget.actorNotMangerGroup}");
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
                                    idUser:
                                        widget.data[indexNotManagerGroup].id,
                                    fisrtname: widget
                                        .data[indexNotManagerGroup].fristName,
                                    lastname: widget
                                        .data[indexNotManagerGroup].lastName,
                                    actor:
                                        widget.data[indexNotManagerGroup].actor,
                                    grouplist: widget.grouplist,
                                  )),
                            ),
                          );
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
      }),
    );
  }
}
