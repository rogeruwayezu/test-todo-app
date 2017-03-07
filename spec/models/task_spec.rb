require 'rails_helper'

RSpec.describe Task, type: :model do
  describe '#toggle_complete!' do 
    it "should switch complete to false if it began as true" do
      task = Task.new(complete: true)
      task.toggle_complete!
      expect(task.complete).to eq(false)
    end

    it "should switch complete to true if it began as false" do 
      task = Task.new(complete: false)
      task.toggle_complete!
      expect(task.complete).to eq(true)
    end
  end
   describe '#toggle_favorite!' do 
    it "should switch favorite to false if it began as true" do
      task = Task.new(favorite: true)
      task.toggle_favorite!
      expect(task.favorite).to eq(false)
    end
    it "should switch favorite to true if it began as false" do 
      task = Task.new(favorite: false)
      task.toggle_favorite!
      expect(task.favorite).to eq(true)
    end
  end
   describe '#overdue?' do 
    it "should show if the deadline is in in the past" do
      task = Task.new(deadline: Time.now - 1.day)
      expect(task.overdue?).to eq(true)
    end

    it "should if the dealdine is in the future" do 
      task = Task.new(deadline: Time.now + 1.day)
      expect(task.overdue?).to eq(false)
    end
  end 
    describe 'increment_priority!' do
      it 'should return the priority increased by one' do
        task = Task.new(priority: 8)
        task.increment_priority!
        expect(task.priority).to eq(9)
      end
  end
  describe 'snooze_hour!' do
      it 'should deadline plus one hour' do
        task = Task.new(deadline: Time.now )
        task.snooze_hour!
        expect(task.deadline).to eq(Time.now)
      end
  end
end
