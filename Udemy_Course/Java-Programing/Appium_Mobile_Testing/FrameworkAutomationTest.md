
## Section 16: Framework Part 1- Code Design Patterns in Writing Android Automation Test
### 76. Important Note

### 77. Understand the importance of framework design - Getting started with Project
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/46cf958c-9de1-4e31-a947-0ced0dbac8ba)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/9dd00536-4d36-4e9c-a6ae-6f8e7595a4f9)

- Create new `Maven Project`
- Using design pattern to help writing code more flexible
  
### 78. Introduction to Page object Factory and design Implementation idea
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/96f9c606-7069-4608-a125-ad9988fd3c53)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a5787ed4-c240-4c26-8e17-511e15acc408)

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
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/68be1a4b-4176-4924-b5ae-e6f799a02b48)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/95d458a5-daa8-45dd-86e7-703e603b4f92)

```java
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
	   private WebElement femaleOption;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Male']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Male']")
	   private WebElement maleOption;
	   
	   public void setNameField(String name)
	   {
		   nameField.sendKeys(name);
		   driver.hideKeyboard();
	   }
	   
	   public void setGender(String gender)
	   {
		   if (gender.contains("female"))
			   femaleOption.click();
		   else 
			   maleOption.click();
	   }
}

```
### 80. Inherit Android Actions class to page object classes for reusable methods
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/7e3b4f14-60e2-46c8-a397-667097a4fa77)
```java
//AndroidAction.java
package TheSecondTestingProject.pageObjects.Android;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class FormPage extends AndroidActions 
{
       
	   AndroidDriver driver;
	   public FormPage(AndroidDriver driver)
	   {
		   //Call the parent contrcutor
		   super(driver);
		   this.driver = driver;
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   //driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
	   @AndroidFindBy(id="com.androidsample.generalstore:id/nameField")
	   private WebElement nameField;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Female']")
	   private WebElement femaleOption;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Male']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Male']")
	   private WebElement maleOption;
	   
	   //driver.findElement(By.id("android:id/text1")).click();
	   @AndroidFindBy(id="android:id/text1")
	   private WebElement countrySelection;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
	   @AndroidFindBy(id="com.androidsample.generalstore:id/btnLetsShop")
	   private WebElement shopButton;
	   
	   public void setNameField(String name)
	   {
		   nameField.sendKeys(name);
		   driver.hideKeyboard();
	   }
	   
	   public void setGender(String gender)
	   {
		   if (gender.contains("female"))
			   femaleOption.click();
		   else 
			   maleOption.click();
	   }
	   
	   public void setCountrySelection(String countryName)
	   {
		   countrySelection.click();
		   scrollToText(countryName);
		   driver.findElement(By.xpath("//android.widget.TextView[@text='"+countryName+"']")).click();
		   
	   }
	   public void submitForm()
	   {
		   shopButton.click();
	   }
}

```
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a0b031fa-98e9-4861-96b1-a1d86998ff14)
```java
//FormPage.java
package TheSecondTestingProject.pageObjects.Android;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class FormPage extends AndroidActions 
{
       
	   AndroidDriver driver;
	   public FormPage(AndroidDriver driver)
	   {
		   //Call the parent contructor
		   super(driver);
		   this.driver = driver;
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   //driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
	   @AndroidFindBy(id="com.androidsample.generalstore:id/nameField")
	   private WebElement nameField;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Female']")
	   private WebElement femaleOption;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Male']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Male']")
	   private WebElement maleOption;
	   
	   //driver.findElement(By.id("android:id/text1")).click();
	   @AndroidFindBy(id="android:id/text1")
	   private WebElement countrySelection;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
	   @AndroidFindBy(id="com.androidsample.generalstore:id/btnLetsShop")
	   private WebElement shopButton;
	   
	   public void setNameField(String name)
	   {
		   nameField.sendKeys(name);
		   driver.hideKeyboard();
	   }
	   
	   public void setGender(String gender)
	   {
		   if (gender.contains("female"))
			   femaleOption.click();
		   else 
			   maleOption.click();
	   }
	   
	   public void setCountrySelection(String countryName)
	   {
		   countrySelection.click();
		   scrollToText(countryName);
		   driver.findElement(By.xpath("//android.widget.TextView[@text='"+countryName+"']")).click();
		   
	   }
	   public void submitForm()
	   {
		   shopButton.click();
	   }
}
```
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/158d3b45-f8f1-44a2-afd1-cd93d32e0ec0)
```java
//TestCase_4.java
package TheSecondTestingProject;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.Test;

import TheSecondTestingProject.pageObjects.Android.FormPage;
import io.appium.java_client.AppiumBy;

public class TestCase_4 extends BaseTest 
{
	/**
     * Rigorous Test :-)
	 * @throws InterruptedException 
     */
    @Test
    public void TestCase_4Test() throws InterruptedException
    {
    		    //tagName[@attribute='value']  -> //tagName
    	        Thread.sleep(3000);
    	        FormPage formPage = new FormPage(driver);
    	        formPage.setNameField("Xuan Hieu");
    	        formPage.setGender("female");
    	        formPage.setCountrySelection("Argentina");
    	        formPage.submitForm();		
    }
}

```
## Section 17: Framework Part 2- Code Design Patterns in Writing Android Automation Test
### 81. Part 1 - Implement Page object file for Product Catalogue page with actions
```java
//FormPage.java
package TheSecondTestingProject.pageObjects.Android;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class FormPage extends AndroidActions 
{
       
	   AndroidDriver driver;
	   public FormPage(AndroidDriver driver)
	   {
		   //Call the parent contructor
		   super(driver);
		   this.driver = driver;
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   //driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
	   @AndroidFindBy(id="com.androidsample.generalstore:id/nameField")
	   private WebElement nameField;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Female']")
	   private WebElement femaleOption;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Male']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Male']")
	   private WebElement maleOption;
	   
	   //driver.findElement(By.id("android:id/text1")).click();
	   @AndroidFindBy(id="android:id/text1")
	   private WebElement countrySelection;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
	   @AndroidFindBy(id="com.androidsample.generalstore:id/btnLetsShop")
	   private WebElement shopButton;
	   
	   public void setNameField(String name)
	   {
		   nameField.sendKeys(name);
		   driver.hideKeyboard();
	   }
	   
	   public void setGender(String gender)
	   {
		   if (gender.contains("female"))
			   femaleOption.click();
		   else 
			   maleOption.click();
	   }
	   
	   public void setCountrySelection(String countryName)
	   {
		   countrySelection.click();
		   scrollToText(countryName);
		   driver.findElement(By.xpath("//android.widget.TextView[@text='"+countryName+"']")).click();
		   
	   }
	   public void submitForm()
	   {
		   shopButton.click();
	   }
}

```

