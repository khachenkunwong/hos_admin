import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_state.dart';
import '../backend/api_requests/api_calls.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../custom_code/actions/index.dart' as actions;

class CreateGroupWidget extends StatefulWidget {
  const CreateGroupWidget({Key? key}) : super(key: key);

  @override
  State<CreateGroupWidget> createState() => _CreateGroupWidgetState();
}

class _CreateGroupWidgetState extends State<CreateGroupWidget> {
  bool lord1 = false;
  TextEditingController? textControlleremail;
  ApiCallResponse? emailOutput;
  @override
  void initState() {
    textControlleremail = TextEditingController(text: 'addadmin@gmail.com');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: SizedBox(
        height: 100.0,
        width: 500.0,
        child: Center(
          child: TextFormField(
            controller: textControlleremail,
            obscureText: false,
            decoration: InputDecoration(
              hintText: 'กรุณาใส่อีเมล',
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
        ),
      ),
      actions: [
        lord1 == false
            ? TextButton(
                onPressed: () async {
                  if (textControlleremail!.text.length != 0 &&
                      textControlleremail!.text != null) {
                    setState(() {
                      lord1 = true;
                    });

                    emailOutput = await AddLocationCall.call(
                      token: FFAppState().tokenStore,
                      email: '${textControlleremail?.text}',
                    );
                    if ((emailOutput?.statusCode ?? 200) == 200) {
                      if (mounted) {
                        setState(() {
                          lord1 = false;
                        });
                      }
                      await actions.notifica(context, 'เพิ่มเสร็จสิ้น',
                          color: Colors.green);
                    } else {
                      if (mounted) {
                        setState(() {
                          lord1 = false;
                        });
                      }
                      await actions.notifica(
                        context,
                        'เพิ่มไม่เสำเร็จ',
                      );
                    }

                    if (mounted) {
                      setState(() => lord1 = false);
                    }
                    Navigator.pop(context);
                  } else {
                    await actions.notifica(context, 'กรุณากรอกอีเมล',
                        color: Colors.amber);
                  }
                },
                child: Text(
                  'เพิ่มสมาชิก',
                  style: FlutterFlowTheme.of(context).bodyText2,
                ),
              )
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: Color(0xFF00A2FD),
                ),
              )
      ],
    );
  }
}
