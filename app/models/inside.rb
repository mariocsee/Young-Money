class Inside < ApplicationRecord
  def self.search(search)
    where("name LIKE ? OR
    category LIKE ? OR
    department LIKE ? OR
    season LIKE ?",
    "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%"
    )
  end

  #define filter
  def self.filter(category = nil, season = nil, department = nil)
    return where(category: category, department: department, season: season) if category && department && season
    return where(category: category, department: department) if category && department
    return where(category: category, season: season) if category && season
    return where(department: department, season: season) if department && season
    return where(category: category) if category
    return where(department: department) if department
    return where(season: season) if season
    all
  end

  #defining filter for season
  def self.filter_season(filter)
    where("season LIKE ?",
    "%#{filter}%"
    )
  end

end
