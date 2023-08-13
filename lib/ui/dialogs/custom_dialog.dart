import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:project_card_game/core/common/extensions/context_extension.dart';
import 'package:project_card_game/core/common/utils/custom_dialog_utils.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog({
    super.key,
    this.showBackButton = true,
    this.onBack,
    this.backText,
    required this.child,
    this.bottom,
    this.top,
    this.topSize = 30,
    this.bottomSize = 30,
    this.dimissAction,
  });

  final bool showBackButton;
  final String? backText;
  final Function()? onBack;
  final Widget child;
  final Widget? bottom;
  final double bottomSize;
  final Widget? top;
  final double topSize;
  final Function()? dimissAction;

  @override
  State<CustomDialog> createState() => _CustomDialogState();

  Future<T?> show<T>(BuildContext context) {
    return showCustomDialog<T>(context, child: this);
  }
}

class _CustomDialogState extends State<CustomDialog> {
  Widget _content(BuildContext context) => SafeArea(
        child: GestureDetector(
          onTap: () {
            if (widget.dimissAction != null) {
              widget.dimissAction!();
            } else {
              FocusScope.of(context).unfocus();
              Modular.to.maybePop();
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              height: context.heightPx,
              width: context.widthPx,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      // color: Colors.white,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (widget.top != null) ...[
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: 10,
                                left: 30,
                                right: 30,
                                top: 20,
                              ),
                              child: widget.top!,
                            ),
                          ],
                          Flexible(
                            child: GestureDetector(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(20),
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                  left: 30,
                                  right: 30,
                                ),
                                // color: Colors.white,
                                constraints: BoxConstraints(
                                  maxHeight: (context.heightPx * 0.9) - (widget.bottom != null ? widget.bottomSize : 0) - (widget.top != null ? widget.topSize : 0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 20.0),
                                  child: SingleChildScrollView(
                                    physics: const BouncingScrollPhysics(),
                                    child: widget.child,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          if (widget.bottom != null)
                            Container(
                              padding: const EdgeInsets.only(
                                bottom: 20,
                                left: 30,
                                right: 30,
                                top: 10,
                              ),
                              color: Colors.white,
                              child: widget.bottom!,
                            ),
                        ],
                      ),
                    ),
                  ),
                  Gap(MediaQuery.viewInsetsOf(context).bottom),
                ],
              ),
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return _content(context);
  }
}
