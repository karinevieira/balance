# frozen_string_literal: true

Rails.logger.debug "\t Seeding accelerometer metrics data..."

user = User.find_by!(email: "isabella_galvao@limao.com.br")
user.accelerometer_metrics.destroy_all

[
  {
    user: user,
    exercise: "Caminhada",
    level: "Sedentário",
    time_in_min: 0
  },
  {
    user: user,
    exercise: "Caminhada",
    level: "Sedentário",
    time_in_min: 3
  },
  {
    user: user,
    exercise: "Corrida",
    level: "Sedentário",
    time_in_min: 0
  },
  {
    user: user,
    exercise: "Caminhada",
    level: "Sedentário",
    time_in_min: 3
  },
  {
    user: user,
    exercise: "Caminhada",
    level: "Sedentário",
    time_in_min: 0
  },
  {
    user: user,
    exercise: "Corrida",
    level: "Sedentário",
    time_in_min: 3
  },
  {
    user: user,
    exercise: "Caminhada",
    level: "Sedentário",
    time_in_min: 0
  }
].each do |data|
  AccelerometerMetric.create!(data)
end
