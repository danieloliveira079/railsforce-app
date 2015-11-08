# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Lead.create([{name: 'John', last_name: 'Hills', email: 'john.hills@gmail.com', company: 'Green Field', job_title: 'CEO', phone: '+44 87677788', website: 'http://www.greenfield.com', status: 'New' },
             {name: 'Mary', last_name: 'Jane', email: 'mary.jane@gmail.com', company: 'New Marketing', job_title: 'Sales', phone: '+33 564464664', website: 'http://www.newmarketing.com', status: 'New' },
             {name: 'Paul', last_name: 'Adams', email: 'paul.adams@hotmail.com', company: 'Orange Juice', job_title: 'Project Manager', phone: '+44 423223223', website: 'http://www.orangejuice.com', status: 'New' },
             {name: 'Ozzy', last_name: 'Osbourne', email: 'ozzy@mail666.com', company: 'Ozzy Company', job_title: 'Director', phone: '+66 6666666', website: 'http://www.ozzyosbourne.com', status: 'New' },
             {name: 'Jimmy', last_name: 'Page', email: 'jimi.page@ledzeppelin.com', company: 'Led Zeppelin', job_title: 'Lead Guitar', phone: '+33 564464664', website: 'http://www.ledzeppelin.com', status: 'New' },
             {name: 'Jim', last_name: 'Morrison', email: 'jimi.page@ledzeppelin.com', company: 'The Doors', job_title: 'Singer', phone: '+55 78737236', website: 'http://www.thedoors.com', status: 'New' } ])

AppSetting.create([{client_email: 'daniel.oliveira079@gmail.com',
                    client_id: '3MVG9KI2HHAq33RxE3uJ6fN7r8Ni2mAGzpVhlQeKePV7GxYdNGe65yXkxVk.ySXzgy8KZ52i0QRhlTOpBCkXb',
                    client_secret: '915198885628210263',
                    active: true}])
