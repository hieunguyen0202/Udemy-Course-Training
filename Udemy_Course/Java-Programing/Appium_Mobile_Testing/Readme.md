# link: [click](https://bosch-bgsv.udemy.com/course/mobile-automation-using-appiumselenium-3/learn/lecture/27347566#overview)

Rest API Testing (Automation) from Scratch-Rest Assured Java

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
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bd1f3b65-b89d-41e5-befc-2c02a4877045)

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
- You don't need to go to `cmd` to start `appium` server. Because you used `AppiumDriverLocalService` instead.
- In window : `C:users/HP/AppData/Roaming/npm/node_modules/appium/build/lib/main.js`
- Write code
```java
  package TheFirstTestingProject;
import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import org.testng.annotations.Test;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;

public class AppTest 
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void AppTest() throws MalformedURLException
    {
    	 AppiumDriverLocalService service = new AppiumServiceBuilder().withAppiumJS(new File("C://Users//HP//AppData//Roaming//npm//node_modules//appium//build//lib//main.js"))
    				.withIPAddress("127.0.0.1").usingPort(4723).build();
    	service.start();
    	UiAutomator2Options options = new UiAutomator2Options();
    	options.setDeviceName("FirstAutomationTesting"); //emulator
    	options.setApp("C://Users//HP//eclipse-workspace//Appium//src//test//java//resources//ApiDemos-debug.apk");
    	
    	//Appium Code ->Apium Server -> Mobile
    	AndroidDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), options);
    	driver.quit();
    	service.stop();
    	
    }
}
```
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bc34a7d8-684a-44bc-b072-1e7a57ad7d05)


### 28. Introduction to Appium Inspector to identify the elements on the Apps
- Go to `appium inspector` github and install tool. That tool is used to identify the elements on the Apps
- Open App and config to load the device on `appium inspector`. we just focus on two elements `accessibility id` and `xpath`
- ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bf51d752-0570-4ea3-af5d-8d23a90d69e5)
```json
{
  "appium:app": "C://Users//HP//eclipse-workspace//Appium//src//test//java//resources//ApiDemos-debug.apk",
  "appium:deviceName": "FirstAutomationTesting",
  "platformName": "android",
  "appium:automationName": "UIAutomator2"
}
```
- Write code
```java
  package TheFirstTestingProject;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;

public class AppTest 
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void AppTest() throws MalformedURLException
    {
    	 AppiumDriverLocalService service = new AppiumServiceBuilder().withAppiumJS(new File("C://Users//HP//AppData//Roaming//npm//node_modules//appium//build//lib//main.js"))
    				.withIPAddress("127.0.0.1").usingPort(4723).build();
    	service.start();
    	UiAutomator2Options options = new UiAutomator2Options();
    	options.setDeviceName("FirstAutomationTesting"); //emulator
    	options.setApp("C://Users//HP//eclipse-workspace//Appium//src//test//java//resources//ApiDemos-debug.apk");
    	
    	//Appium Code ->Apium Server -> Mobile
    	AndroidDriver driver = new AndroidDriver(new URL("http://127.0.0.1:4723"), options);
    	 //Actuall automation
        //Xpath, id, accessibilityId, classname, androidUIAutomator
        driver.findElement(AppiumBy.accessibilityId("Preference")).click();
    	driver.quit();
    	service.stop();
    	
    }
}
```
  - You need to run `appium` in cmd in advance
   ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a7f658d0-c8af-49a2-a025-bc18761d1695)
  - Go to appium in spector and fill 4 properties and click `Start Session`
    ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/5d1688f0-934a-4f5a-bd1d-adfb0a1eeaae)
    ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/ca508bad-ce9a-4ff6-b04b-a8ce8424d6dc)




### 29. Creating Base Class with Util methods and extend it to Child Appium Tests
- Create another file for base class:
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/d9359d2e-6da1-4ac6-a603-9a8a03f32363)
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/65422fdf-faaa-4755-b117-d5659b490d1b)

- Write code
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/31473ce0-76a2-43d2-b9c3-7dd22e288366)

