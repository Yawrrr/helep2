import 'package:flutter/material.dart';

class searchChips extends StatefulWidget {
  const searchChips({super.key});

  @override
  State<searchChips> createState() => _searchChipsState();
}

class _searchChipsState extends State<searchChips> {
  int? _index;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // Set horizontal scrolling
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
                index == 0
                    ? 'Faculty'
                    : index == 1
                        ? 'College'
                        : index == 2
                            ? 'Entertainment'
                            : index == 3
                                ? 'Dining'
                                : index == 4
                                    ? 'Facilities'
                                    : 'Administration',
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
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
