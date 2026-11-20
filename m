Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795167139;
	b=VT17JvUNdfNkUwt3f4gpkNCqDOkyzPQrxCxaFYah9oGaEsjipLzgJud04zeoQza8Z2MG
	 XMi7JL8qhfsMNT1Fm7f2FDZWlNmIqY+5tlEwzHI9P5w/F/vnKWDO4sIQUEofk3fNsNmPa
	 Hw13BiKsgnfix6HIJKMLyC18Y+6NSovvXEMo4cO6M3z+wYt/HFqY3jLqo35PwMNLCbWYu
	 vKfodubsO1HY3l1JXVXcBlkbEQxtu/vu/zTkgGbwHyLTHIKAUMwn1+ahVPQHF/YhexCUt
	 UJqiSONj7gV2V2JtMJ8ORhdqeCDoJrLJ5R7Q1xoZCL35zQv9c0dOEj7vmFVkyeKi1jw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795167139;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NMNeWz5WT9q8hXT4fqpNgweJH88YxaO+fzwmz/mZEoY=;
	b=zxdp8S1Dqs2zPZ9eGg1up8AYEC40l3CNj9vDWgfH5KMOMWBsAsOE2kjz7cZRNUwRsiAy
	 rcCbrt5CYgo9wK9YpVu9HFBeImg9Fe2a/VdVmAZoEQwhSuOQ45KAnWlGj5tNLXMQIJlc6
	 B7m4yGSo6g9SOJ6/UW+9hU4c1hjKBiziEWo0JHEPSI9ZZR43W9ZNwwswUzsrW0ahF4mC3
	 vOrD6L3qwoAe1z+HcnhJ0r47+qc/z4i9tZz3cHIM4aJSwPbBDw6IZmSv5I3PGbWQ5yDvI
	 2KV13AiEgB25ieSQ3qmpX/R5R3gYkOU32SJtSrWVtgyEpjcT2ru9qQ4kTF/Y4g7c34Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RU+tcUgb;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48C606A335
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 09:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RU+tcUgb
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E7461F000CA;
	Fri, 20 Nov 2026 09:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795167138;
	bh=NMNeWz5WT9q8hXT4fqpNgweJH88YxaO+fzwmz/mZEoY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RU+tcUgbSOMvcXKW327zekzKvJvUw5n6UfdSDkb2ajctIEUIFeV4YArNAzkGm/8uM
	 uc5knTWv4tjpKdC7T2W2Od/SpkDiHC+m+41uCfsODtsA0/JBhklMVv+1es4t1XfGnL
	 aCZjDPGpFWGcXcOELWM5MiybFG6JJW38yV42rpUkeQJCQ5Mo4X4fr7X9BQ9yrPmoEo
	 ZzJGYK4SneJ9r3Q/I/Dm6qRVx66jnPn0gYUCJbDwlcuLoo7RKmtBILnhMcMeeYBzkr
	 SNrLD3e2l97RuKwQvWyDqogXgahxyly+ih91xLwhzehicY/ljx3lrbLV3ep/9P0QDM
	 mHRCC+Rw7+3GQ==
Message-ID: <sashiko-outbox-224853@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/4] arm64: dts: qcom: ipq9650: add and enable various
 device nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kathiravan Thirumoorthy" <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261120-ipq9650_various_devices-v1-3-14f53b84c42c@oss.qualcomm.com>
References: <20261120-ipq9650_various_devices-v1-0-14f53b84c42c@oss.qualcomm.com>
 <20261120-ipq9650_various_devices-v1-3-14f53b84c42c@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 09:32:18 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 8 potential
issues to consider:
- [High] arm64: dts: qcom: ipq9650 QUPv3 I2C/SPI nodes omit
  assigned-clock-rates
- [Medium] arm64: dts: qcom: ipq9650 ssphy_0 reg size 0xa00 truncates
  0xe00 pcs_usb