```java
  // BaseTest.java
  package TheFirstTestingProject;

import java.io.File;
import java.net.MalformedURLException;
import java.net.URL;

import org.openqa.selenium.remote.HttpCommandExecutor;
import org.testng.annotations.AfterClass;
import org.testng.annotations.BeforeClass;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.android.options.UiAutomator2Options;
import io.appium.java_client.service.local.AppiumDriverLocalService;
import io.appium.java_client.service.local.AppiumServiceBuilder;

public class BaseTest {
	   		public AndroidDriver driver;
			public AppiumDriverLocalService service;
			@BeforeClass
			public void ConfigureAppium() throws MalformedURLException
			{

	          service = new AppiumServiceBuilder().withAppiumJS(new File("C://Users//HP//AppData//Roaming//npm//node_modules//appium//build//lib//main.js"))
	  			.withIPAddress("127.0.0.1").usingPort(4723).build();
	                   service.start();
			   UiAutomator2Options options = new UiAutomator2Options();
			   options.setDeviceName("FirstAutomationTesting"); //emulator
			   options.setApp("C://Users//HP//eclipse-workspace//Appium//src//test//java//resources//ApiDemos-debug.apk");
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
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/9fc7e388-ad55-48f8-9344-1e2a5b1eaa7e)

```java
  // AppiumBasics.java
package TheFirstTestingProject;

import java.net.MalformedURLException;

import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;


public class AppTest extends BaseTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void AppTest() throws MalformedURLException
    {
    	
    	 //Actuall automation
        //Xpath, id, accessibilityId, classname, androidUIAutomator
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
- Click on `Tap` to go next page
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/ebd8e616-ae5c-4f3e-ae6e-ee87707009fd)
- Check Box Click
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/5b2b60bb-f334-4e9c-88f7-5385b3e297b1)
- Next Step select `WIFI Settings`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/56a68f61-5338-4b1d-a36c-c69d9887fe23)

```java
package TheFirstTestingProject;

import java.net.MalformedURLException;

import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;
import org.openqa.selenium.By;

public class AppTest extends BaseTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void AppTest() throws MalformedURLException
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
### 34. How to handle Mobile popups & return list of matching elements on Android app
- Quit session and start again
- Write code to edit box
- Let's also maintain some global timeout. See, in my system, it's a max, so it's very fast. So screens will load a very quick for me if you are using any mission like Windows with a low configuration. So it might take some time to reach from one place to another.
So we will keep some global timeout that we will ask our app to wait until the timeout is done so that we can set in our configuration file, go to base test here itself.
- Go to id `android:id/edit`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c32001eb-fb48-4afa-abfa-78767f22cb63)
- Find Button click by id `android:id/button1`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/08f72055-13e0-4115-9ea6-a44806e489d5)
- Find Button click by `ClassName "android.widget.Button"`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/e0ef2e27-2d83-4248-bebf-65d280f29689)


```java
package TheFirstTestingProject;

import java.net.MalformedURLException;

import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;
import org.openqa.selenium.By;

public class AppTest extends BaseTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void AppTest() throws MalformedURLException
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
    			driver.findElement(By.id("android:id/edit")).sendKeys("XH Wifi");
                   //The className is not unique, that's why we use `.get(1)`
                driver.findElements(AppiumBy.className("android.widget.Button")).get(1).click();
    	
    }
}

```
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/6409d2b5-3664-4976-a920-de009fca4401)


### 35. How to extract the text & Enter the info on Mobile Apps with Appium
- Using `Assert.assertEquals` to check the group whether include the correct content.
- Copy `android:id/alertTitle` in 
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/def0220c-2dc0-423e-b825-09dc1a626410)

```java
package TheFirstTestingProject;
import java.net.MalformedURLException;
import org.testng.annotations.Test;
import org.testng.Assert;
import io.appium.java_client.AppiumBy;
import org.openqa.selenium.By;

public class AppTest extends BaseTest
{
    /**
     * Rigorous Test :-)
     */
    @Test
    public void AppTest() throws MalformedURLException
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
    			String alertTitle = driver.findElement(By.id("android:id/alertTitle")).getText();
    			Assert.assertEquals(alertTitle, "WiFi settings");	
    			
    			driver.findElement(By.id("android:id/edit")).sendKeys("XH Wifi");
                   //The className is not unique, that's why we use `.get(1)`
                driver.findElements(AppiumBy.className("android.widget.Button")).get(1).click();
    	
    }
}

```

## Section 6: Advanced Gestures Automation with Key Events Handling using Appium
### 36. Introduction to Appium Mobile Gestures and how it works
- New task step by step:
  https://github.com/appium/appium-uiautomator2-driver/blob/master/docs/android-mobile-gestures.md
  https://github.com/appium/appium-uiautomator2-driver/blob/master/docs/android-mobile-gestures.md
  https://github.com/appium/appium-uiautomator2-driver/blob/master/docs/android-mobile-gestures.md
  Long press `People names`
  https://github.com/appium/appium-uiautomator2-driver/blob/master/docs/android-mobile-gestures.md
- Create new class `LongPress`:
- Go to `https://github.com/appium/appium-uiautomator2-driver/blob/master/docs/android-mobile-gestures.md` to use `Long Press`
