class CachorroSearch

  include ActiveModel::Model
  attr_accessor :order, :page, :field, :query

  def search
    criteria = Cachorro
    criteria = search_by_field(criteria)
    criteria = search_order(criteria)
    criteria = search_page(criteria)
    criteria
  end

  def order_options
    [
      # [I18n.t("activerecord.attributes.user.id"), "users.id DESC"],
      # [I18n.t("activerecord.attributes.user.company"), "users.company"],
      # [I18n.t("activerecord.attributes.user.contact"), "users.first_name||users.last_name"]
    ]
  end

  def field_options
    [
      # [I18n.t("activerecord.attributes.user.company"), "users.company"],
      # [I18n.t("activerecord.attributes.user.name"), "users.first_name||users.last_name"],
      # [I18n.t("activerecord.attributes.user.email"), "users.email"]
    ]
  end

  def count
    search.total_count
  end

  private

  def search_by_field(criteria)
    return criteria if field.blank?
    #
    # query_field = field == 'users.first_name||users.last_name' ? "%#{query.gsub(/\s+/, "")}%" : "%#{query}%"
    # criteria.where("lower(#{field}) like lower(?)", query_field)
  end

  def search_order(criteria)
    criteria.order(order || "cachorros.id DESC")
  end

  def search_page(criteria)
    criteria.page(page).per(15)
  end
end
