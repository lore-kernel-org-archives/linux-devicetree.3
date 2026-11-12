Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794459603;
	b=Q/SSUbpLxiWS4+Sho2QyH1sRpc9gn4/aKuXqI/x1S8nIZKIFaR67VZZF6wcFOp5+CjtL
	 eb6evqSgLpt6+Iy5vodUUHUqVBcwX/HwxhoSbv/vUyU+2ml1rDO9t9w7fuNi0LFSV7bpe
	 aeiEEdbCbMqv3NgBiy1fququOFW16tvNZ1jCCeYY+8gFXx2YFSBgiPDH66rEDcqZysLh3
	 EAXYu3T/V3exAjGRErgLgIPZ/O9HZ8FKIUAeL7ohM7XrZmRx39UcVj97Q5hgelCOHbCDI
	 lPDHHE0v0/9yPzS5irY9bev9//Wtu0GQAGQhmVaOO5kYhErqD9K4iqMgE5rB3xeaf2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794459603;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yUHDNrhQusWTm58vNR71O1PHSjM2zm428T3dz68Ty3U=;
	b=u8sDSJSt65sNpRIx13aM4aAI49FmMiqaMDSM3XsLEyVDys8YCv2/4dw75TEAyFN0uYer
	 jeNGb8ywl9btPK7lV6V0Vameq0NPMeQaCq77cgNfpJ28a3wrfUrIyH9jTgZjyKQvP3nkg
	 ImJNVWQH/ZxjsM9MxVOhHC+fQEhRyW33glQCZ0CydTcIehWCus/9uMcLhg8Tzh5TOoKbH
	 l+74l73R9Uh/xz8N2AC+7f2W7gWJW9s5m1rG6nnLqt2YFJ/ADZX1wQoyj/oAJF5rikEaj
	 +CwVCDkGwmg1hAfqCxSh7GMW2usyTRlyRAaSVkJ3xLTBto5gWx7U4y8TG1myErpvAIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqxxLwvn;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A942606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 05:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=kqxxLwvn
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5226F1F00A05;
	Thu, 12 Nov 2026 05:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794459603;
	bh=yUHDNrhQusWTm58vNR71O1PHSjM2zm428T3dz68Ty3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kqxxLwvnxhd7WyWeUOH2PYR60DYwi7zeRY2wPa9CTd0T14KcVximbXXj9q3GUwdqx
	 mXUSoX9kNdxch+ho0DmT4ZEXHgkioJf8h+kkVy70UyvCj7nZ2ChxMxD8Y8dJ5iDk96
	 fhMXoqkxAztELMsDCJ5aG6K/InayuxRGYYtax+GBezO7dRf7USRi97EYzdlnCn9LVB
	 +gWsAk6T95Bf1Err7rCmNzzqvbXqUaSVHTnkybFtid939AkCOa+PRHg2XVUDUBkSpF
	 WGwRoijgwuLqy0/G8lkGI8UCQnKjGWmpNvCXAMn/+teZmzNy/c4+QnWQ64YFBZT4A/
	 wl6yOARfjcv8Q==
Message-ID: <sashiko-outbox-210407@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 01/11] arm64: dts: qcom: ipq5210: Add nodes for
 multiple peripherals
Reply-To: sashiko-reviews@lists.linux.dev
To: "Varadarajan Narayanan" <varadarajan.narayanan@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261112-08-dts-v9-1-c34de4f78fbb@oss.qualcomm.com>
References: <20261112-08-dts-v9-0-c34de4f78fbb@oss.qualcomm.com>
 <20261112-08-dts-v9-1-c34de4f78fbb@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 05:00:00 +0000
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
- [Medium] arm64: dts: qcom: ipq5210: swapped pcie-mem and cpu-pcie
  interconnects in pcie0/1
- [Medium] arm64: dts: qcom: ipq5210: missing ssphy_0 pipe clock phandle
  in gcc clocks
- [Medium] arm64: dts: qcom: ipq5210: incomplete passive cooling setup
  in CPU thermal zones
