all_players_fileName <<- "all_players_list.rds"
game_players_filename <<- "game_players_list.rds"


save_data = function(data, file_type="all_players") {
  if (file_type == "all_players"){
    file_path = file.path("./data", all_players_fileName)
  } else {
    file_path = file.path("./data", game_players_filename)
  }
  saveRDS(data, file=file_path)
}


load_data = function(file_type="all_players") {
  if (file_type == "all_players"){
    file_path = file.path("./data", all_players_fileName)
  } else {
    file_path = file.path("./data", game_players_filename)
  }
  data = readRDS(file=file_path)
  return(data)
}


data_to_list = function(data) {
  return(as.list(paste(data$first_name, data$last_name, sep=" ")))
}

list_to_data = function(list) {
  print(list)
  if (length(list) == 0) {
    data = data.frame(matrix(ncol = 2, nrow = 0))
  } else {
    split_word = function(word) {strsplit(word, " ")[[1]]}
    splitted_list = lapply(list, split_word)
    data = data.frame(matrix(unlist(splitted_list), nrow=length(splitted_list), byrow=T))
  }
  colnames(data) = c("first_name", "last_name")
  return(data)
}