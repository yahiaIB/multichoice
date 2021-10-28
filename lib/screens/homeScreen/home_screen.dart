import 'package:flutter/material.dart';
import 'package:multichoice/screens/homeScreen/home_screen_view_model.dart';
import 'package:multichoice/screens/homeScreen/widgets/filter_widget.dart';
import 'package:multichoice/screens/homeScreen/widgets/hala_payment_item_widget.dart';
import 'package:multichoice/viewmodels/authentication.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  final TextStyle bottomBarTextStyle = const TextStyle(color: Colors.green);

  @override
  Widget build(BuildContext context) {

    showFilterDialog(){
      showDialog(context: context, builder: (_) => AlertDialog(title: const FilterWidget()));
    }

    return ChangeNotifierProvider(
      create: (_) => HomeScreenViewModel()..getHalaPayments(),
      child: Consumer<HomeScreenViewModel>(builder: (context, _viewModel, _) {
        return Scaffold(
          backgroundColor: const Color.fromRGBO(242, 245, 252, 1),
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "مدفوعات هلا",
              style: TextStyle(color: Colors.black87),
            ),
            leading: IconButton(
                onPressed: () => context.read<AuthenticationViewModel>().logout(),
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black87,
                )),
            backgroundColor: const Color.fromRGBO(242, 245, 252, 1),
            elevation: 0,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60.0),
              child: Container(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 209, 0, 1),
                            borderRadius: BorderRadius.circular(5)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "إجمالي المدفوعات",
                              style: bottomBarTextStyle,
                            ),
                            _viewModel.busy
                                ? Container()
                                : RichText(
                                    text: TextSpan(
                                      style: bottomBarTextStyle,
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: _viewModel.totalAmount
                                                .toString(),
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                        const TextSpan(text: ' ريال سعودي '),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => showFilterDialog(),
                      child: Card(
                        child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: const Icon(Icons.filter_alt)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          body: _viewModel.busy
              ? const Center(child: CircularProgressIndicator())
              : _viewModel.error.isNotEmpty
                  ? Center(
                      child: Text(
                        _viewModel.error,
                        style: const TextStyle(color: Colors.red),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: ListView.builder(
                        itemCount: _viewModel.halaPayments.length,
                        itemBuilder: (context, index) => HalaPaymentItemWidget(
                            halaPayment: _viewModel.halaPayments[index]),
                      ),
                    ),
        );
      }),
    );
  }
}
