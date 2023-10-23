# Java_Fundamentals
## 23. JDK JRE JVM
- JDK: Java Dvelopment Kit is a tool that using compile the java code to byte code
- JVM: Java Virtual Machine that means you have to run the code on it
- JRE: Java Runtime Environment

## Static
#### [Static variables](https://github.com/markdown-it/markdown-it-emoji) 
Static variables is shared by all the object. If yuo want to refer a static variable, you can use a class name. Eg. ClassName.variableStatic
#### [Static method](https://github.com/markdown-it/markdown-it-emoji) 
- Using it: ClassName.method();
- Using static variable inside static method
- If not using static method for main, deadlock occur because you need to create object for main, and the main is the start point for execution.
#### [static block](https://github.com/markdown-it/markdown-it-emoji) 
```java
static String name;
static
{
   name = "Create Name";
}
```
- Whenever creating the object, the static block will be invoked firstly
- If you don't create a object, you can use it code to call static block (It's means that class load)
```java
Class.forName(className:"className");
```
## 54. Access Modifiers
- By the daufault is call default access modifiers. It means it can be accessed in the same package.
- Using private: it means it can be accessed in the same class.
- Using protected: you can't use it outside the package. it works in the same package and subclass.
## 56. Dynamic Method Dispatch

## 57. Final keyword
#### [final variables](https://github.com/markdown-it/markdown-it-emoji) 
- final = const in C++
```java
final int num = 8;
can't: num = 9;
```
#### [class variables](https://github.com/markdown-it/markdown-it-emoji) 
- Can't inheritant
```java
final class A
{
}
//Can not do like this:
class B extends A
{
}
```
#### [method variables](https://github.com/markdown-it/markdown-it-emoji) 
- Can not override this method
## 58. Object Class equals toString hashcode
- override method(): toString()
- equals(Object obj)
## 59. Upcasting and Downcasting
#### [Downcasting](https://github.com/markdown-it/markdown-it-emoji) 
```java
class A
{
   public void show1()
   {
   
   }
}
class B extends A
{
   public void show2()
   {
   
   }
}
public class Demo
{
   public static void main(String[] arg[])
   {
      // This is Upcasting: A obj = (A) new B();
      A obj = new B();
      obj.show1();
      B obj1 = (B) obj;
      obj1.show2();
   } 
}
```
## 60. Wrapper Class
```java
 public static void main(String[] arg[])
   {
      int num = 7;
      Integer num1 = num;
      int num2 = num1;
      System.out.println(num2);
      String str = "12";
      int num3  = Integer.parseInt(str); 
   } 
```
## Exception
```java
 public static void main(String[] arg[])
   {
      int i = 20;
      int j = 0;
      try
      {
         j = 18/i;
         if(j == 0)
         {
            throw new ArithmeticException("I don't want to devide by big number");
         }
      }
      catch(ArithmeticException e)
      {
            j = 18/1;
            System.out.println("That is the dafault output" + e);
      }
      catch(Exceoption e)
      {
            System.out.println("Something went wrong" + e);
      }
   } 
```
#### [Custom Exception](https://github.com/markdown-it/markdown-it-emoji) 
```java

class CustomException extends Exception
{
   public CustomException(String string)
   {
      super(string);
   }
}
 public static void main(String[] arg[])
   {
      int i = 20;
      int j = 0;
      try
      {
         j = 18/i;
         if(j == 0)
         {
            throw new CustomException("I don't want to devide by big number");
         }
      }
      catch(CustomException e)
      {
            j = 18/1;
            System.out.println("That is the dafault output" + e);
      }
      catch(Exceoption e)
      {
            System.out.println("Something went wrong" + e);
      }
   } 
```
#### [Ducking Exception using throws](https://github.com/markdown-it/markdown-it-emoji) 
```java
class A
{
	public void show() throws ClassNotFoundException
	{
//    	try
//    	{
//    		Class.forName("Calc");
//    	}
//    	catch(ClassNotFoundException e)
//    	{
//    		System.out.println("Not able to find theh class");
//    	}
		
		Class.forName("Calc");
	}
}

public class Demo {
	
	static {
		System.out.println("Class Loader");
	}
	
    public static void main(String[] args) {
    	
//    	try
//    	{
//    		Class.forName("Class");
//    	}
//    	catch(ClassNotFoundException e)
//    	{
//    		System.out.println("Not able to find theh class");
//    	}
    	
    	A obj=new A();
    	try {
    		obj.show();
    	}catch(ClassNotFoundException e)
    	{
    		e.printStackTrace();
    	}
    	
    	
    }
}
```
## Thread

## 96. Collection API

## Container



