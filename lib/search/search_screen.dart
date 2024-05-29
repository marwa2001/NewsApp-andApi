import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';

import '../shared/commponent.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
var searchControler =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      builder: (context, state) {
        var List = NewsCubit.get(context).Search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defualtFormField(
                  controller: searchControler,
                  inputType: TextInputType.text,
                  onChanged: (dynamic value){
                    NewsCubit.get(context).getSearch(value);
                  },
                  validate: (dynamic value)
                  {
                    if(value!.isEmpty){
                      return 'search must not be empty';}
                    return null;

                  },
                  labelText: 'Search',
                  prefix: Icons.search,

                ),
              ),
              Expanded(child:
              ArticalConditionalBuilder(List,context)),
            ],
          ),
        );
      },
      listener: ( context,  state) {  },

    );
  }
}
