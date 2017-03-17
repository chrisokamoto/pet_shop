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
      [I18n.t("activerecord.attributes.cachorros.ultima_consulta"), "cachorros.data_ultima_consulta DESC"],
      [I18n.t("activerecord.attributes.cachorros.nome_dono"), "cachorros.nome_dono"],
      [I18n.t("activerecord.attributes.cachorros.nome"), "cachorros.nome"]
    ]
  end

  def field_options
    [
      [I18n.t("activerecord.attributes.cachorros.nome_dono"), "cachorros.nome_dono"],
      [I18n.t("activerecord.attributes.cachorros.nome"), "cachorros.nome"]
    ]
  end

  def count
    search.total_count
  end

  def search_by_field(criteria)
    return criteria if field.blank?

    query_field = "%#{query}%"
    criteria.where("lower(#{field}) like lower(?)", query_field)
  end

  private

  def search_order(criteria)
    criteria.order(order || order_options.first.last)
  end

  def search_page(criteria)
    criteria.page(page).per(10)
  end
end