```java
//ProductCatalogue.java
package TheSecondTestingProject.pageObjects.Android;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class ProductCatalogue extends AndroidActions
{

	   AndroidDriver driver;
	   public ProductCatalogue(AndroidDriver driver)
	   {
		   //Call the parent contructor
		   super(driver);
		   this.driver = driver;   
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   
	   //driver.findElements(By.xpath("//android.widget.TextView[@text='ADD TO CART']")).get(0).click();
	   @AndroidFindBy(xpath="//android.widget.TextView[@text='ADD TO CART']")
	   private List<WebElement> addToCart;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/appbar_btn_cart")).click();	
	   @AndroidFindBy(id="com.androidsample.generalstore:id/appbar_btn_cart")
	   private WebElement btnCart;
	   
	   public void addItemToCartByIndex(int index)
	   {
		   addToCart.get(index).click();
	   }
	   
	   public void goToCartPage() throws InterruptedException
	   {
		   btnCart.click();
		   Thread.sleep(2000);
	   }
}

```


```java
//TestCase_4.java
package TheSecondTestingProject;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.Test;

import TheSecondTestingProject.pageObjects.Android.FormPage;
import TheSecondTestingProject.pageObjects.Android.ProductCatalogue;
import io.appium.java_client.AppiumBy;

public class TestCase_4 extends BaseTest 
{
 
	/**
     * Rigorous Test :-)
	 * @throws InterruptedException 
     */
    @Test
    public void TestCase_4Test() throws InterruptedException
    {
    		    //tagName[@attribute='value']  -> //tagName
    	        Thread.sleep(3000);
    	        FormPage formPage = new FormPage(driver);
    	        formPage.setNameField("Xuan Hieu");
    	        formPage.setGender("female");
    	        formPage.setCountrySelection("Argentina");
    	        formPage.submitForm();
    	        ProductCatalogue productCatalogue = new ProductCatalogue(driver);
    	        productCatalogue.addItemToCartByIndex(0);
    	        productCatalogue.addItemToCartByIndex(0);
    	        productCatalogue.goToCartPage();
		
    }
}

```
### 82. Part 2 - Implement Page object file for Product Catalogue page with actions
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/ddcfa7d9-2800-465e-b029-bb0b1a070470)

