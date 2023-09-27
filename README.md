# Bone-fracture-detection-using-Image-Processing-using-MATLAB

**Introduction:**
Image processing techniques play a crucial role in various applications, including biomedical, security, satellite imaging, medicine, and personal image analysis. This project focuses on utilizing image processing, particularly Canny edge detection and the Hough Transform technique, to detect bone fractures in X-ray images using MATLAB. The primary motivations behind this system are:

1. **Time-saving:** To reduce the workload of doctors and expedite the screening process by quickly identifying straightforward fracture cases.
2. **Error reduction:** To minimize human errors associated with manual examination of numerous X-ray images in hospitals.

**Methodology:**

1. **Input Image:** The project begins by loading an input image using the command `I=imread('filename.filetype')`.

2. **Canny Edge Detection:** The Canny edge detection algorithm is chosen for its superior edge detection capabilities, especially in noisy images. It smoothes the image using a Gaussian filter and highlights edges efficiently. This process is crucial for identifying bone edges accurately.

3. **Fracture Detection:** The final phase involves fracture detection. Firstly, prominent features like straight lines are extracted from the image. The Hough Transform is used to detect lines in the binary image generated after edge enhancement. This transform is effective in identifying straight lines, shapes, and curves. Each pixel in the image space corresponds to a parameterized point in the parameter space, and lines are detected by analyzing the parameters of the transformed points.

4. **Line Detection:** To pinpoint the location of the bone fracture, the algorithm identifies straight lines in the image. The algorithm considers lines with a minimum length of 7 pixels and allows for gap connections of up to 7 pixels. Only a few significant lines are detected, and these are plotted in green on the Hough-transformed image. The starting and ending points of these lines are marked in yellow and red, respectively.

**Experimental Results:**

The experimentation involved 21 digital X-ray images of lower long bones. To locate the fracture point, a reference edge value (40) was used, which may need adjustment if the fracture is not in the center of the bone. The system employed a 5° weight value or Hough peak distance to find vertical lines within the specified angle range (85° to 90°). The results showed two detected peak points when a fracture was present and only one peak point in its absence. The system accurately detected fractures and marked their locations.

**Conclusion:**

This paper presented an image processing technique for bone fracture detection, showcasing promising results. The accuracy of fracture detection depends on the quality of the input image. Future work could focus on detecting fractures in smaller bones or in specific joints like the ankle.

**Acknowledgment:**
[1] Peruri Srinivasulu, Jollu Vamsi, Kattubadi Drutesh, and Gandham Prudhvi. "Bone Fracture Detection using Image Processing." Published in the International Journal of Scientific and Research Publications, June 2020, Volume 5, Issue 6.
