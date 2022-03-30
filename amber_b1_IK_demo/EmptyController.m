classdef EmptyController < matlab.System & matlab.system.mixin.Propagates & matlab.system.mixin.SampleTime
    % Untitled Add summary here
    %
    % This template includes the minimum set of functions required
    % to define a System object with discrete state.

    % Public, tunable properties
    properties

    end

    properties(DiscreteState)

    end

    % Pre-computed constants
    properties(Access = private)

    end

    methods(Access = protected)
        function setupImpl(obj)
            % Perform one-time calculations, such as computing constants
        end

        function y = stepImpl(obj, u, t)
            % Implement algorithm. Calculate y as a function of input u and
            % discrete states.
            position_in = [u.joint_1.position; u.joint_2.position; u.joint_3.position; u.joint_4.position; u.joint_5.position; u.joint_6.position; u.joint_7.position];
            velocity_in = [u.joint_1.velocity; u.joint_2.velocity; u.joint_3.velocity; u.joint_4.velocity; u.joint_5.velocity; u.joint_6.velocity; u.joint_7.velocity];
            torque_in = [u.joint_1.torque; u.joint_2.torque; u.joint_3.torque; u.joint_4.torque; u.joint_5.torque; u.joint_6.torque; u.joint_7.torque];
            
            position_des = 0.5*sin(t/2)*[1;1;1;1;1;1;1];
             
            y.position_1 = position_des(1);
            y.position_2 = position_des(2);
            y.position_3 = position_des(3);
            y.position_4 = position_des(4);
            y.position_5 = position_des(5);
            y.position_6 = position_des(6);
            y.position_7 = position_des(7);
        end

        function resetImpl(obj)
            % Initialize / reset discrete-state properties
        end
        
         % PROPAGATES CLASS METHODS ============================================
        function [out] = getOutputSizeImpl(~)
            %GETOUTPUTSIZEIMPL Get sizes of output ports.
            out = [1, 1];
        end % getOutputSizeImpl
        
        function [out] = getOutputDataTypeImpl(~)
            %GETOUTPUTDATATYPEIMPL Get data types of output ports.
            out = 'AmberB1InBus';
        end % getOutputDataTypeImpl
        
        function [out] = isOutputComplexImpl(~) 
            %ISOUTPUTCOMPLEXIMPL Complexity of output ports.
            out = false;
        end % isOutputComplexImpl
        
        function [out] = isOutputFixedSizeImpl(~)
            %ISOUTPUTFIXEDSIZEIMPL Fixed-size or variable-size output ports.
            out = true;
        end % isOutputFixedSizeImpl
    end
end
