class NameValidator

  attr_reader :message

  def initialize(name, names)
    @name = name.to_s.strip
    @names = names
  end

  def valid?
    validate
    @message.nil?
  end

  private

    def validate
      if @name.empty?
        @message = "You need to enter a name."
      elsif @names.include?(@name)
        @message = "#{@name} is already included in our list."
      end
    end

end
