import 'package:brave_girls/constants/colors.dart';
import 'package:brave_girls/controllers/chart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChartRankingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("음원 순위"),
        centerTitle: false,
        backgroundColor: AppColors.darkSlateBlue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      backgroundColor: Colors.white,
      body: GetBuilder<ChartController>(
        init: ChartController(),
        builder: (controller) {
          return !controller.isModelReady
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildTitleTile("멜론 일일 차트"),
                      const SizedBox(height: 20),
                      Container(
                        child: Text(
                          "Rollin' ${controller.melonChart[0]['rank']}위",
                        ),
                      ),
                      const SizedBox(height: 20),
                      _buildTitleTile("멜론 주간 차트"),
                      const SizedBox(height: 20),
                      Container(
                        child: Text(
                          "Rollin' ${controller.melonChart[1]['rank']}위",
                        ),
                      ),
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }

  Widget _buildTitleTile(String? title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 200,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: AppColors.darkSlateBlue,
          ),
          child: Center(
            child: Text(
              title!,
              style: TextStyle(
                fontFamily: 'NotoSansKR Bold',
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
