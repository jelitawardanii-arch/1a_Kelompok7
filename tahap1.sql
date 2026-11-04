SELECT 
    ks.ID_Kelompok, 
    ks.Jenjang,         
    COUNT(*) AS Jumlah_Menu,         
    AVG(p.Energi_Kkal) AS Rata_Energi_Kkal  
FROM Kelompok_Sasaran ks  
JOIN Porsi_Menu p ON p.ID_Kelompok = ks.ID_Kelompok  
GROUP BY ks.ID_Kelompok, ks.Jenjang;