```java
//FormPage.java
....
 public ProductCatalogue submitForm()
	   {
		   shopButton.click();
		   return new ProductCatalogue(driver);
	   }
```

```java
//ProductCatalogue.java
.....
 public CartPage goToCartPage() throws InterruptedException
	   {
		   btnCart.click();
		   Thread.sleep(2000);
		   return new CartPage(driver);
	   }
```

```java
//TestCase_4.java
                .....
    	        ProductCatalogue productCatalogue = formPage.submitForm();   
                  .......
    	        CartPage cartPage = productCatalogue.goToCartPage();
                  ......
```
### 83. Part 3 - Implement Page object file for Cart page with actions
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/ccfc4d04-9f28-4f03-9ee0-6dbf82fde586)

```java
//FormPage.java
package TheSecondTestingProject.pageObjects.Android;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class FormPage extends AndroidActions 
{
       
	   AndroidDriver driver;
	   public FormPage(AndroidDriver driver)
	   {
		   //Call the parent contructor
		   super(driver);
		   this.driver = driver;
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   //driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
	   @AndroidFindBy(id="com.androidsample.generalstore:id/nameField")
	   private WebElement nameField;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Female']")
	   private WebElement femaleOption;
	   
	   //driver.findElement(By.xpath("//android.widget.RadioButton[@text='Male']")).click();
	   @AndroidFindBy(xpath="//android.widget.RadioButton[@text='Male']")
	   private WebElement maleOption;
	   
	   //driver.findElement(By.id("android:id/text1")).click();
	   @AndroidFindBy(id="android:id/text1")
	   private WebElement countrySelection;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
	   @AndroidFindBy(id="com.androidsample.generalstore:id/btnLetsShop")
	   private WebElement shopButton;
	   
	   public void setNameField(String name)
	   {
		   nameField.sendKeys(name);
		   driver.hideKeyboard();
	   }
	   
	   public void setGender(String gender)
	   {
		   if (gender.contains("female"))
			   femaleOption.click();
		   else 
			   maleOption.click();
	   }
	   
	   public void setCountrySelection(String countryName)
	   {
		   countrySelection.click();
		   scrollToText(countryName);
		   driver.findElement(By.xpath("//android.widget.TextView[@text='"+countryName+"']")).click();
		   
	   }
	   public ProductCatalogue submitForm()
	   {
		   shopButton.click();
		   return new ProductCatalogue(driver);
	   }
}

```

```java
//ProductCatalogue.java
package TheSecondTestingProject.pageObjects.Android;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class ProductCatalogue extends AndroidActions
{

	   AndroidDriver driver;
	   public ProductCatalogue(AndroidDriver driver)
	   {
		   //Call the parent contructor
		   super(driver);
		   this.driver = driver;   
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   
	   //driver.findElements(By.xpath("//android.widget.TextView[@text='ADD TO CART']")).get(0).click();
	   @AndroidFindBy(xpath="//android.widget.TextView[@text='ADD TO CART']")
	   private List<WebElement> addToCart;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/appbar_btn_cart")).click();	
	   @AndroidFindBy(id="com.androidsample.generalstore:id/appbar_btn_cart")
	   private WebElement btnCart;
	   
	   public void addItemToCartByIndex(int index)
	   {
		   addToCart.get(index).click();
	   }
	   
	   public CartPage goToCartPage() throws InterruptedException
	   {
		   btnCart.click();
		   Thread.sleep(2000);
		   return new CartPage(driver);
	   }
}

```

