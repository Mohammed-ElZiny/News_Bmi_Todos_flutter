import 'package:flutter/material.dart';
import 'package:bmi/shared/cubit/todo_cubit/cubit.dart';

// AppCubit cubit = AppCubit.get(context);

Widget defaultButton(
    {required Function function,
    double radius = 5,
    double width = double.infinity,
    double height = 40,
    String text = "click me",
    Color background = Colors.blueGrey}) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      color: background,
    ),
    child: MaterialButton(
      onPressed: () {
        function;
      },
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget searchField({
  required TextEditingController controller,
  required Function onSubmit,
  TextInputType? type,
  Function? validate,
  Icon? prefixIcon,
  String? label,
  Function? ontap,
  isClickable = true,
}) {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        label: Text(" $label "),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(),
        enabled: isClickable,
      ),
      onTap: () {
        ontap!();
      },
      onChanged: (value) {
        onSubmit(value);
      },
      validator: (value) {
        return validate!(value);
      });
}
Widget defaulftFormField({
  required TextEditingController controller,
  required Function onSubmit,
  TextInputType? type,
  Function? validate,
  Icon? prefixIcon,
  String? label,
  Function? ontap,
  isClickable = true,
}) {
  return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: controller,
      decoration: InputDecoration(
        label: Text(" $label "),
        prefixIcon: prefixIcon,
        border: OutlineInputBorder(),
        enabled: isClickable,
      ),
      onTap: () {
        ontap!();
      },
      onFieldSubmitted: (value) {
        onSubmit(value);
      },
      validator: (value) {
        return validate!(value);
      });
}

Widget mailField({
  required TextEditingController controller,
  required Function onSubmit,
}) {
  return TextFormField(
    keyboardType: TextInputType.emailAddress,
    controller: controller,
    decoration: InputDecoration(
      hintText: "E-Mail",
      label: Text("Email Address"),
      prefixIcon: Icon(Icons.mail),
      border: OutlineInputBorder(),
    ),
    onFieldSubmitted: (value) {
      onSubmit(value);
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "email address can't be empty";
      } else {
        return null;
      }
    },
  );
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;

  const PasswordField({super.key, required this.controller});
  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool hiddenPass = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.visiblePassword,
      style: TextStyle(color: Colors.grey),
      decoration: InputDecoration(
        label: Text("Password"),
        hintText: "Password",
        suffixIcon: IconButton(
          icon: Icon(hiddenPass ? Icons.visibility : Icons.visibility_off),
          onPressed: () {
            hiddenPass = !hiddenPass;
            setState(() {});
          },
        ),
        prefixIcon: Icon(Icons.lock),
        focusedBorder: OutlineInputBorder(),
        border: OutlineInputBorder(),
      ),
      obscureText: hiddenPass,
      controller: widget.controller,
      onFieldSubmitted: (value) {
        print(value);
      },
      validator: (value) {
        if (value!.isEmpty) {
          return "please enter your password";
        } else {
          return null;
        }
      },
    );
  }
}
// StatefulWidget PasswordField({
//   required TextEditingController controller,
// }) {

//   bool hiddenPass = true;
//   return TextFormField(

//     keyboardType: TextInputType.visiblePassword ,
//     style: TextStyle(color: Colors.grey ),
//     decoration: InputDecoration(
//       label: Text("Password"),
//       hintText: "Password",
//       suffixIcon: IconButton(
//         icon:Icon(hiddenPass?Icons.visibility:Icons.visibility_off)
//         ,onPressed: (){
//           hiddenPass=!hiddenPass;
//          setState(() {});
//         },),
//       prefixIcon: Icon(Icons.lock),
//       focusedBorder: OutlineInputBorder(

//       ),
//       border: OutlineInputBorder(),
//     ),
//     obscureText: hiddenPass,
//     controller: controller,
//     onFieldSubmitted: (value) {
//       print(value);
//     },
//     validator: (value) {
//       if (value!.isEmpty) {
//         return "please enter your password";
//       } else {
//         return null;
//       }
//     },
//   );
// }

Widget taskBuilder(var task, BuildContext context, {String check = "done", String archive = "archived"}) {

  return Dismissible(
    key: Key("${task['id']}"),
    onDismissed: ((direction){
      if(direction == DismissDirection.startToEnd){
        AppCubit.get(context).updateData(id: task["id"], status: archive);
      }
      if(direction == DismissDirection.endToStart){
          AppCubit.get(context).deleteData(task["id"]);
      }
    }),
    child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: Colors.teal,
            radius: 45,
            child: Text(task["time"]),
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  task["title"],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                Text(
                  task["date"],
                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                ),
              ],
            ),
          ),
          IconButton(onPressed: (){
              AppCubit.get(context).updateData(id: task["id"], status: check);
          }, icon: Icon(Icons.check_box, color: Colors.green)),
          IconButton(onPressed: (){
              AppCubit.get(context).updateData(id: task["id"], status: archive);
    
          }, icon: Icon(Icons.archive)),
        ],
      ),
    ),
  );
}


// ignore: non_constant_identifier_names
Widget articelBuilder(var data, context)=> Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: (){
          // print(data['url']);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(
                        data['image_url']
                        ),
                    fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 8,),
            Expanded(
              child: SizedBox(
                height: 120,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(data['title'],
                      maxLines: 1,
                      style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    Expanded(
                      child: Text(data['description'],
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,),
                    ),
                    Expanded(
                      child: Text(data['published_at'],
                      style:Theme.of(context).textTheme.bodySmall ,
                      ),
                    ),
                  ],
                ),
              ),
            )
        
          ],
        ),
      ),
    );