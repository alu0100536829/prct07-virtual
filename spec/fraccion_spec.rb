require "lib/fraccion.rb"

describe Fraccion do
	before :each do
		@F = Fraccion.new(3, 2)
		@F1 = Fraccion.new(5, 4)
    end 

    describe "# Almacenamiento del numerador de fraccion" do
    	it "Se almacena el numerador" do
      		@F.a.should eq(3)
   		end
   	end
   	
   	describe "# Almacenamiento del denominador de fraccion" do
    	it "Se almacena el denominador" do
      		@F.b.should eq(2)
    	end
  	end

  	describe "# Retorno del numerador" do
    	it "Retorna el numerador" do
      		@F.num.should eq(3)
   		end
   	end
   	
   	describe "# Retorno del denominador" do
    	it "Retorna el denominador" do
      		@F.denom.should eq(2)
    	end
  	end
  	
  	describe "# Mostrar de la forma: a/b" do
		it "Se muestra la fraccion" do
			@F.to_s.should eq("3/2")
		end
	end
	
	describe "# Mostrar en coma flotante" do
		it "Se muestra la forma flotante" do
			@F.to_f.should eq(1.5)
		end
	end
	
	describe "# Igualdad de fracciones" do
		it "Se comprueba si son iguales las fracciones" do
			res = @F == @F1
			res.should eq(false)	
		end
	end
	
	describe "# Valor absoluto de la fraccion" do
		it "Halla valor absoluto" do
			@F.abs.to_s.should eq("3/2")
		end
	end
	
	describe "# Reciproco de la fraccion" do
		it "Halla el reciproco" do
			@F.reciprocal.to_s.should eq("2/3")
		end
	end
	
	describe "# Opuesto de la fraccion" do
		it "Halla el opuesto" do
			frac = -@F
			frac.to_s.should eq("-3/2")
		end
	end
	
	describe "#Suma de fracciones" do
		it "Halla la suma" do
			frac = @F + @F1
			frac.to_s.should eq("11/4")
		end
	end

	describe "#Resta de fracciones" do
		it "Halla la resta" do
			frac = @F - @F1
			frac.to_s.should eq("1/4")
		end
	end
	
	describe "#Producto de fracciones" do
		it "Halla el producto" do
			frac = @F * @F1
			frac.to_s.should eq("15/8")
		end
	end
	
	describe "#Division de fracciones" do
		it "Halla la division" do
			frac = @F / @F1
			frac.to_s.should eq("6/5")
		end
	end
	
	describe "#Resto de fracciones" do
		it "Halla el resto" do
			frac = @F % @F1
			frac.to_s.should eq("1/4")
		end
	end
	
	describe "Comprobar fracción mayor que otra" do
		it "fraccion A mayor que B?" do
			res = @F > @F1
			res.should eq(true)
		end
	end
	
	describe "Comprobar fracción menor que otra" do
		it "fraccion A menor que B?" do
			res = @F < @F1
			res.should eq(false)
		end
	end
	
	describe "Comprobar fracción mayor o igual que otra" do
		it "fraccion A mayor o igual que B?" do
			res = @F >= @F1
			res.should eq(true)
		end
	end
	
	describe "Comprobar fracción menor o igual que otra" do
		it "fraccion A menor o igual que B?" do
			res = @F <= @F1
			res.should eq(false)
		end
	end
  	
end
