# MIST 4610 Project 2 

## Team Name:
Ctrl+Alt+Elite

## Team Members:
1. Julia Shanahan [@juliashanahan](https://github.com/juliashanahan)
2. Ben Goodall [@bengoodalll](https://github.com/bengoodalll)
3. Kira Mennella [@kiramennella](https://github.com/kiramennella)
4. Peyton Strickland [@pes30522](https://github.com/pes30522)
5. Yulianna Pazymino [@yuliapazymino](https://github.com/yuliapazymino)

## Scenario Description:
Our project outlines a comprehensive structure for managing a movie streaming platform, focusing on user engagement, content personalization, and subscription management. 

It supports both individual and family accounts, allowing users within a family account to have separate profiles linked to a shared subscription. Users can manage their genre preferences, watch lists, and watch history within an account. Movies can be filtered and searched by details such as genre, release year, age rating, etc. Additionally, users can give reviews by rating and commenting on movies they have viewed, which may be of benefit to other users. Subscription plans define pricing and streaming quality, with payment records tracking billing details. 

Our model integrates user activity, feedback, and account information to create a seamless movie streaming experience, all while providing insights about content and user engagement that allows management to optimize profitability and customer satisfaction.

## Data Model:
<img width="864" alt="Screenshot 2024-11-18 at 3 40 24 PM" src="https://github.com/user-attachments/assets/2d578b4a-c2e4-4545-ac31-7499b223523b">

This model showcases how management for a movie streaming platform manages users, family accounts, subscription plans, and movie content. It tracks user activities such as watch history, genre preferences, reviews, and saved watch lists, while also associating devices with a user within a family account. The model also shows how payments are completed based on different subscription tiers, which vary in price based on the type of subscription a user is signed up for.

## Data Dictionary:
<img width="711" alt="Screenshot 2024-12-02 at 5 52 47 PM" src="https://github.com/user-attachments/assets/0f15489f-8ebe-49fa-b974-096b7bc1791c">
<img width="733" alt="Screenshot 2024-12-02 at 5 53 02 PM" src="https://github.com/user-attachments/assets/5b933dd7-1860-4e61-af5d-bc9a1ae0e5ed">
<img width="732" alt="Screenshot 2024-12-02 at 5 54 23 PM" src="https://github.com/user-attachments/assets/8103a819-a0b2-4706-8424-b7bb63a2909c">
<img width="716" alt="Screenshot 2024-12-02 at 5 54 40 PM" src="https://github.com/user-attachments/assets/4d663eda-0a57-425b-9661-6f395c418ab0">
<img width="718" alt="Screenshot 2024-12-02 at 5 55 00 PM" src="https://github.com/user-attachments/assets/9aad357a-eda8-4915-80eb-f6071e288065">
<img width="720" alt="Screenshot 2024-12-02 at 5 55 16 PM" src="https://github.com/user-attachments/assets/8461a192-9de1-464c-b7dc-fe62c498c677">
<img width="729" alt="Screenshot 2024-12-02 at 5 55 34 PM" src="https://github.com/user-attachments/assets/09bb53d7-4d7f-43ba-b61c-4276711b88e8">
<img width="703" alt="Screenshot 2024-12-02 at 5 55 49 PM" src="https://github.com/user-attachments/assets/ef9901f6-93a8-4437-96d4-734f413ab261">
<img width="705" alt="Screenshot 2024-12-02 at 5 56 05 PM" src="https://github.com/user-attachments/assets/77a9a749-83b7-46c7-a1c6-bf408ffefcb7">
<img width="708" alt="Screenshot 2024-12-02 at 5 56 19 PM" src="https://github.com/user-attachments/assets/037ab8c9-cf0e-4f62-94b8-7d1f57166a67">
<img width="712" alt="Screenshot 2024-12-02 at 5 56 34 PM" src="https://github.com/user-attachments/assets/98735558-19f6-427b-874f-69c9dd3ce9c5">



## Queries:

Query 1 lists the total number of movies watched by each user, shown by the users first and last name. The results are in descending order.

<img width="726" alt="Screenshot 2024-12-02 at 3 31 16 PM" src="https://github.com/user-attachments/assets/08611030-713c-48f3-9610-46399176ed01">
<img width="279" alt="Screenshot 2024-12-02 at 3 31 55 PM" src="https://github.com/user-attachments/assets/4a197acc-a948-4f4c-984a-e94b09bf2df7">
Query 1 may be beneficial to management in realizing user engagement and identifying the most and least active users. If management can pinpoint users with low levels of activity, they can target these users specifically with direct marketing efforts and provide incentives that will increase engagement. On the other hand, identifying users with high levels of activity will help direct the kind of content the platform should be streaming to keep these users satisfied.

---

Query 5 lists the ratings for each movie genre in the database. 

<img width="430" alt="Screenshot 2024-12-02 at 3 55 14 PM" src="https://github.com/user-attachments/assets/cf33bed7-c754-4ad4-9863-f6beb358018a">
<img width="174" alt="Screenshot 2024-12-02 at 3 55 26 PM" src="https://github.com/user-attachments/assets/c7d1123b-7c36-4aac-b012-5da6e56e2020">

Query 5 will be beneficial to management because it can give them an idea of what genres people enjoy the most to put more money into the production of those genres of movies.

## Tableau Visualizations:
The first Tableau visualization answers the question, "What are the customer ratings for the movies on the platform?". 
<img width="1183" alt="Screenshot 2024-12-02 at 5 38 28 PM" src="https://github.com/user-attachments/assets/ee2eb664-956e-4946-b9a7-40a152da22b7">
This Tableau graph can be helpful to management because many streaming platforms are constantly updating their catalogs, so this helps show management which movies they should keep as they are higher-rated and which lower-rated movies they should remove in certain age ratings. Then, if they remove a lower-rated PG-13 movie, then they can be on the look out for another PG-13 movie that they can replace the movie with. 

The second Tableau visualization answers the question, "".
## Database Information: 
