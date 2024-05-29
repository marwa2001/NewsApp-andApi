
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/commponent.dart';

import '../../shared/cubit/cubit.dart';
import '../../shared/cubit/states.dart';

class BusinessScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,NewsStates){},
      builder: (BuildContext context, NewsStates state) {
        var List =NewsCubit.get(context).business;
        return ArticalConditionalBuilder(List,context);
      },
    );

  }
}
