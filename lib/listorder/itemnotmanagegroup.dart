import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hos_admin/app_state.dart';
import 'package:hos_admin/model/not_manager_group_model.dart';

import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class ItemNotManageGroup extends StatefulWidget {
  List<MemberNotManagerGroup> data;
  List<String> actorNotMangerGroup;

  ItemNotManageGroup({
    super.key,
    required this.data,
    required this.actorNotMangerGroup,
  });

  @override
  State<ItemNotManageGroup> createState() => _ItemNotManageGroupState();
}

class _ItemNotManageGroupState extends State<ItemNotManageGroup> {
  Future<ApiCallResponse>? outputupdataactor;
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
                      onChanged: (val) {
                        print(
                            "val--- ${val} ${widget.data[indexNotManagerGroup].id}");

                        if (val != null) {
                          outputupdataactor = UpdateMyUserActorCall.call(
                              idUser: "${widget.data[indexNotManagerGroup].id}",
                              actor: "${val.first}");
                          final stataupdatamyuseractor =
                              UpdateMyUserActorCall.resState(outputupdataactor);
                          print(
                              "stataupdatamyuseractor ${stataupdatamyuseractor}");
                          setState(() =>
                              widget.actorNotMangerGroup[indexNotManagerGroup] =
                                  val.first);
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
                        onTap: () {},
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
