# Google_Test_Mock_Tutorials-
___
## Mocking Project Resources

## Introduction Mocking
* Mocking is a type of test double that usually means replacing a `real` project with a `fake` one.
* It's used to isolate the class under test from its dependencies.
* So you can check that method was called or not with what parameters and so on.
#### For example:
If you are testing a class that does some database operations, you don't want to make `real` changes to the database.
### [Fake](https://github.com/markdown-it/markdown-it-emoji)
 * Working implementation
 * Takes a shortcut
 * Not suitable for production
 * Example: in-momory database
### [Stub](https://github.com/markdown-it/markdown-it-emoji)
 * Is a test doubles that responds with pre-defined data
 * They don't work outside the test
 * An example could be if you are replacing a `real` server with a minimal one that responds with predefined data
### [Mock](https://github.com/markdown-it/markdown-it-emoji)
 * Mock also respond with predefine data, but thay can also have expectations. That means th at you can tell the test that you are expecting a certain method to be called.
 * And exception to be thrown and so on.

## Mocking Method
### [Current way](https://github.com/markdown-it/markdown-it-emoji)
Instead of refefining the methods that you want to override, you just have to use the mock method.
#### Syntax:

###### MOCK_METHOD(ReturnType, MethodName, (Arguments...))
```
int sum(int a, int b);
MOCK_METHOD(int, sum, (int, int));
```
###### Complex Types
```
std::map<int, int> foo(float x);
MOCK_METHOD((std::map<int, int>), foo, (float));
```
###### MOCK_METHOD(ReturnType, MethodName, (Arguments...), (Specs...))
* Specs:
  * const
  * override
  * noexcept
```
void doSomething() const;
MOCK_METHOD((void, doSomething, (),(const));
```
### [Legacy way](https://github.com/markdown-it/markdown-it-emoji)
There used to be a set of macros called mock method, followed by the number of arguments the method
#### Syntax:
###### MOCK_METHOD`n`(MethodName, ReturnType(paramType1, paramType2...));
```
int sum(int a, int b);
MOCK_METHOD2(sum, int(int, int));
void doSomething();
MOCK_METHOD0(doSomething, void());
```
###### MOCK_CONST_METHOD`n`
```
int sum(int a, int b) const;
MOCK_CONST_METHOD2(sum, int(int, int));

```
## Presentation Of Our project
### [Employee.hpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
#pragma once
#include <string>

struct Employee
{
 int id;
 float salary;
 std::string name;
};
```
### [IDatabaseConnection.hpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
#pragma once
#include <string>
#include <vector>
#include "Employee.hpp"

//interface because we might subclass it
//example: IOracleDatabaseConnectionManager, ISQLDatabaseConnectionManager
class IDatabaseConnection
{
public:
  IDatabaseConnection(std::string serverAddress);
  virtual float getSalary(int id) const = 0; // SELECT * FROM employees WHERE id=...
  virtual void updateSalary(int id, float newSalary) = 0;

  virtual std::vector<Employee> getSalariesRange(float low) const = 0; //just greater than low
  virtual std::vector<Employee> getSalariesRange(float low, float high) const = 0;

  virtual void connect();
  virtual void disconnect();

protected:
  std::string mServerAddress;
};
```
### [IDatabaseConnection.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
#include "IDatabaseConnection.hpp"
#include <iostream>

IDatabaseConnection::IDatabaseConnection(std::string serverAddress) : mServerAddress{serverAddress}
{
}
void IDatabaseConnection::connect()
{
  std::cout << "Connecting to database server " << mServerAddress << "\n";
  //initialize real DB connection
}
void IDatabaseConnection::disconnect()
{
 std::cout << "Disconnecting from database\n";
 //close the real connection
}
```
### [EmployeeManager.hpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
#pragma once
#include "Employee.hpp"
#include "IDatabaseConnection.hpp"

#include <map>
#include <vector>
#include <string>

class EmployeeManager
{
public:
  EmployeeManager(IDatabaseConnection *dbConnection);
  ~EmployeeManager();

  void setSalary(int employeeId, float newSalary);
  float getSalary(int employeeId) const;
  
  std::map<std::string,float> getSalariesGreater(float low) const;
  std::map<std::string,float> getSalariesBetween(float low, float high) const;
  
private:
  std::map<std::string, float> vectorToMap(std::vector<Employee> const& employees) const;

private:
  IDatabaseConnection  *mDbConnection;
};
```

