cat("
    TODO : utiliser doremifasol ou un autre moyen de télécharger directement cette table.
    En attendant, aller sur https://www.insee.fr/fr/information/2120875 et prendre les sous-classes.
")
naf_brut <- read_excel("02_data/naf2008_liste_n5.xls", skip = 1) %>% 
  rename(code = Code, lib = Libellé)

# naf_structure <- read_excel("02_data/naf2008_5_niveaux.xls")

if (exists("naf_brut")){
  cat("
  Créé le fichier 'naf_brut' avec toutes les lignes du niveau 5 de la NAF 2008 rév. 2.
"
  )
}