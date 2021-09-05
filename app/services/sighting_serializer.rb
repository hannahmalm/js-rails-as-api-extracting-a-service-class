class SightingSerializer
    def initialize(sighting_object)
        @sighting = sighting_object
    end

    # def to_serialized_json
    #     @sighting.to_json(:include => {
    #       :bird => {:only => [:name, :species]},
    #       :location => {:only => [:latitude, :longitude]}
    #     }, :except => [:updated_at])
    # end

      def to_serialized_json
        options = {
          include: {
            bird: {
              only: [:name, :species]
            },
            location: {
              only: [:latitude, :longitude]
            }
          },
          except: [:updated_at],
        }
        @sighting.to_json(options)
      end
end


#This service is used to take some of the logic out of the controller
#we use the initialize method to set up any instance variables that we might want to share over multiple methods.
#whatever we pass when initializing a new instance of SightingSerializer will be stored as @sighting
#We will need access to this variable elsewhere in the SightingSerializer, so an instance variable is needed here.