- [Medium] arm64: dts: qcom: ipq9650 usb3 swaps dp_hs_phy_irq and
  dm_hs_phy_irq IRQs
- [Medium] arm64: dts: qcom: ipq9650 300 MHz OPP table attached to 200
  MHz sdhc
- [Low] arm64: dts: qcom: ipq9650 missing #address-cells/#size-cells on
  spi1 and i2c
- [Low] arm64: dts: qcom: ipq9650 sdhc_ice enabled in both common dtsi
  and board dts
- [Low] arm64: dts: qcom: ipq9650 qpic_bam omits status disabled in SoC
  dtsi
- [Low] arm64: dts: qcom: ipq9650 out-of-order DT nodes in soc@0 and
  rdp488-common
--

commit 72adc63cd895671ec07ed6eae7e42757d9770778
Author: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

arm64: dts: qcom: ipq9650: add and enable various device nodes

This commit adds SoC device tree nodes for QUPv3 SPI and I2C, TCSR download
mode, QPIC SPI NAND and BAM, CPU idle states, USB2/USB3 and PHYs, DSU PMU,
LLCC, SMMU, and eMMC ICE on IPQ9650, and enables several peripherals on
RDP488.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi b/arch/a=
rm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
> index e51d75bb9576e..bc2caf42faf5d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9650-rdp488-common.dtsi
[ ... ]
> @@ -73,11 +154,44 @@ &sdhc {
>  	pinctrl-names =3D "default";
>  };
> =20
> +&sdhc_ice {
> +	status =3D "okay";
> +};

[Severity: Low]
Should sdhc_ice only be enabled in ipq9650-rdp488.dts alongside sdhc rather
than in ipq9650-rdp488-common.dtsi?

ipq9650-rdp488.dts already enables sdhc_ice, so enabling it here duplicates
that override on the eMMC board and also probes the Inline Crypto Engine
(keeping GCC_SDCC1_ICE_CORE_CLK and GCC_SDCC1_AHB_CLK enabled) on NAND board
variants where sdhc is disabled.

