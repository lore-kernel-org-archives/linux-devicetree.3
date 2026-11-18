Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795046000;
	b=MAuZWlwEOGjHAAPr8WK8ut66Rk0lUwCRc4V76biwgZUgnHO+96anrnMS9xvuP7QxkWpP
	 kCHq/7UT31Q42C+07OAgtIHxno0ahNwT0UbyE9RqMUYCclf8qjXcKwxv4B6rFY63DwPPN
	 9n/pAFuDGD05kW6kTA9KZUfZEPLuK5CJGkXnZ5PUPDnokmbA8nKS4xqg5iNDsltOEcWsy
	 e1E8xkgrekv9FonG/l6a0fxvA27+7TnOiu/bcl7Ms726kSstub7zPw/9+kXm0PHV7B3w1
	 VQwA8VZTjcOwGlYjKzG7PU/aQImMt193Tk+uR4nF1yxJtpr3L/Fp1gBCHk4EvjiJf9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795046000;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=NIgGftYM7/SihCmV2tfBBcng3xaSfyHeY5NfTPPV32M=;
	b=mnuMjMFibNn2MhhMW9WEh/dG1dXGitJBFDR6l9ko2e3qI6LCUlnR/W0ZSJdM3BjbfImP
	 W2OA80LumhPyd/e6KPvMWNzjnEVTUsGitWzg1QHmUhcGw3FfHc8bruTbbM+KPzhRCmrqb
	 9qbRJQ4hopaci+hScFeOTAG/yJUDdi+8do4HdOn4KDk/Tx2PRYcxORzCVWSQFFTYxx5Tk
	 Km69s6/2W1x801sgNOw7nsOAQsnWGvsYGr9lolWYffw0Eq4PTHvQKVcRNBYw2rvt2OOwU
	 T6jT493l1SD0QGrj9ZCJrG6/iMhNtZzPff+fG9AG+ciI9IPNe1oP5zLRDTWWDdhwNqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLP8BKyT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BA4606A31C
	for <devicetree@vger.kernel.org>; Wed, 18 Nov 2026 23:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZLP8BKyT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB521F000C4;
	Wed, 18 Nov 2026 23:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795046000;
	bh=NIgGftYM7/SihCmV2tfBBcng3xaSfyHeY5NfTPPV32M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZLP8BKyTGiKapOpJPrChoMz2ANgrCyZk1DUBzBzxWaD/tmt7V6QA1Ke0AJ/dr3lQk
	 w1RF6yHIxtRgLtrlEEw4vV/ZfP5CA3jYKWN5rTXoSJa/NYI9hiKAH3LXezdVdQlTZP
	 KbH4EDGF5j9kJ8h/VslyVdI3qPkNoQAy4HDFDPcMZyIuJVHg9Z35OhMzq3ETjrP8Q8
	 eVoBEuDmDkduJSfqNj2FAGVQhxN72uHwPuflfkgfPbJLMqtvWl4WZ5FlLQ2jLhmQvl
	 cYn4Xv5XaQXYijwqSKOjC7AI/XnXx+3y3qt54Z9fV/GjPvUci/MDe3zkXrDVvQ4Wj5
	 3DbEBtviT2MEQ==
Message-ID: <sashiko-outbox-222218@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] arm64: dts: rockchip: add Forlinx OK3568-C
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Yashin" <dmt.yashin@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-ok3568-c-v3-3-071840643591@gmail.com>
References: <20261119-ok3568-c-v3-0-071840643591@gmail.com>
 <20261119-ok3568-c-v3-3-071840643591@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 23:53:19 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: rockchip: conflicting GPIO polarity in
  vcc1v8_wifi_bt_reg_on
- [Medium] arm64: dts: rockchip: missing assigned-clocks on gmac0/1 in
  rk3568-ok3568-c
--

commit b8a53fc702b227f666755566c4fdee7cf810512c
Author: Dmitry Yashin <dmt.yashin@gmail.com>

arm64: dts: rockchip: add Forlinx OK3568-C

This commit adds a devicetree for the Forlinx OK3568-C carrier board,
which hosts the FET3568-C System on Module.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts b/arch/arm6=
4/boot/dts/rockchip/rk3568-ok3568-c.dts
> new file mode 100644
> index 0000000000000..94f08fdc11433
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-ok3568-c.dts
> @@ -0,0 +1,566 @@

[ ... ]

> +	vcc1v8_wifi_bt_reg_on: regulator-1v8-vcc-wifi-bt-reg-on {
> +		compatible =3D "regulator-fixed";
> +		enable-active-high;
> +		gpios =3D <&gpio3 RK_PD4 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&wifi_reg_on>;
> +		off-on-delay-us =3D <20000>;
> +		regulator-name =3D "vcc1v8_wifi_bt_reg_on";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		startup-delay-us =3D <200>;
> +	};

[Severity: Medium]
Does vcc1v8_wifi_bt_reg_on specify conflicting polarities with both
enable-active-high and GPIO_ACTIVE_LOW?

For regulator-fixed nodes with enable-active-high, of_gpio_quirk_polarity()
emits a runtime warning and strips OF_GPIO_ACTIVE_LOW.  If the hardware
enable signal is active-low, enable-active-high should be dropped so the
regulator does not invert the polarity and keep the WiFi/BT module powered
off; if it is active-high, gpios should use GPIO_ACTIVE_HIGH.

[ ... ]

> +&gmac0 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy0>;
> +	phy-mode =3D "rgmii-id";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus
> +		     &gmac0_clkinout
> +		     &eth0_pins>;
> +	status =3D "okay";
> +};
> +
> +&gmac1 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy1>;
> +	phy-mode =3D "rgmii-id";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac1m1_miim
> +		     &gmac1m1_tx_bus2
> +		     &gmac1m1_rx_bus2
> +		     &gmac1m1_rgmii_clk
> +		     &gmac1m1_rgmii_bus
> +		     &gmac1m1_clkinout
> +		     &eth1m1_pins>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should gmac0 and gmac1 configure assigned-clocks, assigned-clock-parents,
and assigned-clock-rates for RGMII clock output?

On RK3568, rk_gmac_clk_init() does not program the GMAC clock muxes or the
125 MHz base rate in RGMII output mode, and SCLK_GMAC0/1_RGMII_SPEED lacks
CLK_SET_RATE_PARENT so runtime link speed changes only switch dividers on
SCLK_GMAC0/1_RX_TX.  Without assigned-clocks in the devicetree to parent
SCLK_GMAC0/1_RX_TX to SCLK_GMAC0/1_RGMII_SPEED and set SCLK_GMAC0/1 to
125 MHz (via CLK_MAC0/1_2TOP), RGMII clock generation depends on the
bootloader having already configured both clock trees.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-ok3568-c-v=
3-0-071840643591@gmail.com?part=3D3
