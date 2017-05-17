SELECT     Skateboard.Skate_ID, Skateboard.Picture, Boardstyle.Length, Boardstyle.Width, Boardstyle.Nose, Boardstyle.Tale, Boardstyle.Curved_tale, Boardstyle.Wheelbase, Boardstyle.Type_of_deck, 
                      Tracks.Size, Tracks.Type, Bearings.Name, Bearings.MadeOf, Wheels.Hardness, Wheels.Size AS Wheel_Size, Skateboard.Name AS Skate_Name, Skateboard.Description,
                      dbo.GetSkateRidingStyle(Skateboard.Skate_ID) as styles
FROM         Skateboard INNER JOIN
                      Bearings ON Skateboard.Bearings_ID = Bearings.Bearings_ID INNER JOIN
                      Boardstyle ON Skateboard.Boardstyle_ID = Boardstyle.Boardstyle_ID INNER JOIN
                      Tracks ON Skateboard.Tracks_ID = Tracks.Tracks_ID INNER JOIN
                      Wheels ON Skateboard.Wheels_ID = Wheels.Wheels_ID