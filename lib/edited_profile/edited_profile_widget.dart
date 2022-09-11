import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileWidget extends StatefulWidget {
  const EditProfileWidget({
    Key? key,
    this.name,
    this.nickname,
  }) : super(key: key);

  final String? name;
  final String? nickname;

  @override
  _EditProfileWidgetState createState() => _EditProfileWidgetState();
}

class _EditProfileWidgetState extends State<EditProfileWidget> {
  ApiCallResponse? stateUpdatProfile;
  String? dropDownValue1;
  TextEditingController? textController1;
  TextEditingController? textController2;
  TextEditingController? textController3;
  TextEditingController? textController4;
  String? dropDownValue2;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController1 = TextEditingController(text: widget.name);
    textController2 = TextEditingController(text: widget.nickname);
    textController3 =
        TextEditingController(text: 'แพทยศาสตร์ มหาวิทยาลัยพะเยา');
    textController4 = TextEditingController(text: 'วิชาเวรกิจฉุกเฉิน');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                  child: Material(
                    color: Colors.transparent,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: 644,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-1, 0),
                            child: InkWell(
                              onTap: () async {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.chevron_left,
                                color: Colors.black,
                                size: 60,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                            child: Container(
                              width: 120,
                              height: 120,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.network(
                                'https://picsum.photos/seed/111/600',
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: Text(
                                    'ชื่อ',
                                    style: GoogleFonts.mitr(
                                      color: Color(0xFF727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: textController1,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรอกชื่อที่นี้',
                                    hintStyle: GoogleFonts.mitr(
                                      color: Color(0xFFBDBDBD),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFBDBDBD),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF727272),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: GoogleFonts.mitr(
                                    color: Color(0xFF727272),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 28,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: Text(
                                    'นามสกุล',
                                    style: GoogleFonts.mitr(
                                      color: Color(0xFF727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: textController2,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรอกชื่อที่นี้',
                                    hintStyle: GoogleFonts.mitr(
                                      color: Color(0xFFBDBDBD),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFBDBDBD),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF727272),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: GoogleFonts.mitr(
                                    color: Color(0xFF727272),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 28,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: Text(
                                    'คณะ',
                                    style: GoogleFonts.mitr(
                                      color: Color(0xFF727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: textController3,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรอกชื่อที่นี้',
                                    hintStyle: GoogleFonts.mitr(
                                      color: Color(0xFFBDBDBD),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFBDBDBD),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF727272),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: GoogleFonts.mitr(
                                    color: Color(0xFF727272),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 28,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: Text(
                                    'สาขา',
                                    style: GoogleFonts.mitr(
                                      color: Color(0xFF727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                  ),
                                ),
                                TextFormField(
                                  controller: textController4,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    hintText: 'กรอกชื่อที่นี้',
                                    hintStyle: GoogleFonts.mitr(
                                      color: Color(0xFFBDBDBD),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFFBDBDBD),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0xFF727272),
                                        width: 1,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  style: GoogleFonts.mitr(
                                    color: Color(0xFF727272),
                                    fontWeight: FontWeight.normal,
                                    fontSize: 28,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: FlutterFlowDropDown(
                                    options: ['Option 1', 'Option 2'],
                                    onChanged: (val) =>
                                        setState(() => dropDownValue1 = val),
                                    width: double.infinity,
                                    height: 60,
                                    textStyle: GoogleFonts.mitr(
                                      color: Color(0xFF727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                    hintText: 'กรุณาเลือกบทบาท',
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 1,
                                    borderRadius: 10,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 30, 0, 0),
                                  child: FlutterFlowDropDown(
                                    options: ['Option 1', 'Option 2'],
                                    onChanged: (val) =>
                                        setState(() => dropDownValue2 = val),
                                    width: double.infinity,
                                    height: 60,
                                    textStyle: GoogleFonts.mitr(
                                      color: Color(0xFF727272),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 28,
                                    ),
                                    hintText: 'เลือกกลุ่ม',
                                    fillColor: Colors.white,
                                    elevation: 2,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    borderWidth: 1,
                                    borderRadius: 10,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12, 4, 12, 4),
                                    hidesUnderline: true,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 50, 20, 50),
                            child: FFButtonWidget(
                              onPressed: () async {
                                
                                await Future.delayed(Duration(seconds: 2));
                                // var _shouldSetState = false;
                                // if (widget.name != null && widget.name != '') {
                                //   if (widget.nickname != null &&
                                //       widget.nickname != '') {
                                //     stateUpdatProfile =
                                //         await UpdateProfileCall.call(
                                //       fristName: widget.name,
                                //       lastName: widget.nickname,
                                //     );
                                //     _shouldSetState = true;
                                //     if ((stateUpdatProfile?.statusCode ??
                                //             200) ==
                                //         200) {
                                //       await actions.notifica(
                                //         context,
                                //         'บันทึกสำเร็จ',
                                //       );
                                //       Navigator.pop(context);
                                //       if (_shouldSetState) setState(() {});
                                //       return;
                                //     } else {
                                //       await actions.notifica(
                                //         context,
                                //         'เชื่อมต่อ api ไม่สำเร็จ',
                                //       );
                                //       if (_shouldSetState) setState(() {});
                                //       return;
                                //     }
                                //   } else {
                                //     await actions.notifica(
                                //       context,
                                //       'กรุณากรอกนามสกุล',
                                //     );
                                //     if (_shouldSetState) setState(() {});
                                //     return;
                                //   }
                                // } else {
                                //   await actions.notifica(
                                //     context,
                                //     'กรุณากรอกชื่อให้ครบ',
                                //   );
                                //   if (_shouldSetState) setState(() {});
                                //   return;
                                // }

                                // if (_shouldSetState) setState(() {});
                                
                              },
                              text: 'บันทึก',
                              options: FFButtonOptions(
                                width: double.infinity,
                                height: 60,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                textStyle: GoogleFonts.getFont(
                                  'Mitr',
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 28,
                                ),
                                borderSide: const BorderSide(
                                  color: Colors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
