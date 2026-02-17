rtable <- function(
    n, # nombre de tirages
    table, # table dans laquelle tirer
    nom_tirage = "tirage", # nom de la colonne dans le fichier de sortie
    nom_col = "lib" # nom de la colonne des libellés dans laquelle tirer
    ){
  X = sample(x = table[[nom_col]], replace = F, size = n)
  res <- tibble(X)
  
  res[[nom_tirage]] <- res[["X"]]
  res$X <- NULL
  row.names(res) <- NULL
  
  return(res)
}

# Exemples
rtable(2, cpf_select)
