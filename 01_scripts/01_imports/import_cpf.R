cat("
    TODO : utiliser doremifasol ou un autre moyen de télécharger directement cette table.
    En attendant, aller sur https://www.insee.fr/fr/information/2399243 et prendre les sous-catégories.
")
cpf_brut <- read_excel("02_data/cpf2015_liste_n6.xls", skip = 1) %>% 
    rename(code = CODE, lib = LIBELLE)

if (exists("cpf_brut")){
  cat("
  Créé le fichier 'cpf_brut' avec toutes les lignes du niveau 6 de la CPF 2015 rév. 2.1.
")
}