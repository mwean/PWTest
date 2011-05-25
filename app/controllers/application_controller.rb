# require "rails/all"
# require  File.join('root','config', 'initializers', 'brute_force.rb')
# require "/config/initializers/brute_force.rb"

class ApplicationController < ActionController::Base
  def index
  end

  def strength
    @password = params[:application][:pass]
    @cracker = params[:application][:cracker]
    @usergen = params[:application][:usergen]
    @years = params[:application][:years].to_i

    @years = 1 unless @years > 0

    if @password == ""
      redirect_to :action => "index"
    else
      pass = @password.downcase
      pwds = [pass]
      pwds << pass.reverse
      pwds << pass.tr("5$", "s").tr("04@(","oagc").tr("|!1", "l").tr("[{3","e")
      pwds << pass[2..-1]
      pwds << pass[1..-1]
      pwds << pass[0..-2]
      pwds << pass[0..-3]
      pwds << pass[0..-4]

      @in_dictionary = nil
      if EnDict.check_words(pwds)
        @in_dictionary = true
      elsif Name.check_words(pwds)
        @in_dictionary = true
      else
        @bf = BruteForce.new(:password => @password, :attack_type => @cracker, :user_gen => @usergen)
        # @cracked_in = "in #{@bf.crack_time}"
        @combinations = @bf.combinations
        @y = @years == 1 ? "1 year" : @years.to_s + " years"
        @chance = @bf.chance_of_failure(@years)
        @adj = @chance.floor =~ /(8$|8\d|18|11)/ ? "an" : "a"
        @chance = sprintf("%.2f%", @chance)
        @cracker = @bf.attack_type
        case @cracker
        when :Extreme
          @attack = "a multi-GPU-based"
        when :GPU
          @attack = "a GPU-based"
        when :desktop
          @attack = "a high-end desktop"
        when :online
          @attack = "an online"
        end
      end
      render "password_strength"
    end
  end
  
  def update
    @cracker = params[:application][:cracker]
    @usergen = params[:application][:usergen]
    @years = params[:application][:years].to_i
    @combinations = params[:application][:combinations].to_i
    @bfu = BruteForce.new(:attack_type => @cracker, :usergen => @usergen, :combinations => @combinations)

    @y = @years == 1 ? "1 year" : @years.to_s + " years"
    @chance = @bfu.chance_of_failure(@years)
    @adj = @chance.floor =~ /(8$|8\d|18|11)/ ? "an" : "a"
    @chance = sprintf("%.2f%", @chance)
    @cracker = @bfu.attack_type
    case @cracker
    when :Extreme
      @attack = "a multi-GPU-based"
    when :GPU
      @attack = "a GPU-based"
    when :desktop
      @attack = "a high-end desktop"
    when :online
      @attack = "an online"
    end
    
    render "password_strength"
  end
end
