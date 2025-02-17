import 'package:new_crypto_app/app/notifiers/app_notifiers.dart';
import 'package:new_crypto_app/constants.dart';
import 'package:new_crypto_app/model/FinalModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class BuildCard extends StatelessWidget {
  const BuildCard({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height / 815;
    double width = MediaQuery.of(context).size.width / 375;
    var data = Provider.of<AppNotifiers>(context, listen: false);

    return FutureBuilder(
      future: data.getFinalData(),
      builder: ((BuildContext context, AsyncSnapshot<FinalModel> snapshot) {
        if (snapshot.hasError) {
          return const Center(
            child: Text("Opps! Try again later!"),
          );
        }
        if (snapshot.hasData) {
          return ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(
                parent: BouncingScrollPhysics()),
            itemCount: snapshot.data!.data!.coins!.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
                child: Container(
                  height: height * 100,
                  width: width * 150,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            double.parse(snapshot
                                    .data!.data!.coins![index].price
                                    .toString())
                                .toStringAsFixed(2),
                            style: const TextStyle(color: kGreen),
                          ),
                          SizedBox(
                            height: 30,
                            width: 30,
                            child: SvgPicture.network(
                              "${snapshot.data!.data!.coins![index].iconUrl}",
                              fit: BoxFit.contain,
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            snapshot.data!.data!.coins![index].symbol
                                .toString(),
                            style: const TextStyle(),
                          ),
                          SizedBox(
                            width: width * 10,
                          ),
                          Text(
                              '${double.parse(snapshot.data!.data!.coins![index].change.toString()).toStringAsFixed(2)}%'),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          );
        }

        return const Center(
            child: CircularProgressIndicator(
          color: kGreen,
        ));
      }),
    );
  }
}
