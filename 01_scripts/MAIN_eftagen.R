# EFTA - ENERGUMÈNES FRANCOMORPHES TOTALEMENT ALEATOIRES ------------------




# 00. Architecture du dossier ----------------------------------------------
source("01_scripts/00_initialisation/init_dir.R")


# 01. Import des fichiers Insee --------------------------------------------
# TODO télécharger les bases utiles sur le site de l'Insee
source("01_scripts/01_imports/import_naf.R")
source("01_scripts/01_imports/import_cpf.R")
source("01_scripts/01_imports/import_prenoms.R")

# 02. Affinement ----------------------------------------------------------
# TODO améliorer la forme des tables et filtrer les éléments inutilisables
source("01_scripts/02_affinement/filtre_naf.R")
source("01_scripts/02_affinement/filtre_cpf.R")
source("01_scripts/02_affinement/filtre_prenoms.R")

# 03. Fonctions génératives -----------------------------------------------
# TODO fonctions atomiques utilisées pour générer certains aspects des EFTA
source("01_scripts/03_fonctions_generatives/rtable.R")

# 04. Wrappers EFTAgen ----------------------------------------------------
# TODO combinaison de fonctions génératives pour créer des EFTA complets
source("01_scripts/04_wrappers_eftagen/EFTAgen_v0.R")


# 05. Exports -----------------------------------------------------------
# TODO exporte un EFTA vers un fichier à définit (Excel ? parquet ? html ? autre ?)
source("01_scripts/05_exports/export0.R")


# 06. EXPLOITATION
nombre_profils = 6
for (i in 1:nombre_profils){
  L0 <- EFTAgen_v0(nb_naf = 1, nb_cpf = 5, liste_prenoms = prenoms_top_quantile_q)
  id_profil <- paste0("energumene_numero_", i)
  
  export0(L0 = L0, nom_sortie = id_profil)
}