> diff --git a/arch/arm64/boot/dts/qcom/ipq9650.dtsi b/arch/arm64/boot/dts/=
qcom/ipq9650.dtsi
> index 94269c9c8d6fe..a4091fd0c1eae 100644
> --- a/arch/arm64/boot/dts/qcom/ipq9650.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq9650.dtsi
[ ... ]
> @@ -210,6 +270,61 @@ refgen_pcie: regulator@6c000 {
[ ... ]
> +		ssphy_0: phy@7d000 {
> +			compatible =3D "qcom,ipq9650-qmp-usb3-phy";
> +			reg =3D <0x0 0x0007d000 0x0 0xa00>;

[Severity: Medium]
Does the 0xa00 reg size on ssphy_0 truncate the PCS_USB register block at
offset 0xe00?

In drivers/phy/qualcomm/phy-qcom-qmp-usb.c, ipq9650_usb3phy_cfg uses
qmp_usb_offsets_v4, which sets .pcs_usb =3D 0x0e00, and
ipq9650_usb3_pcs_usb_tbl programs registers up to offset 0x0e18.  Because
qmp_usb_parse_dt() maps resource 0 and computes qmp->pcs_usb =3D base + 0x0=
e00,
qmp_usb_power_on() and runtime PM transitions access 0x400 bytes past the
declared 0xa00 resource range.  Should the reg size be 0x1000?

[ ... ]

> @@ -399,6 +519,84 @@ qupv3: geniqup@1ac0000 {
>  			#size-cells =3D <2>;
>  			ranges;
> =20
> +			spi0: spi@1a80000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x01a80000 0x0 0x4000>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				clock-names =3D "se";
> +				interrupts =3D <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH 0>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				assigned-clocks =3D <&gcc GCC_QUPV3_WRAP_SE0_CLK>;
> +				operating-points-v2 =3D <&spi_opp_table_50mhz>;
> +
> +				status =3D "disabled";
> +			};
> +
> +			i2c0: i2c@1a84000 {
> +				compatible =3D "qcom,geni-i2c";
> +				reg =3D <0x0 0x01a84000 0x0 0x4000>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
> +				clock-names =3D "se";
> +				clock-frequency =3D <400000>;
> +				interrupts =3D <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH 0>;
> +				assigned-clocks =3D <&gcc GCC_QUPV3_WRAP_SE1_CLK>;
> +				operating-points-v2 =3D <&i2c_opp_table_32mhz>;
> +
> +				status =3D "disabled";
> +			};

[Severity: High]
Are spi0, spi1, and i2c0..i2c4 missing assigned-clock-rates to match their
assigned-clocks properties?

Without assigned-clock-rates, of_clk_set_defaults() leaves the serial engine
clocks at their boot rate.  Unlike spi-geni-qcom, i2c-qcom-geni never calls
dev_pm_opp_set_rate() to apply i2c_opp_table_32mhz, and instead checks the
current rate of se.clk at probe time:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_clk_map_idx() {
	if (clk_get_rate(gi2c->se.clk) =3D=3D GENI_SE_CLK_32MHZ) {
		req_freq =3D GENI_SE_CLK_32MHZ;
		itr =3D geni_i2c_clk_map_32mhz;
	} else {
		req_freq =3D GENI_SE_CLK_19P2MHZ;
		itr =3D geni_i2c_clk_map_19p2mhz;
	}
}

In drivers/clk/qcom/gcc-ipq9650.c, ftbl_gcc_qupv3_wrap_se0_clk_src and
ftbl_gcc_qupv3_wrap_se4_clk_src are derived from a 24 MHz XO reference and
support 32 MHz, not 19.2 MHz.  If GCC_QUPV3_WRAP_SE*_CLK is at its 24 MHz XO
default rather than pre-programmed to 32 MHz by firmware,
geni_se_clk_freq_match() fails with -EINVAL and i2c2 fails to probe on
RDP488.

[ ... ]

> +			spi1: spi@1a94000 {
> +				compatible =3D "qcom,geni-spi";
> +				reg =3D <0x0 0x01a94000 0x0 0x4000>;
> +				clocks =3D <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
> +				clock-names =3D "se";
> +				interrupts =3D <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH 0>;
> +				assigned-clocks =3D <&gcc GCC_QUPV3_WRAP_SE5_CLK>;
> +				operating-points-v2 =3D <&spi_opp_table_50mhz>;
> +
> +				status =3D "disabled";
> +			};

[Severity: Low]
Should spi1 and i2c0..i2c4 define #address-cells =3D <1> and #size-cells =
=3D <0>
like spi0?  Without them, DT schema validation fails and any child SPI or I=
2C
devices added under those controllers inherit #address-cells =3D <2> and
#size-cells =3D <1>.

Conversely, the flash@0 nodes under &qpic_nand and &spi0 in
ipq9650-rdp488-common.dtsi set #address-cells =3D <1> and #size-cells =3D <=
1>
with no child subnodes, which Documentation/devicetree/bindings/mtd/mtd.yaml
marks as deprecated.

[ ... ]

> @@ -408,6 +606,75 @@ uart1: serial@1a98000 {
[ ... ]
> +		system-cache-controller@4000000 {
> +			compatible =3D "qcom,ipq9650-llcc";
> +			reg =3D <0x0 0x04000000 0x0 0x200000>;
> +			reg-names =3D "llcc0_base";
> +			interrupts =3D <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH 0>;
> +		};
> +
> +		usb2: usb@1e00000 {

[Severity: Low]
This isn't a bug, but system-cache-controller@4000000 is placed before
usb@1e00000 under soc@0 instead of in unit-address order.  Similarly, in
ipq9650-rdp488-common.dtsi, &qusb_phy_0 and &qusb_phy_1 are placed before
&i2c2, &spi0 before &sleep_clk, and &usb2 and &usb3 before &uart1 instead of
in alphabetical order.

[ ... ]

> @@ -429,6 +696,102 @@ sdhc: mmc@7804000 {
>  				      "core",
>  				      "xo";
>  			non-removable;
> +			qcom,ice =3D <&sdhc_ice>;
> +			operating-points-v2 =3D <&sdhc_opp_table_300mhz>;
> +			supports-cqe;
> +
> +			status =3D "disabled";
> +		};
> +
> +		sdhc_ice: crypto@7808000 {
> +			compatible =3D "qcom,ipq9650-inline-crypto-engine",
> +				     "qcom,inline-crypto-engine";
> +			reg =3D <0x0 0x07808000 0x0 0x2000>;
> +
> +			clocks =3D <&gcc GCC_SDCC1_ICE_CORE_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names =3D "core",
> +				      "iface";
> +
> +			status =3D "disabled";
> +		};

[Severity: Medium]
Is sdhc_opp_table_300mhz (300 MHz) attached to sdhc instead of configuring
the 300 MHz core clock on sdhc_ice?

sdhci_msm_probe() binds sdhc's operating-points-v2 table to its "core" clock
(GCC_SDCC1_APPS_CLK), but in drivers/clk/qcom/gcc-ipq9650.c,
ftbl_gcc_sdcc1_apps_clk_src only supports up to 200 MHz (and
ipq9650-rdp488-common.dtsi sets max-frequency =3D <192000000>).  300 MHz is=
 the
rate in ftbl_gcc_sdcc1_ice_core_clk_src for sdhc_ice's GCC_SDCC1_ICE_CORE_C=
LK,
which currently has no rate configured in DT or drivers/soc/qcom/ice.c.
Also, Documentation/devicetree/bindings/mmc/qcom,sdhci-msm.yaml requires
required-opps on every OPP entry in an sdhci-msm opp-table.

> +
> +		qpic_bam: dma-controller@7984000 {
> +			compatible =3D "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
> +			reg =3D <0x0 0x7984000 0x0 0x1c000>;
> +			interrupts =3D <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks =3D <&gcc GCC_QPIC_AHB_CLK>;
> +			clock-names =3D "bam_clk";
> +			#dma-cells =3D <1>;
> +			qcom,ee =3D <0>;
> +		};

[Severity: Low]
Should qpic_bam have status =3D "disabled" in ipq9650.dtsi like its consumer
qpic_nand?  Leaving it enabled causes bam_dma_probe() to probe the QPIC BAM
controller, keep GCC_QPIC_AHB_CLK enabled, and claim IRQ 109 on eMMC board
variants where qpic_nand is disabled.

[ ... ]

> +		usb3: usb@8a00000 {
[ ... ]
> +			interrupts-extended =3D <&intc GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH 0>,
> +					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH 0>;
> +			interrupt-names =3D "dwc_usb3",
> +					  "pwr_event",
> +					  "qusb2_phy",
> +					  "dp_hs_phy_irq",
> +					  "dm_hs_phy_irq";

[Severity: Medium]
Are GIC_SPI 423 and GIC_SPI 424 swapped relative to "dp_hs_phy_irq" and
"dm_hs_phy_irq" on usb3?

On usb2 above (where GIC_SPI 388 is dp_hs_phy_irq and GIC_SPI 387 is
dm_hs_phy_irq) and on ipq5424.dtsi (where GIC_SPI 423 is dm_hs_phy_irq and
GIC_SPI 424 is dp_hs_phy_irq), the lower SPI number is DM and the higher SPI
number is DP.  With 423 mapped to dp_hs_phy_irq and 424 mapped to
dm_hs_phy_irq, dwc3_qcom_enable_port_interrupts() monitors D- instead of D+
for High-Speed/Full-Speed devices and D+ instead of D- for Low-Speed devices
during suspend, breaking USB2 wakeup and disconnect detection on usb3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-ipq9650_va=
rious_devices-v1-0-14f53b84c42c@oss.qualcomm.com?part=3D3
