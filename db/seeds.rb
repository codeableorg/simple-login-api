User.destroy_all
User.create(name: 'Codeable', email: 'hello@codeable.pe', password: '123456')
User.create(name: 'Able', email: 'hello@able.co', password: '123456')
Conversation.create(title: 'general')
Conversation.create(title: 'random')
Message.create(text: 'Hola', conversation: Conversation.first, user: User.first)
Message.create(text: 'Hola', conversation: Conversation.first, user: User.second)
Message.create(text: 'Hola', conversation: Conversation.second, user: User.first)
Message.create(text: 'Hola', conversation: Conversation.second, user: User.second)