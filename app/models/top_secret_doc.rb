class TopSecretDoc < ActiveRecord::Base
  TOP_SECRET_SECRET = 'swordfish' * 100
  ROUNDS = 10

  attr_accessor :body

  belongs_to :author, :class_name => 'Operative'

  attr_accessible :title, :body, :author

  before_save :encrypt_body
  after_save :decrypt_body
  after_find :decrypt_body

  def encrypt_body
    self.encrypted_body = encrypt(body)
  end

  def decrypt_body
    self.body = decrypt(encrypted_body) unless encrypted_body.blank?
  end

  def cipher
    ActiveSupport::MessageEncryptor.new(TOP_SECRET_SECRET)
  end

  def decrypt(ciphertext)
    text = ciphertext
    ROUNDS.times { text = cipher.decrypt_and_verify(text) }
    text
  end

  def encrypt(plaintext)
    text = plaintext
    ROUNDS.times { text = cipher.encrypt_and_sign(text) }
    text
  end
end
