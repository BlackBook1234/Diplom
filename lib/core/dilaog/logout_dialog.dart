import 'package:chat_system/constants.dart';
import 'package:chat_system/ui/widget/common/button.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  const CustomDialog(
      {super.key,
      required this.type,
      this.title,
      this.desc,
      this.footerCancelText = "Үгүй",
      this.footerSubmitText = "Тийм",
      this.onPressedSubmit,
      this.agree = false,
      this.onBackSubmit});

  final int type;
  final String? title;
  final String? desc;
  final bool? agree;
  final String? footerCancelText;
  final String? footerSubmitText;
  final VoidCallback? onPressedSubmit;
  final VoidCallback? onBackSubmit;

  @override
  State<CustomDialog> createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.0),
      ),
      child: Container(
        color: Colors.transparent,
        // height: 400,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(9),
                          child: Image.asset("assets/logo2.png",
                              fit: BoxFit.fill)))),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 0),
                child: SizedBox(
                  child: Text(
                    widget.title!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: kBrandRed),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 10),
                child: SizedBox(
                  child: Text(
                    widget.desc ?? "",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: kTextMedium),
                  ),
                ),
              ),
              if (widget.agree!)
                const Padding(
                  padding:
                      EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
                  child: SizedBox(
                    child: Text(
                      "Та зөвшөөрч байна уу?",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: kTextMedium),
                    ),
                  ),
                ),
              widget.type == 2
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 40, bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: PrimaryButton(
                              height: 40,
                              borderRadius: 16,
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              color: kDisable,
                              child: Center(
                                child: Text(widget.footerCancelText.toString(),
                                    style:
                                        const TextStyle(color: kPrimaryColor)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Expanded(
                            child: PrimaryButton(
                              height: 40,
                              borderRadius: 16,
                              onPressed: () {
                                widget.onPressedSubmit?.call();
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context, false);
                                }
                              },
                              color: kPrimaryColor,
                              child: Center(
                                  child:
                                      Text(widget.footerSubmitText.toString())),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 12, right: 12, top: 40, bottom: 20),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: PrimaryButton(
                                  height: 40,
                                  borderRadius: 16,
                                  onPressed: () {
                                    widget.onBackSubmit?.call();
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context, false);
                                    }
                                  },
                                  color: kDisable,
                                  child: Center(
                                    child: Text(
                                        widget.footerCancelText.toString(),
                                        style: const TextStyle(
                                            color: kPrimaryColor)),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Expanded(
                                child: PrimaryButton(
                                  height: 40,
                                  borderRadius: 16,
                                  onPressed: () {
                                    widget.onPressedSubmit?.call();
                                    if (Navigator.canPop(context)) {
                                      Navigator.pop(context, false);
                                    }
                                  },
                                  color: kPrimarySecondColor,
                                  child: Center(
                                      child: Text(
                                          style: TextStyle(color: Colors.white),
                                          widget.footerSubmitText.toString())),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