- [Low] arm64: dts: qcom: ipq5210: qpic_bam enabled unconditionally in
  base SoC DTSI
- [Low] arm64: dts: qcom: ipq5210: stale 816 MHz comment in cpu0-thermal
  cooling-maps
--

commit d1ab8c6e1b0ebf5f28504c611ba26174cc9742a0
Author: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

arm64: dts: qcom: ipq5210: Add nodes for multiple peripherals

This commit adds IPQ5210 device tree nodes for USB, PCIe, QPIC NAND/BAM,
QFPROM, TSENS, thermal zones, and the CPU OPP table and cooling cells.

> diff --git a/arch/arm64/boot/dts/qcom/ipq5210.dtsi b/arch/arm64/boot/dts/=
qcom/ipq5210.dtsi
> index c4a760c1ab23e..504364ca031c4 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5210.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5210.dtsi

[ ... ]

> @@ -171,8 +384,8 @@ gcc: clock-controller@1800000 {
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
parent via DT clock index DT_USB3_PHY0_CC_PIPE_CLK (4).  Leaving that slot
as <0> keeps gcc_usb0_pipe_clk_src and its child GCC_USB0_PIPE_CLK
orphaned with a rate of 0 when USB3 is enabled.

> @@ -230,6 +443,88 @@ sdhc: mmc@7804000 {
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
Should qpic_bam have status =3D "disabled" here so boards only enable it
alongside qpic_nand?  Keeping it enabled in the base DTSI causes
bam_dma_probe() to enable GCC_QPIC_AHB_CLK, reset the QPIC BAM block, and
claim GIC_SPI 56 even on eMMC boards that do not use QPIC NAND.

[ ... ]

> @@ -332,6 +645,287 @@ frame@b128000 {
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

drivers/clk/qcom/gcc-ipq5210.c:
	{ MASTER_CNOC_PCIE0, SLAVE_CNOC_PCIE0, GCC_CNOC_PCIE0_1LANE_S_CLK },
	{ MASTER_CNOC_PCIE1, SLAVE_CNOC_PCIE1, GCC_CNOC_PCIE1_2LANE_S_CLK },
	{ MASTER_SNOC_PCIE0, SLAVE_SNOC_PCIE0, GCC_SNOC_PCIE0_AXI_M_CLK },
	{ MASTER_SNOC_PCIE1, SLAVE_SNOC_PCIE1, GCC_SNOC_PCIE1_AXI_M_CLK },

With CNOC bound to "pcie-mem" and SNOC bound to "cpu-pcie", pcie-qcom
scales the CNOC AXI slave clock with PCIe link speed while clamping the
SNOC AXI master DMA clock to 1 KBps, and disables the SNOC AXI master DMA
clock via icc_disable(pcie->icc_cpu) during non-S2RAM suspend when the
link stays active.

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
> +				};
> +			};
> +		};

[Severity: Low]
As reported by Konrad Dybcio on v4 [1], the "Set maximum frequency as
816 MHz" comment is stale now that cooling-device uses THERMAL_NO_LIMIT
instead of pinning state 3.

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
>  	};

[Severity: Medium]
Is cpu1-thermal missing a cooling-maps node for its cpu-passive trip, and
do both cpu0-thermal and cpu1-thermal need polling-delay-passive?

Without cooling-maps in cpu1-thermal, crossing 100 C on TSENS sensor 15
binds no cooling devices and triggers no throttling.  In addition, because
neither zone sets polling-delay-passive, crossing the single 100 C passive
trip in cpu0-thermal steps the CPU cooling state down by only one OPP
(1416 MHz to 1200 MHz) while TSENS advances its upper interrupt threshold
to 115 C, with no passive polling scheduled to step down further through
1008 MHz and 816 MHz.

[1] https://lore.kernel.org/r/11f0df89-8bd5-41ed-85a3-b7164123f8f7@oss.qual=
comm.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112-08-dts-v9-=
0-c34de4f78fbb@oss.qualcomm.com?part=3D1
