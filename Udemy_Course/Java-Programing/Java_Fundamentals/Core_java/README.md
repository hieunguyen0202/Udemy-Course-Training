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
Like polymorphism
```
First:
	A obj = new A();
	obj.show();
After:
	obj = new B();
	obj.show();
```
- Stack:
	- First: obj with 101
	- After: obj with 103 
- Heap:
	- Object A have `show()` with address 101
	- Object B have `show()` with address 103
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
```java
class Laptop
{
	String model;
	int price;
//	String serial;
	
	public String toString()
	{
//		return "Hey";
		return model+ " : "+price;
	}
	public boolean equals(Laptop that)
	{
//		if(this.model.equals(that.model) && this.price==that.price) 
//			return true;
//		else
//			return false;
		
		return this.model.equals(that.model) && this.price==that.price ;
	}
}
	
public class  Demo{
    public static void main(String[] args) {

    	Laptop obj=new Laptop();
    	obj.model="Lenevo Yoga";
    	obj.price=1000;
    	
    	Laptop obj2=new Laptop();
    	obj2.model="Lenevo Yoga";
 //   	obj2.model="Lenevo Yoga1";
    	obj2.price=1000;
    	
    	boolean result = obj.equals(obj2);
    	
    	System.out.println(obj.toString());
//   	System.out.println(obj);
    	
    }
}
```
- If you print(obj), it will print value it has default return value of funtion toString(), So, If you want to change, please override method(): toString()
- Using `equals(Object obj)` to compare two object
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
```java
class A
{
	public void show1()
	{
		System.out.println("in A show");
	}
}
class B extends A
{
	public void show2()
	{
		System.out.println("in show B");
	}
}

public class  Demo{
    public static void main(String[] args) {

//    	double d=4.5;
//    	int i=(int)d;
//    	
//    	System.out.println(i);
    	
//    	A obj= new A();
//    	A obj=(A) new B();   //upcasting
//    	obj.show1();
    	
    	A obj=new B();
    	obj.show1();  // System.out.println("in A show");
    	
    	B obj1=(B)obj;
    	obj1.show2(); //System.out.println("in show B");
    }
}
```
## Abstract keyword
```java
abstract class Car
{
//	public void drive()
//	{
//
//	}
	
	public abstract void drive();
	public abstract void fly();
	
	public void playMusic()
	{
		System.out.println("play music");
	}
}

abstract class WagnoR extends Car
{
//	public void fly()
//	{
//		System.out.println("Flying...");
//	}
	public void drive()
	{
		System.out.println("Driving...");
	}
}

class UpdateWagnoR extends WagnoR   //concrete class
{
	public void fly()
	{
		System.out.println("flying...");
	}
}

public class  Demo{
    public static void main(String[] args) {

 //   	Car obj=new Car();
 //   	Car obj=new WagnoR();
    	Car obj=new UpdateWagnoR();
    	obj.drive();
    	obj.playMusic();
    }
}
```
- The Abstract class it means: You don't need to implement the method
- If I remove `abstract` from `abstract class WagnoR extends Car`, the syntax error will apear. Because you didn't implement all method (Particularly `public void fly()`). To solve that problem, the simple way is add keyword `abstract` in a head of method and create the `class UpdateWagnoR` extends WagnoR to implement `public void fly()` method.
## 67. Inner class
```java
class A
{
	int age;
	public void show()
	{
		System.out.println("in show");
	}
//	class B
//	{
//		public void config()
//		{
//			System.out.println("in config");
//		}
//	}
	static class B
	{
		public void config()
		{
			System.out.println("in config");
		}
	}
}

public class  Demo{
    public static void main(String[] args) {
    	A obj=new A();
    	obj.show();
   	
//    	A.B obj1=obj.new B();
//    	obj1.config();
    	
    	A.B obj1=new A.B();
    	obj1.config();
    }
}
```
- Case 1: If you remove `static` from `static class B`, you must be use `A.B obj1=obj.new B();` because you need to create the object first, and you can be able to access the attribute of the class (Indicate: class B(non-static) belong to class A)
- Case 2: Becasue the `static class B` is static, so that's why you can be able to use `A.B obj1=new A.B();` to access the attribute of the class.
## 68. Anonymous Inner class
```java
class A
{
	public void show() 
	{
		System.out.println("in A show");
	}
}
//class B extends A
//{
//	public void show()
//	{
//		System.out.println("in B Show");
//	}
//}

public class  Demo{
    public static void main(String[] args) {
    	
    	//A obj=new B();
    	
    	A obj=new A() 
    	{
    		public void show()
    		{
    			System.out.println("in new show");
    		}
    	};
    	obj.show();
    }
}
```
- Anonymous simply means something which doesn't have a name.
- Instead of using this code below, yuo can use this code above. The advantage is that you don't need to create a new class and extends the parent class.
- Two ways have the same result.
```java
class A
{
	public void show() 
	{
		System.out.println("in A show");
	}
}
class B extends A
{
	public void show()
	{
		System.out.println("in B Show");
	}
}

public class  Demo{
    public static void main(String[] args) {
    	
    	A obj=new B();
    	obj.show();
    }
}
```
## Abstract and anonymous inner class

