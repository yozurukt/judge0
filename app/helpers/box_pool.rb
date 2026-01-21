# Box Pool Manager - Thread-safe box_id allocation
# Eliminates box_id collisions within a single container
class BoxPool
  MAX_BOXES = 1000
  ACQUIRE_TIMEOUT = 5 # seconds

  def initialize
    @mutex = Mutex.new
    @available = (0...MAX_BOXES).to_a.shuffle  # Shuffle for better distribution
    @in_use = Set.new
  end

  # Acquire a box_id from the pool
  # Returns box_id or raises error if timeout
  def acquire
    started_at = Time.now
    
    loop do
      @mutex.synchronize do
        if @available.any?
          box_id = @available.shift
          @in_use.add(box_id)
          return box_id
        end
      end
      
      # All boxes in use, wait a bit
      if Time.now - started_at > ACQUIRE_TIMEOUT
        raise "Box pool exhausted: all #{MAX_BOXES} boxes in use"
      end
      
      sleep(0.01) # 10ms
    end
  end

  # Release a box_id back to the pool
  def release(box_id)
    @mutex.synchronize do
      if @in_use.delete?(box_id)
        @available.push(box_id)
      end
    end
  end

  # Get pool statistics
  def stats
    @mutex.synchronize do
      {
        available: @available.size,
        in_use: @in_use.size,
        total: MAX_BOXES
      }
    end
  end

  # Singleton instance
  def self.instance
    @instance ||= new
  end
end
