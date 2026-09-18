Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3499525A9D
	for <devicetree@vger.kernel.org>; Fri, 18 Sep 2026 20:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789762049; cv=none; b=K4dFA6kEIbPleik8+un2GW4rqCsO0BwDXSEHjcsjQBdVuOYkE9D/sq1VehwAhItOZc8t4z9DX3CfuKEkCuFzCs2ZbV2t/mCrqaGhN7EFhNzBohqaEvoHFEikex5oEU2KJ2N8FR4do2W9KJBGMjMymePCpiekTExEzUdEv2E+z2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789762049; c=relaxed/simple;
	bh=pPQP4FVkAMXfLwz8NcuozZydtETFgHVpqVCQdXSGKno=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GuXhEYeuMNj1K9RYjhqHvMiI86ynEvfjsgsfTazeGWzGWoWnXnItgjIGBVKU6zaWzBrERmNGzt7w+6vJ22vlxnTmEFNuIDpy2FtjVEgDqm1JQS+0Q/cSu+5O02e3d8t/JyIPcrD50IiU8tc8haippJcEsYX41oEJyNLnFcpchCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KG79ZaHa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KG79ZaHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751E91F000FF;
	Fri, 18 Sep 2026 20:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789762044;
	bh=b+P12VFmlMbPebwZGD5BsueSdP19CUNMNGUGgkrh7Zs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KG79ZaHaCS50QAhh0iDzJs4yqFAoQZMKCjRTNLT7Ahwy2RKfyxQHXMaaG4x6V7wtU
	 0KQva4lQeyk/P0R+xwdoZqZf1mh5V6qhEhYYVQENJosDsF77BzeVaXmzeRvDVgMdP0
	 joqh2MApg9ALmLoDbnYRTnoH4w2385MyA2LSO/G8eWYLD1PyP3AmvOyOtAre/KYVuo
	 qQH3iVj40y5zS2yyxMNkh12rH3DWS1cz8PBMY6leg5SJnYkXgi5vPibwM5BWZ6RoUy
	 Uy0cWDfdFce/MZXwVtJ9Uryr0Z9tpe4GitxCY4y8L/WuYrARZtfuJdDE9x4zKR89B4
	 5Ieflxx6PIOjA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: imx8mp: add Olimex i.MX8MP-SOM-EVB kit
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zoltan HERPAI" <wigyori@uid0.hu>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260918195559.130443-3-wigyori@uid0.hu>
References: <20260918195559.130443-1-wigyori@uid0.hu>
 <20260918195559.130443-3-wigyori@uid0.hu>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 18 Sep 2026 20:07:24 +0000
Message-Id: <20260918200724.751E91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] dt: PMIC interrupt misconfigured as edge-rising instead of level-l=
ow
- [Medium] dt: EVB carrier features incorrectly enabled in SOM dtsi
- [Medium] dt: unused CAN standby pinctrl groups leave transceivers disabled
- [Medium] dt: missing pinctrl-names in PMIC node prevents pinmux applicati=
on
- [Low] dt: duplicate pinctrl_usb1_vbus label causes build error
- [Low] dt: rohm,dh2228fv compatible string abused for generic SPI header
- [Low] dt: deprecated reset-gpio property used in PCIe node
--

commit b3a5c80438428e973d66a598e54426ad5ece4f26
Author: Zoltan HERPAI <wigyori@uid0.hu>

arm64: dts: imx8mp: add Olimex i.MX8MP-SOM-EVB kit

This adds support for an i.MX8-based system-on-module + EVB board. The
product pages are here [1] and here [2] respectively.
There are two new files, one dts for the EVB and one dtsi for the SoM.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts b/ar=
ch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
> new file mode 100644
> index 0000000000000..26fee72d50c90
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-olimex-som-evb.dts
[ ... ]
> +&ecspi2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;
> +	cs-gpios =3D <&gpio5 13 GPIO_ACTIVE_LOW>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_ecspi2 &pinctrl_ecspi2_cs>;
> +
> +	status =3D "okay";
> +
> +	spidev1: spi@0 {
> +		reg =3D <0>;
> +		compatible =3D "rohm,dh2228fv";
> +		spi-max-frequency =3D <500000>;
> +	};
> +};

