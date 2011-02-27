class Event < ActiveRecord::Base

def Event.current(category)
  if category
    sql = <<-SQL
      select events.* from events,pages
      where events.page_id=pages.page_id
      and pages.category like "%#{category}%"
      and end_time>?
      order by start_time asc limit 100
    SQL
  else
    sql = "select * from events where end_time>? order by start_time asc limit 100"
  end
  find_by_sql([sql,DateTime.now])
end
end
