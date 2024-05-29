import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/webView.dart';
Widget defualtFormField(
    {required TextEditingController controller,
      required TextInputType inputType,
      void Function(String)? onSubmit,
      void Function()? onTap,
      void Function(String)? onChanged,
      final String? Function(String?)? validate,
      required String labelText,
      required IconData prefix,
      bool isPassword = false,
      IconData? suffix,
      void Function()? suffixPressed,
      bool isclickable = true}) =>
    TextFormField(
      controller: controller,
      enabled: isclickable,
      keyboardType: inputType,
      onFieldSubmitted: onSubmit,
      onChanged: onChanged,
      onTap: onTap,
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(prefix),
        suffix: suffix != null
            ? IconButton(
          icon: Icon(suffix),
          onPressed: suffixPressed,
        )
            : null,
        border: OutlineInputBorder(),
      ),
    );

Widget BuildArticalItem(artical,context) => InkWell(
  onTap: (){
    navigateTo(context, WebViewScreen(artical['url']));
  },
  child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage('${artical['urlToImage']}'),
                  fit: BoxFit.cover,
                )),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      '${artical['title']}',
                      style: Theme.of(context).textTheme.bodyLarge,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    '${artical['publishedAt']}',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
);

Widget myDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey[300],
      ),
    );

Widget ArticalConditionalBuilder(List,context) => ConditionalBuilder(
    condition: List.length > 0,
    builder: (context) => ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => BuildArticalItem(List[index],context
          ),
          separatorBuilder: (context, index) => myDivider(),
          itemCount: 15,
        ),
    fallback: (context) => Center(child: CircularProgressIndicator()));
//بينقل من widget للتانيه
void navigateTo(context,widget)=>Navigator.push(
  context,
  MaterialPageRoute(
      builder: (context)=>widget),


);