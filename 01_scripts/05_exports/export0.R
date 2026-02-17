# Fonction d'export pensé pour marcher avec les sorties du wrapper EFTAgen_v0.
# Crée un Excel un tout petit peu mis en forme avec les éléments demandés.

# On part du principe que l'objet L qu'on manipule est une Liste dont chaque
# élément est un tableau, éventuellement de longueur 1.)

export0 <- function(
  L0, # liste à exporter - issue de EFTAgen_v0  
  adresse_sortie = "03_output/",
  nom_sortie = "export_EFTA0"
  ){
  adresse_export_totale = paste0(
    adresse_sortie,
    nom_sortie, 
    ".xlsx"
  )
  
  wb0 <- createWorkbook()
  sheet0 <- addWorksheet(wb0, "Feuille principale")
  
  
  ligne_ecriture <- 3
  lignes_titres <- c()
  
  style_grandtitre = createStyle(fontSize = 18, border = "TopBottomLeftRight")
  style_titres = createStyle(fgFill = "#2D02C2", fontSize = 14, fontColour = "#EBE6FF")
  
  
  
  noms_L0 <- names(L0)
  
  writeData(wb0, sheet0, x = "Feuille d'EFTA0", startCol = 1, startRow = 1)
  addStyle(wb0, sheet0, style = style_grandtitre, rows = 1, cols = 1)
  
  for (i in 1:length(L0)){
    lignes_titres <- c(lignes_titres, ligne_ecriture)
    
    writeData(wb0, sheet0, x = L0[[i]], startCol = 2, startRow = ligne_ecriture)
    ligne_ecriture <- ligne_ecriture+2
    
  }
  
  addStyle(wb0, sheet0, style = style_titres, 
           rows = lignes_titres, cols = 2)
  setColWidths(wb0, sheet0, cols = 2, widths = 100)
  
  saveWorkbook(wb = wb0, adresse_export_totale, overwrite = T)
  
}