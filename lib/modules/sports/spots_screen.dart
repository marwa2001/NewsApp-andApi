import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/commponent.dart';
import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,NewsStates){},
      builder: (BuildContext context, NewsStates state) {
        var List =NewsCubit.get(context).sport;
        return ArticalConditionalBuilder(List,context);
      },
    );
  }
}
