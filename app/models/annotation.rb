class Annotation < ActiveRecord::Base
  has_one :token
  belongs_to :lemma
  belongs_to :partofspeech
  belongs_to :norm
  accepts_nested_attributes_for :token
  accepts_nested_attributes_for :lemma
  accepts_nested_attributes_for :partofspeech
  accepts_nested_attributes_for :norm
  
  def before_create
    tokenized = self.line.split(",")
    @norm = Norm.find_or_create_by_norm(:norm => tokenized[1])
    self.norm_id = @norm.id
    @lemma = Lemma.find_or_create_by_lemma(:lemma => tokenized[2])
    self.lemma_id = @lemma.id
    @partofspeech = Partofspeech.find_or_create_by_partofspeech(:partofspeech => tokenized[3])
    self.partofspeech_id = @partofspeech.id
  end
  
  def after_create
    tokenized = self.line.split(",")
    @token = Token.create(:token => tokenized[0], :annotation_id => self.id)
  end
  
  def before_update
    
    @lemma = Lemma.find_by_id(@attributes["lemma_id"])
    if (@lemma==nil)
          @lemma = Lemma.create(:lemma => @attributes["lemma_id"])
          self.lemma_id = @lemma.id
    end
    
    @norm = Norm.find_by_id(@attributes["norm_id"])
    if (@norm==nil)
          @norm = Norm.create(:norm => @attributes["norm_id"])
          self.norm_id = @norm.id
    end
    
  end
  
end
