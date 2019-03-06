CREATE OR REPLACE FUNCTION find_all_activities_for_owner(username varchar(500)) RETURNS SETOF activity AS $$

	SELECT *
	FROM activity
	WHERE activity.owner_id = (
		SELECT id
		FROM user
		WHERE username = find_all_activities_for_owner.username)

$$ LANGUAGE SQL;