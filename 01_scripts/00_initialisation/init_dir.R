if (!file.exists("02_data")){
  dir.create(path = "02_data/")
  cat("
      Création du dossier '02_data/' pour stocker les données à télécharger...")
} else {
  cat("
  Le dossier '02_data/' existe déjà.")
}

if (!file.exists("03_output")){
  dir.create(path = "03_output/")
  cat("
      Création du dossier '03_output/' pour stocker les données à télécharger...")
} else {
  cat("
  Le dossier '03_output/' existe déjà.")
}

