import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:hos_admin/custom_code/actions/index.dart';

import '../backend/pubilc_.dart';
import '../components/showimage_widget.dart';
import '../flutter_flow/flutter_flow_calendar.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/random_data_util.dart' as random_data;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../model/delete_group_model.dart';
import '../model/not_manager_group_model.dart';

class NotificationsWidget extends StatefulWidget {
  const NotificationsWidget({Key? key}) : super(key: key);

  @override
  _NotificationsWidgetState createState() => _NotificationsWidgetState();
}

class _NotificationsWidgetState extends State<NotificationsWidget> {
  DateTimeRange? calendarSelectedDay;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  addproveDeleteGrop(
      {required String idnotification, required bool addprove}) async {
    var headers = {
      'Authorization': FFAppState().tokenStore,
      'Content-Type': 'application/json'
    };
    var request = http.Request('POST', Uri.parse('$url/graphql'));
    request.body =
        '''{"query":"mutation ApproveDeleteGroup(\$input: ApproveDeleteGroupInput!) {\\r\\n  approveDeleteGroup(input: \$input)\\r\\n}","variables":{"input":{"notificationId":"$idnotification","approve":$addprove}}}''';

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      print(await response.stream.bytesToString());
      await notifica(context, addprove?"อนุมัติสำเร็จแล้ว":"ปฏิเสธสำเร็จแล้ว", color: Colors.green);
    } else {
      print(response.reasonPhrase);
      await notifica(context, "ไม่สำเร็จแล้ว");
    }
  }

  @override
  void initState() {
    super.initState();
    calendarSelectedDay = DateTimeRange(
      start: DateTime.now().startOfDay,
      end: DateTime.now().endOfDay,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).secondaryWhite,
        automaticallyImplyLeading: false,
        actions: [
          Align(
            alignment: const AlignmentDirectional(0, 0),
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
            padding: const EdgeInsetsDirectional.fromSTEB(17, 5, 0, 5),
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
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print('FloatingActionButton pressed ...');
        },
        backgroundColor: FlutterFlowTheme.of(context).primaryColor,
        icon: const Icon(
          Icons.send,
          size: 35,
        ),
        elevation: 10,
        label: Container(),
      ),
      body: SafeArea(
        
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 1,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsetsDirectional.fromSTEB( 50, 0, 50, 0),
                  //   child: Card(
                  //     clipBehavior: Clip.antiAliasWithSaveLayer,
                  //     color: FlutterFlowTheme.of(context).secondaryWhite,
                  //     elevation: 2,
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Padding(
                  //       padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
                  //       child: Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Container(
                  //             width: 56,
                  //             height: 56,
                  //             clipBehavior: Clip.antiAlias,
                  //             decoration: BoxDecoration(
                  //               shape: BoxShape.circle,
                  //             ),
                  //             child: Image.network(
                  //               'https://picsum.photos/seed/260/600',
                  //             ),
                  //           ),
                  //           Text(
                  //             'Hannah Darlene',
                  //             style: FlutterFlowTheme.of(context).title2,
                  //           ),
                  //           Text(
                  //             'แลกทั้งหมด',
                  //             textAlign: TextAlign.center,
                  //             style: FlutterFlowTheme.of(context)
                  //                 .bodyText1
                  //                 .override(
                  //                   fontFamily: FlutterFlowTheme.of(context)
                  //                       .bodyText1Family,
                  //                   color: FlutterFlowTheme.of(context)
                  //                       .primaryBlue,
                  //                 ),
                  //           ),
                  //           FlutterFlowIconButton(
                  //             borderColor: Colors.transparent,
                  //             borderRadius: 30,
                  //             borderWidth: 1,
                  //             buttonSize: 60,
                  //             icon: Icon(
                  //               Icons.keyboard_arrow_up,
                  //               color: Colors.black,
                  //               size: 30,
                  //             ),
                  //             onPressed: () {
                  //               print('IconButton pressed ...');
                  //             },
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
// Query(options: options, builder: builder)
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(50, 0, 50, 0),
                    child: Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      color: Colors.white,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                20, 20, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.asset(
                                      'assets/images/noti.png',
                                      width: 60,
                                      height: 60,
                                      fit: BoxFit.cover,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              10, 0, 0, 0),
                                      child: Text(
                                        'แจ้งเหตุ',
                                        style:
                                            FlutterFlowTheme.of(context).title2,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      'วันนี้ 07:14 น.',
                                      style:
                                          FlutterFlowTheme.of(context).title3,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 10, 47, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ชื่อ:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                "ชื่อ นามสกุล",
                                                // '${snapshot.data![indexleave].user!.fristName} ${snapshot.data![indexleave].user!.lastName}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 0, 47, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Text(
                                              'ประเภทการลา:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                "ชนิด",
                                                // '${snapshot.data![indexleave].type}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryRed,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 0, 47, 0),
                                        child: Wrap(
                                          // mainAxisSize: MainAxisSize.max,
                                          direction: Axis.vertical,
                                          children: [
                                            Text(
                                              'รายละเอียดเพิ่มเติ่ม:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                "คำอธิบาย",
                                                // '${snapshot.data![indexleave].detail}',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryGray,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'ติดต่อ:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                '0883011544',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryGray,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'จำนวนวันที่ขอลา:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                'ยังไม่ได้กำหนด',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryRed,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'แจ้งเมื่อ:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                'วันที่ 18 เดือน เมษายน ปี 2565 ',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryGray,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(47, 0, 0, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text(
                                              'จำนวนการลาที่เหลือ:',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .title2
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryBlack,
                                                      ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 0, 0),
                                              child: Text(
                                                '5 ครั้ง',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryGray,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 100, 0),
                                child: InkWell(
                                  onTap: () async {
                                    await showModalBottomSheet(
                                      isScrollControlled: true,
                                      backgroundColor:
                                          FlutterFlowTheme.of(context)
                                              .secondaryWhite,
                                      context: context,
                                      builder: (context) {
                                        return Padding(
                                          padding:
                                              MediaQuery.of(context).viewInsets,
                                          child: SizedBox(
                                            height: 1215,
                                            child: ShowimageWidget(
                                              image: random_data.randomImageUrl(
                                                939,
                                                1215,
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Hero(
                                    tag: 'showimage',
                                    transitionOnUserGestures: true,
                                    child: Image.network(
                                      'https://picsum.photos/seed/935/600',
                                      width: 302,
                                      height: 391,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),

                              // InkWell(
                              //   onTap: () async {
                              //     await showModalBottomSheet(
                              //       isScrollControlled: true,
                              //       backgroundColor:
                              //           FlutterFlowTheme.of(context)
                              //               .secondaryWhite,
                              //       context: context,
                              //       builder: (context) {
                              //         return Padding(
                              //           padding:
                              //               MediaQuery.of(context)
                              //                   .viewInsets,
                              //           child: Container(
                              //             height: 1215,
                              //             child: ShowimageWidget(
                              //               image: random_data
                              //                   .randomImageUrl(
                              //                 939,
                              //                 1215,
                              //               ),
                              //             ),
                              //           ),
                              //         );
                              //       },
                              //     );
                              //   },
                              //   child: Hero(
                              //     tag: 'showimage',
                              //     transitionOnUserGestures: true,
                              //     child: Image.network(
                              //       'https://picsum.photos/seed/935/600',
                              //       width: 302,
                              //       height: 391,
                              //       fit: BoxFit.cover,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 45, 0, 27),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    // await updateApprove(
                                    //   token: FFAppState().tokenStore,
                                    //   id: '${snapshot.data![indexleave].id}',
                                    //   approve: true,
                                    // );
                                    // final outputLeaveApprove =
                                    //     await UpdateLeaveApproveCall.call(
                                    //         token: FFAppState()
                                    //             .tokenStore,
                                    //         id: '${snapshot.data![indexleave].id}',
                                    //         approve: true);
                                    // if (outputLeaveApprove
                                    //         .statusCode ==
                                    //     200) {
                                    //   await notifica(
                                    //       context, "สำเร็จ",
                                    //       color: Colors.green);
                                    // } else {
                                    //   await notifica(
                                    //       context, "ไม่สำเร็จ");
                                    // }
                                  },
                                  child: Text(
                                    'อนุมัติ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Text(
                                  'ปฎิเสธ',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          FlutterFlowCalendar(
                            color: FlutterFlowTheme.of(context).primaryColor,
                            weekFormat: false,
                            weekStartsMonday: false,
                            rowHeight: 70,
                            onChange: (DateTimeRange? newSelectedDate) {
                              setState(
                                  () => calendarSelectedDay = newSelectedDate);
                            },
                            titleStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  fontSize: 28,
                                ),
                            dayOfWeekStyle: FlutterFlowTheme.of(context)
                                .title1
                                .override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title1Family,
                                  fontSize: 28,
                                ),
                            dateStyle: FlutterFlowTheme.of(context)
                                .title2
                                .override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title2Family,
                                  color:
                                      FlutterFlowTheme.of(context).primaryBlack,
                                ),
                            selectedDateStyle: FlutterFlowTheme.of(context)
                                .title2
                                .override(
                                  fontFamily:
                                      FlutterFlowTheme.of(context).title2Family,
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryWhite,
                                ),
                            inactiveDateStyle:
                                FlutterFlowTheme.of(context).title2,
                            daysOfWeekHeight: 50,
                            changTwoDuty: true,
                            yearduty: 2022,
                            monthduty: 9,
                            dayduty: 6,
                            yearduty2: 2022,
                            monthduty2: 9,
                            dayduty2: 1,
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0, 45, 0, 27),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () async {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'แลกเปลี่ยนเสร็จสิ้น',
                                          style: FlutterFlowTheme.of(context)
                                              .subtitle1
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle1Family,
                                                fontSize: 18,
                                              ),
                                        ),
                                        duration:
                                            const Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .primaryColor,
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'อนุมัติ',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1Family,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                                Text(
                                  'ยกเลิก',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyText1Family,
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Query(
                      options: QueryOptions(
                          document: gql(notificationDeleteGroup),
                          variables: const {
                            "filter": {"type": "DELETE_GROUP"}
                          }),
                      builder: (QueryResult result, {fetchMore, refetch}) {
                        if (result.hasException) {
                          return Text(result.exception.toString());
                        }
                        if (result.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        // final productList = Welcome.fromJson(result.data as Map<String, dynamic>);
                        // print(productList);
                        print("result.data ${result.data}");
                        final getDeleteGroup =
                            NotificationDeleteGroup.fromJson(result.data!)
                                .notifications;

                        return ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: getDeleteGroup!.length,
                            itemBuilder: (context, indexDeleteGroup) {
                              print(
                                  "45485465 ${getDeleteGroup[indexDeleteGroup].noift}");
                              if (getDeleteGroup[indexDeleteGroup].noift == "1") {
                                return Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      50, 0, 50, 0),
                                  child: Card(
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    color: Colors.white,
                                    elevation: 2,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(20, 20, 20, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Image.asset(
                                                    'assets/images/noti.png',
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            10, 0, 0, 0),
                                                    child: Text(
                                                      'มีการลบกลุ่ม',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    'วันนี้ 07:14 น.',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title3,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.stretch,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(47, 10, 47, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'คุณต้องการอนุญาติหรือไม่',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBlack,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // เปลี่ยนแปลงโดย
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(70, 10, 47, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'เปลี่ยนแปลงโดย:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBlack,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            5, 0, 0, 0),
                                                    child: Text(
                                                      'Hannah Darlene ',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // โรงพยาบาลที่
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(70, 0, 47, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'โรงพยาบาลที่:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBlack,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            5, 0, 0, 0),
                                                    child: Text(
                                                      '${getDeleteGroup[indexDeleteGroup].fields!.group!.location}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryRed,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // ชื่อกลุ่ม
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional
                                                      .fromSTEB(70, 0, 47, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Text(
                                                    'ชื่อกลุ่ม:',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .title2
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .title2Family,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBlack,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional
                                                                .fromSTEB(
                                                            5, 0, 0, 0),
                                                    child: Text(
                                                      '${getDeleteGroup[indexDeleteGroup].fields!.group!.nameGroup}',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .title2
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .title2Family,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryGray,
                                                              ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsetsDirectional
                                              .fromSTEB(0, 45, 0, 27),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  print(
                                                      "${getDeleteGroup[indexDeleteGroup].id}");
                                                  await addproveDeleteGrop(
                                                      idnotification:
                                                          getDeleteGroup[
                                                                  indexDeleteGroup]
                                                              .id!,
                                                      addprove: true);
                                                },
                                                child: Text(
                                                  'อนุมัติ',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryColor,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await addproveDeleteGrop(
                                                      idnotification:
                                                          getDeleteGroup[
                                                                  indexDeleteGroup]
                                                              .id!,
                                                      addprove: false);
                                                },
                                                child: Text(
                                                  'ยกเลิก',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1Family,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              }
                              return const SizedBox();
                            });
                      }),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
