ALTER TABLE Kelompok_Sasaran 
ADD COLUMN Rata_Energi_Kkal DECIMAL(8,2) NOT NULL DEFAULT 0;

UPDATE Kelompok_Sasaran ks  
SET ks.Rata_Energi_Kkal = (    
    SELECT COALESCE(AVG(p.Energi_Kkal), 0)    
    FROM Porsi_Menu p    
    WHERE p.ID_Kelompok = ks.ID_Kelompok
);
