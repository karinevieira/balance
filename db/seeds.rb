# frozen_string_literal: true

Rails.logger.debug "\t Seeding users data..."

[
  {
    name: "Isabella Galvão",
    email: "isabella_galvao@limao.com.br",
    password: "password",
    profile_attributes: {
      weight: 60,
      height_in_cm: 160,
      workout_in_min: 60,
      workout_days_frequency: 3,
      active_lifestyle: true,
      gender: "female"
    }
  },
  {
    name: "Benício Santos",
    email: "benicio_santos@jbtc.com",
    password: "password",
    profile_attributes: {
      weight: 90,
      height_in_cm: 190,
      workout_in_min: 100,
      workout_days_frequency: 5,
      active_lifestyle: true,
      gender: "male"
    }
  },
  {
    name: "Yuri Fogaça",
    email: "yuri-fogaca95@grupoarteoficio.com.br",
    password: "password",
    profile_attributes: {
      weight: 85,
      height_in_cm: 170,
      workout_in_min: 70,
      workout_days_frequency: 4,
      gender: "male"
    }
  },
  {
    name: "Rafaela Melo",
    email: "rafaelacarolinamelo@cielo.com.br",
    password: "password",
    profile_attributes: {
      weight: 45,
      height_in_cm: 153,
      workout_in_min: 60,
      workout_days_frequency: 3,
      gender: "female"
    }
  },
  {
    name: "Andreia Duarte",
    email: "andreia.daiane.duarte@oliveiracontabil.com.br",
    password: "password",
    profile_attributes: {
      weight: 55,
      height_in_cm: 160,
      workout_in_min: 60,
      workout_days_frequency: 3,
      gender: "female"
    }
  }
].each do |data|
  User.create!(data)
end
