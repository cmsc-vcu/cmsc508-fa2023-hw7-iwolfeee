# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( skills_id,skills_name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    skills_id int ,
    tag varchar(256) NOT NULL,
    skills_name varchar(256) NOT NULL,
    description varchar(256) NOT NULL,
    url varchar(256),
    time_commitment int,
    PRIMARY KEY (skills_id)
);

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

insert into skills (skills_id, tag, skills_name, description)
values
    (1, 'Skill 1', 'Python', 'Proficent in Python'),
    (2, 'Skill 2', 'Java', 'Proficent in Java'),
    (3, 'Skill 3', 'C', 'Proficent in C'),
    (4, 'Skill 4', 'SQL', 'Profficent in SQL'),
    (5, 'Skill 5', 'Scripting', 'Script writer'),
    (6, 'Skill 6', 'Quality Assurance', 'Quality reviewer'),
    (7, 'Skill 7', 'Cyber Security', 'Analyses risks and threats'),
    (8, 'Skill 8', 'Database Admin', 'Database management');


# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    people_id int,
    last_name varchar(256) NOT NULL,
    first_name varchar(256),
    email varchar(256),
    linkedin_url varchar(256),
    headshot_url varchar(256),
    discord_handle varchar(256),
    brief_bio varchar(256),
    date_joined date NOT NULL,
    PRIMARY KEY (people_id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (people_id, last_name, date_joined)
values
    (1, 'Person 1', '1998/09/28'),
    (2, 'Person 2', '2000/01/02'),
    (3, 'Person 3', '2000/03/15'),
    (4, 'Person 4', '2001/07/22'),
    (5, 'Person 5', '2003/03/24'),
    (6, 'Person 6', '2005/05/09'),
    (7, 'Person 7', '2007/02/07'),
    (8, 'Person 8', '2017/08/19'),
    (9, 'Person 9', '2021/10/28'),
    (10, 'Person 10', '2023/11/12');

# Section 6
# Create peopleskills( peopleskills_id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    peopleskills_id int auto_increment,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired date NOT NULL,
    PRIMARY KEY (peopleskills_id)
);

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
insert into peopleskills (skills_id, people_id, date_acquired)
values
    (1, 1, '2023/01/01'), (3, 1, '2023/02/01'), (6, 1, '2023/03/01'),
    (3, 2, '2023/01/02'), (4, 2, '2023/02/02'), (5, 2, '2023/03/02'),
    (1, 3, '2023/01/03'), (5, 3, '2023/02/03'),
    -- Person 4 has no skills
    (3, 5, '2023/01/04'), (6, 5, '2023/02/04'),
    (2, 6, '2023/01/05'), (3, 6, '2023/02/05'), (4, 6, '2023/03/05'),
    (3, 7, '2023/01/06'), (5, 7, '2023/02/06'), (6, 7, '2023/03/06'),
    (1, 8, '2023/01/07'), (3, 8, '2023/02/07'), (5, 8, '2023/03/07'), (6, 8, '2023/04/07'),
    (2, 9, '2023/01/08'), (5, 9, '2023/02/08'), (6, 9, '2023/03/08'),
    (1, 10, '2023/01/09'), (4, 10, '2023/02/09'), (5, 10, '2023/03/09');

# Section 8
# Create roles( roles_id, roles_name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    roles_id int,
    roles_name varchar(256) NOT NULL,
    sort_priority int NOT NULL,
    PRIMARY KEY (roles_id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

insert into roles (roles_id, roles_name, sort_priority)
values
    (1, 'Designer', 10),
    (2, 'Developer', 20),
    (3, 'Recruit', 30),
    (4, 'Team Lead', 40),
    (5, 'Boss', 50),
    (6, 'Mentor', 60);

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id INT AUTO_INCREMENT,
    people_id INT NOT NULL,
    role_id INT NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (peopleroles_id)
);

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

insert into peopleroles (people_id, role_id, date_assigned)
values
    (1, 2, '2023/01/01'),
    (2, 5, '2023/01/02'),
    (2, 6, '2023/01/02'),
    (3, 2, '2023/01/03'),
    (3, 4, '2023/01/03'),
    (4, 3, '2023/01/04'),
    (5, 3, '2023/01/05'),
    (6, 2, '2023/01/06'),
    (6, 1, '2023/01/06'),
    (7, 1, '2023/01/07'),
    (8, 1, '2023/01/08'),
    (8, 4, '2023-01/08'),
    (9, 2, '2023/01/09'),
    (10, 2, '2023/01/10'),
    (10, 1, '2023/01/10');