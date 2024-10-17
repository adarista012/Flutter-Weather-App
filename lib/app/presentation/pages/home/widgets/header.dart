import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outcode/app/presentation/widgets/gap.dart';

Widget header(
  double width,
  void Function() toogleSearcher,
  void Function() searchLocation,
  void Function(String)? onChanged,
  BuildContext context,
) =>
    Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Visibility(
          visible: width != 0,
          child: Expanded(
            child: CupertinoTextField(
              placeholder: "Location",
              onChanged: onChanged,
            ),
          ),
        ),
        gap(width: 8.0),
        MaterialButton(
          onPressed: width == 0
              ? toogleSearcher
              : () {
                  searchLocation();
                  toogleSearcher();
                },
          shape: width == 0 ? const CircleBorder() : const StadiumBorder(),
          padding: EdgeInsets.zero,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          color: Theme.of(context).colorScheme.onInverseSurface,
          child: width == 0
              ? Icon(
                  Icons.search,
                  color: Theme.of(context).colorScheme.primary,
                )
              : Text(
                  'Search',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
        ),
      ],
    );
