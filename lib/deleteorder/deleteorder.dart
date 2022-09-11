import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../flutter_flow/flutter_flow_choice_chips.dart';
import '../flutter_flow/flutter_flow_theme.dart';

class DeleteOrder extends StatefulWidget {
  const DeleteOrder({super.key});

  @override
  State<DeleteOrder> createState() => _DeleteOrderState();
}

class _DeleteOrderState extends State<DeleteOrder> {
  String choiceChipsValue = "พยาบาล";
  List<List<String>> textlsit = [
    [
      "หัวหน้าพยาบาล",
      "พยาบาล",
      "พยาบาล",
      "พยาบาล",
      "พยาบาล",
    ],
    [
      "หัวหน้าพยาบาล",
      "พยาบาล",
      "พยาบาล",
      "หัวหน้าพยาบาล",
      "พยาบาล",
    ],
    [
      "หัวหน้าพยาบาล",
      "พยาบาล",
      "พยาบาล",
      "พยาบาล",
      "หัวหน้าพยาบาล",
    ],
    [
      "หัวหน้าพยาบาล",
      "พยาบาล",
      "หัวหน้าพยาบาล",
      "หัวหน้าพยาบาล",
      "พยาบาล",
    ],
    [
      "หัวหน้าพยาบาล",
      "พยาบาล",
      "พยาบาล",
      "หัวหน้าพยาบาล",
      "หัวหน้าพยาบาล",
    ]
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          Padding(
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
        ],
        centerTitle: false,
        elevation: 2,
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                  padding: const EdgeInsets.fromLTRB(10, 8, 8, 0),
                  child: Text(
                    "สมาชิกที่ถูกย้ายมา",
                    style:
                        GoogleFonts.mitr(fontSize: 24, color: Color(0xFFF727272)),
                  ),
                ),
                 Divider(
                          thickness: 1,
                          color: FlutterFlowTheme.of(context).stokeLightGray,
                        ),
            ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 2,
              itemBuilder: ((context, indexname) {
                return ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 0, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "e ama",
                          style: GoogleFonts.mitr(
                            fontSize: 20,
                            color: Color(0xFFF727272),
                          ),
                        ),
                        Text(
                          "email@gmail.com",
                          style: GoogleFonts.mitr(
                            fontSize: 20,
                            color: Color(0xFFF727272),
                          ),
                        ),
                        Row(
                          children: [
                            FlutterFlowChoiceChips(
                              initiallySelected: [
                                if (choiceChipsValue != null)
                                  textlsit[0][indexname]
                              ],
                              options: [
                                ChipData('หัวหน้าพยาบาล'),
                                ChipData('พยาบาล'),
                              ],
                              onChanged: (val) {
                                print("val ${val}");
                                setState(() => choiceChipsValue = val!.first);
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
                                      Icons.undo,
                                      color: Colors.red,
                                    ),
                                    Text(
                                      "เลิกทำ",
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
            ),
          ],
        ),
      ),
    );
  }
}