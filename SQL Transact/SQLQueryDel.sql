Use [Acad_PD321(class)]

Delete From Schudule 
WHERE [group] = (Select group_id From Groups WHERE group_name = 'PV_211')
Execute my_select_from_schudule