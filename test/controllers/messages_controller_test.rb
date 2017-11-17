require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
    @client = clients(:starhub)
    @token = JWT.encode({ user: @client.id },
                        Rails.application.secrets.secret_key_base)
  end

  test "should fail index without any queries" do
    Client.stub(:find, @client) do
      get messages_url, headers: {HTTP_AUTHORIZATION: @token},
        as: :query
      assert_response 400
    end
  end

  test "should create message" do
    Client.stub(:find, @client) do
      assert_difference('Message.count') do
        post messages_url,
          params: { message: { content: @message.content, originator: @message.originator, recipient: @message.recipient } },
          headers: {HTTP_AUTHORIZATION: @token}, as: :json
      end
      assert_response 201
    end
  end

  test "should destroy message" do
    Client.stub(:find, @client) do
      assert_difference('Message.count', -1) do
        delete message_url(@message),
          headers: {HTTP_AUTHORIZATION: @token},
          as: :json
      end
    end
    assert_response 204
  end
end
