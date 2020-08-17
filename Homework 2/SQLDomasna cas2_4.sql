/*
Change GradeDetails table always to insert value 100 in AchievementMaxPoints column if no value is provided on insert
Change GradeDetails table to prevent inserting AchievementPoints that will more than AchievementMaxPoints
Change AchievementType table to guarantee unique names across the Achievement types
*/

alter table GradeDetails
add constraint DF_GreadDetails_AchievementMaxPoints
default 100 for AchievementMaxPoints

alter table GradeDetails
add constraint CHK_GreadDetails_AchievementMaxPoints
check (AchievementPoints <= AchievementMaxPoints )

alter table AchievementType
add constraint UC_AchievementType_Name unique (Name)