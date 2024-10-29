library(dplyr)

path = r"(filepath\file.csv)"
data = read.csv(path, sep = ';', stringsAsFactors = FALSE)

sel = select(data, Molecule.ChEMBL.ID, Smiles, Standard.Type, Standard.Relation, Standard.Value, Standard.Units, Action.Type) %>% 
  na.omit() %>% filter(Standard.Value <= 50 & Action.Type == 'ANTAGONIST')

output_path = r"(filepath\outputfile.csv)"
write.csv(sel, output_path, row.names = FALSE)
