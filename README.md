# mood-buttons

simple website with buttons that play motivational clips based on mood or what is needed at particular moment when you need it the most.

## tasks

- button design. WIP. see `design.html`
- ~~research solutions~~
- ~~test `s3stream` java solution *never got this script to work correctly. will revisit.*~~
- test amazon buttons using `dasher`
  - ~~downloaded code~~
- ~~uploaded sample mp3 to s3 bucket and tested s3 url within html using `audio controls src`~~
- ~~test `aws-java.html` solution. *going to abandon this as to not waste time figuring java I don't fully understand yet*~~
- create 2-3 sample snippets of some motivation clips I use often

## commands

aws s3 cp assets/${audio_file} s3://mood-buttons/
aws s3 cp assets/${audio_file} s3://mind-pyramid/

## resources

- https://dabuttonfactory.com/

- https://developer.mozilla.org/en-US/docs/Web/HTML/Element/button

- https://www.youtube.com/watch?v=7e5SQL_xLN8&t=86m23s

- https://dabuttonfactory.com/#t=TEST+BUTTON&f=Calibri-Bold&ts=100&tc=f00&tshs=5&tshc=000&hp=20&vp=8&c=5&bgt=gradient&bgc=f90&ebgc=4c1130&it=png

- https://alexzywiak.github.io/streaming-audio-goodness-from-amazon-s3-to-the-clients-ears/index.html

- https://htmlcheatsheet.com/

## dasher app

- did a fork of the dasher app repo to leverage amazon buttons
 https://github.com/maddox/dasher


## setup react-native-audio-toolkit

```
npm install s3
npm install --save react-native-audio-toolkit
```

## audacity

- See `audacity.md` as I will be taking notes there to document the steps I take
