import 'package:flutter/material.dart';
import 'package:multichoice/models/hala_payments_entity.dart';
import 'package:intl/intl.dart';

class HalaPaymentItemWidget extends StatefulWidget {
  const HalaPaymentItemWidget({required this.halaPayment, Key? key})
      : super(key: key);

  final HalaPaymentsEntity halaPayment;

  @override
  _HalaPaymentItemWidgetState createState() => _HalaPaymentItemWidgetState();
}

class _HalaPaymentItemWidgetState extends State<HalaPaymentItemWidget> {
  final double itemPadding = 15;

  bool showMoreDetails = false;

  final TextStyle parametersTextStyle = const TextStyle(color: Colors.black54);


  @override
  Widget build(BuildContext context) {
    String trxDate = DateFormat("kk:mm:ss  yyyy-MM-dd").format(DateTime.parse(widget.halaPayment.trxDate!));
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                showMoreDetails = !showMoreDetails;
              });
            },
            child: Container(
              padding: EdgeInsets.all(itemPadding),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.halaPayment.fullNameAR!,
                        style: const TextStyle(color: Colors.purple, fontSize: 16),
                      ),
                      Text(widget.halaPayment.mobileNumber!),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        widget.halaPayment.amount!.toString(),
                        style: const TextStyle(
                            color: Colors.red,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const Text("ريال سعودي",
                          style: TextStyle(
                              color: Colors.black45,
                              fontSize: 12,
                              fontWeight: FontWeight.w200)),
                    ],
                  )
                ],
              ),
            ),
          ),
          showMoreDetails
              ? Container(
                  padding: EdgeInsets.all(itemPadding),
                  width: double.infinity,
                  color: const Color.fromRGBO(249, 251, 253, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: parametersTextStyle,
                    children: <TextSpan>[
                      const TextSpan(text: "رقم التحويل : "),
                       TextSpan(text: widget.halaPayment.trxRef,style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                RichText(
                  text: TextSpan(
                    style: parametersTextStyle,
                    children: <TextSpan>[
                      const TextSpan(text: "تاريخ التحويل : "),
                       TextSpan(text: trxDate,style: TextStyle(color: Colors.black)),
                    ],
                  ),
                ),
                const SizedBox(height: 5,),
                RichText(
                  text: TextSpan(
                    style: parametersTextStyle,
                    children: <TextSpan>[
                      const TextSpan(text: "اسم المنشأه : "),
                       TextSpan(text: widget.halaPayment.corporateFullNameAR,style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
              ],
            ),
                )
              : Container(),
        ],
      ),
    );
  }
}
