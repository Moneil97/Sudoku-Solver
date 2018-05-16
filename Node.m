classdef Node < handle
    
    properties
        isSolved
        value
        possibleValues
        currentIndex %used for brute force
    end
    
    methods
        %constructor
        function this = Node(val)
            if nargin == 0
                this.isSolved = 0;
                this.value = 0;
            else
                this.isSolved = 1;
                this.value = val;
            end
            this.currentIndex = 1;
        end
        
        %increment index for brute force check
        function inc(this, nodes, r, c)
            
            %if called on a solved node then just inc the next one instead
            if this.isSolved
                if c >= 9
                    if r >= 9
                        disp("r == 9");
                        return;
                    end
                    nodes(r+1,1).inc(nodes, r+1, 1);
                else
                    nodes(r,c+1).inc(nodes, r, c+1);
                end
                
                return;
            end
            
            
            this.currentIndex = this.currentIndex + 1;
            if this.currentIndex > length(this.possibleValues)
                this.currentIndex = 1;
                if c >= 9
                    %if r also == 9 then no solution
                    %end
                    if r >= 9
                        disp("r === 9");
                        return;
                    end
                    nodes(r+1,1).inc(nodes, r+1, 1);
                else
                    nodes(r,c+1).inc(nodes, r, c+1);
                end
                
            end
        end
        
        function val = getBFval(this)
            val = this.possibleValues(this.currentIndex);
        end
        
    end
end
