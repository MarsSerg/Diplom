SELECT     s1.Skate_ID, s1.Picture, s1.Tracks_ID, s1.Bearings_ID, s1.[Description], s1.Name, s1.Wheels_ID, s1.Boardstyle_ID, 
                      b1.Type_of_deck, sr1.Ridingstyle_ID
FROM         Skateboard s1 INNER JOIN
                      Boardstyle b1 ON s1.Boardstyle_ID = b1.Boardstyle_ID INNER JOIN
                      Skate_Riding sr1 ON s1.Skate_ID = sr1.Skate_ID INNER JOIN
                      Riding_Style rs1 ON rs1.Ridingstyle_ID = sr1.Ridingstyle_ID
Where s1.Skate_ID in
(SELECT     Skate_Riding.Skate_ID
FROM         Skate_Riding 
Where 
 Ridingstyle_id = 'crv') 

And s1.Skate_ID in

  (SELECT     Skate_Riding.Skate_ID
FROM         Skate_Riding 
                      
Where Ridingstyle_id = 'dnh') 
and Type_of_deck = 'Dropthrough'
                