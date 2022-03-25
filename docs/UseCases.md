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
| *Description* | The authenticated user opens the map |
| *Preconditions* | - The authenticated user is logged in. |
| *Postconditions* | - The authenticated user enters the map search/navigation menu |
| *Normal flow* | 1. The authenticated user goes to the main menu. <br> 2. The authenticated user selects the map option. |
| *Alternative flows and exceptions* | [Connection failure] If, in step 2 of the normal flow there are problems with the internet connection, the app won't be able to load the map, the system warns the user and returns to the main menu. |


|||
| --- | --- |
| *Name* | Check location |
| *Actor* |  Authenticated User | 
| *Description* | The authenticated user interacts with a location and is prompted with a small box who contains a summary of the information and a link to its full page |
| *Preconditions* | - The authenticated user is logged in.<br> - The authenticated user is in the map menu. |
| *Postconditions* | - A small box is prompted to the authenticated user. |
| *Normal flow* | 1. The authenticated user goes to the main menu. <br> 2. The authenticated user selects the map option.<br> 3. The authenticated user selects a location of a service.<br> 4. The small box is prompted to the authenticated user.|
| *Alternative flows and exceptions* | *None* |

|||
| --- | --- |
| *Name* | Check current position |
| *Actor* |  Authenticated User | 
| *Description* | The authenticated activates the get current location and gets his real-time location with the gps. |
| *Preconditions* | - The authenticated user is logged in.<br> - The authenticated user is in the map menu.<br> - The authenticated user has the gps system turned on. |
| *Postconditions* | - An icon appears on the map with the authenticated user location. |
| *Normal flow* | 1. The authenticated user goes to the main menu. <br> 2. The authenticated user selects the map option.<br> 3. The authenticated user selects the get current location option and waits a few seconds. <br> 4. The small icon is prompted on the map in the real life location.|
| *Alternative flows and exceptions* | [GPS failure] If, in step 3 and 4 of the normal flow there are problems with the gps system, and it can't find the authenticated user location, a message will appear with a warning and the app will return to the normal map state.|

|||
| --- | --- |
| *Name* | Check the services list |
| *Actor* |  Authenticated User | 
| *Description* | The authenticated user opens the services list |
| *Preconditions* | - The authenticated user is logged in. |
| *Postconditions* | - The authenticated user enters the services list search menu |
| *Normal flow* | 1. The authenticated user goes to the main menu. <br> 2. The authenticated user selects the services list option. |
| *Alternative flows and exceptions* | *None* |

|||
| --- | --- |
| *Name* | Check Services information |
| *Actor* |  Authenticated User | 
| *Description* | The authenticated user checks the info about a service |
| *Preconditions* | - The authenticated user is logged in. |
| *Postconditions* | - The authenticated user enters the map search/navigation mode.specific service information menu. |
| *Normal flow* | 1. The authenticated user goes to the main menu. <br><br> Either<br> 2. The authenticated user selects the map option.<br><t> 2.1. The autenticated user selects a service on the map, opening a small box <br> 2.2. The authenticated user opens the service information menu, whose link is in the box <br> <br>Or <br>3. The authenticated user selects the services list option.<br> 3.1 The authenticated user selects a service from the list of available options opening the service information menu.|
| *Alternative flows and exceptions* | *None*


|||
| --- | --- |
| *Name* | Make a reminder |
| *Actor* |  Authenticated User |
| *Description* | The authenticated marks a reminder related to a service for a certain time |
| *Preconditions* | - The authenticated user is logged in. |
| *Postconditions* | - A notification will be scheduled and popped at the specified time to the user. |
| *Normal flow* | 1. The authenticated user goes to the main menu. <br> 2. The authenticated user selects the map option. 2. Navigates throught the map or service list in order to reach the one service information menu.| 3. The authenticated user schedules a reminder for the current service. 
| *Alternative flows and exceptions* | [Lack of information failure] If, in step 3 of the normal flow there are mandatory fields missing when submitting the reminder, it won't work, and the system will redirect to the service information page again. |

