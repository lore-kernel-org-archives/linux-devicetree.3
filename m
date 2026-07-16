Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18B0A2264B0
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 01:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784166061; cv=none; b=l8VR4MeouxCyU1WrMDxrm+RO981TPJdUKpO0HSES30uz2pnAwPk9PJJvEp2UI/qWb+zrFPlEvQQb+HfFD/gbq6Xh2A7bSKuhHb2mD9azzmbeHWYeo1F37aa63lX02X6vDBUpWCH4zpCC7rp0Qk3HQnZpdzSZoUxR3LnyTjK6VGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784166061; c=relaxed/simple;
	bh=SnrxmSVp1+h0q3yj76AlDja/eZQVVefDE4PyGhY9V5k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WH41zxmCL8fu3MwlhaWtRQrBi1zE6xwFwXCJ5kIlY7vHA7v+GmDszXUhH3ZwnfyIOAkkWCr52UZDBnZ0i7A+N6D8mFL/AxYgEtPmR2WTwVWTyznCvs6c0pHpjkyV2g6SvJGle86czcukioiDZUGFlqD6E3GhkJfAl3AZ/dVgd44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/bVKBlB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/bVKBlB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1966E1F000E9;
	Thu, 16 Jul 2026 01:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784166059;
	bh=x+8a1u5qiC/ZSWIHvmNnp+VoeSqIBipNCLBGMvM1Cq4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/bVKBlB2MtxLExVU3pIMDDc9egc6Hyab2nRPnVeZXE0jRLMu1U+mWWug4V6nsFih
	 ftvcfysauvwmhokoxX4n69fT5iRBWnb97oX4FizeMGPSHbdQ5B98yndUvEcbrTKuNp
	 D/NpZ732H61xaLTE0o6WlzzGb758p80fYQgyWqdaApss9iRitabkaASJ+927i7dy5o
	 +2IcCNjHGb1IZMCoO51WhNYASYeJtdsvP1e7ugFwB00nJiBph9u69AyrsbO6fC/E3B
	 lUL7udxnA11cEHEoIYgRCcnZPBvnAd8Ak6E1ss2x1TUcHL0bLrsvETleCphM0+0UwI
	 FsSQjB9s67mFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jiaxing Hu" <huhuvmb88@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260716012838.2353939-3-huhuvmb88@gmail.com>
References: <20260716012838.2353939-1-huhuvmb88@gmail.com>
 <20260716012838.2353939-3-huhuvmb88@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 01:40:58 +0000
Message-Id: <20260716014059.1966E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Type-C DP Altmode configuration errors (SVID format, missing mode-=
switch, and misplaced SVID)
- [High] Wireless (SYN43752 WiFi/BT) missing child nodes and unreferenced p=
inctrls
- [Medium] ES8388 audio is advertised in the commit message but functionall=
y missing
- [Medium] Missing vmmc-supply and vqmmc-supply for the eMMC
- [Low] The gmac0_rst pinctrl is defined but omitted from &gmac0
--

--- Patch [2]: [PATCH 2/2] arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO =
---
commit 0ff6fbd7a765dd8a49516e69aa071bce9122a7bd
Author: Jiaxing Hu <huhuvmb88@gmail.com>

arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO
   =20
Adds the RK3576-based ArmSoM CM5 compute module and its CM5-IO carrier
board. This includes support for the RK806 PMIC, HYM8563 RTC, eMMC,
GMAC, SYN43752 WiFi/BT, HDMI, PCIe, and USB.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch=
/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts

[ ... ]

> +&i2c0 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&i2c0m1_xfer>;
> +
> +	es8388: es8388@10 {
> +		#sound-dai-cells =3D <0>;
> +		compatible =3D "everest,es8388", "everest,es8323";
> +		reg =3D <0x10>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&sai1m0_mclk>;
> +		status =3D "disabled";
> +	};

[Severity: Medium]
The commit message mentions adding ES8388 audio support, but the node is
explicitly set to disabled here.=20

Is this board missing a sound card node (like simple-audio-card) or I2S
integration to make the audio codec functionally available?

[ ... ]

> +				altmodes {
> +					#address-cells =3D <1>;
> +					#size-cells =3D <0>;
> +
> +					altmode@0 {
> +						reg =3D <0>;
> +						svid =3D <0xff01>;

[Severity: High]
Does this property format result in a 32-bit property being created?

When fwnode_property_read_u16() reads this, it will extract the first two
bytes, which might evaluate to an invalid SVID of 0 rather than 0xff01.

Should this be specified as a 16-bit property, such as:
svid =3D /bits/ 16 <0xff01>;

> +						vdo =3D <0xffffffff>;
> +					};
> +				};

