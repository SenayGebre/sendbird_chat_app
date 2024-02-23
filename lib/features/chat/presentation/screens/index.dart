library chat_screen;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sendbird_chat_app/core/application/theme/colors/app_colors.dart';
import 'package:sendbird_chat_app/features/chat/application/bloc/chat_bloc/chat_bloc.dart';
import 'package:sendbird_chat_app/features/chat/application/bloc/message_bloc/message_bloc.dart';
import 'package:sendbird_chat_app/features/chat/presentation/widgets/error_widget.dart';
import 'package:sendbird_chat_app/features/chat/presentation/widgets/message_bubble.dart';
import 'package:sendbird_chat_app/features/chat/presentation/widgets/message_composer.dart';
import 'package:sendbird_chat_app/features/chat/presentation/widgets/loading_chat_list.dart';

part 'chat_screen.dart';
part '../widgets/chat_app_bar.dart';
