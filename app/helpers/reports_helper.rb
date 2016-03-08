module ReportsHelper
  def statusName(num)
    case num
    when 1
      # Form is submitted by the user and is in que to be reviewed by the admin
      "Pending Approval"
    when 2
      # Form is accepted by the admin and the form goes live on the index page and the issue is now being worked on.
      "In Progress"
    when 3
      # The issue is now completed and the request is closed
      "Completed"
    when 4
      # These are the forms that have been submitted by the user but not approved by the admin. Kept on file for info hoarding reasons.
      "Rejected"
    end
  end
end