```java
abstract class A
{
	public abstract void show();
	public abstract void config();

}

//class B extends A
//{
//	public void show()
//	{
//		System.out.println("in B show");
//	}
//}


public class  Demo{
    public static void main(String[] args) {
    	
//    	A obj=new B();
    	
    	A obj=new A() 
    	{
    		public void show()
    		{
    			System.out.println("in new show");
    		}
		public void config()
    		{
    			System.out.println("in new config");
    		}
    	};
    	obj.show();
    	
    }
}
```
## 70. What is Interface
- Now first of all, interface is not a class.
- And by default, every method in the interface is public abstract.
- So all the variables inside the interface are by default, final(const) and static.
```java
interface A
{
//	public abstract void show();
//	public abstract void config();
	int age=44;            // final and static 
	String area="Mumbai";
	
	void show();
	void config();
}

class B implements A
{
	public void show()
	{
		System.out.println("in show");
	}
	public void config()
	{
		System.out.println("in cofing");
	}
}

public class Demo {
    public static void main(String[] args) {

    	A obj;
    	obj=new B();
    	
    	obj.show();
    	obj.config();
    	
 //   	A.area="Hyderabad"; // can't assign new value because the default of variables in interface is const
    	
    	System.out.println(A.area);
        
    }
}

```
## 71. More on Interfaces
```java
// class - class -> extends
// class - interface -> implements
// interface - interface -> extends

interface A
{
//	public abstract void show();
//	public abstract void config();
	int age=44;            // final and static 
	String area="Mumbai";
	
	void show();
	void config();
}

interface X
{
	void run();
}
interface Y extends X
{
	
}

class B implements A,Y
{
	public void show()
	{
		System.out.println("in show");
	}
	public void config()
	{
		System.out.println("in cofing");
	}
	public void run()
	{
		System.out.println("running...");
	}
}

public class Demo {
    public static void main(String[] args) {

    	A obj;
    	obj=new B();
    	
    	obj.show();
    	obj.config();
    	
    	X obj1=new B();
    	obj1.run();
    	
 //   	A.area="Hyderabad";
    	
    	System.out.println(A.area);
        
    }
}
```
## 72. Need of Interface
```java
/*

abstract class Computer
{
//	public void code()
//	{
//		
//	}
	public abstract void code();
}

class Laptop extends Computer
{
	public void code()
	{
		System.out.println("code, compile, run");
	}

}

class Desktop extends Computer
{
	public void code()
	{
		System.out.println("code, compile, faster");
	}
}
class Developer
{
//	public void devApp(Laptop lap)
	public void devApp(Computer lap)
	{
		lap.code();
	}
}

public class Demo {
    public static void main(String[] args) {
//        Laptop lap=new Laptop();
//        Desktop desk=new Desktop();
        
        Computer lap=new Laptop();
        Computer desk=new Desktop();
        
        Developer navin=new Developer();
        navin.devApp(lap);
        
    }
}
*/
```

```java

interface Computer
{
	 void code();
}

class Laptop implements Computer
{
	public void code()
	{
		System.out.println("code, compile, run");
	}

}

class Desktop implements Computer
{
	public void code()
	{
		System.out.println("code, compile, faster");
	}
}
class Developer
{
//	public void devApp(Laptop lap)
	public void devApp(Computer lap)
	{
		lap.code();
	}
}

public class Demo {
    public static void main(String[] args) {
//        Laptop lap=new Laptop();
//        Desktop desk=new Desktop();
        
        Computer lap=new Laptop();
        Computer desk=new Desktop();
        
        Developer navin=new Developer();
        navin.devApp(lap);
        
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



