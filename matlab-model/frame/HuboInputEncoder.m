classdef HuboInputEncoder < LCMCoder
    properties
        defaultCoordinateNames
    end
    methods
        function obj = HuboInputEncoder(coordinateNames)
            obj.defaultCoordinateNames = coordinateNames;
        end
        
        function [x,t] = decode(obj,data)
            msg = hubo.hubo_hubo2input(data);
            if ~isempty(msg)
            x = [msg.NeckYaw,...
                msg.Neck1,...
                msg.Neck2,...
                msg.LeftShoulderPitch,...
                msg.LeftShoulderRoll,...
                msg.LeftShoulderYaw,...
                msg.LeftElbowPitch,...
                msg.LeftWristYaw,...
                msg.LeftWristPitch,...
                msg.RightShoulderPitch,...
                msg.RightShoulderRoll,...
                msg.RightShoulderYaw,...
                msg.RightElbowPitch,...
                msg.RightWristYaw,...
                msg.RightWristPitch,...
                msg.TrunkYaw,...
                msg.LeftHipYaw,...
                msg.LeftHipRoll,...
                msg.LeftHipPitch,...
                msg.LeftKneePitch,...
                msg.LeftAnklePitch,...
                msg.LeftAnkleRoll,...
                msg.RightHipYaw,...
                msg.RightHipRoll,...
                msg.RightHipPitch,...
                msg.RightKneePitch,...
                msg.RightAnklePitch,...
                msg.RightAnkleRoll,...
                ];
                t = msg.timestamp;
            end
        end
        function dimmatrix = dim(obj)
            dimmatrix = 28;
        end
        function msg = encode(obj,t,x)
            msg = hubo.hubo_hubo2input();
            msg.timestamp = t;
            msg.NeckYaw = x(1);
            msg.Neck1 = x(2);
            msg.Neck2 = x(3);
            msg.LeftShoulderPitch = x(4);
            msg.LeftShoulderRoll = x(5);
            msg.LeftShoulderYaw = x(6);
            msg.LeftElbowPitch = x(7);
            msg.LeftWristYaw = x(8);
            msg.LeftWristPitch = x(9);
            msg.RightShoulderPitch = x(10);
            msg.RightShoulderRoll = x(11);
            msg.RightShoulderYaw = x(12);
            msg.RightElbowPitch = x(13);
            msg.RightWristYaw = x(14);
            msg.RightWristPitch = x(15);
            msg.TrunkYaw = x(16);
            msg.LeftHipYaw = x(17);
            msg.LeftHipRoll = x(18);
            msg.LeftHipPitch = x(19);
            msg.LeftKneePitch = x(20);
            msg.LeftAnklePitch = x(21);
            msg.LeftAnkleRoll = x(22);
            msg.RightHipYaw = x(23);
            msg.RightHipRoll = x(24);
            msg.RightHipPitch = x(25);
            msg.RightKneePitch = x(26);
            msg.RightAnklePitch = x(27);
            msg.RightAnkleRoll = x(28);
        end
        function name = timestampName(obj)
            name = 'timestamp';
        end
        function name = coordinateNames(obj)
            strArray = java_array('java.lang.String', 3);
            for i=1:obj.dim()
                strArray(i) = java.lang.String('');
            end
            name = cell(strArray);
%             name = ['NeckYaw';...
%                 'Neck1';...
%                 'Neck2';...
%                 'LeftShoulderPitch';...
%                 'LeftShoulderRoll';...
%                 'LeftShoulderYaw';...
%                 'LeftElbowPitch';...
%                 'LeftWristYaw';...
%                 'LeftWristPitch';...
%                 'RightShoulderPitch';...
%                 'RightShoulderRoll';...
%                 'RightShoulderYaw';...
%                 'RightElbowPitch';...
%                 'RightWristYaw';...
%                 'RightWristPitch';...
%                 'TrunkYaw';...
%                 'LeftHipYaw';...
%                 'LeftHipRoll';...
%                 'LeftHipPitch';...
%                 'LeftKneePitch';...
%                 'LeftAnklePitch';...
%                 'LeftAnkleRoll';...
%                 'RightHipYaw';...
%                 'RightHipRoll';...
%                 'RightHipPitch';...
%                 'RightKneePitch';...
%                 'RightAnklePitch';...
%                 'RightAnkleRoll'...
%                 ];
        end
    end

end