[Severity: Low]
Is it appropriate to use the rohm,dh2228fv compatible string here for a
generic SPI header? This appears to be forcing the spidev driver to bind
and silences DTC warnings, which goes against the device tree compatible
string mechanism.

[ ... ]
> +&flexcan1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Will this configuration leave the CAN1 transceiver disabled? The flexcan1
node fails to reference the pinctrl_flexcan1_reg standby pins or a regulator
for them.

[ ... ]
> +	pinctrl_flexcan1_reg: flexcan1reggrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_SPDIF_EXT_CLK__GPIO5_IO05	0x154	/* CAN1_STBY */
> +		>;
> +	};

Because these standby pins are configured but never used, the physical CAN
transceivers will likely remain disabled.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi b/arch/=
arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi
> new file mode 100644
> index 0000000000000..9876d3e7b81a3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-olimex-som.dtsi
[ ... ]
> +&i2c1 {
> +	clock-frequency =3D <400000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_i2c1>;
> +
> +	status =3D "okay";
> +
> +	pmic: pmic@25 {
> +		reg =3D <0x25>;
> +		compatible =3D "nxp,pca9450c";
> +		/* PMIC PCA9450 PMIC_nINT GPIO1_IO3 */
> +		pinctrl-0 =3D <&pinctrl_pmic>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <3 GPIO_ACTIVE_LOW>;

[Severity: Medium]
Does the pmic@25 node need a pinctrl-names =3D "default"; property here? Wi=
thout
it, the kernel's pinctrl core will not automatically apply the pinctrl-0 st=
ate
during probe, potentially leaving the interrupt pin floating.

[Severity: High]
Does this interrupt configuration break the delivery of PMIC events?
The GPIO_ACTIVE_LOW flag resolves to 1, which corresponds to
IRQ_TYPE_EDGE_RISING. Since the PCA9450's INTb line is active low, the host
expecting a rising edge will miss the interrupts. Should this be
IRQ_TYPE_LEVEL_LOW instead?

[ ... ]
> +&pcie {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_pcie0>;
> +	reset-gpio =3D <&gpio2 7 GPIO_ACTIVE_LOW>;
> +	vpcie-supply =3D <&reg_pcie0>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Is it correct to enable EVB carrier features like PCIe inside the shared
SOM .dtsi file? Hardcoding baseboard-specific peripheral enablement here
causes pin conflicts and prevents this .dtsi from being reused for other
carrier board designs.

[Severity: Low]
Does this node use a deprecated property? The reset-gpio property is
deprecated by standard PCI bindings which require the generic reset-gpios
plural format.

[ ... ]
> +&usdhc2 {
> +	assigned-clocks =3D <&clk IMX8MP_CLK_USDHC2>;
> +	assigned-clock-rates =3D <400000000>;
> +	bus-width =3D <4>;
> +	cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
> +	pinctrl-names =3D "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-1 =3D <&pinctrl_usdhc2_100mhz>, <&pinctrl_usdhc2_gpio>;
> +	pinctrl-2 =3D <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
> +	vmmc-supply =3D <&reg_usdhc2_vmmc>;
> +
> +	status =3D "okay";
> +};

[Severity: Medium]
Should the usdhc2 (microSD slot) be enabled in the SOM .dtsi? Similar to
PCIe, enabling baseboard-specific features in the shared SoM file breaks
device tree abstraction and forces other carrier boards to inherit this
configuration.

[ ... ]
> +	pinctrl_usb1_vbus: usb1grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14		0x19
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
[ ... ]
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
> +		>;
> +	};
> +
> +	pinctrl_usb1_vbus: usb1grp {
> +		fsl,pins =3D <
> +			MX8MP_IOMUXC_GPIO1_IO14__GPIO1_IO14	0x19
> +		>;
> +	};

[Severity: Low]
Does this code duplicate the pinctrl_usb1_vbus label? The Device Tree
Compiler (DTC) prohibits identically named nodes and duplicate labels at the
same scope level, and this will cause a build failure.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260918195559.1304=
43-1-wigyori@uid0.hu?part=3D2
