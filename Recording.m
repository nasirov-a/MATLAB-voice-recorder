prompt = 'Name? : ';
speaker = input(prompt,'s');
mkdir(speaker);


Fs = 44100 ; 
nBits = 16 ; 
nChannels = 1 ; 
recordingduration=3;
ID = -1; % default audio input device 

for i=1:10
    A=i;
    fprintf('\n Train Recording %d out of 13',A)
    name='%s%dtrain-%s-b.flac';
    newpath=append(speaker,'\');
    Recordingname=sprintf(name,newpath,A,speaker);
    


    recObj = audiorecorder(Fs,nBits,nChannels,ID);
    fprintf('\nStart speaking.')
    recordblocking(recObj,recordingduration);
    fprintf('\nEnd of Recording %d.',A);
    play(recObj);
    myRecording = getaudiodata(recObj);
    audiowrite(Recordingname, myRecording,Fs);
    pause(recordingduration);
end
for i=1:3
    A=i;
    fprintf('\n Test Recording %d out of 3',A)
    name='%stest%d-%s-b.flac';
    newpath=append(speaker,'\');
    Recordingname=sprintf(name,newpath,A,speaker);
    


    recObj = audiorecorder(Fs,nBits,nChannels,ID);
    fprintf('\nStart speaking.')
    recordblocking(recObj,recordingduration);
    fprintf('\nEnd of Recording %d.',A);
    play(recObj);
    myRecording = getaudiodata(recObj);
    audiowrite(Recordingname, myRecording,Fs);
    pause(recordingduration);
end
