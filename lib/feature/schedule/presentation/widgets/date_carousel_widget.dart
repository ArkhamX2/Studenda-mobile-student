import 'package:flutter/material.dart';
import 'package:studenda_mobile_student/feature/schedule/presentation/widgets/position_values.dart';
import 'package:studenda_mobile_student/resources/colors.dart';

class DateCarouselWidget extends StatefulWidget {
  final List<String> dates;

  final Function(int) onDateTap;
  final Function() onPrevTap;
  final Function() onNextTap;

  const DateCarouselWidget({
    super.key,
    required this.dates,
    required this.onDateTap,
    required this.onPrevTap,
    required this.onNextTap,
  });

  @override
  State<DateCarouselWidget> createState() => _DateCarouselWidgetState();
}

class _DateCarouselWidgetState extends State<DateCarouselWidget> {
  int curIndex = 99;
  final PageController _controller = PageController(initialPage: 99);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: const BoxDecoration(
        color: Color.fromRGBO(211, 201, 253, 0.4),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
        child: PageView.builder(
          controller: _controller,
          onPageChanged: (value) {
            if(value > curIndex){
              setState(() {
                curIndex++;
              });
              widget.onNextTap();
            }
            else{
              setState(() {
                curIndex--;
              });
              widget.onPrevTap();
            }
          },
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: widget.dates
                  .asMap()
                  .map(
                    (key, value) => MapEntry(
                      key,
                      GestureDetector(
                        onTap: () {
                          widget.onDateTap(key);
                        },
                        child: _DateCarouselItemWidget(
                          day: key,
                          date: value,
                        ),
                      ),
                    ),
                  )
                  .values
                  .toList(),
            ),
          )
        ),
    );
  }
}

class _DateCarouselItemWidget extends StatelessWidget {
  final int day;
  final String date;

  const _DateCarouselItemWidget({
    required this.day,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          date,
          style: const TextStyle(
            color: mainForegroundColor,
            fontSize: 30,
          ),
        ),
        Text(
          weekPositionValues[day],
          style: const TextStyle(
            color: mainForegroundColor,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
