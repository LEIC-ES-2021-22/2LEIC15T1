|||
| --- | --- |
| *Name* | Get Classroom Location |
| *Actor* |  Student | 
| *Description* | The student gets the location for a specific classroom with indication on how to get to the classroom in question |
| *Preconditions* | - The student must be logged in. <br> The Student must have selected a specific curricular unit either by their personal information page or Personal schedule page. Alternatively The student's schedule can also be used to query the classroom in question|
| *Postconditions* | - The student gets a map detailing the location and trajectory to the classroom.  |
| *Normal flow* | 1. The students logs in to the app (if not already logged in) <br> 2. The application shows the student's schedule <br> 3. The student selects a specific curricular unit through the schedule<br> 4. The student clicks on the classroom they want to know the location of. <br> 5. The application shows the location and trajectory to the classroom. |
| *Alternative flows and exceptions* | 1. [Schedule Flow] In step 3 the student instead can simply click on a specific classroom, skipping step 4. <br> 2. [Personal Academic Pathway Flow] The student on step 2 can instead choose a specific curricular unit through their personal academic pathway. |