import 'package:firebase/home.dart';
import 'package:firebase/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}
final _formKey =GlobalKey<FormState>();
bool lg=false;
TextEditingController emailController=TextEditingController();
TextEditingController passwordController =TextEditingController();
bool isLoading =false;
bool passwordVisible=false;
class _signUpState extends State<signUp> {
  createUserWithEmailAndPassword() async{
  try {
    setState(() {
      isLoading = true;
    });
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
  email: emailController.text,
  password: passwordController.text,
  );
  setState(() {
    isLoading=false;
    lg=true;
    lg==true?Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn())):null;
  });
  } on FirebaseAuthException catch (e) {
    setState(() {
      isLoading=false;
      lg=false;
    });
    if (e.code == 'email-already-in-use') {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("The account already exists for that email."),
      ));
  } else
    if (e.code == 'weak-password') {
      return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("The password provided is too weak"),
      ));
  }
  } catch (e) {
    setState(() {
      isLoading=false;
      lg=false;
    });
  print(e);
  }}


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width*0.8;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image(
                  height: 150,
                  width: 150,
                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZNStqZ9lT52ibqVbtuajBMFJS7GKUTKFmGg&usqp=CAU')
                  ,),
                SizedBox(
                  height: 40,
                ),
                Container(alignment: Alignment.topLeft
                    ,child: Text('Sign Up',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),)),
                SizedBox(
                  height: 20,
                ),

                TextFormField(
                  controller: emailController,
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'Email is empty';
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    prefixIcon: Icon(Icons.alternate_email,color: Colors.teal,),

                  ),
                ),
                SizedBox(
                  height: 30,
                ),

                TextFormField(
                  keyboardType: TextInputType.text,
                  controller: passwordController,
                    obscureText: !passwordVisible,
                  validator: (text){
                    if(text==null||text.isEmpty){
                      return 'Password is Empty';
                    }
                  },
                  decoration: InputDecoration(

                      hintText: 'Enter Your Password',
                      prefixIcon: Icon(Icons.lock,color: Colors.teal,),
                      suffixIcon: IconButton(
                  icon: Icon(
                  // Based on passwordVisible state choose the icon
                  passwordVisible
                  ? Icons.visibility
                    : Icons.visibility_off,
                    color: Theme.of(context).primaryColorDark,
                  ),
                  onPressed: () {
                    // Update the state i.e. toogle the state of passwordVisible variable
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: width,
                  child: ElevatedButton(onPressed: (){
                    if(_formKey.currentState!.validate()){
                      createUserWithEmailAndPassword();
                      lg==true?Navigator.push(context, MaterialPageRoute(builder: (context)=>signIn())):null;
                    }
                   //lg==true?Navigator.push(context, MaterialPageRoute(builder: (context)=>homeScreen())):null;
                  }, child: isLoading? CircularProgressIndicator():Text('Sign Up',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(

                  ).merge(ButtonStyle(

                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        side: BorderSide(color: Colors.blueAccent.shade700,),
                      ),

                    ),
                    backgroundColor:  MaterialStateProperty.all<Color>(Colors.blueAccent),
                  ),)
                  ),
                ),

                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Already have an account?'),
                    InkWell(onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>
                        signIn()
                      ));
                    }
                        ,child: Text('Sign In',style: TextStyle(color: Colors.blueAccent),))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
