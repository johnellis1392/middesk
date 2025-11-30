## Background

Middesk's business verification product aims to present our customers with a comprehensive set of attributes related to businesses they care about. One such attribute is the corporate officers associated with a business. The definition of a corporate officer is as follows:

> Corporate officers are high-level management executives hired by the business's owner or board of directors.
> Examples include the organization's chief executive officer (CEO), chief financial officer (CFO),
> treasurer, president, vice president, and secretary.
> A corporation can have any number of officers and an individual can hold any number of offices.
> In small corporations, the same person may hold every office.

Middesk mainly obtains officer data from business registration data purchased from the various Secretaries of State in each U.S. state. Often times, this data is offered in the form of a CSV file.

## Exercise

In this exercise, we'll imagine we've just obtained a CSV file from the California Secretary of State listing information about businesses registered in the state, including the officers of the business. We'd like to expose this data via an API which will allow customers to query the officer data.

In your implementation, use the stack of your choice. You may use any libraries or technologies you find useful - use your preferred language, web framework, database, etc. You are welcome to reference documentation and resources online throughout the exercise.

### Requirements

This exercise is intentionally designed to take up more than the alotted time. As such, you will most likely NOT be able to complete all of the requirements below; just aim to complete as many of the requirements as possible (in order):

1. Examine the CSV (provided [here](https://drive.google.com/file/d/1P7PPiAhYd4B4K_sqhoMf3-q47F-wcObX/view?usp=sharing)) which contains business + officer data.
2. Design a database schema to represent the data from the CSV. Use the subsequent requirements below to guide your schema design.
3. Write a script to load the data into a database of your choice. The script should be idempotent, i.e. running the script again after the data has already been loaded should have no effect.
4. Implement an API endpoint which responds with a list of all officers.
5. Augment the API endpoint to allow filtering officers by:
    - Business name
    - Role
    - Officer name
6. Implement an API endpoint which allows callers to add more officers to an existing business.
7. Write tests for the "list officers" endpoint.
