|||
| --- | --- |
| *Name* | Get Classroom Location |
| *Actor* |  Student | 
| *Description* | The student gets the location for a specific classroom with indication on how to get to the classroom in question |
| *Preconditions* | - The student must be logged in. <br> The Student must have selected a specific curricular unit either by their personal information page or Personal schedule page|
| *Postconditions* | - The student gets a map detailing the location and trajectory to the classroom.  |
| *Normal flow* | 1. The students logs in to the app (if not already logged in)<br> 2. The application shows the student's schedule <br> 3. The student selects a specific <br> 4. If wanted, the costumer may Choose Places.<br> 5. The system shows the total price to pay.<br> 6. The system redirects the customer to Electronic Payment.<br> 7. The system delivers the electronic tickets to the customer with a unique identifier and QR code. |
| *Alternative flows and exceptions* | 1. [Payment failure] If, in step 6 of the normal flow the payment fails, the system gives the user the possibility to cancel or retry. |