class Event < ActiveRecord::Base

def Event.current
  find_by_sql(["select * from events where end_time>? order by start_time asc limit 100",DateTime.now])
end
end
