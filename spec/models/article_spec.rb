RSpec.describe Article, type: :model do
  describe "DB table" do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :snippet }
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :category }
    it { is_expected.to have_db_column :premium }
    it { is_expected.to have_db_column :published }
  end

  describe "Validations" do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :snippet }
    it { is_expected.to validate_presence_of :content }
    it { is_expected.to validate_presence_of :category }
  end

  describe "Factory" do
    it "should have valid Factory" do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end
end
