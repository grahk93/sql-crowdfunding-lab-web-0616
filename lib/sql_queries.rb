# Write your sql queries in this file in the appropriate method like the example below:
#
# def select_category_from_projects
# "SELECT category FROM projects;"
# end

# Make sure each ruby method returns a string containing a valid SQL statement.

def selects_the_titles_of_all_projects_and_their_pledge_amounts #GROUP BY will get rid of repeats
  #projects have many pledges, pledges belong to projects
"SELECT projects.title, SUM(pledges.amount) 
FROM pledges INNER JOIN projects ON pledges.project_id = projects.id 
GROUP BY projects.title"
end

def selects_the_user_name_age_and_pledge_amount_for_all_pledges
  #users have many pleges, a pledge belongs to a user 
  #join pledges to users
  #what ever belongs to should after FROM 
 "SELECT users.name, users.age, SUM(pledges.amount) 
 FROM pledges INNER JOIN users ON pledges.user_id = users.id 
 GROUP BY users.name"
end

def selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal
#what do you want returned --> after select
#can manipulate that
  #we want project titles and the amount they are over --> do the math 
#need to link pledges and funding goal, funding goal has many pledges?
"SELECT projects.title, ((SUM(pledges.amount)) - projects.funding_goal) 
FROM pledges INNER JOIN projects ON pledges.project_id = projects.id 
GROUP BY projects.title
HAVING (SUM(pledges.amount)) >= projects.funding_goal" 
end
# SELECT Cats.name, Cats.breed, Owners.name 
# FROM Cats 
# INNER JOIN Owners
# ON Cats.owner_id = Owners.id;

def selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_amount
#Select users.name, SUM(pledges.amount) #Group by users.name #order by  SUM(pledges.amount)
#pledges belong to users, users have many pledges --> pledges go after from 
"SELECT users.name, SUM(pledges.amount)
FROM pledges INNER JOIN users ON pledges.user_id = users.id 
GROUP BY users.name 
ORDER BY SUM(pledges.amount)"
end

def selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category
#select projects.category,  pledges amount
#need to link pledges to projects #what dose () around it mean 
"SELECT projects.category, pledges.amount
 FROM pledges INNER JOIN projects ON pledges.project_id = projects.id
 WHERE projects.category = 'music'"
end

def selects_the_category_name_and_the_sum_total_of_the_all_its_pledges_for_the_book_category
"SELECT projects.category, SUM(pledges.amount)
 FROM pledges INNER JOIN projects ON pledges.project_id = projects.id
 WHERE projects.category = 'books'"
end
