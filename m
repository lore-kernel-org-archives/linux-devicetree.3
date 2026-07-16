Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BC523909BC
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 07:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784185949; cv=none; b=P1aYTvhhuICPECO89gqGFAswJaFhy2AhRfjRe/WtoO9MuCF7aze0gISRaBXx+NnXUCmECRrJRNrtFEVj4TUWqoRi+5T5CuBzK1Zh69OQTdkxczea9OzYP1MX5K6slQnUNgnu7iy0BLc6twWfgQyMnnLWYsirSRSmCcZRGShQrh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784185949; c=relaxed/simple;
	bh=AZ99Xd9xDztq5w3kJ0tNUy09aof8dGc+ko2C/fQGBR4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NWpPDJdNFVq9y+EaXlyHP2MVJLJzV7lqajggb9nCyquFN3gN+ejkPwpk27KKsE0h3vTlojEJUtyQBiRtw/vltD+hJ5XnfX4W99AZGigCyKrz6jv8ArzUMFB24dXFHQtsDf/lGnRCmA29qnX/Wc0pzJiT8VhNCwZsPUMdGcc7wmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FIGirt86; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FIGirt86"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FE301F000E9;
	Thu, 16 Jul 2026 07:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784185936;
	bh=CyaIY1GZ/3tgixuhpd20016EA/mZhYFme1Jfcu2vKGg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FIGirt86c+8C+MBltXs1RHRflbTvMIYMFGkINkySYk7GbxOQi6SkRN+i5EC9fxRSz
	 jXiSEklgfN7pk+sSilNVZD6K4YwkcAgBjswfH3QBueZwNv3aRWQ7kFbm0+SxaFlWZN
	 KPJAFoRY9yYSxXkB1DQr5svhiNwZrNoRiPleWFqgGVH1BfFfUNJMvgSSlOOVIvX46H
	 JR+Dyg5ncvzb+9FXRpUE9OAfg97gUWPC/h4IZXLdHQuuuvsqvH2ljKiDM5e0YRI1Db
	 EH3eR4w33UoPko2vpbjMMvEN4tnkqj3FfBrOQIonnLVACVIxziDFk3cqWBhpLVtI2T
	 Ym5jLBCrtNGtQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <a86b8b22-6216-4926-a82f-9d4bd15cc397@smtp-relay.sendinblue.com>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
 <a86b8b22-6216-4926-a82f-9d4bd15cc397@smtp-relay.sendinblue.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 07:12:15 +0000
Message-Id: <20260716071216.3FE301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The 25 MHz reference clock output (`clk_mac_refout`) for the cryst=
al-less motorcomm YT8531 PHY will remain disabled because the `dwmac-rk` MA=
C driver ignores it for RGMII interfaces, leading to MDIO timeouts and a no=
n-functional PHY.
- [Low] The ES8388 audio codec is claimed to be supported on I2C0 by the fi=
le header and block comments, but its node implementation is entirely missi=
ng.
- [Low] Use of deprecated 'gpio' property instead of 'gpios' in regulator-f=
ixed node.
--

--- Patch [2]: [PATCH v2 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit e75134401985ec8dc82c1bb4f3f58610d1d03afd
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

Add the ArmSoM CM5, an RK3576 compute module (rk3576-armsom-cm5.dtsi),
and its CM5-IO carrier (rk3576-armsom-cm5-io.dts).

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> new file mode 100644
> index 0000000000000..79a903585197c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts

[ ... ]

> +	/* PCIe 3.3 V for the M.2 slot, gated by GPIO0 PC3. */
> +	vcc_3v3_pcie: regulator-vcc-3v3-pcie {
> +		compatible =3D "regulator-fixed";
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pcie_pwr_en>;
> +		regulator-name =3D "vcc_3v3_pcie";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		enable-active-high;
> +		gpio =3D <&gpio0 RK_PC3 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Does this violate the regulator-fixed device tree binding schema? The schema
expects the gpios property instead of the deprecated gpio property, which m=
ay
trigger dtbs_check warnings.

> +		startup-delay-us =3D <5000>;
> +		vin-supply =3D <&vcc_5v0_sys>;
> +	};

[ ... ]

> +/*
> + * I2C0: ES8388 audio codec @ 0x10, FUSB302 USB-C PD controller @ 0x22.
> + * Pinctrl i2c0m1 (GPIO0 PC4 SCL / GPIO0 PC5 SDA).
> + */
> +&i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0m1_xfer>;
> +
> +	usbc0: usb-typec@22 {

[Severity: Low]
This isn't a bug, but the block comment mentions the ES8388 audio codec at
address 0x10, yet the node isn't implemented here. Could this cause confusi=
on
for anyone attempting to use the audio functionality?

> +		compatible =3D "fcs,fusb302";
> +		reg =3D <0x22>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> index 0000000000000..4612b7e1d6e8a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

[ ... ]

> +/*
> + * GMAC0 drives an on-module MotorComm YT8531. The PHY has no local crys=
tal, so
> + * it relies on the SoC 25 MHz reference: clk_mac_refout (REFCLKO25M_GMA=
C0_OUT)
> + * has to be named on the gmac node for dwmac-rk to enable it, and
> + * ethm0_clk0_25m_out routes it to the pad.
> + */
> +&gmac0 {
> +	/* The RX delay is added by the PHY, the TX delay by the MAC below. */
> +	phy-mode =3D "rgmii-rxid";
> +	clock_in_out =3D "output";
> +	clocks =3D <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
> +		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
> +		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
> +	clock-names =3D "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
> +		      "ptp_ref", "clk_mac_refout";

[Severity: High]
Will the 25 MHz reference clock output remain disabled here? The dwmac-rk
driver (in drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c) only parses and
enables clk_mac_refout if the phy-mode is exactly RMII.

Since the mode is configured as rgmii-rxid, the MAC driver will ignore the
clock. Additionally, neither the generic PHY framework nor the motorcomm dr=
iver
automatically enable clocks specified in the PHY node before the MDIO bus s=
can,
which could lead to MDIO timeouts and a non-functional Ethernet interface.

> +	tx_delay =3D <0x21>;
> +	rx_delay =3D <0x00>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716065548.2466=
198-1-gahing@gahingwoo.com?part=3D2
