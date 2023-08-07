
import 'package:firebase/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase/signup.dart';
import 'package:flutter/material.dart';
class signIn extends StatefulWidget {
  const signIn({super.key});

  @override

  State<signIn> createState() => _signInState();
}
class _signInState extends State<signIn> {
bool passwordVisible=false;
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  bool isLoading =false;
  final _formKey =GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController =TextEditingController();
  signInWithEmailAndPassword () async{
    try {
      setState(() {
        isLoading =true;
      });
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      setState(() {
        isLoading=false;

      });

    } on FirebaseAuthException catch (e) {
      setState(() {
        isLoading=false;
      });
      if (e.code == 'user-not-found') {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("No user found for that email"),
        ));
      } else if (e.code == 'wrong-password') {
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Wrong Password Provide for that user"),
        ));
      }
    }
  }

  @override
  void initState(){
    passwordVisible = false;
  }
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width*0.8;
    double line = MediaQuery.of(context).size.width*0.35;
    return Scaffold(
      resizeToAvoidBottomInset : false,
      body: SingleChildScrollView(
        child: SafeArea(
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
                      ,child: Text('Sign In',style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold,),)),
                  SizedBox(
                    height: 20,
                  ),

                  TextFormField(
                    controller: emailController,

                    validator: (text){
                      if(text==null||text.isEmpty){
                  return 'Email is Empty';
                      }
                      return null;
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
                    height: 5,
                  ),
                  Container(alignment: Alignment.topRight,
                      child: Text('Forgot Password?',style: TextStyle(color: Colors.blueAccent),)),
                  SizedBox(
                    height: 30,
                  ),
                 SizedBox(
                   height: 50,
                   width: width,
                   child: ElevatedButton(onPressed: (){
                     if(_formKey.currentState!.validate()){
                       signInWithEmailAndPassword();
                     }

                   }, child:isLoading?Center(child: CircularProgressIndicator(color: Colors.white,)): Text('Sign In',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(

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
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      Container(
                        height:1.0,
                        color:Colors.grey,
                        width:line,),
                      SizedBox(width: 10,),
                      Text('OR',style: TextStyle(color: Colors.grey),),
                      SizedBox(width: 10,),
                      Container(
                        height:1.0,
                        width:line,
                        color:Colors.grey,),
                    ],
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: width,
                    child: ElevatedButton(onPressed: (){
                      signInWithGoogle();
                    }, child:
                 Container(alignment: Alignment.centerRight,
                 child:  Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                       Image(
                           height: 20,width: 20,image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/2008px-Google_%22G%22_Logo.svg.png')),
                       SizedBox(
                         width: 10,
                       ),
                       Text('Continue With Google',style: TextStyle(fontSize: 17,color: Colors.black,fontWeight: FontWeight.bold),)
                   ],
                 ),
               ),
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(28.0),
                                side: BorderSide(color: Colors.grey.shade300),
                            ),
                        ),
                        backgroundColor:  MaterialStateProperty.all<Color>(Colors.white),

                    ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('New to Adhicine?'),
                      InkWell(onTap:
                      (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> signUp()));
                      },child: Text('Sign Up',style: TextStyle(color: Colors.blueAccent),))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
