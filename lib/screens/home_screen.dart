import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interview_app/routes/route_name.dart';
import 'package:interview_app/utils/colors.dart';
import 'package:interview_app/utils/custom_text_style.dart';
import 'package:interview_app/viewmodels/home_viewmodel.dart';
import 'package:interview_app/widgets/my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeViewmodel homeViewmodel = Get.put(HomeViewmodel());

    return Scaffold(
        appBar: AppBar(
          title: const Text("Interview App"),
        ),
        body: Obx(
          () => SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Position",
                          style: CustomTextStyle.base(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: homeViewmodel.positionController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Coloring.pr1200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Coloring.pr900),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Coloring.arb500),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Coloring.pr100),
                            ),
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                          ),
                          style: CustomTextStyle.base(
                            fontSize: 12,
                          ),
                          onChanged: (value) {
                            homeViewmodel.validatePosition(value);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Position cannot be empty";
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Requirement",
                          style: CustomTextStyle.base(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Coloring.pr1200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Coloring.pr900),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Coloring.arb500),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Coloring.pr100),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                          ),
                          onChanged: (value) {
                            homeViewmodel.validateRequirement(value);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Requirement cannot be empty";
                          },
                          maxLines: 7,
                          style: CustomTextStyle.base(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Your Jobdesk",
                          style: CustomTextStyle.base(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Coloring.pr1200),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Coloring.pr900),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Coloring.arb500),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide:
                                  const BorderSide(color: Coloring.pr100),
                            ),
                          ),
                          onChanged: (value) {
                            homeViewmodel.validateJobdesk(value);
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) {
                            return value!.isNotEmpty
                                ? null
                                : "Jobdesk cannot be empty";
                          },
                          maxLines: 7,
                          style: CustomTextStyle.base(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyButton(
                    title: "Start Interview",
                    onPress: homeViewmodel.isPositionValid &&
                            homeViewmodel.isRequirementValid &&
                            homeViewmodel.isJobdeskValid
                        ? () => Get.toNamed(RouteName.interview)
                        : null,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
