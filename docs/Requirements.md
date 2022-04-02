# Requirements

## Use Cases

![Use cases](/images/ESOF.png)

|||
| --- | --- |
| *Name* | Login |
| *Actor* |  Visitor | 
| *Description* | The visitor logs in the app using the university credentials. |
| *Preconditions* | - The visitor has an account registered in the university. |
| *Postconditions* | - The visitor gets access to the app features. |
| *Normal flow* | 1. The visitor opens the app.<br> 2. The system prompts the visitor with the username and password fields.<br> 3. The visitor types the credentials and logs in. |
| *Alternative flows and exceptions* | [Login failure] If, in step 3 of the normal flow the login fails because of wrong credentials, the system warns the visitor and asks again for an input. |

|||
| --- | --- |
| *Name* | Logout |
| *Actor* |  User | 
| *Description* | The user logs out off the app. |
| *Preconditions* | - The user is in the main menu |
| *Postconditions* | - The user loses access to the app features. <br> - The log in menu is prompted. |
| *Normal flow* | The user selects the logout option in the menu |
| *Alternative flows and exceptions* | *None* |

|||
| --- | --- |
| *Name* | Check the map |
| *Actor* | User | 
| *Description* | The user opens the map |
| *Preconditions* | - The user is in the main menu |
| *Postconditions* | - The user enters the map search/navigation menu |
| *Normal flow* | 1. The user goes to the main menu. <br> 2. Then user selects the map option. |
| *Alternative flows and exceptions* | [Connection failure] If, in step 2 of the normal flow there are problems with the internet connection, the app won't be able to load the map, the system warns the user and returns to the main menu. |


|||
| --- | --- |
| *Name* | Check Service Location |
| *Actor* |  User | 
| *Description* | The user interacts with a location and is prompted with a small box who contains a summary of the information and a link to its full page |
| *Preconditions* | - The user is in the map menu. |
| *Postconditions* | - A small box is prompted to the user. |
| *Normal flow* | 1. The user goes to the main menu. <br> 2. The user selects the map option.<br> 3. The user selects a location of a service.<br> 4. The small box is prompted to the user.|
| *Alternative flows and exceptions* | [Google API connection failure] If, in step 2, the app fails to load the map using the Google API, a message warning the user will be prompted, and the main menu screen will be maintained.|

|||
| --- | --- |
| *Name* | Check Current Position |
| *Actor* |  User | 
| *Description* | The user selects the "Get current position" option and gets his real-time location on the map using the GPS. |
| *Preconditions* | - The user is in the map menu.<br> - The user has the GPS system turned on. |
| *Postconditions* | - An icon appears on the map with the user location. |
| *Normal flow* | 1. The user goes to the main menu. <br> 2. The user selects the map option.<br> 3. The user selects the get current location option and waits a few seconds. <br> 4. The small icon is prompted on the map in the real life location.|
| *Alternative flows and exceptions* | [GPS failure] If, in step 3 and 4 of the normal flow there are problems with the GPS system, and it can't find the user location, a message will appear with a warning and the app will return to the normal map state.|

|||
| --- | --- |
| *Name* | Check the services list |
| *Actor* |  User | 
| *Description* | The user opens the services list |
| *Preconditions* | - The user is in the main menu |
| *Postconditions* | - The user enters the services list search menu |
| *Normal flow* | 1. The user goes to the main menu. <br> 2. The user selects the services list option. |
| *Alternative flows and exceptions* | *None* |

|||
| --- | --- |
| *Name* | Check Services information |
| *Actor* | User | 
| *Description* | The user checks the info about a service |
| *Preconditions* | - The user is either in the map menu with the service pop up opened or in the services list menu. |
| *Postconditions* | - The user enters the detailed information menu of the pretended service. |
| *Normal flow* | 1. The user goes to the main menu. <br><br> Either<br> 2. The user selects the map option.<br><t> 2.1. The user selects a service on the map, opening a small box <br> 2.2. The user opens the service information menu, whose link is in the box <br> <br>Or <br>3. The user selects the services list option.<br> 3.1 The user selects a service from the list of available options opening the service information menu.|
| *Alternative flows and exceptions* | *None*


|||
| --- | --- |
| *Name* | Manage reminders |
| *Actor* | User |
| *Description* | The user opens the menu with his info and the manage reminders features. |
| *Preconditions* | - The user is in the main menu |
| *Postconditions* | - The user enters the manage reminders menu.|
| *Normal flow* | 1. The user goes to the main menu. <br> 2. The user selects the manage reminders option. |
| *Alternative flows and exceptions* | *None* |

|||
| --- | --- |
| *Name* | Create reminder |
| *Actor* | User |
| *Description* | The user creates a reminder for the selected service. |
| *Preconditions* | - The user is in the service information menu. |
| *Postconditions* | - A notification will be scheduled and popped at the specified time to the user. |
| *Normal flow* | 1. The user goes to the main menu. <br> 2. The user enters the service information menu either through the map or the list. <br> 3. The user selects the create reminder option. <br> 4. The user fills the data in need and submits it. <br>|
| *Alternative flows and exceptions* | [Lack of information failure] If, in step 4 of the normal flow there are mandatory fields missing when submitting the reminder, it won't work, and the system will redirect to the service information page again. |

|||
| --- | --- |
| Name | Delete Reminder |
| Actor | User | 
| Description | The user deletes an existing reminder |
| Preconditions | - The user must be in the manage reminders menu |
| Postconditions | - The reminder is deleted. |
| Normal flow | 1. The user goes to the main menu. <br> 2. The user goes to the manage reminders menu. <br> 3. The user deletes the chosen reminder. <br> 4. The user confirms the deletion of the reminder  |
| Alternative flows and exceptions | None |

|||
| --- | --- |
| Name | Edit Reminder |
| Actor | User | 
| Description | The user edits an existing reminder |
| Preconditions | - The user must be in the manage reminders menu<br> - The user is redirected back to the manage reminders menu|
| Postconditions | - The edited reminder changes its details. |
| Normal flow | 1. The user goes to the main menu. <br> 2. The user goes to the manage reminders menu. <br> 3. The user chooses the reminder he would like to edit. <br> 4. The user edits the chosen reminder and confirms its edition.|
| Alternative flows and exceptions | [Lack of information failure] If, in step 4 of the normal flow there are mandatory fields missing when editing the reminder, it won't work, and the system will redirect to the manage reminders page. |


## Domain Model

![Use cases](/images/esof_domain_model.png)

### Tables
- **Service**: information about each service
- **Schedule**: information about a specific schedule of a service
- **Location**: information about a service's location
- **Reminder**: information about a reminder, created by a specific user for a specific service
- **User**: information about each User
