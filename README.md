<!-- ABOUT THE PROJECT -->
## flipgrid-mobile-code-challenge-gaurang

This is my attempt at an onboarding screen according to the requirements provided to me with a few additions.


![ezgif-5-83dfdc1119](https://user-images.githubusercontent.com/25397326/165194322-eb2bc0f8-c209-40f8-b796-db879aeef332.gif)


## App Breakdown

- **Sign Up Page** -> This page takes in sign up data and allows you to submit. The email and password fields are required to proceed

![Simulator Screen Shot - iPhone 13 - 2022-04-26 at 18 29 23 (1)](https://user-images.githubusercontent.com/25397326/165403811-b65e7877-faf1-4e61-919d-88a9de1e29f9.png)

I have added validation logic to prevent the user from putting in an invalid email format or a password that doesn't meeting proper specification (8 characters, 1 uppercase, 1 lowercase, 1 number and special character)

![Simulator Screen Shot - iPhone 13 - 2022-04-26 at 19 16 45 (1)](https://user-images.githubusercontent.com/25397326/165408356-3ac655e0-dbf5-4e38-b80d-13f3ebba9fce.png)
![Simulator Screen Shot - iPhone 13 - 2022-04-26 at 19 17 09 (1)](https://user-images.githubusercontent.com/25397326/165408374-5b800a26-3043-4871-95f8-66b401392cf7.png)



- **Confirmation Page** -> This page displays the confirmation that your onboarding was successful, addresses you by name and lists your provided onboarded information

![Simulator Screen Shot - iPhone 13 - 2022-04-26 at 18 29 50 (1)](https://user-images.githubusercontent.com/25397326/165403546-c10c90d5-835c-42e8-8c7b-06ad2bbe1c43.png)

### Built With

* [Swift](https://www.swift.org/)



## Liberties Taken on the Project

- I made the sign up page dynamic so that the number of fields (and types), are provided by a json file that can be configured accordingly. I did this so that if requirements were ever to change in regards to sign up information being collected, the UI will require zero maintenance to update it. (This of course does not include the API call to sign up since actually signing up was beyond the scope of the project)
- Email and Password validation utilizes regex so that the are actually valid inputs for each of them. I wrote a procedure that could be expanded upon to support all types of validation in the future as well


## Proposed expansion if time allowed

I initially had a few more ideas I wanted to implement but ultimately was not able to given my schedule over the past week. These included:

- Designing with **MVVM** architecture in mind rather than **MVC**: I initially went into this with MVVM but ultimately decided against it due to the use case and scope of the project. Had I done so, I would have abstracted out the Sign Up Validation logic to a SignUpViewModel and perform any validation there.
- Having the confirmation screen designed by the JSON as well: As mentioned above, this project makes use of a JSON payload to design the sign up form. I did this so that the design of the form requires little maintenance in the case of a change in requirement to support more or even less sign up fields. My plan was to take that sign up data, convert into JSON and written to a file that would then be read out in the Confirmation Page to design that page accordingly as well. I ultimately did not get a chance to implement this but this would've acted in place of an API confirmation response when signing up for an account.
- Loading indicator: In tandem with the pages being pulled from JSON. I would to provide a spinner to indicate the progress of the server returning the information. Since I am not pulling the data from JSON for the confirmation page, I didn't see the need to squeeze the loading indicator in there.
- Given more time, I wanted to design the confirmation screen so each sign up field information had attributes tied to it to determine how the text would be displayed. So for example, a website would become a hyperlink, an email address would open up the mail app, etc. This would also help with MVVM since I would know exactly which fields were the required ones to abstract to a ViewModel. 

As you can probably tell, most of these additions were thought of to keep API calls in mind and given more time would be executed to do so. 

## Build

Open the project and you should be able to click run or CMD-R to build and run the project on either a simulator or on your device (iOS 13 and above supported). You will likely have to accept my development signatue to test on a device. (Settings)

## Running unit tests

Navigate to mobile_coding_challengeTests.swift. From there you can run individual tests or the entire test suite. I did my best to provide code coverage to all classes with unit based logic.
