module DataStructures
  module Drawing
    module Base

      def self.base_path
        File.expand_path("../../../frames", __FILE__)
      end

      def base_path
        Base::base_path
      end

      def self.frames
        Dir.entries(base_path).select{|f| f =~ /\d+\.png/}
      end

      def frames
        Base::frames
      end

      def self.clear_frames!
        frames.each{|f| File.delete("#{base_path}/#{f}")}
      end

      def next_filename
        numbers = frames.map {|f| f.gsub(".png","").to_i}
        if numbers.none?
          "#{base_path}/1.png"
        else
          next_number = numbers.max + 1
          "#{base_path}/#{next_number}.png"
        end
      end

      def set_node_color(node, color)
        node.set{|n| n.fillcolor = color}
        node.set{|n| n.style = "filled"}
      end

      def animate(filename)
        gif = Magick::ImageList.new
        frames = Dir.entries(base_path).select{|f| f =~ /\d+\.png/}
        frames.reverse.map{|f| Magick::Image::read("#{base_path}/#{f}").first}.each do |i|
          gif << i
        end
        gif.write(filename)
      end
    end
  end
end