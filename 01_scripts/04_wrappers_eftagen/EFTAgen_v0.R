# Wrapper basique reprenant toutes les tables à un instant T.

EFTAgen_v0 <- function(
    nb_naf = 1, # nombre d'activités à tirer de la NAF
    nb_cpf = 3, # nombre de produits à tirer de la CPF
    liste_prenoms = prenoms # liste de prénoms préférée
    ){
  nombre_prenoms <- round(rexp(n = 1, rate = .6)+1)
  nomgen <- rtable(n = nombre_prenoms, table = liste_prenoms, nom_tirage = "Nom") %>% 
    summarise(Nom = paste0(Nom, collapse = ", "))
  
  nafgen <- rtable(n = nb_naf, table = naf_select, nom_tirage = "Catégorie d'activité")
  cpfgen <- rtable(n = nb_cpf, table = cpf_select, nom_tirage = "Catégorie d'objet")
  
  EFTA0 = list(
    "Nom" = nomgen,
    "Catégorie d'activité" = nafgen,
    "Catégorie d'objet " = cpfgen
  )
  
  return(EFTA0)
}

EFTAgen_v0()



