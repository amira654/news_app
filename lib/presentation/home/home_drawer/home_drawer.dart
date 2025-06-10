import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/core/extentions/context_extention.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(16.r),
          bottomRight: Radius.circular(16.r),
        ),
      ),
      backgroundColor: ColorsManager.black17,
      width: context.width * 0.7,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 166.h,
            color: ColorsManager.white,
            child: Text("News_App",style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
                color: ColorsManager.black17),
          ) ),
         Padding(
           padding: REdgeInsets.all(16.0),
           child: Column(
             children: [
               Row(
                 children: [
                   Icon(
                     Icons.home,
                     color: ColorsManager.white,
                   ),
                   SizedBox(width: 8.w,),
                   Text("Go To Home",style: TextStyle(
                     fontSize: 20.sp,
                     color: ColorsManager.white,
                     fontWeight: FontWeight.bold,))
                 ],
               ),
               SizedBox(height: 24.h,),
               Divider(color: ColorsManager.white,
               thickness: 1.h,),
               SizedBox(height: 24.h,),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Text("Dark",style: TextStyle(
                     fontSize: 20.sp,
                     color: ColorsManager.white,
                     fontWeight: FontWeight.bold,)),
                   Switch(
                     value: true,
                     onChanged: (value){},
                     activeColor: ColorsManager.white,
                   ),

                 ]
               ),
               SizedBox(height: 24.h,),
               Divider(color: ColorsManager.white,
                 thickness: 1.h,),               SizedBox(height: 24.h,),

               Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("English",style: TextStyle(
                       fontSize: 20.sp,
                       color: ColorsManager.white,
                       fontWeight: FontWeight.bold,)),
                     Switch(
                       value: true,
                       onChanged: (value){},
                       activeColor: ColorsManager.white,
                     ),

                   ]
               )

             ],
           ),
         )
        ],
      ),
    );
  }
}
