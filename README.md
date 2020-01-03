I tried one approach, but I have now run into problems, which
I attribute to the fact that I chose to use an array of hashes.

I am going to approach this slightly differently, using
a simple hash for the menu, rather than using an array of
hashes.

Update

User Story 1

My 'menu' is now made up of one single hash rather than an array of hashes.
I have used Dependency Injection to inject a menu object into my Takeaway class.
The Takeaway class's method read_menu() uses this menu object to call on the Menu class's
print_items() method.

Both menu and takeaway instances have a method which reads the menu.

I have used an instance double for the menu rather than a plain double in my takeaway spec, 
as instance doubles allow us to overcome the limitations associated with the London style of testing.

Update

User Story 2  3

A user can add any item that is on the menu with any quantity e.g.
in irb:
order.add(:"Chicken Wings", 4)
=> "4 X Chicken Wings added to your basket"
order.add(:"Pepperoni Pizza", 2)
=> "2 X Pepperoni Pizza added to your basket" 
order.add(:"Olives", 1)
 => "1 X Olives added to your basket" 

 If the user tries to add an item that isn't on the menu, an error is raised:

 order.add(:"Mushroom Soup", 1)
 RuntimeError (Mushroom Soup is not on the menu. Cannot be added to your basket)

 The user can check the total by calling the total method on the order object:
 order.total
  => 40.83 

  Ideally, I'd want a message returned to the user e.g.
  "The cost of your total order is: £40.83"










Takeaway Challenge
==================
```
                            _________
              r==           |       |
           _  //            |  E.M.I|   ))))
          |_)//(''''':      |   L.Y. |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

* **WARNING** think twice before you push your mobile number or any private details to a public space like Github. Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
