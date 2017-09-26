library(yaml)

setwd("~/courses/datachats-content")
yaml_files <- dir(pattern = "*.yml")
ids <- sapply(yaml_files, function(file) {
  yaml.load_file(file)$id
}, USE.NAMES = FALSE)

# JSON below is result of
# $ curl -L -X POST -d 'query=query { datachats { datachats { id } } }' https://<USER>:<PASS>@datachats.herokuapp.com/graphql
in_app_json <- '{"data":{"datachats":{"datachats":[{"id":"4"},{"id":"9"},{"id":"10"},{"id":"11"},{"id":"32"},{"id":"33"},{"id":"34"},{"id":"35"},{"id":"36"},{"id":"37"},{"id":"38"},{"id":"39"},{"id":"40"},{"id":"41"},{"id":"43"},{"id":"44"},{"id":"45"},{"id":"46"},{"id":"47"},{"id":"48"},{"id":"49"},{"id":"50"},{"id":"51"},{"id":"52"},{"id":"53"},{"id":"42"}]}}}'
ids_in_app <- as.numeric(sapply(jsonlite::fromJSON(in_app_json, simplifyDataFrame = FALSE)$data$datachats$datachats, `[[`, c("id")))

ids_to_remove <- setdiff(ids_in_app, ids)
ids_to_remove

patt <- "curl -L -X POST -d 'query=mutation { deleteDatachat(id: %i) { title }}' https://datachats:5ffwXWRbVLdvvjQR@datachats.herokuapp.com/graphql"
commands <- sprintf(patt, ids_to_remove)
lapply(commands, system)
