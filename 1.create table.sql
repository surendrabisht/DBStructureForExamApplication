
  -- dropping tables------------------------------------
IF EXISTS ( SELECT  *
            FROM    sysobjects
            WHERE   type IN ( 'U' )
                    AND name = 'test_logs_answers' ) 
    BEGIN
        DROP TABLE  test_logs_answers
    END
GO



   IF EXISTS ( SELECT  *
            FROM    sysobjects
            WHERE   type IN ( 'U' )
                    AND name = 'test_logs' ) 
    BEGIN
        DROP TABLE  test_logs
    END
GO

IF EXISTS ( SELECT  *
            FROM    sysobjects
            WHERE   type IN ( 'U' )
                    AND name = 'test_questions_mapping' ) 
    BEGIN
        DROP TABLE  test_questions_mapping
    END
GO

IF EXISTS ( SELECT  *
            FROM    sysobjects
            WHERE   type IN ( 'U' )
                    AND name = 'tests' ) 
    BEGIN
        DROP TABLE  tests
    END
GO

IF EXISTS ( SELECT  *
            FROM    sysobjects
            WHERE   type IN ( 'U' )
                    AND name = 'Answer' ) 
    BEGIN
        DROP TABLE  Answer
    END
GO


IF EXISTS ( SELECT  *
            FROM    sysobjects
            WHERE   type IN ( 'U' )
                    AND name = 'question' ) 
    BEGIN
        DROP TABLE  question
    END
GO

 -- dropping tables finished------------------------------------

CREATE TABLE question (
	question_id int ,
	question_description nvarchar(4000) NOT NULL,
	question_type char,      -- 0 for objective,S for subjective.
	question_diagram varchar (500) null,
	max_marks int ,
	question_enabled bit  DEFAULT 1

 Primary Key (question_id)
)
GO
GRANT DELETE ON [dbo].[question] TO [public] AS [dbo]
GO
GRANT INSERT ON [dbo].[question] TO [public] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[question] TO [public] AS [dbo]
GO
GRANT SELECT ON [dbo].[question] TO [public] AS [dbo]
GO
GRANT UPDATE ON [dbo].[question] TO [public] AS [dbo]
GO




CREATE TABLE Answer (
	answer_id  int not null IDENTITY(1,1) ,
	question_id int FOREIGN KEY REFERENCES question(question_id),
	answer_description nvarchar(4000) NOT NULL,
    answer_enabled bit DEFAULT 1 ,
	is_correct bit  -- 0 /1
 Primary Key (answer_id)
)

GO
GRANT DELETE ON [dbo].[Answer] TO [public] AS [dbo]
GO
GRANT INSERT ON [dbo].[Answer] TO [public] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[Answer] TO [public] AS [dbo]
GO
GRANT SELECT ON [dbo].[Answer] TO [public] AS [dbo]
GO
GRANT UPDATE ON [dbo].[Answer] TO [public] AS [dbo]
GO


create table tests
(
test_id int identity(1,1),
Test_name varchar(100),
Instructions varchar(1000),
test_enabled bit  DEFAULT 1
UNIQUE (Test_name),
Primary Key (test_id)
)


GO
GRANT DELETE ON [dbo].[tests] TO [public] AS [dbo]
GO
GRANT INSERT ON [dbo].[tests] TO [public] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[tests] TO [public] AS [dbo]
GO
GRANT SELECT ON [dbo].[tests] TO [public] AS [dbo]
GO
GRANT UPDATE ON [dbo].[tests] TO [public] AS [dbo]
GO



create table test_questions_mapping
(
mapping_id int identity(1,1),
test_id int FOREIGN KEY REFERENCES tests(test_id) on delete cascade ,
question_id int,
question_position int null 
Primary Key (test_id,question_id)
)


GO
GRANT DELETE ON [dbo].[test_questions_mapping] TO [public] AS [dbo]
GO
GRANT INSERT ON [dbo].[test_questions_mapping] TO [public] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[test_questions_mapping] TO [public] AS [dbo]
GO
GRANT SELECT ON [dbo].[test_questions_mapping] TO [public] AS [dbo]
GO
GRANT UPDATE ON [dbo].[test_questions_mapping] TO [public] AS [dbo]
GO



create table test_logs
(
 test_log_id int IDENTITY(1,1) ,
 test_id  int FOREIGN KEY REFERENCES tests(test_id),
 user_badge_no int,
 starttime datetime,
 finishtime datetime,    --  finish time
 test_Score int null,   -- to be updated at last.
 time_taken bigint null
 Primary Key (test_log_id)
)


GO
GRANT DELETE ON [dbo].[test_logs] TO [public] AS [dbo]
GO
GRANT INSERT ON [dbo].[test_logs] TO [public] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[test_logs] TO [public] AS [dbo]
GO
GRANT SELECT ON [dbo].[test_logs] TO [public] AS [dbo]
GO
GRANT UPDATE ON [dbo].[test_logs] TO [public] AS [dbo]
GO




create table test_logs_answers 
(
position_id int ,
test_log_id int FOREIGN KEY REFERENCES test_logs(test_log_id),
question_id int ,
answered_id int null,
correct_answer_id int null,
maxmarks int,
submitted_answer varchar(max) null,
obtained_marks int null

 
Primary Key (test_log_id,position_id)

)
GO
GRANT DELETE ON [dbo].[test_logs_answers] TO [public] AS [dbo]
GO
GRANT INSERT ON [dbo].[test_logs_answers] TO [public] AS [dbo]
GO
GRANT REFERENCES ON [dbo].[test_logs_answers] TO [public] AS [dbo]
GO
GRANT SELECT ON [dbo].[test_logs_answers] TO [public] AS [dbo]
GO
GRANT UPDATE ON [dbo].[test_logs_answers] TO [public] AS [dbo]
GO





