                      # function parameter (argument)
get_trending_table<- function(search_term) {

  # path parameter
  endpoint <- paste0("/person/", person_id)

  # query parameter  
  param_list = list("api_key" = tmdb_key, "query" = search_term)
  
  uri <- paste0(base_uri, "/trending/person/day")
  print(uri)
  response <- GET(uri, query = param_list)
  body <- content(response, "text")
  data <- body$results

}