### [EmployeeManager.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
#include "EmployeeManager.hpp"
#include <map>

EmployeeManager::EmployeeManager(IDatabaseConnection *dbConnection): mDbConnection{dbConnection}
{
  mDbConnection->connect();
}

EmployeeManager::~EmployeeManager()
{
  mDbConnection->disconnect();
}


float EmployeeManager::getSalary(int employeeId) const
{
 return mDbConnection->getSalary(employeeId); 
}
  
void EmployeeManager::setSalary(int employeeId, float newSalary)
{
  mDbConnection->updateSalary(employeeId, newSalary);
}
  
std::map<std::string, float> EmployeeManager::vectorToMap(std::vector<Employee> const& employees) const
{
  std::map<std::string, float> result;
  for(Employee const& employee : employees)
  {
      result[employee.name] = employee.salary;
  }
  return result;
}

std::map<std::string,float> EmployeeManager::getSalariesGreater(float low) const
{
  return vectorToMap(mDbConnection->getSalariesRange(low));
  
}
std::map<std::string,float> EmployeeManager::getSalariesBetween(float low, float high) const
{
  return vectorToMap(mDbConnection->getSalariesRange(low, high));
}

```
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
#include <iostream>
#include <gtest/gtest.h>
#include <gmock/gmock.h>

#include <map>

#include "IDatabaseConnection.hpp"
#include "Employee.hpp"
#include "EmployeeManager.hpp"


class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);

    //MOCK_METHODn n=0,10
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));

};

MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestConnection)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());

    EmployeeManager employeeManager(&dbConnection);
}

TEST(TestEmployeeManager, TestUpdateSalary)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EXPECT_CALL(dbConnection, updateSalary(testing::_, testing::_)).Times(1);   

    EmployeeManager employeeManager(&dbConnection);

    employeeManager.setSalary(50, 6000);
}

TEST(TestEmployeeManager, TestGetSalary)
{
    const int employeeId = 50;
    const float salary = 6100.0;
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EXPECT_CALL(dbConnection, getSalary(testing::_)).Times(1).WillOnce(testing::Return(salary));

    EmployeeManager employeeManager(&dbConnection);

    float returnedSalary = employeeManager.getSalary(employeeId);

    ASSERT_EQ(salary, returnedSalary);
}

TEST(TestEmployeeManager, TestGetSalaryInRange)
{
    const int low = 5000, high = 8000;
    std::vector<Employee> returnedVector{Employee{1, 5600, "John"},
                                    Employee{2, 7000, "Jane"},
                                    Employee{3, 6600, "Alex"}};

    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EXPECT_CALL(dbConnection, getSalariesRange(low, high)).WillOnce(testing::Return(returnedVector));

    EmployeeManager employeeManager(&dbConnection);

    std::map<std::string, float> returnedMap = employeeManager.getSalariesBetween(low, high);

    for(auto it=returnedMap.begin(); it!=returnedMap.end(); ++it)
    {
        std::cout << it->first << " " << it->second << '\n';
        ASSERT_THAT(it->second, testing::AnyOf(testing::Gt(low), testing::Lt(high-3000)));
    }
}

int main(int argc, char **argv)
{
 ::testing::InitGoogleTest(&argc, argv);
 return RUN_ALL_TESTS();
}
```
## Mocking Methods - Current Way(Code example)
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);
    MOCK_METHOD(void, connect, ());
    MOCK_METHOD(void, disconnect, ());
    MOCK_METHOD(float, getSalary, (int), (const));
    MOCK_METHOD(void, updateSalary, (int, float) );

    MOCK_METHOD(std::vector<Employee>, getSalariesRange, (float), (const));
    MOCK_METHOD(std::vector<Employee>, getSalariesRange, (float, float), (const));

};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestConnection)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EmployeeManager employeeManager(&dbConnection);
}

```
## Mocking Methods - Legacy Way(Code example)
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));

};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestConnection)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EmployeeManager employeeManager(&dbConnection);
}

```

