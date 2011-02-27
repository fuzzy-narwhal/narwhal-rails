class Event < ActiveRecord::Base

def Event.current(category)
  if category
    sql = <<-SQL
      select events.* from events,pages,categories_pages,categories
      where events.page_id=pages.page_id
      and pages.id = categories_pages.page_id
      and categories_pages.category_id=categories.id
      and categories.name like "%#{category}%"
      and end_time>?
      order by start_time asc limit 100
    SQL
  else
    sql = "select * from events where end_time>? order by start_time asc limit 100"
  end
  find_by_sql([sql,DateTime.now])
end

def post
  Post.find_by_post_id(post_id)
end
end
=begin
select events.* from events,pages,categories_pages,categories
where events.page_id=pages.page_id
and pages.id = categories_pages.page_id
and categories_pages.category_id=categories.id
and categories.name like '%movies%'
and end_time>'2011-02-27 07:10:35'
order by start_time asc limit 100

select events.* from events,pages,categories_pages,categories
where events.page_id=pages.page_id
and pages.id = categories_pages.page_id
and categories_pages.category_id=categories.id
and categories.name like "%local%"

=end