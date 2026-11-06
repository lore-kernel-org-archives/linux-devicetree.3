Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793958059;
	b=uazcB/REZ40Vuvy/q3ohVNBc7NwR6CRQUNSRl2noScMkky1kFOM7bWAhmNrZH/XdcYEw
	 Mf0WuKr7PNhCYrxpPh+BFY3Z9m1FmU1xJWzYWeeS6O6sI/CvtuDfWyyQ0S+Wavx9aE1I7
	 YMYIEfgZ51bEKjhJ8zRz0KUSM+emgXBCGgCaJtMXn0Fzatgm7QWmz6iVY8kvxtw6uH+Jk
	 rw8FvMpsrUVXY1w89/CB22yXSjFRUuVkoqZkh66ZRgsGdlwZB5q6S4pInRADNJQ+t93Wl
	 TXBRJNHTfBl86K5ZiEmXLejBTlz92EklWirjlDwgB02SziPh4wsvUVhimeNJZkq/SLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793958059;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OV5Kd81PUIakEFct7Fz6Dt6VFcIOypiLJK1O58tyWHk=;
	b=XiVk5b9FAXrd2PBf/87lTdiwR/8PWN2xC2evjCS9VE8f5zq6oAOHJbGfEjoqq7eYDkvm
	 Lk8AolkDvoCdhlVCnWdePMTDBy4eeixFg3eecIcCXUoh2KHKpnGx9cl/8/sS9Pw51FkGv
	 7/+cq9Jr2WXV9iXUhHIfmLJTI/ScDnNnAKkv+2SiS0Parw5eNUW8MgGHR1w6zQDBhzZsd
	 m35ZzD6ipU3uOs8JV74xtLspRD2bKn/2q1imW5JrUbhGrS0SMP0eLsWbSXKVywa0uGTxZ
	 E+dfUpi+EP1SgHgWL1BEK7qPv6KYKg6q5qgGUPOniXuHTVTslKAY+u8AV8iBjneindQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESna0YlI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B01F606A32D
	for <devicetree@vger.kernel.org>; Fri,  6 Nov 2026 09:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ESna0YlI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C226F1F0089F;
	Fri,  6 Nov 2026 09:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793958059;
	bh=OV5Kd81PUIakEFct7Fz6Dt6VFcIOypiLJK1O58tyWHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ESna0YlIKGRm7fgdh4ZXaMD4v/dUV+f96Dk4Wkvu7xT7eYQMMNj2rJqw5AS2Tso8K
	 x8P+xAbeIcU++dadjAstrz8QCNUiMr7Y+95/zgzJ6pgV5arRs0YCQWjj18kWWr3N0p
	 yf7L1K8ZIEt+wVpJXoVGIDND/xAbWIzaVH2qgggXuqqp1so9wA+GKQD7WmV9vgGDgJ
	 twIoxYy7pKIA7O1gWKAYYg1K3PSiR8X2rhwEr8BJaDMyTLh02vLNUG1vHI2U4uIxfp
	 L+2zEMecFXZXZqHhnK5zmHnxwkem0zRHnI2aaLsbvLc/K8habl5sh+j3PxPPFQR+px
	 HPidJojYW3aSg==
Message-ID: <sashiko-outbox-201138@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 01/11] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261106-08-dts-v8-1-d91401955039@oss.qualcomm.com>
References: <20261106-08-dts-v8-0-d91401955039@oss.qualcomm.com>
 <20261106-08-dts-v8-1-d91401955039@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 06 Nov 2026 09:40:58 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] arm64: dts: qcom: ipq5210: missing ssphy_0 pipe clock phandle
  in gcc clocks
- [Medium] arm64: dts: qcom: ipq5210: swapped pcie-mem and cpu-pcie
  interconnects in pcie0/1
- [Medium] arm64: dts: qcom: ipq5210: incomplete passive cooling setup
  in CPU thermal zones
- [Low] arm64: dts: qcom: ipq5210: qpic_bam enabled unconditionally in
  base SoC DTSI
- [Low] arm64: dts: qcom: ipq5210: stale 816 MHz comment in cpu0-thermal
  cooling-maps
