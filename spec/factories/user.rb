FactoryBot.define do
  factory :user do
    email { 'example@example.com' }
    password { 'please' }
    password_confirmation { 'please' }

    factory :super_admin do
      after(:create) {|user| user.add_role(:super_admin)}
    end

    factory :admin do
        after(:create) {|user| user.add_role(:admin)}
    end

    factory :contributor_user do
        after(:create) {|user| user.add_role(:contributor)}
    end
  end
end