```java
//CartPage.java
package TheSecondTestingProject.pageObjects.Android;

import java.util.List;

import org.openqa.selenium.WebElement;
import org.openqa.selenium.support.PageFactory;

import TheSecondTestingProject.utils.AndroidActions;
import io.appium.java_client.android.AndroidDriver;
import io.appium.java_client.pagefactory.AndroidFindBy;
import io.appium.java_client.pagefactory.AppiumFieldDecorator;

public class CartPage extends AndroidActions 
{

	   AndroidDriver driver;
	   public CartPage(AndroidDriver driver)
	   {
		   //Call the parent contructor
		   super(driver);
		   this.driver = driver;   
		   PageFactory.initElements(new AppiumFieldDecorator(driver), this);
	   }
	   
	   //List<WebElement> productPrices =driver.findElements(By.id("com.androidsample.generalstore:id/productPrice"));
	   @AndroidFindBy(id="com.androidsample.generalstore:id/productPrice")
	   private List<WebElement> productList;
	   
	   //String displaySum =driver.findElement(By.id("com.androidsample.generalstore:id/totalAmountLbl")).getText();
	   @AndroidFindBy(id="com.androidsample.generalstore:id/totalAmountLbl")
	   private WebElement totalAmount;
	   
	   //WebElement ele = driver.findElement(By.id("com.androidsample.generalstore:id/termsButton"));
	   @AndroidFindBy(id="com.androidsample.generalstore:id/termsButton")
	   private WebElement terms;
	   
	   //driver.findElement(By.id("android:id/button1")).click();
	   @AndroidFindBy(id="android:id/button1")
	   private WebElement acceptButton;
	   
	   //driver.findElement(AppiumBy.className("android.widget.CheckBox")).click();
	   @AndroidFindBy(className="android.widget.CheckBox")
	   private WebElement checkBox;
	   
	   //driver.findElement(By.id("com.androidsample.generalstore:id/btnProceed")).click();
	   @AndroidFindBy(id="com.androidsample.generalstore:id/btnProceed")
	   private WebElement proceed;
	   
	   public List<WebElement>	getProductList()
	   {
		   return productList;
	   }
	   
	   public double getProductsSum()
	   {
		   int count = productList.size();
		   double totalSum = 0;
		   for(int i = 0; i < count; i++)
		   {
			   String amountString = productList.get(i).getText();
			   Double price = getFormattedAmount(amountString);
			   totalSum = totalSum + price;
		   }
		   return totalSum;
	   }
	   
	   
	   public Double getTotalAmountDisplayed()
	   {
		   return getFormattedAmount(totalAmount.getText());
	   }
	   
	   public void acceptTermsConditions()
	   {
		   longPressAction(terms);
		   acceptButton.click();
	   }
	   
	   public Double getFormattedAmount(String amount)
	   {
		   Double price = Double.parseDouble(amount.substring(1));
		   return price;
	   }
	   public void submitOrder()
	   {
		   checkBox.click();
		   proceed.click();	
	   }
	   
}

```


```java
//TestCase_4.java
            package TheSecondTestingProject;

import java.time.Duration;

import org.openqa.selenium.By;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.testng.Assert;
import org.testng.annotations.Test;

import TheSecondTestingProject.pageObjects.Android.CartPage;
import TheSecondTestingProject.pageObjects.Android.FormPage;
import TheSecondTestingProject.pageObjects.Android.ProductCatalogue;
import io.appium.java_client.AppiumBy;

public class TestCase_4 extends BaseTest 
{
 
	/**
     * Rigorous Test :-)
	 * @throws InterruptedException 
     */
    @Test
    public void TestCase_4Test() throws InterruptedException
    {
    		    //tagName[@attribute='value']  -> //tagName
    	        Thread.sleep(3000);
    	        FormPage formPage = new FormPage(driver);
    	        formPage.setNameField("Xuan Hieu");
    	        formPage.setGender("female");
    	        formPage.setCountrySelection("Argentina");
    	        ProductCatalogue productCatalogue = formPage.submitForm();   
    	        //ProductCatalogue productCatalogue = new ProductCatalogue(driver);
    	        productCatalogue.addItemToCartByIndex(0);
    	        productCatalogue.addItemToCartByIndex(0);
    	        CartPage cartPage = productCatalogue.goToCartPage();
    	        double totalSum = cartPage.getProductsSum();
    	        double displayFormattedSum = cartPage.getTotalAmountDisplayed();
    	        Assert.assertEquals(totalSum, displayFormattedSum);
    	        cartPage.acceptTermsConditions();
    	        cartPage.submitOrder();
	
    }
}

```
### 84. Part 4- Convert IOS test into Page object Pattern

