class Event < ActiveRecord::Base
  belongs_to :page, :primary_key=>:page_id
  
  scope :recent, lambda {
    order("start_time asc").where(["end_time>?",Time.now])
  }

  scope :for_section, lambda {|section|
    if section
      section = Section.find_by_name_or_id(section) || 0
      joins(:page).where(:pages=>{:section_id=>section})
    end
  }
  
  scope :for_category, lambda {|category|
    if category
      category = Category.find_by_name_or_id(category) || 0
      joins(:page=>:categories_pages).where(:categories_pages=>{:category_id=>category})
    end
  }

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

def event_link
  page = Page.find_by_page_id(page_id)
  page.link if page.link
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
