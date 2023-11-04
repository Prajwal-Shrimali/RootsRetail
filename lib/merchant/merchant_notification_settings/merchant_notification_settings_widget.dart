import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'merchant_notification_settings_model.dart';
export 'merchant_notification_settings_model.dart';

class MerchantNotificationSettingsWidget extends StatefulWidget {
  const MerchantNotificationSettingsWidget({Key? key}) : super(key: key);

  @override
  _MerchantNotificationSettingsWidgetState createState() =>
      _MerchantNotificationSettingsWidgetState();
}

class _MerchantNotificationSettingsWidgetState
    extends State<MerchantNotificationSettingsWidget> {
  late MerchantNotificationSettingsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MerchantNotificationSettingsModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 24.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FlutterFlowIconButton(
                      borderRadius: 30.0,
                      buttonSize: 60.0,
                      icon: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: FlutterFlowTheme.of(context).primaryText,
                        size: 30.0,
                      ),
                      onPressed: () async {
                        context.safePop();
                      },
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 0.0, 0.0),
                      child: Text(
                        FFLocalizations.of(context).getText(
                          '5540e15d' /* Notification Settings */,
                        ),
                        style: FlutterFlowTheme.of(context)
                            .headlineMedium
                            .override(
                              fontFamily: 'Outfit',
                              color: FlutterFlowTheme.of(context).primaryText,
                              fontSize: 24.0,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'rva238n1' /* Push Notifications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue1 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue1 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.email_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'vcq0gih1' /* Email Notifications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue2 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue2 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.sms_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                'iq5csodg' /* SMS Notifications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue3 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue3 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.event_available_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '5mfpemo5' /* Event Reminders */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue4 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue4 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.volume_up_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '49rxwpag' /* Sound Notifications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue5 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue5 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.lightbulb_outline_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '3v2tnbki' /* Light Notifications */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue6 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue6 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 0.0),
                child: Container(
                  width: double.infinity,
                  height: 60.0,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(12.0, 12.0, 12.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Icon(
                          Icons.do_not_disturb_on_outlined,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                12.0, 0.0, 12.0, 0.0),
                            child: Text(
                              FFLocalizations.of(context).getText(
                                '1dru33n8' /* Do Not Disturb */,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ),
                        Switch(
                          value: _model.switchValue7 ??= true,
                          onChanged: (newValue) async {
                            setState(() => _model.switchValue7 = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).primaryText,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).secondaryText,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).primaryBackground,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
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
    );
  }
}