### 85. Part 5- Convert IOS test into Page object Pattern
## Section 18: Framework Part 2- Implement Test Strategy
### 87. Implement Test Strategy on deciding how to run tests in a file

```java
package TheSecondTestingProject;

import org.openqa.selenium.By;
import org.testng.Assert;
import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;

public class TwoTest_1 extends BaseTest
{

	/**
     * Rigorous Test :-)
	 * @throws InterruptedException 
     */
    @Test
    public void TestCase_FailTest() throws InterruptedException
    {
    		    //tagName[@attribute='value']  -> //tagName
    	        Thread.sleep(3000);
//    			driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
    			driver.hideKeyboard();
    			driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
    			driver.findElement(By.id("android:id/text1")).click();
    			driver.findElement(AppiumBy.androidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView(text(\"Argentina\"));"));
    			driver.findElement(By.xpath("//android.widget.TextView[@text='Argentina']")).click();
    			driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
    			String toastMessage = driver.findElement(By.xpath("//android.widget.Toast[1]")).getAttribute("Name");
    			Assert.assertEquals(toastMessage,"Please enter your name");
    			Thread.sleep(3000);
    					
    			
    }
    
    @Test
    public void TestCase_SuccessTest() throws InterruptedException
    {
    		  
    			driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
    			driver.hideKeyboard();
    			driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
    			driver.findElement(By.id("android:id/text1")).click();
    			driver.findElement(AppiumBy.androidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView(text(\"Argentina\"));"));
    			driver.findElement(By.xpath("//android.widget.TextView[@text='Argentina']")).click();
    			driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
    			Assert.assertTrue(driver.findElements(By.xpath("//android.widget.Toast[1]")).size()<1);
	
    }
}
```


### First you have to open the app screen what you wish to grab activity.
- Let's say I want to grab the activity of this home page.
- First you have to open the app screen what you wish to grab activity.
- In that case, go to terminal. Type `adb shell dumpsys window | grep -E 'mCurrentFocus'`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/72fe42c8-38d5-4d75-be67-3ff681b60084)
- That's why
   - The package Name:
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a0b486f8-63d3-4b18-a620-a48853e8b75c)
   - The Activity Name:
        ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/344121c8-0ccb-4300-96d5-9715ffdece96)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/d8f12098-4464-415c-ad29-b77715e9b418)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/93ec69b5-17d0-4bad-9323-d00119a6ec38)

```java

package TheSecondTestingProject;

import org.openqa.selenium.By;
import org.testng.Assert;
import org.testng.annotations.BeforeMethod;
import org.testng.annotations.Test;

import io.appium.java_client.AppiumBy;
import io.appium.java_client.android.Activity;

public class TwoTest_1 extends BaseTest
{

	@BeforeMethod
	public void preSetup()
	{
		//App Package & App Activity
		Activity activity = new Activity("io.appium.android.apis", "io.appium.android.apis.preference.PreferenceDependencies");
		driver.startActivity(activity);

	}
	/**
     * Rigorous Test :-)
	 * @throws InterruptedException 
     */
    @Test
    public void TestCase_FailTest() throws InterruptedException
    {
    		    //tagName[@attribute='value']  -> //tagName
    	        Thread.sleep(3000);
//    			driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
    			driver.hideKeyboard();
    			driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
    			driver.findElement(By.id("android:id/text1")).click();
    			driver.findElement(AppiumBy.androidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView(text(\"Argentina\"));"));
    			driver.findElement(By.xpath("//android.widget.TextView[@text='Argentina']")).click();
    			driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
    			String toastMessage = driver.findElement(By.xpath("//android.widget.Toast[1]")).getAttribute("Name");
    			Assert.assertEquals(toastMessage,"Please enter your name");
    			Thread.sleep(3000);
    					
    			
    }
    
    @Test
    public void TestCase_SuccessTest() throws InterruptedException
    {
    		  
    			driver.findElement(By.id("com.androidsample.generalstore:id/nameField")).sendKeys("Xuan Hieu");
    			driver.hideKeyboard();
    			driver.findElement(By.xpath("//android.widget.RadioButton[@text='Female']")).click();
    			driver.findElement(By.id("android:id/text1")).click();
    			driver.findElement(AppiumBy.androidUIAutomator("new UiScrollable(new UiSelector()).scrollIntoView(text(\"Argentina\"));"));
    			driver.findElement(By.xpath("//android.widget.TextView[@text='Argentina']")).click();
    			driver.findElement(By.id("com.androidsample.generalstore:id/btnLetsShop")).click();
    			Assert.assertTrue(driver.findElements(By.xpath("//android.widget.Toast[1]")).size()<1);
	
    }
}

```
### 89. How to run all tests together using Single TestNG.xml file
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/072bf007-f427-4017-a51d-a1418cf0ee96)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/e062f474-6c6d-40f1-ac30-e5b5b99cdb35)

