namespace :load_data do
  desc 'Load example data for staging environment'
  task example: :environment do
    user = User.create(
      first_name: 'FirstName',
      last_name: 'LastName',
      email: 'tester@example.com',
      password: 'somepassword',
      password_confirmation: 'somepassword',
      confirmed_at: Time.now
    )

    admin_role = Role.create name: 'administrator', description: 'Site administrators'

    admin_role.users << user

    About.create title: %w[ad aut sed saepe qui].join("\s"), body: ['Repellat impedit doloremque. Ex quaerat et. Ab dooorum quibusdam.', 'Non ullam est. Iure aut ipsam. Delectus qui praesentium.', 'Harum eum facere. Illum quos nemo. Similique sint inventore.', 'Moorum quibusdam.', 'Non ullam est. Iure aut ipsam. Delectus qui praesentium.', 'Harum eum facere. Illum quos nemo. Similique sint inventore.', 'Mollitia esse qui. Enim neque ea. Aliquam aperiam dolores.', 'Facilis sit est. Dolor sint magnam. Voluptatem quidem qui.'].join('<br />')

    ContactMe.create name: 'John Rambo'.join("\s"), email: 'jrambo@example.com', message: ['Repellat impedit doloremque. Ex quaerat et. Ab dooorum quibusdam.', 'Non ullam est. Iure aut ipsam. Delectus qui praesentium.', 'Harum eum facere. Illum quos nemo. Similique sint inventore.', 'Moorum quibusdam.', 'Non ullam est. Iure aut ipsam. Delectus qui praesentium.', 'Harum eum facere. Illum quos nemo. Similique sint inventore.', 'Mollitia esse qui. Enim neque ea. Aliquam aperiam dolores.', 'Facilis sit est. Dolor sint magnam. Voluptatem quidem qui.'].join('<br />')

    5.times do
      Post.create title: ["sit", "minima", "et", "repudiandae", "impedit"].join("\s"), content: ["Alias illo facere. Modi iure odit. Aut natus recusandae.", "Iure libero rem. Occaecati quis asperiores. Officiis quisquam corrupti.", "Hic non iusto. At dolore est. Perferendis eius consequatur.", "Totam eius non. Magni ut quia. Qui quia omnis.", "Perspiciatis qui et. Earum doloremque porro. Magni architecto accusantium."].join('<br />'), created_by: user.id
    end

  end
end
