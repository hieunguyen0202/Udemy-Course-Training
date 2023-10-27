# link: [click](https://bosch-bgsv.udemy.com/course/mobile-automation-using-appiumselenium-3/learn/lecture/27347566#overview)
# Learning unit testing [Learn Java Unit Testing with Junit & Mockito in 30 Steps](https://bosch-bgsv.udemy.com/course/mockito-tutorial-with-junit-examples/learn/lecture/5678212#overview)
## Section 1: Introduction to Appium and Course Plan
### 1. Course Agenda
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/4a68cf6a-aeab-4f80-b05f-329f404722ff)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bb5a1ba2-257d-49ef-91f5-04488986caec)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/af96597f-fc5b-475a-9cc8-b6abce18434c)
### 2. Appium Features
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/278736c4-5c36-40dc-937d-ae7bb819d554)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/93b9f623-4df5-44bd-a648-4c958656f62d)
### 3. Appium Internal Architecture
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/adab29aa-fe57-49f7-8271-f11c0db95050)

## Section 2: Appium Installation Instructions for Window
### 4. Important Note on Player settings
### 5. Download Java, Android Studio & Node softwares for Appium Setup
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/68fc2644-f7dc-404f-989c-aab9b5444de0)
#### Download Java
- Step 1: Go to google "jdk download"
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/4d213bda-2b51-401d-9ebb-742a331b1295)
- Step 2:
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/3f18e3f0-1d16-43d6-9494-80046203c725)
- Step 3:
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/3bb7e5ae-4d25-449c-b8e1-ba11ae3f8865)
- Step 4:
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/43596c19-c55f-4524-a6a7-74f0acc83b13)
- Step 5: Copy path
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/d0179e54-081e-4944-a83a-4fb99fec4d6f)
- Step 6: Go to system environments
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/6b779155-4825-49ae-bce0-bebccd4570bc)
- Step 7: Go to system environments
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/677440ce-fab3-480c-81f1-ec2fe53d30f4)
#### Android Studio
#### Download Node
- Step 1: Go to google "node install"
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/b92b59cc-6d42-4f7a-af39-844bae8a1541)
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/5dad7ac7-508f-4943-a1f0-747340498ba1)

