import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'main_button.dart';

class LocationsInformation extends StatefulWidget {
  const LocationsInformation(
      {super.key,
      required this.locationName,
      required this.tag,
      required this.imageLink,
      required this.location,
      required this.information});

  final String locationName;
  final String tag;
  final String imageLink;
  final String location;
  final String information;

  @override
  State<LocationsInformation> createState() => _LocationsInformationState();
}

class _LocationsInformationState extends State<LocationsInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: SizedBox(
                width: double.infinity,
                child: Hero(
                    tag: widget.tag,
                    child: Image.network(
                      widget.imageLink,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.locationName,
                      style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Space'),
                    ),
                    Text(
                      widget.location,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Space'),
                    ),
                    Text(
                      widget.information,
                      style: const TextStyle(
                        fontSize: 14,
                        color: kDarkBlueColor,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Space',
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: MainButton(
                        text: 'I Like!',
                        onTap: () {
                          
                          Navigator.pop(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
