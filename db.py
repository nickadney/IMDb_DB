from imdb import Cinemagoer

#SQL insert template -> f"INSERT INTO **Table Name** VALUES ({variable}, {variable})"

#opening the file to write to
sqlFile = open("finalProject.sql", "w")

#creating an instance of Cinemagoer
ia = Cinemagoer()

top_movies = ia.get_top250_movies() 
top_tv = ia.get_top250_tv()


# nameId		
# firstName			
# lastName		
# birthDate			
# acting_credits
# writing_credits	
# directing_credits
for movie in top_movies:
    id = ia.get_imdbID(movie)
    tempMovie = ia.get_movie(id)
    for director in movie["director"]:
        personId = ia.search_person(director['name'])['id']
        person = ia.get_person(personId)
        print(person.data)
        
#to populate the tv_shows entity
for tv in top_tv[0:50]:
    title_id = tv.getID()
    title = tv.data['title']
    title = title.replace("'", "")
    release_dt = tv.data['year']
    rating = tv.data['rating']

    #fetching the number of seasons
    ia.update(tv, 'episodes')
    list_of_seasons = (sorted(tv['episodes'].keys()))

    #summing the number of episodes to assign to num_episodes
    episodes = 0
    for i in list_of_seasons:
        season = tv['episodes'][i]
        episodes += len(season)

    num_episodes = episodes
    #returns the number of seasons by popping the last element in list_of_seasons (the last season)
    num_seasons = list_of_seasons.pop()

    #cannot get this to work
    #maturity_rating = tv.data['certificates']

    #load into finalProject.sql
    sqlFile.write(f"INSERT INTO tv_show VALUES ({title_id},{title},{release_dt},{rating},{num_episodes},{num_episodes})")



#person
#--------
#nameId
#f_name
#l_name
#Bdate
#act creds
#write creds
#direct creds

nameID = person.personID #?
name = person.data['name'].split()
fname = name[0]
lname = name[1]
bdate = person.data['birth date']
#look at person object to figure out the name for these
actCreds = person.data['acting credits']
writeCreds = person.data['writing credits']
directCreds = person.data['directing credits']

sqlFile.write(f"INSERT INTO Person VALUES ({nameID}, {name}, {fname}, {lname}, {bdate}, {actCreds}, {writeCreds}, {directCreds})")










        



