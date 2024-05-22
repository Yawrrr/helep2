// ignore_for_file: camel_case_types, unused_element, file_names


import 'package:flutter/material.dart';
import 'package:helep2/components/choice_chips.dart';
import 'package:helep2/components/place_tile.dart';
import 'package:helep2/models/place.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({super.key});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  int? _index;
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  final TextEditingController textController = TextEditingController();
  
  static List<Place> _tempListofPlaces = places;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onChanged);
  }

  void _onChanged() {
    final currentSize = _controller.size;
    if (currentSize <= 0.05) _collapse();
  }

  void _collapse() => _animateSheet(sheet.snapSizes!.first);

  void _anchor() => _animateSheet(sheet.snapSizes!.last);

  void _expand() => _animateSheet(sheet.maxChildSize);

  void _hide() => _animateSheet(sheet.minChildSize);

  void _animateSheet(double size) {
    _controller.animateTo(size,
        duration: const Duration(milliseconds: 50), curve: Curves.easeInOut);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  DraggableScrollableSheet get sheet =>
      (_sheet.currentWidget as DraggableScrollableSheet);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return DraggableScrollableSheet(
        key: _sheet,
        initialChildSize: 0.5,
        maxChildSize: 1,
        minChildSize: 0,
        expand: true,
        snap: true,
        snapSizes: [100 / constraints.maxHeight, 0.5],
        controller: _controller,
        builder: (BuildContext context, ScrollController scrollController) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  //drag bar
                  SliverToBoxAdapter(
                    child: Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFDECDC3),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10)),
                        ),
                        height: 4,
                        width: 40,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                      ),
                    ),
                  ),
                  //search bar
                  SliverToBoxAdapter(
                    child: TextField(
                      style: const TextStyle(color: Color(0xFF54392D),height: 1),
                      controller: textController,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xFFF5EFEC),
                        hintText: 'Search',
                        hintStyle: TextStyle(color: Color(0xFF936B4F)),
                        prefixIcon: Icon(Icons.search, color: Color(0xFF54392D),),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _tempListofPlaces = places
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  //choice Chip
                  const SliverToBoxAdapter(
                    child: searchChips(),
                  ),
                  //list of places
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      Place place = _tempListofPlaces[index];
                      return PlaceTile(place: place);
                    },
                    childCount: _tempListofPlaces.length,
                  ))
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
