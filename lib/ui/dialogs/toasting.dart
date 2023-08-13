import 'package:auto_size_text/auto_size_text.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/common/constants/app_colors.dart';
import 'package:project_card_game/core/common/extensions/context_extension.dart';
import 'package:project_card_game/core/common/extensions/widget_extension.dart';

class Toasting {
  static void error(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    bool? obscure,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.error);
    }
    showNotification(
      context,
      color: Colors.red,
      title: title ?? 'Erro',
      obscure: obscure,
      icon: const Icon(
        Icons.error,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void info(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    bool? obscure,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.success);
    }
    showNotification(
      context,
      color: Colors.blue,
      title: title ?? 'Info',
      obscure: obscure,
      icon: const Icon(
        Icons.info,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void success(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    bool? obscure,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.success);
    }
    showNotification(
      context,
      color: Colors.green,
      title: title ?? 'Sucesso',
      obscure: obscure,
      icon: const Icon(
        Icons.check_circle,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void noConnection(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    bool? obscure,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.error);
    }
    showNotification(
      context,
      color: Colors.red,
      title: title ?? 'Sem conexão com a internet',
      obscure: obscure,
      icon: const Icon(
        Icons.wifi_off_rounded,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void warning(
    BuildContext context, {
    String? title,
    String? subtitle,
    Duration? duration,
    bool? obscure,
  }) {
    if (!kIsWeb) {
      Vibrate.feedback(FeedbackType.warning);
    }
    showNotification(
      context,
      color: Colors.yellow.shade800,
      title: title ?? 'Aviso',
      obscure: obscure,
      icon: const Icon(
        Icons.warning,
        color: AppColors.white,
      ),
      duration: duration,
      subtitle: subtitle,
    );
  }

  static void showNotification(
    BuildContext context, {
    required Color color,
    required String title,
    bool? obscure,
    String? subtitle,
    required Widget icon,
    Duration? duration,
  }) {
    BotToast.showCustomNotification(
      backButtonBehavior: BackButtonBehavior.close,
      duration: duration ?? const Duration(seconds: 10),
      enableSlideOff: false,
      onlyOne: true,
      align: Alignment.bottomCenter,
      toastBuilder: (close) {
        return _CustomWidget(
          cancelFunc: close,
          title: title,
          color: color,
          obscure: obscure,
          subtitle: subtitle,
          icon: icon,
        );
      },
    );
  }
}

class _CustomWidget extends StatefulWidget {
  const _CustomWidget({
    required this.cancelFunc,
    required this.title,
    required this.color,
    this.subtitle,
    this.obscure,
    required this.icon,
  });

  final CancelFunc cancelFunc;
  final String title;
  final String? subtitle;
  final bool? obscure;
  final Widget icon;
  final Color color;

  @override
  _CustomWidgetState createState() => _CustomWidgetState();
}

class _CustomWidgetState extends State<_CustomWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        (widget.obscure ?? false) ? Container(color: Colors.black54) : const SizedBox.shrink(),
        SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.all(5),
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.08),
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                ),
                child: Container(
                  padding: const EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    border: Border.all(color: AppColors.white, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                  ),
                  constraints: const BoxConstraints(
                    minHeight: 120,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: 0,
                        bottom: 0,
                        child: LayoutBuilder(
                          builder: (context, constraints) {
                            return Container(
                              decoration: BoxDecoration(
                                color: widget.color.withOpacity(0.8),
                                borderRadius: const BorderRadius.all(Radius.circular(15)),
                              ),
                              width: (context.widthPx - 20) * 0.2,
                              child: Row(
                                children: [
                                  Gap(((context.widthPx - 20) * 0.3) * 0.2),
                                  widget.icon,
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Gap(
                            (context.widthPx - 20) * 0.2,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: widget.subtitle != null ? MainAxisAlignment.start : MainAxisAlignment.center,
                              children: [
                                AutoSizeText(
                                  widget.title,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    color: AppColors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                if (widget.subtitle != null) ...[
                                  const Gap(10),
                                  Text(
                                    widget.subtitle!,
                                    style: TextStyle(
                                      color: AppColors.black.withOpacity(0.5),
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                                const Gap(30),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: GestureDetector(
                                    onTap: widget.cancelFunc,
                                    child: Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                        color: AppColors.blueGrey,
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        //border: Border.all(color: AppColors.secondaryColor.withOpacity(0.5), width: 0.8),
                                      ),
                                      child: const Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'Entendi',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.secondaryColor,
                                            ),
                                          ),
                                          /* Gap(7),
                                          Icon(Icons.thumb_up, size: 18), */
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ).expanded(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              GestureDetector(
                                onTap: widget.cancelFunc,
                                child: const Padding(
                                  padding: EdgeInsets.only(right: 10, top: 10),
                                  child: Icon(Icons.close),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