### 6. Set Environment variable Paths of all Softwares in WINDOWS
- Step 1: Copy the path
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bf160584-dbed-448c-91e5-4da46db47b36)
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/0c713a1f-be31-4f57-91db-299c3fd0b6c6)
- Step 2: Run application
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/6737c533-0359-4517-ae41-34b389e107bc)
- Step 3:
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bee402a8-c592-4feb-a649-0c80ec38fd09)
### 8. Configure Android Virtual Device/Emulator and Install Appium Server
Download `Appium Server`: `sudo npm install -g appium@next`
### 9. Setting up Appium Maven project with Java client dependencies
Install Eclipse
- Step 1: Select `Download Packages` -> `Eclipse IDE for java Developers`
- Step 2: Go to `maven repository` -> type `appium` -> Select `Java Client` -> Select Version -> Copy dependencies
- Step 3: Open Eclipse -> Click on `Create a project` -> Select `/Maven/Maven Project`-> Next
- Step 4: Click Next -> Select on `spring-boot-blank-archetype`-> Filter -> Select on `maven-archetype-quickstart` -> Next
- Step 5: Fill `Group Id` and `Artifact Id` -> Finish
- Step 6: Go to `porn.xml` and copy past dependencies
- Step 7: Go to `maven repository` -> Type `testing` -> Select `TestNG` -> Copy dependencies -> Save
- Step 8: Right click the roor folder -> Select `Maven` -> Select `Update project` -> CLick OK
### 10. Caution on Compatible testnG Java version along with Plugin Install
- Go to `Help` -> Select `Eclipse Marketplace` -> Search `testing` -> Install `TestNG for Eclipse`
### 11. Important Note
- Lets pause on Appium discussion here and jump on to  Java basics in next section to get basic brushup on Java concepts.
- If you are already familiar with Java basics, then please skip next section and move on  further for Appium automation.
## Section 3: Brush up Java Concepts for Appium Automation
### 12. Course Strategy to learn Appium basics for Selenium Automation
-Upload Image
```java
public class CoreJavaBrushUp1 {
public static void main(String[] args) {

// TODO Auto-generated method stub

int myNum = 5;
String website = "Rahul Shetty Academy";
char letter = 'r';
double dec = 5.99;
boolean myCard = true;

System.out.println(myNum+"is the value stored in the myNum variable");

System.out.println(website);

//Arrays -

int[] arr = new int[5];// 5, 10
arr[0] = 1;
arr[1] = 2;
arr[2]= 4;
arr[3]= 5;
arr[4]= 6;


int[] arr2 = {1,2,4,5,6};
System.out.println(arr2[0]);

//for loop arr.length - 5

for(int i = 0; i< arr.length; i++) //4

{

System.out.println(arr[i]);

}

for (int i =0;i<arr2.length; i++)

{

System.out.println(arr2[i]);

}

String[] name = {"rahul", "shetty", "selenium"};

for(int i =0; i<name.length;i++)

{

System.out.println(name[i]);

}

for( String s: name)

{

System.out.println(s);

}

}

}
```
```java
public class CoreJavaBrushUp3 {
    public static void main(String[] args) {
    // TODO Auto-generated method stub
    //string is an object //String literal
    // String s1 = "Rahul Shetty Academy";
    String s5 = "hello";
    //new
    String s2 = new String("Welcome");
    String s3 = new String("Welcome");
    String s = "Rahul Shetty Academy";
    String[] splittedString = s.split("Shetty");
    System.out.println(splittedString[0]);
    System.out.println(splittedString[1]);
    System.out.println(splittedString[1].trim());
      for(int i =s.length()-1;i>=0;i--)
      {
      System.out.println(s.charAt(i));
      }
  }
}

//************************************Methods Code *****************************************
public class MethodsDemo {
public static void main(String[] args) {
// TODO Auto-generated method stub
MethodsDemo d = new MethodsDemo();
String name = d.getData();
System.out.println(name);
MethodsDemo2 d1 = new MethodsDemo2();
d1.getUserData();
getData2();

}

public String getData()
{
System.out.println ("hello world");
return "rahul shetty";
}

public static String getData2()
{
System.out.println ("hello world");
return "rahul shetty";

}
}
```
## Section 4: Getting Started with Mobile testing using Appium Code
### 23. DO NOT SKIP - Important Note on dependencies version compatibility
Please go through below checklist and make sure you have correct configurations. If not you will run into issues from upcoming lectures

1.  Node version minimum should be 16. you can check your version with below command
`node -v`
If it is less than 16, please upgrade
2.  This course is taught on latest Appium Server 2.0 version. If you use older Version 1.22, then you will run into issues.
You can check your appium version with below command
`appium -v`
If you have less than 2 version, use below steps to install correctly
`npm uninstall -g appium`
Delete  appium folder in node modules
`npm install -g appium@next`

3.  Appium Java client 8.0.0 has few bugs. So please select the  version Greater than 8.0.0 from `mavenrepository.com`. ( Always select latest available)
3. Do not include any Selenium dependencies as of now in your project, I will later show what packages needs to be installed once we move into framework lectures,
So, as of now,  Below is Latest perfect working ( Appium & TestNG ) Combination  which you can have in your POM.xml Project for smoother execution
```
<dependency>
  <groupId>io.appium</groupId>
  <artifactId>java-client</artifactId>
  <version>8.3.0</version>
</dependency>
<!-- https://mvnrepository.com/artifact/org.testng/testng -->
<dependency>
  <groupId>org.testng</groupId>
  <artifactId>testng</artifactId>
  <version>6.14.3</version>
</dependency>
```
### 24. What is UIAutomator and creating UiAutomator object to define Capabilities
- UPLOAD
- `appium driver install uiautomator2`
- `appium driver list`
- Create new class
- Write code
  ```java
  package rahulshettyacademy;

	import java.net.MalformedURLException;
	import java.net.URL;
	import org.testng.annotations.Test;
	
	import io.appium.java_client.android.AndroidDriver;
	import io.appium.java_client.android.options.UiAutomator2Options;
	
	public class AppiumTest {
	
		public AndroidDriver driver;
		public AppiumDriverLocalService service;
		
		@Test
		public void AppiumTest() throws MalformedURLException
		{
									
		   UiAutomator2Options options = new UiAutomator2Options();
		   options.setDeviceName("RahulPhone"); //emulator
				
		   AndroidDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), null);
		   driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
		}
	}
  ```
