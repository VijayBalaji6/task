// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/constants/api_response.dart';
import 'package:task/constants/colors.dart';
import 'package:task/models/api_model.dart' as api_model;
import 'package:task/modules/api_view/api_controller.dart';

class ApiScreen extends StatelessWidget {
  ApiScreen({super.key});
  final ApiController apiController = Get.find();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
              child: Icon(
                Icons.refresh,
                color: AppColor.indigo,
              ),
              onPressed: () async => await apiController.getCall()),
          body: GetBuilder<ApiController>(
            initState: (state) => apiController.getCall(),
            builder: (controller) {
              if (controller.apiData.status == Status.LOADING) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: AppColor.black,
                ));
              } else if (controller.apiData.status == Status.COMPLETED) {
                final api_model.ApiDataModel apiData = controller.apiData.data!;
                return DataView(apiData: apiData);
              } else {
                return Center(
                  child: Text(controller.apiData.message.toString()),
                );
              }
            },
          )),
    );
  }
}

class DataView extends StatelessWidget {
  const DataView({super.key, required this.apiData});
  final api_model.ApiDataModel apiData;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          itemCount: apiData.routes.length,
          itemBuilder: (context, index) {
            final currentRoute = apiData.routes[index];
            return Column(
              children: [
                title(dataTitle: "Routs"),
                dataTitle(dataTitle: "NorthEast"),
                dataText(
                    title: 'Longitude',
                    data: currentRoute.bounds?.northeast?.lng.toString() ?? ""),
                dataText(
                    title: 'Latitude',
                    data: currentRoute.bounds?.northeast?.lat.toString() ?? ""),
                dataTitle(dataTitle: "SouthWest"),
                dataText(
                    title: 'Longitude',
                    data: currentRoute.bounds?.southwest?.lng.toString() ?? ""),
                dataText(
                    title: 'Latitude',
                    data: currentRoute.bounds?.southwest?.lat.toString() ?? ""),
                title(dataTitle: "Legs"),
                LegsView(legData: currentRoute.legs)
              ],
            );
          },
        ),
      ),
    );
  }
}

Text dataTitle({required String dataTitle}) {
  return Text(
    dataTitle,
    style: const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
  );
}

Text title({required String dataTitle}) {
  return Text(
    dataTitle,
    style: const TextStyle(
        color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
  );
}

Row dataText({required String title, required String data}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      Text(
        data,
        style: const TextStyle(color: Colors.black),
      ),
    ],
  );
}

class LegsView extends StatelessWidget {
  const LegsView({super.key, required this.legData});
  final List<api_model.Leg> legData;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: legData.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final currentLeg = legData[index];
          return Column(
            children: [
              dataTitle(dataTitle: 'Distance'),
              dataText(title: 'Text', data: '${currentLeg.distance?.text}'),
              dataText(title: 'Value', data: '${currentLeg.distance?.value}'),
              dataTitle(dataTitle: 'Duration'),
              dataText(title: 'Text', data: '${currentLeg.duration?.text}'),
              dataText(title: 'Value', data: '${currentLeg.duration?.value}'),
              dataText(title: 'End Address', data: '${currentLeg.endAddress}'),
              dataTitle(dataTitle: 'End Location'),
              dataText(
                  title: 'Latitude', data: '${currentLeg.endLocation?.lat}'),
              dataText(
                  title: 'Longitude', data: '${currentLeg.endLocation?.lng}'),
              dataText(
                  title: 'Start Address', data: '${currentLeg.startAddress}'),
              dataTitle(dataTitle: 'Start Location'),
              dataText(
                  title: 'Latitude', data: '${currentLeg.startLocation?.lat}'),
              dataText(
                  title: 'Longitude', data: '${currentLeg.startLocation?.lng}'),
              title(dataTitle: "Steps"),
              StepsView(
                stepData: currentLeg.steps,
              )
            ],
          );
        });
  }
}

class StepsView extends StatelessWidget {
  const StepsView({
    super.key,
    required this.stepData,
  });
  final List<api_model.Step> stepData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: stepData.length,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          final currentStep = stepData[index];
          return Column(
            children: [
              dataTitle(dataTitle: 'Distance'),
              dataText(title: 'Text', data: '${currentStep.distance?.text}'),
              dataText(title: 'Value', data: '${currentStep.distance?.value}'),
              dataTitle(dataTitle: 'Duration'),
              dataText(title: 'Text', data: '${currentStep.duration?.text}'),
              dataText(title: 'Value', data: '${currentStep.duration?.value}'),
              dataText(title: 'Travel Mode', data: '${currentStep.travelMode}'),
              dataTitle(dataTitle: 'End Location'),
              dataText(
                  title: 'Latitude', data: '${currentStep.endLocation?.lat}'),
              dataText(
                  title: 'Longitude', data: '${currentStep.endLocation?.lng}'),
              dataTitle(dataTitle: 'Start Location'),
              dataText(
                  title: 'Latitude', data: '${currentStep.startLocation?.lat}'),
              dataText(
                  title: 'Longitude',
                  data: '${currentStep.startLocation?.lng}'),
            ],
          );
        });
  }
}