## Setting Expectations and Behaviour
### [Setting Expectations](https://github.com/markdown-it/markdown-it-emoji)
It specifies what happens when a method gets called
###### ON_CALL `VS` EXPECT_CALL
```c++
ON_CALL: sets  the behaviour when a method gets called
EXPECT_CALL = ON_CALL + expectations
```
* (the method will get called, with what args, etc.)
#### For example:
###### Check the number of calls:
```c++
EXPECT_CALL(someObject, someMethod).Times(2);
```
###### Check the agrument:
```c++
EXPECT_CALL(someObject, someMethod("Value I expect to be passed"));
```
###### Matchers:
```c++
More generic expectations (ex. Argument is > 10)
```
### [Setting Behaviour](https://github.com/markdown-it/markdown-it-emoji)
```c++
ACTION(ThrowSomeException){
 throw std::runtime_error("Dummy error");
}
EXPECT_CALL(object, someMethod()).WillOnce(ThrowSomeException());
```
Then after on call or expect call, invoke that action by using will once will repeatedly will by default.
Setting an action/return value:
* WillOnce
* WillRepeatedly
* WillByDefault
* Return
* returnRef
###### return Example:
```c++
EXPECT_CALL(object, someMethod()).WillRepeatedly(Return(6));
```
### [Cardinality](https://github.com/markdown-it/markdown-it-emoji)
Expected number of calls:
* `AnyNumber()`: If you don't care how many times the method was called
* AtLeast(n)
* AtMost(n)
* Between(m, n)
* "Exactly(n)" or "n"
## Mocking - Times (Code Example)
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);
    MOCK_METHOD(void, connect, ());
    MOCK_METHOD(void, disconnect, ());
    MOCK_METHOD(float, getSalary, (int), (const));
    MOCK_METHOD(void, updateSalary, (int, float) );

    MOCK_METHOD(std::vector<Employee>, getSalariesRange, (float), (const));
    MOCK_METHOD(std::vector<Employee>, getSalariesRange, (float, float), (const));
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestConnection)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EmployeeManager employeeManager(&dbConnection);
}

TEST(TestEmployeeManager, TestUpdateSalary)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EXPECT_CALL(dbConnection, updateSalary(50, 6000)).Times(1);   
    //EXPECT_CALL(dbConnection, updateSalary(testing::_, testing::_)).Times(1);   

    EmployeeManager employeeManager(&dbConnection);

    employeeManager.setSalary(50, 6000);
}
```

## Mocking - Returns (Code Example)
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);
    MOCK_METHOD(void, connect, ());
    MOCK_METHOD(void, disconnect, ());
    MOCK_METHOD(float, getSalary, (int), (const));
    MOCK_METHOD(void, updateSalary, (int, float) );

    MOCK_METHOD(std::vector<Employee>, getSalariesRange, (float), (const));
    MOCK_METHOD(std::vector<Employee>, getSalariesRange, (float, float), (const));
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestConnection)
{
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EmployeeManager employeeManager(&dbConnection);
}

TEST(TestEmployeeManager, TestGetSalary)
{
    const int employeeId = 50;
    const float salary = 6100.0;
    MockDatabaseConnection dbConnection("dummyConnection");
    EXPECT_CALL(dbConnection, connect());
    EXPECT_CALL(dbConnection, disconnect());
    EXPECT_CALL(dbConnection, getSalary(testing::_)).Times(1).WillOnce(testing::Return(salary));

    EmployeeManager employeeManager(&dbConnection);

    float returnedSalary = employeeManager.getSalary(employeeId);

    ASSERT_EQ(salary, returnedSalary);
}
``` 
## Invoking Actions (Code Example)
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
##### Test Connection Error:
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);

    //MOCK_METHODn n=0,10
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestConnectionError)
{
    MockDatabaseConnection dbConnection("DummyAddresss");
    EXPECT_CALL(dbConnection, connect()).WillOnce(testing::Throw(std::runtime_error("Dummy Error")));
    
    ASSERT_THROW(EmployeeManager employeeManager(&dbConnection), std::runtime_error);
}
```
##### Test Connection Error Action:
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);

    //MOCK_METHODn n=0,10
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

ACTION(myThrow)
{
    std::cout << "Throwing an error!\n";
    throw std::runtime_error("Dummy error");
}

TEST(TestEmployeeManager, TestConnectionErrorAction)
{
    MockDatabaseConnection dbConnection("DummyAddresss");
    EXPECT_CALL(dbConnection, connect()).WillOnce(myThrow());
    
    ASSERT_THROW(EmployeeManager employeeManager(&dbConnection), std::runtime_error);
}
```
##### Test Connection Error Invoke -`Way 1`:
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);

    //MOCK_METHODn n=0,10
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

