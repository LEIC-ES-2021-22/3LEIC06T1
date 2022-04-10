# Architecture and Design
In this section we'll describe the logical and physical architectures of our project.


## Logical architecture
In order to provide long-term maintenance of the code and allow easy understanding about it, our project was diveded in six sections:
- **Services UI**: 
- **Service Logic**: responsible for housing the models for each struture of the database and the programs logic
- **Reminder Database Schema**: module that saves the information regarding the reminders
- **ASSO API**: external API responsible for supplying information about FEUP's services
- **Google API**: external API responsible for supplying information the FEUP's map

![Logical architecture](/images/logical_architecture.png)

## Physical architecture

In our app's physical architecture we have 3 entities featured: the Back-end Server where get the all information regarding FEUP's services, the Google Servers where we get the information and data to build the map features, and the Flutter app itself, which the user interacts with.

![Physical architecture](/images/physical_architecture.png)


## Vertical prototype

The following user stories were implemented:

- Transição para ???

- Botão que ...

