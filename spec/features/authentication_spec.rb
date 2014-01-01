require 'spec_helper'

describe "Authentication requirements" do

  fixtures :streams, :posts

  let(:post) { posts(:book1) }

  [
    [:get,    "/posts/new"],
    [:post,   "/posts", {post: {title: "foo"}}],
    [:get,    "/posts/clojure-programming-80f91567/edit"],
    [:post,   "/posts/clojure-programming-80f91567", {_method: 'patch', post: {title: "foo"}}],
    [:delete, "/posts/clojure-programming-80f91567"],
  ].each do |verb, unauthorized_url, params|

    it "prevents unauthorized #{verb.to_s.upcase} #{unauthorized_url}" do
      page.driver.send(verb, unauthorized_url, params)
      expect(page.status_code).to eq(302)
      page.visit(page.response_headers["Location"])
      expect(page.current_path).to eq(new_user_session_path)
    end

  end

end