![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/0b05ac09-50c2-4014-b227-c4628c65ec3d)

![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/3d27ff9c-2b12-40e7-9894-d275107f8c2c)


![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/e99429d0-6908-4c5c-be47-23b45803b8e8)

![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/9fd34046-dfb5-42a9-a8bd-29d5f3f5e2c2)

## Section 19: Framework Part 4- Data-Driven Testing with Parameterization  for Appium Tests
### 90. Implement Data driven testing to testng tests using Data provider
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/19911763-6fe1-466e-b2da-cd1a8a07387d)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/aa93305c-3c36-4e15-99ab-2401202400eb)

### 91. Parameterize the test data with multiple data sets using TestNG dataprovider
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/29517d71-360a-44db-a45c-81e0801dfc84)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/3b5b6ef1-d668-41eb-be83-a6c149e6f866)

### 92. How to drive the data from Json files and load into Hashmap for parameterization
- Create New Package and Json File
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a4134600-34e8-4ef9-a00f-2113f7145902)
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/5b868996-3d26-443c-b232-31cf84b8fc38)
- Config mavenproject
 ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/4bc1f286-b656-4866-beb1-ea4d4000dc47)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c67e78ff-586e-4ebf-b5e9-a962946887d6)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/eeff6b58-d777-4462-844d-f62103ee826e)

- Step 1: Parse Json file -> Json String
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/bb1d8496-c8ec-4b0d-8574-3b60961b4675)

- Step 2: Json String -> Hash Map (jackson)
 ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c9ad9c68-2697-42f6-a16f-bf571bf869af)
 ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/6b49aecc-e57b-4460-81b1-115f04ee86aa)
 ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/ed7dce1e-33d5-47dc-9ebc-daf1795ed024)

- Step 3: HashMap -> Testcase (TestNg Data provider)

### 93. Data utility which reads json and parse it for TestNG Dataprovider input (The same 92)
## Section 20: Framework Part 5 - Setting up Global Configuration variables and generating reports
### 96. Create Global properties file and read the global values from the file
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c1ce762a-f02c-4b55-8c99-ef7331aff98f)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/2eafb67e-cb43-4664-b89b-9f2662a8dd37)
### 97. Introduction to Extent reports - Quick 20min tutorial
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/cfd6d51a-7478-4dd0-85f0-a5f02ee988dd)
- Step 1: Go to maven dependencies and type `ExtentReports`
  ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/c9ef3a7b-8ab3-49a2-abbc-02dd6f0796ad)
- Step 2: Add to 3 dependencies:
  ```html
   <!-- https://mvnrepository.com/artifact/org.testng/testng -->
	<dependency>
	    <groupId>org.testng</groupId>
	    <artifactId>testng</artifactId>
	    <version>7.8.0</version>
	</dependency>
	<!-- https://mvnrepository.com/artifact/org.seleniumhq.selenium/selenium-java -->
	<dependency>
	    <groupId>org.seleniumhq.selenium</groupId>
	    <artifactId>selenium-java</artifactId>
	    <version>4.14.1</version>
	</dependency>
	
	<!-- https://mvnrepository.com/artifact/com.aventstack/extentreports -->
	<dependency>
	    <groupId>com.aventstack</groupId>
	    <artifactId>extentreports</artifactId>
	    <version>5.1.1</version>
	</dependency>
  ```
