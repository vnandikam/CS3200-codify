# Codify

Codify is a social media platform that will allow college students to collaborate on software related projects. This aims to allow people to find people to work on their personal projects as well as discover new projects to join. Each project will have one designer, one project lead who will be the project creator, and up to three developers. Every user can pick what kind of role they would like to contribute to and then view and search for various projects. Users can then request to join specific projects, as well as make their own projects. Projects have different tags, which allow users to sort through the ones that they’re specifically interested in, and which align closest to their skills. To expedite the process of allowing users to meet like-minded individuals, there is a people search so users can find people based on their tags and usernames. Codify also has a built-in messaging feature in order to facilitate communication between users. All users have user profiles where they are able to convey their skills as well as links to their GitHub/portfolios. Projects also have profiles where administrators can add useful links as well as the description of the project as well the types of collaborators they are interested in.


## How to setup and start the containers
**Important** - you need Docker Desktop installed

1. Clone this repository.  
1. Create a file named `db_root_password.txt` in the `secrets/` folder and put inside of it the root password for MySQL. 
1. Create a file named `db_password.txt` in the `secrets/` folder and put inside of it the password you want to use for the a non-root user named webapp. 
1. In a terminal or command prompt, navigate to the folder with the `docker-compose.yml` file.  
1. Build the images with `docker compose build`
1. Start the containers with `docker compose up`.  To run in detached mode, run `docker compose up -d`. 


Video: https://drive.google.com/file/d/1qYo1S6Uq3xB2zx5qdKyXLkULk5zOKM8W/view?usp=sharing 

