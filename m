Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1B825C80E
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 07:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784272381; cv=none; b=DjXZRl7GLwhBb9DNTeuWSX6UWNP5HB106PORFYmGSKOLbuy6y8Es8mMoqyQwOH1WqR3zhTTGp/rLZSvDxfnkZRKyljW3RoKbms1k+TToxXaR4xiIbqhje5jvTnIJTOoAMV3COk3qX4PgLqUKTbE4JZffd8kW6ADhq2D7fKDqFvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784272381; c=relaxed/simple;
	bh=pivLIBY6iue9cC3FbsyF3y2r/iEvs72YEZX+xXSpiCo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=e2l4gYmOwyW5dqruuZgdRsO6uj9BZsZ9WbalTq1fM+Uj/VKTgvt3kdptnJKF08ZwtECAWYiUsNc+gUq6ymHlTYXVLJXLIvkgb1kAQFBymdVHIxs3jCJO/YP3oXTkAsh2ja4cbVxo9P3vSZu1Q6Q45NcURas1q8PNGODB1EoXis0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DNcxMk3f; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DNcxMk3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF6951F00A3A;
	Fri, 17 Jul 2026 07:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784272380;
	bh=sUkvQHEoyMvcVvUx0pHNkfEPeBB5iCMNzo3TgZN4qfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DNcxMk3f3acv+GooM4biCJDZbRs4yPrlCqloz1SY/5CwUIu0cLyrqVyhOANo3O/OQ
	 HYQMEOx5GnfRjYVxT++lcduOpU0bHVcqIt2zu19mIf8xeCa9z2mufFZiGVsiq0R04J
	 AneLVt7XlQCFBnANRwptfN4vtMOcNFJ8QpfvKVczG0/eYm/YhKYACApXbg+dp1g317
	 g7USaVG1q/zz1unss+20FLqNesK+YyRzxuHAFTXm8oooFv0vqnFJyj9vj992HjsOVk
	 ygBQzyUUk3GoCjIYs8naco9ndF75UX5QiugjP8gQcOSrnwEtzNUzsRNw4pt5Z7LsKt
	 gXbBymganiuOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <gahing@gahingwoo.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260717065903.2629399-3-gahing@gahingwoo.com>
References: <20260717065903.2629399-1-gahing@gahingwoo.com>
 <20260717065903.2629399-3-gahing@gahingwoo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 07:12:59 +0000
Message-Id: <20260717071259.EF6951F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The 25 MHz reference clock `clk_mac_refout` for the YT8531 Etherne=
t PHY is not enabled by the driver in RGMII mode, leaving the PHY without a=
 clock.
- [Medium] DisplayPort Alt Mode VDO advertises all capabilities and reserve=
d bits as 1 (`0xffffffff`).
--

--- Patch [2]: [PATCH v4 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-=
IO ---
commit e58918599e73710e92e762060f9447be7d1a658e
Author: Jiaxing Hu <gahing@gahingwoo.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

This commit adds support for the ArmSoM CM5 (an RK3576 compute module) and
its CM5-IO carrier board. It includes configurations for the RK806 PMIC,
Ethernet MAC, WiFi/Bluetooth, USB, HDMI, and various other peripherals.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> new file mode 100644
> index 0000000000000..40d9be0c69f42
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts

[ ... ]

> @@ -198,22 +198,15 @@ usbc0: usb-typec@22 {
>  			source-pdos =3D
>  				<PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
> =20
>  			altmodes {
>  				displayport {
>  					svid =3D /bits/ 16 <0xff01>;
>  					vdo =3D <0xffffffff>;

[Severity: Medium]
Is this vdo value correct? Setting the DisplayPort Alt Mode VDO to all 1s
(0xffffffff) asserts all possible DisplayPort capabilities and sets reserved
bits to 1.

Could this cause connected hosts to mistakenly detect the board as a
DisplayPort sink (phantom monitor) and fail alt mode negotiations?

>  				};
>  			};

[ ... ]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> index 0000000000000..91d7918c29c5a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

[ ... ]

> @@ -138,20 +138,15 @@ &cpu_l3 {
>  /*
>   * GMAC0 drives an on-module MotorComm YT8531. The PHY has no local crys=
tal, so
>   * it relies on the SoC 25 MHz reference: clk_mac_refout (REFCLKO25M_GMA=
C0_OUT)
>   * has to be named on the gmac node for dwmac-rk to enable it, and
>   * ethm0_clk0_25m_out routes it to the pad.
>   */
>  &gmac0 {
>  	phy-mode =3D "rgmii-id";
>  	clock_in_out =3D "output";
>  	clocks =3D <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
>  		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
>  		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
>  	clock-names =3D "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
>  		      "ptp_ref", "clk_mac_refout";

[Severity: High]
Will the PHY receive its reference clock with this configuration?=20

The commit message notes that the YT8531 lacks a crystal and relies on the
SoC 25 MHz reference output described here as clk_mac_refout. However, the
device tree specifies phy-mode =3D "rgmii-id", and dwmac-rk only parses and
enables clk_mac_refout if the PHY mode is RMII.

Since the clock is ignored in RGMII mode, does the PHY remain unclocked and
break Ethernet initialization?

>  	phy-handle =3D <&rgmii_phy0>;
>  	phy-supply =3D <&vcc_3v3_s3>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717065903.2629=
399-1-gahing@gahingwoo.com?part=3D2
