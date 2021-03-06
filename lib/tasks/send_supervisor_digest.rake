desc "Send an email to supervisors each week to share an overview of their volunteers' activities"
task send_supervisor_digest: :environment do
  if Time.now.monday?
    Supervisor.find_each do |supervisor|
      SupervisorMailer.weekly_digest(supervisor).deliver_now
    end
  end
end
