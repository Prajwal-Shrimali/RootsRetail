import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'tribals_sign_up_widget.dart' show TribalsSignUpWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TribalsSignUpModel extends FlutterFlowModel<TribalsSignUpWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for tribalcheifname widget.
  FocusNode? tribalcheifnameFocusNode;
  TextEditingController? tribalcheifnameController;
  String? Function(BuildContext, String?)? tribalcheifnameControllerValidator;
  // State field(s) for tribalname widget.
  FocusNode? tribalnameFocusNode;
  TextEditingController? tribalnameController;
  String? Function(BuildContext, String?)? tribalnameControllerValidator;
  // State field(s) for Produce widget.
  FocusNode? produceFocusNode;
  TextEditingController? produceController;
  String? Function(BuildContext, String?)? produceControllerValidator;

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
    tribalcheifnameFocusNode?.dispose();
    tribalcheifnameController?.dispose();

    tribalnameFocusNode?.dispose();
    tribalnameController?.dispose();

    produceFocusNode?.dispose();
    produceController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