void someFreeFunction()
{
    std::cout << "Free function\n";
    throw std::runtime_error("Dummy exception");
}
TEST(TestEmployeeManager, TestConnectionErrorInvoke)
{
    MockDatabaseConnection dbConnection("DummyAddresss");
    EXPECT_CALL(dbConnection, connect()).WillOnce(testing::Invoke(someFreeFunction));
    /*EXPECT_CALL(dbConnection, connect()).WillOnce(testing::Invoke([](){
        std::cout << "Lambda called\n";
        throw std::runtime_error("Dummy error");
    }));*/
    ASSERT_THROW(EmployeeManager employeeManager(&dbConnection), std::runtime_error);
}
```
##### Test Connection Error Invoke -`Way 2`:
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);

    //MOCK_METHODn n=0,10
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));

    void someMemberMethod(std::string param)
        {
            std::cout << "Member method called with param = " << param << "\n";
            throw std::runtime_error("Dummy error!");
        }
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}
TEST(TestEmployeeManager, TestConnectionErrorInvoke)
{
    MockDatabaseConnection dbConnection("DummyAddresss");
    auto boundMethod = std::bind(&MockDatabaseConnection::someMemberMethod, &dbConnection, "Some param");
    EXPECT_CALL(dbConnection, connect()).WillOnce(testing::InvokeWithoutArgs(boundMethod));
    ASSERT_THROW(EmployeeManager employeeManager(&dbConnection), std::runtime_error);
}
```
## Matchers
##### Exact value:
```c++
EXPECT_CALL(someObject, someMethod(5, "Hello"));
```
##### Agrument is greater/lower:
```c++
EXPECT_CALL(someObject, someMethod(`Gt(5)`));
```
##### Similar matchers:
* Ge
* Lt
* Le
* Eq
##### Anything("-"):
```c++
EXPECT_CALL(someObject, someMethod(6,_));
```
##### String matchers:
```c++
HasSubstr("Substring")
```
##### Can be used for checking against null:
* isNull()/
* isNotNull()
##### Comnining Matchers: 
```c++
EXPECT_CALL(someObject, someMethod(AllOf(Gt(5), Le(100), Not(7))));
//The argument is > 5, <=100 and != 7
```
##### Others:
* AllOf()/AnyOf()
* AllOfArray()/AnyOffArray()
* Not()
##### Can be used in assertions:
* ASSERT_THAT
## Matchers (Code Example)
### [testRunner.cpp](https://github.com/markdown-it/markdown-it-emoji)
##### Test Connection Error:
```c++
class MockDatabaseConnection : public IDatabaseConnection
{
public:
    MockDatabaseConnection(std::string serverAddress);

    //MOCK_METHODn n=0,10
    MOCK_METHOD0(connect, void());
    MOCK_METHOD0(disconnect, void());

    MOCK_CONST_METHOD1(getSalary, float(int));
    MOCK_METHOD2(updateSalary, void(int, float) );

    MOCK_CONST_METHOD1(getSalariesRange, std::vector<Employee>(float));
    MOCK_CONST_METHOD2(getSalariesRange, std::vector<Employee>(float, float));
};
MockDatabaseConnection::MockDatabaseConnection(std::string serverAddress) : IDatabaseConnection(serverAddress)
{

}

TEST(TestEmployeeManager, TestGetSalaryInRange)
{
    const int low = 5000, high = 8000;
    std::vector<Employee> returnedVector{
          Employee{1, 5000, "John"},
          Employee{2, 6600, "John"},
          Employee{3, 7000, "John"}
   };
   
    MockDatabaseConnection dbConnection("DummyAddresss");
    EXPECT_CALL(dbConnection, connect())
    EXPECT_CALL(dbConnection, disconnect());
    EXPECT_CALL(dbConnection, getSalariesRange(low, high)).WillOnce(Return(returnedVector));
    EmployeeManager employeeManager(&dbConnection)
    std::map<std::string, float> returnedMap = employeeManager.getSalariesBetween(low, high);
    for (auto it=returnedMap.begin(); it != returnedMap.end(); ++it)
    {
       std::cout << it->first << " " << it->second << "\n";
       ASSERT_THAT(it->second, testing::Gt(low));
       //ASSERT_THAT(it->second, testing::AllOf(testing::Gt(low), testing::Lt(high)));
    }
}
```

# Link tutorials: https://markdown-it.github.io/
