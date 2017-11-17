Message.delete_all && Client.delete_all

Message.create originator: 'thomas', content: 'this is my message', recipient: 'fred'
Message.create originator: 'sarah', content: 'hello, how are you?', recipient: 'paul'
Client.create name: 'starhub', domain: 'www.star-apps.com', password: '123secret'
