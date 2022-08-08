# ContourSeparator
\
**[Problem]:** Edge detection is a basic and commonly used method in image segmentation. However, after edge detection, the segmented cell cannot be divided into two cells because the mother cell is always connected to other daughter cells during cell division.\
\
<img src="https://github.com/xiangyu066/ContourSeparator/blob/main/Contour_1.png" width="20%">\
\
**[Algorithem]:** To solve this problem, the basic idea is to give a random starting point from contour pixels, and then form a closed loop along a specific direction. Based on this wall follower algorithm, the connected contour can be divided into two separate contours.\
\
**[Demo]:**\
<img src="https://github.com/xiangyu066/ContourSeparator/blob/main/ContourSeprator.gif" width="20%">\
\
<img src="https://github.com/xiangyu066/ContourSeparator/blob/main/Contour_1_Demo.png" width="45%">
