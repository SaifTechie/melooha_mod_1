import 'package:flutter/material.dart';
import 'package:melooha_mod_1/universal_widgets/show_message.dart';
import 'package:melooha_mod_1/utils/enums.dart';
import 'colors.dart';

void showMessageDialog(BuildContext context, MessageType messageType) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.blue600,
    builder: (BuildContext context) {
      return ShowMessage(messageType: messageType);
    },
  );
}