- Start appium server, type command `appium`
### 26. Create Android Driver and set Desired capabilities through UiAutomator object
- Write code
  ```java
  package rahulshettyacademy;

	import java.net.MalformedURLException;
	import java.net.URL;
	import org.testng.annotations.Test;
	
	import io.appium.java_client.android.AndroidDriver;
	import io.appium.java_client.android.options.UiAutomator2Options;
	
	public class AppiumBasics {
		@Test
		public void AppiumTest() throws MalformedURLException
		{
  		//code to start server
	           //AndroidDriver, IOSDriver
	           //Appium code -> Appium Server -> Mobile
		   UiAutomator2Options options = new UiAutomator2Options();
		   options.setDeviceName("RahulPhone"); //emulator
		   options.setApp("/////ApiDemo-debug.apk")	
		   AndroidDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), null);
                   driver.quit()
                   //stop server
                   //Actuall automation
	
		}
	}
  ```
### 27. How to start & Stop Appium Server Programmatically using AppiumServiceBuilder
- In window : `C:users/HP/AppData/Roaming/npm/node_modules/appium/build/lib/main.js`
- Write code
  ```java
  package rahulshettyacademy;

	import java.net.MalformedURLException;
	import java.net.URL;
	import org.testng.annotations.Test;
	
	import io.appium.java_client.android.AndroidDriver;
	import io.appium.java_client.android.options.UiAutomator2Options;
	
	public class AppiumBasics {
		@Test
		public void AppiumTest() throws MalformedURLException
		{
  		//code to start server
	           //AndroidDriver, IOSDriver
	           //Appium code -> Appium Server -> Mobile
                   AppiumDriverLocalService service = new AppiumServiceBuilder().withAppiumJS(new File("//usr//local//lib//node_modules//appium//build//lib//main.js"))
  			.withIPAddress("127.0.0.1").usingPort(4723).build();
                   service.start();
		   UiAutomator2Options options = new UiAutomator2Options();
		   options.setDeviceName("RahulPhone"); //emulator
		   options.setApp("/////ApiDemo-debug.apk")	
		   AndroidDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), null);
                    //Actuall automation
                   driver.quit()
                   service.stop();
                   //stop server
                   
	
		}
	}
  ```
### 28. Introduction to Appium Inspector to identify the elements on the Apps
- Go to `appium inspector` github and install tool. That tool is used to identify the elements on the Apps
- Open App and config to load the device on `appium inspector`. we just focus on two elements `accessibility id` and `xpath`
- Write code
  ```java
  package rahulshettyacademy;

	import java.net.MalformedURLException;
	import java.net.URL;
	import org.testng.annotations.Test;
	
	import io.appium.java_client.android.AndroidDriver;
	import io.appium.java_client.android.options.UiAutomator2Options;
	
	public class AppiumBasics {
		@Test
		public void AppiumTest() throws MalformedURLException
		{
  		//code to start server
	           //AndroidDriver, IOSDriver
	           //Appium code -> Appium Server -> Mobile
                   AppiumDriverLocalService service = new AppiumServiceBuilder().withAppiumJS(new File("//usr//local//lib//node_modules//appium//build//lib//main.js"))
  			.withIPAddress("127.0.0.1").usingPort(4723).build();
                   service.start();
		   UiAutomator2Options options = new UiAutomator2Options();
		   options.setDeviceName("RahulPhone"); //emulator
		   options.setApp("/////ApiDemo-debug.apk")	
		   AndroidDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), null);
                    //Actuall automation
                   //Xpath, id, accessibilityId, classname, androidUIAutomator
                   driver.findElement(AppiumBy.accessibilityId("Preference")).click();
  
                   driver.quit()
                   service.stop();
                   //stop server
                   
	
		}
	}
  ```
