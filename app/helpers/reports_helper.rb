module ReportsHelper
  def statusName(num)
    case num
    when 1
      "Pending Approval"
    when 2
      "In Progress"
    when 3
      "Completed"
    when 4
      "Rejected"
    end
  end
end
