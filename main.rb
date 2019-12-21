class Brave
    attr_reader :name, :offense, :defense
    attr_accessor :hp
    
    SPECIAL_ATTACK_CONSTANT = 1.5
    
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
 
  def attack(monster)
     puts "#{@name}の攻撃"
     
     attack_type = decision_attack_type
     
     # calculate_damageメソッドの呼び出し
     damage = calculate_damage(monster, atack_type)
     
     monster.hp -= damage
     
     puts "#{monster.name}は#{damage}のダメージを受けた"
     puts "#{@name}の残りHPは#{monster.hp}だ"
     end
  
     # attack_typeを用いて攻撃処理を振り分け
     if attack_type == "special_attack"
         puts "必殺攻撃"
         damage = calculate_special_attack - monster.defense
     else
     puts "通常攻撃"
     damage = @offense - monster.defense
     end
     
     monster.hp -= damage
     
     
    end
  
  # 攻撃の種類(通常攻撃 or 必殺攻撃)を判定するメソッド
  def decision_attack_type
      attack_num = rand(4)
      
      if attack_num == 0
      "special_attack"
      else
      "nomal_attack"
  end
end
  
  
  def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONSTANT
      end

end

class Monster
attr_reader :offense, :defense
attr_accessor :hp, :name

POWER_UP_RATE = 1.5
CALC_HALF_HP = 0.5

def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
    
    @transform_flag = false
    @trigger_of_transform = params[:hp] * CALC_HALF_HP
  end

def attack(brave)
    if @hp <= @trigger_of_transform && @transform_flag == false
        @transform_flag = true
        transform
    end
    puts "#{@name}の攻撃"
    
   damage = @offense - brave.defense
   brave.hp -= damage
    
    puts "#{brave.name}は#{damage}のダメージを受けた"
    puts "#{brave.name}の残りHPは#{brave.hp}だ"
   end

   private

def transform
  transform_name = "ドラゴン"
           
  puts <<~EOS
  #{@name}は怒っている
　#{@name}は#{transform_name}に変身した
  EOS
           
  @offense *= POWER_UP_RATE
  @name = transform_name
    end

end

# パラメータの値をinitializeにキーワード引数として渡す
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: "モンスター", hp: 250, offense: 200, defense: 100)

# attackメソッドの呼び出し
brave.attack(monster)