- Step 3:  I would show how to generate excellent reports with one single test.
- ![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/a48350b3-df79-4fe4-a026-e70326124444)

```java
package TheSecondTestingProject;

import org.openqa.selenium.WebDriver;
import org.openqa.selenium.chrome.ChromeDriver;
import org.testng.annotations.BeforeTest;
import org.testng.annotations.Test;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;



public class ExtentReportDemo {
		
			ExtentReports extent;
			@BeforeTest
			public void config()
			{
				String path = System.getProperty("user.dir") + "\\reports\\index.html";
				ExtentSparkReporter reporter = new ExtentSparkReporter (path);
				reporter.config().setReportName("Web Automation Reports");
				reporter.config().getDocumentTitle();
				
				
				extent = new ExtentReports();
				extent.attachReporter(reporter);
				extent.setSystemInfo("Tester", "Udemy");
				
			}
			@Test
			public void DemoTest()
			{
				extent.createTest("111");
				System.setProperty("webdriver.chrome.driver", "D:\\Downloads\\chromedriver-win64\\chromedriver-win64\\chromedriver.exe");
				WebDriver driver =  new ChromeDriver();
				driver.get("https://mvnrepository.com/");
				System.out.print(driver.getTitle());
				extent.flush();
				
			}
}


```
- Step 4: Take a screenshort
- 

### 98. Create extent object and set it in the TestNG Listeners for automatic reports
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/ff96b037-8154-4853-80d5-04bbfef334c5)

![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/9877cef5-ada8-4ccd-a218-d587ba86f7ec)
```java
//Listeners.java
package Utils;

import org.testng.ITestContext;
import org.testng.ITestListener;
import org.testng.ITestResult;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.ExtentTest;
import com.aventstack.extentreports.Status;

public class Listeners implements ITestListener 
{
	  ExtentTest test;
	  ExtentReports extent = TestReport.config();
	
	  @Override
	  public void onTestStart(ITestResult result) {
	    // not implemented
		  
		  test = extent.createTest(result.getMethod().getMethodName());
	  }
	  
	  
	  @Override
	  public void onTestSuccess(ITestResult result) {
	    // not implemented
		  test.log(Status.PASS, "Test Passed");
	  }
	  
	  
	  
	  @Override
	  public void onTestFailure(ITestResult result) {
	    // not implemented
		  test.fail(result.getThrowable());
	  }
	  
	  
	  public void onFinish(ITestContext context) {
		    // not implemented
		  extent.flush();
		  }
	  
	  @Override
	  public void onTestSkipped(ITestResult result) {
	    // not implemented
	  }
	  

}

```
```java
// TestReport.java

package Utils;

import org.testng.annotations.BeforeTest;

import com.aventstack.extentreports.ExtentReports;
import com.aventstack.extentreports.reporter.ExtentSparkReporter;

public class TestReport {

	static ExtentReports extent;
	@BeforeTest
	public static ExtentReports config()
	{
		String path = System.getProperty("user.dir") + "\\reports\\index.html";
		ExtentSparkReporter reporter = new ExtentSparkReporter (path);
		reporter.config().setReportName("Web Automation Reports");
		reporter.config().getDocumentTitle();
		
		
		extent = new ExtentReports();
		extent.attachReporter(reporter);
		extent.setSystemInfo("Tester", "Udemy");
		return extent;
		
	}
}

```

- Remember include `listener` tag into testng.xml to run automation Test scheduler
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/30e0ac9e-30f4-4d77-a202-db399d275589)


## Section 21: Framework Part 6 - Sceenshots, TestNG Listener, Maven Integration with jenkins 
### 100. How to take automatic screenshots of Test failures & attach to report
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/446f8352-48a5-48a8-b96e-a5b9550a2e3a)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/9f53bb2c-acd4-4831-894b-7200f892eb2c)
![image](https://github.com/hieunguyen0202/Udemy-Course-Training/assets/98166568/1361298f-6f30-4fca-a1b6-549e63a6c789)

### 101. How to run selected tests from pool of tests using TestNG groups

### 104. Setting up Jenkins CI/CD tool in local machines
