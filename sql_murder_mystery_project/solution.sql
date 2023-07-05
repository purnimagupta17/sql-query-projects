
I have solved this case (https://mystery.knightlab.com/) by ending with this SQL approach:

Step 1. To check and collect clues based on the following information:
  
/*
Select *
from crime_scene_report
where type='murder' and city='SQL City'


this query helps in finding 2 clues as follows:
1. The first witness lives at the last house on "Northwestern Dr". 
2. The second witness, named Annabel, lives somewhere on "Franklin Ave".
*/


  Step 2. Based on above mentioned 2 clues-> it is best to identify and look more from "person" table which contain info like name and addresses.
/*
  Select *
from person
where address_street_name='Northwestern Dr'
order by address_number desc

  */
  -> the result of this query helps us finding the first witness as-> Morty Schapiro

/*
  Select *
from person
where address_street_name='Franklin Ave'
and name like '%Annabel%'

*/

  -> the result of this query helps us finding the second witness as-> Annabel Miller

Step 3. Now, we have two witnesses and we can find out their ids from the person table to look more information from them

/*
  Select *
from person
where name in ('Morty Schapiro', 'Annabel Miller')
*/

Step 4. We can used their id info to see their interview transcript to look for more information.
  /*
Select *
from interview
where person_id in ('14887', '16371')
  */

  the following transcripts records says:
 -> 14887	Morty Schapiro ->>>I heard a gunshot and then saw a man run out. He had a "Get Fit Now Gym" bag. The membership number on the bag started with "48Z". Only gold members have those bags. The man got into a car with a plate that included "H42W".	
-> 16371	Annabel Miller ->>> I saw the murder happen, and I recognized the killer from my gym when I was working out last week on January the 9th.

  Step 5. To find out more based on information provided by witnesses.

  -> To identify suspects having gold gym card holders.
  /*
  Select *
from get_fit_now_member m
join get_fit_now_check_in c on m.Id=c.membership_id
where Id like '%48Z%' and membership_status='gold'
  */

  It lists 'Joe Germuska' and 'Jeremy Bowers' as two suspects who own the gold gym card.

-> To identigy the main suspect from the license_id and name plate number.

  /*
  Select *
from drivers_license dl
join person p 
where dl.Id=p.license_id
and dl.plate_number like ('%H42W%')
  */

  It shows the 'Jeremy Bowers' as one of the main suspect.

  So the ANSWER is 'Jeremy Bowers' 




  
  
  




  



