Step 1: Check itune_album table:
Select 
DISTINCT SUBSTRING_INDEX(iTunesUrl,'/',-1) ,
albumuuid from itunes_album_tracks_release
where
SUBSTRING_INDEX(iTunesUrl,'/',-1) 
in 
(

)

Step2: check crawling task and crawlingtask done
-- crawlingtasks: 

Select TaskDetail ->> '$.album_id',TaskDetail ->> '$.artist_name',SUBSTRING_INDEX(Ext ->> '$.error_message',':',-1),createdat
 from crawlingtasks
where 
ActionId = '9C8473C36E57472281A1C7936108FC06'
and
TaskDetail ->> '$.album_id'in (

)
group by 
TaskDetail ->> '$.album_id'


Step 3: check crawlingtasks

Select actionid,status,COUNT(DISTINCT Id),CreatedAt from crawlingtasks
where
actionid = '496A12427F0B4A66BB804475D9257060'
and Priority = 59

and CreatedAt > '2019-09-03'
and CreatedAt < '2019-09-06'
group by 
actionid, `Status`
UNION ALL

Select actionid,status,COUNT(DISTINCT Id),CreatedAt from crawlingtask_done
where
actionid = '496A12427F0B4A66BB804475D9257060'
and Priority = 59
and CreatedAt > '2019-09-03'
and CreatedAt < '2019-09-06'
group by 
actionid
