|||
| --- | --- |
| *Name* | Get Classroom Location |
| *Actor* |  Student | 
| *Description* | The student gets the location for a specific classroom with indication on how to get to the classroom in question |
| *Preconditions* | - The student must be logged in. <br> The Student must have selected a specific curricular unit either by their personal information page or Personal schedule page. Alternatively The student's schedule can also be used to query the classroom in question|
| *Postconditions* | - The student gets a map detailing the location and trajectory to the classroom.  |
| *Normal flow* | 1. The students logs in to the app (if not already logged in) <br> 2. The application shows the student's schedule <br> 3. The student selects a specific curricular unit through the schedule<br> 4. The student clicks on the classroom they want to know the location of. <br> 5. The application shows the location and trajectory to the classroom. |
| *Alternative flows and exceptions* | 1. [Schedule Flow] In step 3 the student instead can simply click on a specific classroom, skipping step 4. <br> 2. [Personal Academic Pathway Flow] The student on step 2 can instead choose a specific curricular unit through their personal academic pathway. |


|||
| --- | --- |
| *Name* | Get Curricular Unit Schedule |
| *Actor* |  Student | 
| *Description* | The user gets all the information about curricular unit Schedule|
| *Preconditions* | The student is logged in and has a personal schedule with curricular unit in their schedule |
| *Postconditions* | - The student gets the unit schedule |
| *Normal flow* | 1. The student opens the app<br> 2.  Selects personal schedule <br> 3. Selects the curricular unit <br> 4. The student selects the option to see the unit schedule.
| *Alternative flows and exceptions* | 1. If the student selects the option with the personal information then the app follows the same flow as before. Instead of selecting from their personal schedule the student can select from the list of curricular units they’re enrolled for. |

|||
| --- | --- |
| *Name* | Get Curricular Unit Info |
| *Actor* |  Student | 
| *Description* | The student gets all the information of the curricular unit. |
| *Preconditions* | - The student has to be logged in and on their personal info page.|
| *Postconditions* | - The student goes to the page with all of the curricular unit’s information. |
| *Normal flow* | 1. The student opens the app.<br> 2. Selects personal schedule.<br> 3. Selects the preferred curricular unit. |
| *Alternative flows and exceptions* | 1. The student can select personal info instead of personal schedule in step 2. |

|||
| --- | --- |
| *Name* | Personal Schedule|
| *Actor* |  Student | 
| *Description* | The student gets their schedule with all the respective information|
| *Preconditions* | - The student is logged in <br> - The students has a personal schedule given by the university|
| *Postconditions* | - The student gets to visualize their schedule|
| *Normal flow* | 1. The student opens the app<br>2. Goes through the main menu and selects the schedule option. |
| *Alternative flows and exceptions* | 1. [No schedule available] if the student does not have an assigned schedule. |

|||
| --- | --- |
| *Name* | Schedule Export|
| *Actor* |  Student | 
| *Description* | The student gets a file containing their schedule with all the respective information that can be use by third person apps|
| *Preconditions* | - The student is logged in <br> - The students has a personal schedule given by the university|
| *Postconditions* | - The student gets a file corresponding to their schedule|
| *Normal flow* | 1. The student opens the app<br>2. Goes through the main menu and selects the schedule option. <br> 3.The students selects the option to extract the schedule to a file.|
| *Alternative flows and exceptions* | 1. [No schedule available] if the student does not have an assigned schedule. |

|||
| --- | --- |
| *Name* | Login |
| *Actor* | Student | 
| *Description* | The student logs in. |
| *Preconditions* | - The student has to start the app. |
| *Postconditions* | - The student is logged in. |
| *Normal flow* | 1. The student starts the app.<br> 2. Logs in. |
| *Alternative flows and exceptions* | 1. [Incorrect combination of user-password information] If, in step 2 of the normal flow the inserted user-password combination is incorrect, the system gives the student the possibility to cancel or retry.