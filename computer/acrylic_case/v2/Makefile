OSC=openscad
TARGET_DXF=dxf/3mm_output.dxf dxf/6mm_output1.dxf dxf/6mm_output2.dxf
TARGET_SVG=svg/3mm_output.svg svg/6mm_output1.svg svg/6mm_output2.svg
world:
	@echo "Choose 'make all' or make <one of the following>:"
	@echo $(TARGET_DXF) $(TARGET_SVG)
all: svg dxf
svg: $(TARGET_SVG)

dxf: $(TARGET_DXF)

.PHONY: $(TARGET_DXF) $(TARGET_SVG) rendering

svg/3mm_output.svg: 3mm_output.scad
	mkdir -p svg
	$(OSC) -m make -o $@ $<

svg/6mm_output1.svg: 6mm_output1.scad
	mkdir -p svg
	$(OSC) -m make -o $@ $<

svg/6mm_output2.svg: 3mm_output2.scad
	mkdir -p svg
	$(OSC) -m make -o $@ $<

dxf/3mm_output.dxf: 3mm_output.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/6mm_output1.dxf: 6mm_output1.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/6mm_output2.dxf: 3mm_output2.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

rendering: img/hdmi_case.png

img/hdmi_case.png: hdmi_case.scad
	mkdir -p img
	$(OSC) -m make -o $@ $<

clean:
	rm -rf $(TARGET_DXF) $(TARGET_SVG) dxf svg img
