## Section 16: Framework Part 1- Code Design Patterns in Writing Android Automation Test
### 76. Important Note

### 77. Understand the importance of framework design - Getting started with Project
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/46cf958c-9de1-4e31-a947-0ced0dbac8ba)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/9dd00536-4d36-4e9c-a6ae-6f8e7595a4f9)

- Create new `Maven Project`
- Using design pattern to help writing code more flexible
  
### 78. Introduction to Page object Factory and design Implementation idea
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/96f9c606-7069-4608-a125-ad9988fd3c53)
```java
//FormPage.java
package TheSecondTestingProject.pageObjects.Android;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class FormPage {
       
	   AndroidDriver driver;
	   public FormPage(AndroidDriver driver)
	   {
		   this.driver = driver;
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   //driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
	   @AndroidFindBy(id="com.androidsample.generalstore:id/nameField")
	   private WebElement nameField;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Female']")
	   private WebElement femailOption;
}


```
### 79. Create Action methods in the Pageobject file to drive into tests
### 80. Inherit Android Actions class to page object classes for reusable methods

