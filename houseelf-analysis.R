#House elf data analysis

elf_data <- read.csv("./data/houseelf_earlength_dna_data_1.csv")

#6
install.packages("stringr")
library("stringr")

#6.1
gc_content <- function(sequence){
  Gs <- str_count(sequence, "g")
  Cs <- str_count(sequence, "c")
  gc_content <- round((Gs + Cs) / str_length(sequence) * 100, digits = 2 )
  return(gc_content)
}
print(gc_content(str_to_lower(elf_data$dnaseq)))

#7
source ('classify_ear_size.R')
ear_length_classified <- get_size_class(elf_data$earlength)
table_classified <- data.frame (elf_data$id, ear_length_classified,gc_content(str_to_lower(elf_data$dnaseq)))
write.csv(table_classified)
