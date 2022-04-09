
## Logical Architecture
![Logical View](diagrams/logicalView.svg)

## Physical Architecture 
![Physical View](diagrams/physicalView.svg)

### User Client Machine
  The actual machine owned by the user. Will run the app and allow the user to access all the apps functionalities.
#### User GUI
  The graphical user interface of the app tailored to allow a easy and intuitive navigation.
  
### Application Client Machine
  The "brain" of our app. Manages all the logic behind the functionalities being the centerpiece of our project and its mainly developed in Fluter.
#### Application UI
  In direct contact with the User Client Machine this part is responsible for all the connecting between the logic and the user. As said before developed in Flutter with ease of use and accesibility in mind.
#### Student Logic Service Management
  The key part of the app logic in direct connecion with [FEUP Servers](https://github.com/LEIC-ES-2021-22/2LEIC15T1/edit/main/docs/ArchitectureAndDesign.md#feup-servers), handles all the requests recived by the users and returns with the correspondent actions or information.
#### Schedule Exporting Logic
  Since exporting to Google Calendar is a selling point of our project this artifact is a must since it will be responsible for handling such matters.
  
### Google servers 
  The necessary google connection to allow the [export feature](https://github.com/LEIC-ES-2021-22/2LEIC15T1/blob/main/docs/ArchitectureAndDesign.md#schedule-exporting-logic) to work. 
#### Google Calendar
  The exporting target of our feature.
  
### FEUP servers
  University Servers with all the information necessary to make our app work.
#### Backend API
  API resposible for colecting information.
  
## Vertical Prototype

To verify all our various decisions so far, we created a small prototype of the login app page, using the flutter framework and dart language. Our current implementation is simply visual
so that we could test its logic and functionality. 

![Vertical Prototype](screenshots/prototype.png)