[ ... ]

> +&usbdp_phy {
> +	status =3D "okay";
> +	orientation-switch;
> +	svid =3D <0xff01>;
> +	sbu1-dc-gpios =3D <&gpio4 RK_PC4 GPIO_ACTIVE_HIGH>;
> +	sbu2-dc-gpios =3D <&gpio4 RK_PC5 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does the Rockchip USB/DP PHY driver expect an svid property at this level?

Also, is this node missing the mode-switch; boolean property? Without it,
the PHY driver might fail to register as a Type-C mux, preventing DP Altmode
from negotiating successfully.

> +
> +	port {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;

[ ... ]

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi b/arch/a=
rm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi

[ ... ]

> +&gmac0 {
> +	phy-mode =3D "rgmii-rxid";
> +	clock_in_out =3D "output";
> +	clocks =3D <&cru CLK_GMAC0_125M_SRC>, <&cru CLK_GMAC0_RMII_CRU>,
> +		 <&cru PCLK_GMAC0>, <&cru ACLK_GMAC0>,
> +		 <&cru CLK_GMAC0_PTP_REF>, <&cru REFCLKO25M_GMAC0_OUT>;
> +	clock-names =3D "stmmaceth", "clk_mac_ref", "pclk_mac", "aclk_mac",
> +		      "ptp_ref", "clk_mac_refout";
> +	tx_delay =3D <0x21>;
> +	rx_delay =3D <0x00>;
> +	phy-handle =3D <&rgmii_phy0>;
> +	phy-supply =3D <&vcc_3v3_s3>;
> +	snps,reset-gpios =3D <&gpio2 RK_PB3 GPIO_ACTIVE_LOW>;
> +	snps,reset-delays-us =3D <0 20000 100000>;
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&eth0m0_miim
> +		     &eth0m0_tx_bus2
> +		     &eth0m0_rx_bus2
> +		     &eth0m0_rgmii_clk
> +		     &eth0m0_rgmii_bus
> +		     &ethm0_clk0_25m_out>;

[Severity: Low]
Is &gmac0_rst missing from this pinctrl-0 list?=20

The gmac0-rst pinctrl is defined later in this file to configure the PHY re=
set
pin without pull resistors. Although snps,reset-gpios drives the pin, missi=
ng
the pinctrl assignment leaves the configuration as dead code and might resu=
lt
in undefined pin states during boot or sleep.

> +	status =3D "okay";
> +};

[ ... ]

> +/* eMMC: on-module, HS400 200 MHz with enhanced strobe. */
> +&sdhci {
> +	bus-width =3D <8>;
> +	full-pwr-cycle-in-suspend;
> +	max-frequency =3D <200000000>;

[Severity: Medium]
Are vmmc-supply and vqmmc-supply required for this node?

By specifying full-pwr-cycle-in-suspend without defining the regulator supp=
lies,
the MMC subsystem cannot actively perform the requested power cycle. This m=
ight
fall back to a dummy regulator and cause improper suspend/resume behavior.

> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	/delete-property/ supports-cqe;
> +	status =3D "okay";
> +};
> +
> +/* SDIO: SYN43752 WiFi, power-sequenced by sdio_pwrseq, clock from HYM85=
63. */
> +&sdio {
> +	bus-width =3D <4>;
> +	cap-sdio-irq;

[Severity: High]
Is a WiFi child node missing here to configure out-of-band interrupts?

Without the child node, the wifi_host_wake_irq pinctrl defined later is
unreferenced, which might break host-wake interrupt functionality.

> +	disable-wp;
> +	keep-power-in-suspend;
> +	mmc-pwrseq =3D <&sdio_pwrseq>;
> +	no-sd;
> +	no-mmc;
> +	non-removable;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc_3v3_s3>;
> +	vqmmc-supply =3D <&vcc_1v8_s3>;
> +	wakeup-source;
> +	status =3D "okay";
> +};
> +
> +/* UART4: Bluetooth (SYN43752). */
> +&uart4 {
> +	pinctrl-0 =3D <&uart4m1_xfer &uart4m1_ctsn &uart4m1_rtsn>;
> +	pinctrl-names =3D "default";
> +	uart-has-rtscts;
> +	status =3D "okay";
> +};

[Severity: High]
Should there be a bluetooth child node added to this UART configuration?

Without it, the Bluetooth driver cannot probe, and the bt_reg_on pinctrl
defined below remains unused, preventing the chip from being taken out of
reset.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260716012838.2353=
939-1-huhuvmb88@gmail.com?part=3D2
