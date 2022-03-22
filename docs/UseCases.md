# Use Cases 

![Use cases](/images/ESOF.png)


|||
| --- | --- |
| *Name* | Login |
| *Actor* |  User | 
| *Description* | The user logs in the app using the university credentials. |
| *Preconditions* | - The user is a member of the university. |
| *Postconditions* | - The user gets access to the app features. |
| *Normal flow* | 1. The user opens the app.<br> 2. The system prompts the user with the username and password fields.<br> 3. The user types the credentials and logs in. |
| *Alternative flows and exceptions* | [Login failure] If, in step 3 of the normal flow the login fails because of wrong credentials, the system warns the user and asks again for an input. |

|||
| --- | --- |
| *Name* | Logout |
| *Actor* |  Authenticated User | 
| *Description* | The authenticated user logs out off the app. |
| *Preconditions* | - The authenticated user is logged in. |
| *Postconditions* | - The authenticated user loses access to the app features. <br> - The log in menu is prompted. |
| *Normal flow* | The authenticated user selects the logout option in the |
| *Alternative flows and exceptions* | *None* |

|||
| --- | --- |
| *Name* | Check the map |
| *Actor* |  Authenticated User | 
| *Description* | The user opens the map |
| *Preconditions* | - The user is a member of the university. |
| *Postconditions* | - The user gets access to the app features. |
| *Normal flow* | 1. The user opens the app.<br> 2. The system prompts the user with the username and password fields.<br> 3. The user types the credentials and logs in. |
| *Alternative flows and exceptions* | [Login failure] If, in step 3 of the normal flow the login fails because of wrong credentials, the system warns the user and asks again for an input. |