### 29. Creating Base Class with Util methods and extend it to Child Appium Tests
- Create another file for base class:
- Write code
  ```java
  // BaseTest.java
   package rahulshettyacademy;

	import java.net.MalformedURLException;
	import java.net.URL;
	import org.testng.annotations.Test;
	
	import io.appium.java_client.android.AndroidDriver;
	import io.appium.java_client.android.options.UiAutomator2Options;
	
	public class BaseTest {
                public AndroidDriver driver;
		public AppiumDriverLocalService service;
		@BeforeClass
		public void ConfigureAppium() throws MalformedURLException
		{

                   AppiumDriverLocalService service = new AppiumServiceBuilder().withAppiumJS(new File("//usr//local//lib//node_modules//appium//build//lib//main.js"))
  			.withIPAddress("127.0.0.1").usingPort(4723).build();
                   service.start();
		   UiAutomator2Options options = new UiAutomator2Options();
		   options.setDeviceName("RahulPhone"); //emulator
		   options.setApp("/////ApiDemo-debug.apk")	
		   driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), options);

		}
  		 @AfterClass
	         public void tearDown()
		  {
		      driver.quit();
		      service.stop();
		  }
	}
  ```
  
  ```java
  // AppiumBasics.java
        package rahulshettyacademy;
	import java.net.MalformedURLException;
	public class AppiumBasics extends BaseTest {
		@Test
		public void WifiSettingsName() throws MalformedURLException
		{
  		//code to start server
	           //AndroidDriver, IOSDriver
	           //Appium code -> Appium Server -> Mobile
                   driver.findElement(AppiumBy.accessibilityId("Preference")).click();
		}
	}
  ```
### 30. Appium Server not starting programmatically - FIX WORKAROUND
- Solve problems: Comment `service.start();`

### 31. Android Home Not Set error - MAC - Troubleshoot - FIX WORK AROUND
- Config to run the test, add ptah ANDROID_HOME
### 32. Stay Connected to the Testing World
- Do you want to stay updated with the latest Automation Technologies/Updates/Jobs happening in Testing Industry?
- Are you curious to know the Best Practices what others Use in their companies for Software Testing??
- Get Social with us in LinkedIn, Facebook, Telegram and see what other QA Peers are talking about on their experiences. You can have your general questions too and get suggestions from the Strongest QA Community Base
- FB QA Group : https://www.facebook.com/groups/RahulShettyAcademy/
- LinkedIn : https://www.linkedin.com/in/rahul-shetty-trainer/
- Exclusive QA Interview Preparation Telegram Group. You can find questions asked from various companies with detailed solutions
- Telegram Group :  https://t.me/rahulshettyacademy
- Subscribe to our below YouTube channel for Automation Tidbits and many Miscellaneous Important QA General topics which needed for Real time projects

- YouTube : https://www.youtube.com/c/RahulShettyAcademy

### 33. Introduction to Id, Xpath & Accessibility ID locators in App with an example
```java
package rahulshettyacademy;

import java.net.MalformedURLException;

import org.openqa.selenium.By;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;

public class AppiumBasics extends BaseTest{

	@Test
	public void WifiSettingsName() throws MalformedURLException
	{
	//code to start server	
		//AndroidDriver , IOSDriver
		//Appium code - > Appium Server -> Mobile 		
		//Actual automation
		//Xpath, id, accessibilityId, classname, androidUIAutomator
		
	//tagName[@attribute='value']  -> //tagName
		driver.findElement(AppiumBy.accessibilityId("Preference")).click();
		driver.findElement(By.xpath("//android.widget.TextView[@content-desc='3. Preference dependencies']")).click();
		driver.findElement(By.id("android:id/checkbox")).click();
               //If xpath is too long, you can use tagName instead.
		driver.findElement(By.xpath("(//android.widget.RelativeLayout)[2]")).click(); 	
	}	
}

```