--

commit aadfdda0f016f5ff16e6b63c819910081e954fce
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

This commit adds device tree nodes for USB, PCIe, QPIC NAND/BAM, QFPROM,
TSENS, thermal zones, and CPU OPPs/cooling in ipq5210.dtsi.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index 20e8b240642c6..81af32af4047d 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi

[ ... ]

> @@ -130,6 +179,170 @@ soc@0 {
>  		dma-ranges =3D <0 0 0 0 0x10 0>;
>  		ranges =3D <0 0 0 0 0x10 0>;
> =20
> +		qusb_phy_0: phy@7b000 {
> +			compatible =3D "qcom,ipq5210-qusb2-phy", "qcom,ipq6018-qusb2-phy";
> +			reg =3D <0x0 0x0007b000 0x0 0x180>;
> +			#phy-cells =3D <0>;
> +
> +			clocks =3D <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +				 <&xo_board>;
> +			clock-names =3D "cfg_ahb",
> +				      "ref";
> +
> +			resets =3D <&gcc GCC_QUSB2_0_PHY_BCR>;
> +			status =3D "disabled";
> +		};
> +
> +		ssphy_0: phy@7d000 {
> +			compatible =3D "qcom,ipq5210-qmp-usb3-phy", "qcom,ipq9574-qmp-usb3-ph=
y";
> +			reg =3D <0x0 0x0007d000 0x0 0xa00>;
> +			#phy-cells =3D <0>;
> +
> +			clocks =3D <&gcc GCC_USB0_AUX_CLK>,
> +				 <&xo_board>,
> +				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
> +				 <&gcc GCC_USB0_PIPE_CLK>;
> +			clock-names =3D "aux",
> +				      "ref",
> +				      "cfg_ahb",
> +				      "pipe";
> +
> +			resets =3D <&gcc GCC_USB0_PHY_BCR>,
> +				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
> +			reset-names =3D "phy",
> +				      "phy_phy";
> +
> +			#clock-cells =3D <0>;
> +			clock-output-names =3D "usb0_pipe_clk";
> +
> +			status =3D "disabled";
> +		};

[ ... ]

> @@ -146,8 +359,8 @@ gcc: clock-controller@1800000 {
>  			reg =3D <0x0 0x01800000 0x0 0x40000>;
>  			clocks =3D <&xo_board>,
>  				 <&sleep_clk>,
> -				 <0>,
> -				 <0>,
> +				 <&pcie0_phy>,
> +				 <&pcie1_phy>,
>  				 <0>,
>  				 <0>;
>  			#clock-cells =3D <1>;

[Severity: Medium]
Should the fifth entry in gcc's clocks property be <&ssphy_0> instead of
<0>?

In drivers/clk/qcom/gcc-ipq5210.c, gcc_usb0_pipe_clk_src resolves its sole
parent via .index =3D DT_USB3_PHY0_CC_PIPE_CLK (4) with no fallback name.
Leaving that slot as <0> keeps gcc_usb0_pipe_clk_src and its child
GCC_USB0_PIPE_CLK (consumed by ssphy_0) orphaned with a rate of 0 when
USB3 is enabled.

[ ... ]

> @@ -205,6 +418,88 @@ sdhc: mmc@7804000 {
>  			status =3D "disabled";
>  		};
> =20
> +		qpic_bam: dma-controller@7984000 {
> +			compatible =3D "qcom,bam-v1.7.0";
> +			reg =3D <0x0 0x07984000 0x0 0x1c000>;
> +			interrupts =3D <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks =3D <&gcc GCC_QPIC_AHB_CLK>;
> +			clock-names =3D "bam_clk";
> +			#dma-cells =3D <1>;
> +			qcom,ee =3D <0>;
> +
> +			status =3D "okay";
> +		};

[Severity: Low]
Should qpic_bam have status =3D "disabled" here like its consumer qpic_nand,
so boards that do not use QPIC NAND (such as eMMC boards) do not enable
GCC_QPIC_AHB_CLK and probe the QPIC BAM controller unconditionally?

[ ... ]

> @@ -307,6 +620,287 @@ frame@b128000 {
>  				status =3D "disabled";
>  			};
>  		};
> +
> +		pcie1: pcie@50000000 {

[ ... ]

> +			interconnects =3D <&gcc MASTER_CNOC_PCIE1 &gcc SLAVE_CNOC_PCIE1>,
> +					<&gcc MASTER_SNOC_PCIE1 &gcc SLAVE_SNOC_PCIE1>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";

[ ... ]

> +		pcie0: pcie@70000000 {

[ ... ]

> +			interconnects =3D <&gcc MASTER_CNOC_PCIE0 &gcc SLAVE_CNOC_PCIE0>,
> +					<&gcc MASTER_SNOC_PCIE0 &gcc SLAVE_SNOC_PCIE0>;
> +			interconnect-names =3D "pcie-mem", "cpu-pcie";

[Severity: Medium]
Are the "pcie-mem" and "cpu-pcie" interconnect paths swapped in both pcie1
and pcie0?

drivers/clk/qcom/gcc-ipq5210.c maps the CNOC pairs to the AXI slave clocks
and the SNOC pairs to the AXI master clocks:

drivers/clk/qcom/gcc-ipq5210.c:icc_ipq5210_hws[] =3D {
	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_CNOC_PCIE0_1LANE_S_CLK },
	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_CNOC_PCIE1_2LANE_S_CLK },
	{ MASTER_SNOC_PCIE0, SLAVE_SNOC_PCIE0, GCC_SNOC_PCIE0_AXI_M_CLK },
	{ MASTER_SNOC_PCIE1, SLAVE_SNOC_PCIE1, GCC_SNOC_PCIE1_AXI_M_CLK },
    ...
};

With CNOC bound to "pcie-mem" and SNOC bound to "cpu-pcie", pcie-qcom scales
the AXI slave clock to the PCIe link bandwidth while clamping the SNOC AXI
master (PCIe DMA to memory) clock to 1 KBps, and disables the SNOC AXI
master clock during non-S2RAM suspend when the link stays active.

[ ... ]

> +		cpu0-thermal {
> +			thermal-sensors =3D <&tsens 14>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature =3D <115000>;
> +					hysteresis =3D <9000>;
> +					type =3D "critical";
> +				};
> +
> +				cpu0_thermal_alert: cpu-passive {
> +					temperature =3D <100000>;
> +					hysteresis =3D <9000>;
> +					type =3D "passive";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip =3D <&cpu0_thermal_alert>;
> +					/* Set maximum frequency as 816 MHz */
> +					cooling-device =3D <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;

[Severity: Low]
As reported by Konrad Dybcio on v4 [1], the "Set maximum frequency as
816 MHz" comment is stale now that cooling-device uses THERMAL_NO_LIMIT
rather than pinning state 3.

> +				};
> +			};
> +		};
> +
> +		cpu1-thermal {
> +			thermal-sensors =3D <&tsens 15>;
> +
> +			trips {
> +				cpu-critical {
> +					temperature =3D <115000>;
> +					hysteresis =3D <9000>;
> +					type =3D "critical";
> +				};
> +
> +				cpu-passive {
> +					temperature =3D <100000>;
> +					hysteresis =3D <9000>;
> +					type =3D "passive";
> +				};
> +			};
> +		};

[Severity: Medium]
Is cpu1-thermal missing a cooling-maps node for its cpu-passive trip, and
should both cpu0-thermal and cpu1-thermal set polling-delay-passive?

Without cooling-maps in cpu1-thermal, thermal_of_should_bind() binds no
cooling devices when TSENS sensor 15 crosses 100 C.  In addition, because
neither zone sets polling-delay-passive, crossing the single 100 C passive
trip advances the TSENS upper interrupt threshold to 115 C while step_wise
steps CPU frequency down by only one OPP (1416 MHz to 1200 MHz) with no
passive polling scheduled to step through the remaining OPPs.

[1] https://lore.kernel.org/r/11f0df89-8bd5-41ed-85a3-b7164123f8f7@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261106-08-dts-v8-=
0-d91401955039@oss.qualcomm.com?part=3D1
