FactoryBot.define do
  factory :user do
    email {"demo@test.com" }
    encrypted_password {"123456789Test"}
    reset_password_token {"123456789Reset_token#"}
    reset_password_sent_at {DateTime.now}
    first_name {"Test_fn"}
    last_name {"Test_ln"}
    role {0}
    remember_created_at {DateTime.now}
    created_at {DateTime.now}
    updated_at {DateTime.now}
    password {"12345678"}
  end
end