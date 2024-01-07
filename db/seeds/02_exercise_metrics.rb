# frozen_string_literal: true

Rails.logger.debug "\t Seeding crowdfunding projects data..."

user = User.find_by!(email: "isabella_galvao@limao.com.br")

[
  {
    user: user,
    name: "Caminhada",
    steps: 2000,
    distance_in_m: 1520,
    intensity: "normal"
  },
  {
    user: user,
    name: "Caminhada",
    steps: 5000,
    distance_in_m: 3810,
    intensity: "high"
  },
  {
    user: user,
    name: "Corrida",
    steps: 10_000,
    distance_in_m: 7620,
    intensity: "high"
  },
  {
    user: user,
    name: "Caminhada",
    steps: 700,
    distance_in_m: 530,
    intensity: "low"
  },
  {
    user: user,
    name: "Caminhada",
    steps: 6000,
    distance_in_m: 4570,
    intensity: "high"
  },
  {
    user: user,
    name: "Corrida",
    steps: 12_000,
    distance_in_m: 9140,
    intensity: "high"
  },
  {
    user: user,
    name: "Caminhada",
    steps: 500,
    distance_in_m: 380,
    intensity: "low"
  }
].each do |data|
  ExerciseMetric.create!(data)
end
