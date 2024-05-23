// ignore_for_file: camel_case_types, unused_element, file_names

import 'package:flutter/material.dart';
import 'package:helep2/components/place_tile.dart';
import 'package:helep2/models/place.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({super.key});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  final _scrollController = ScrollController();
  final TextEditingController textController = TextEditingController();
  
  List<Place> tempListOfPlace = places;
  final List<String> _filters = [
    'Faculty',
    'College',
    'Entertainment',
    'Dining',
    'Facility',
    'Administration'
  ];
  int? _index;

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
                          color: Color(0xFF936B4F),
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
                          _index = null;
                          tempListOfPlace = places
                              .where((element) => element.name
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                  //choice Chip
                  SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List<Widget>.generate(
                          6,
                          (index) => Padding(
                            padding: const EdgeInsets.only(right: 6.0, bottom: 10, top: 4),
                            child: ChoiceChip(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              showCheckmark: false,
                              label: Text(
                                _filters[index],
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 1,
                                  color:
                                      _index == index ? Colors.white : const Color(0xFF54392D),
                                ),
                              ),
                              backgroundColor: const Color(0xFFF5EFEC),
                              padding: const EdgeInsets.symmetric(horizontal: 4, vertical: -2),
                              side: BorderSide.none,
                              selected: _index == index,
                              selectedColor: const Color(0xFF54392D),
                              onSelected: (selected) {
                                setState(() {
                                  _index = selected ? index : null;
                                  tempListOfPlace = places
                                      .where((element) => element.type
                                          .toLowerCase()
                                          .contains(_filters[index].toLowerCase()))
                                      .toList();
                                  if(_index==null) tempListOfPlace = places;
                                });
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  //list of places
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: constraints.maxHeight - 150, // Adjust height as needed
                      child: ListView.builder(
                        controller: _scrollController,
                        itemCount: tempListOfPlace.length,
                        itemBuilder: (context, index) {
                          Place place = tempListOfPlace[index];
                          return PlaceTile(place: place);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      );
    });
  }
}
