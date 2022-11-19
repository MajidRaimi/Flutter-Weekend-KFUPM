import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import 'location_information.dart';

class LocationSuggestion extends StatefulWidget {
  const LocationSuggestion({
    super.key,
    required this.locationName,
    required this.tag,
    required this.imageLink,
    required this.location,
    required this.information,
  });

  final String locationName;
  final String tag;
  final String imageLink;
  final String location;
  final String information;
  @override
  State<LocationSuggestion> createState() => _LocationSuggestionState();
}

class _LocationSuggestionState extends State<LocationSuggestion> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24.0),
        child: Container(
            color: kDarkBlueColor,
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LocationsInformation(
                        locationName: widget.locationName,
                        imageLink: widget.imageLink,
                        location: widget.location,
                        tag: widget.tag,
                        information: widget.information,
                      );
                    },
                  ),
                );
              },
              child: Stack(
                children: [
                  Hero(
                    tag: widget.tag,
                    child: Image.network(
                      
                      widget.imageLink,
                      fit: BoxFit.cover,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: kDarkBlueColor.withOpacity(0.5),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.locationName,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.location,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
