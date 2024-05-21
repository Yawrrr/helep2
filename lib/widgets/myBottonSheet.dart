// ignore_for_file: unused_field

import 'package:flutter/material.dart';

class bottomSheet extends StatefulWidget {
  const bottomSheet({super.key});

  @override
  State<bottomSheet> createState() => _bottomSheetState();
}

class _bottomSheetState extends State<bottomSheet> {
  final _sheet = GlobalKey();
  final _controller = DraggableScrollableController();
  final TextEditingController textController = TextEditingController();

  //later change to fetch the data from database with late keyword
  static final List _listofPlaces = [
    'Arked Cengal',
    'He & She Coffee UTM Johor',
    'Arked Meranti',
    'Dewan Sri Iskandar',
    'Perpustakaan UTM',
    'Kolej Tun Fatimah',
    'Kolej Tun Dr. Ismail',
    'Kolej Tun Hussein Onn',
    'Kolej Tun Razak',
    'Tasik Ilmu',
  ];
  List _tempListofPlaces = _listofPlaces;

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
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).hintColor,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                      ),
                      height: 4,
                      width: 40,
                      margin: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextField(
                      controller: textController,
                      decoration: const InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      onChanged: (value) {
                        setState(() {
                          _tempListofPlaces = _listofPlaces
                              .where((element) => element
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      },
                    ),
                  ),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'List of Places',
                    style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  ),
                ),
                SliverList(
                    delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Card(
                      child: Column(
                        children: [
                          Container(
                            height: 150,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/images/ArkedMeranti.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                            ),
                          ),
                          ListTile(
                            title: Text(_tempListofPlaces[index]),
                            //later change to open detail page
                            onTap: () =>
                                ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(_tempListofPlaces[index]),
                                duration: const Duration(milliseconds: 500),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: _tempListofPlaces.length,
                ))
              ],
            ),
          );
        },
      );
    });
  }
}
