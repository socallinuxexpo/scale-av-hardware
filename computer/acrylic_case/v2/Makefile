OSC=openscad
TARGET_DXF=dxf/3mm_output.dxf dxf/6mm_output1.dxf dxf/6mm_output2.dxf dxf/6mm_fronts.dxf
TARGET_SVG=svg/3mm_output.svg svg/6mm_output1.svg svg/6mm_output2.svg dxf/6mm_fronts.dxf
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

svg/6mm_output2.svg: 6mm_output2.scad
	mkdir -p svg
	$(OSC) -m make -o $@ $<

svg/6mm_fronts.svg: 6mm_fronts.scad
	mkdir -p svg
	$(OSC) -m make -o $@ $<

dxf/3mm_output.dxf: 3mm_output.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/6mm_output1.dxf: 6mm_output1.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/6mm_output2.dxf: 6mm_output2.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/right_side.dxf: side.scad
	mkdir -p dxf
	$(OSC) -D "side=\"right\"" -m make -o $@ $<

dxf/left_side.dxf: side.scad
	mkdir -p dxf
	$(OSC) -D "side=\"left\"" -m make -o $@ $<

dxf/mount_plate.dxf: mount_plate.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/front.dxf: front.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/sata_mount_panel.dxf: sata_mount_panel.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

dxf/test_panel2.dxf: test2.scad
	mkdir -p dxf
	$(OSC) -m make -o $@ $<

rendering: img/hdmi_case.png

img/hdmi_case.png: hdmi_case.scad
	mkdir -p img
	$(OSC) -m make -o $@ $<

clean:
	rm -rf $(TARGET_DXF) $(TARGET_SVG) dxf svg img
