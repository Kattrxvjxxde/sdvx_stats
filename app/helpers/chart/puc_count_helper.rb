module Chart::PucCountHelper
  def display_search_conditions(conditions)
    tag.ul class: 'uk-margin-remove-top uk-list' do
      if conditions.present?
        safe_join(
          conditions.map do |condition|
            tag.li(
              info_str(condition),
              class: 'uk-margin-remove-top'
            )
          end
        )
      else
        tag.li '全譜面'
      end
    end
  end

  private

  def info_str(condition)
    attr_name = condition.a.first.attr_name
    val = condition.value

    val_str = case attr_name
              when 'level'
                val.to_s
              when 'difficult'
                val.map { |v| Chart.difficult.find_value v }.join(', ')
              when 'musicname'
                "『#{val}』 を含む"
              end

    Chart.human_attribute_name(attr_name) + ' … ' + val_str
  end
end
