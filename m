Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795608391;
	b=0+WUy2/StNSGWon5MVOzTo4qRoQmyN2KpCvZuo+O3RQ1f9uoo57SKhA4gAOkLRdxCeTU
	 8D+CkL+i45DGHUF2d6WjYg1g4LFgQWX7NFPJCRyN91q4W9VUloKmTcjnQMjDqMPQdAHKy
	 Q5We6/eyKluo/35hTxwVemFzTRECN7NhbKiUGTKq5NJ9JsUGWWpiK6GElL8uIy9E/jCpm
	 XaEuhuYSbGPgAJZE1RhPxgZBweWKsuXGft9l9+BEvZ6+IB40HHz6oQvti6n8dmxActDyd
	 FGNopL+QI7LSGLrFrfAzKsLhNKfufvouS3Xaaq1QerDfndpYmeDgQtS9iP/pKWxAmqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795608391;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pr/D2uQnkV7DEguRqefa5NxldVdKC3hrX9EtLS4udHA=;
	b=AEm9XpXGX7TIA3SvUDLGfgAh4C1XeJqZAABRkm8oIsIwaULeYYAFudlnbCGTmGO4m/de
	 O8JNbbZYvJnBku6wfMErLyKNenlroSKhERtppw8htUyhd+/RU5lMXcgcPsGicnkRc+mXs
	 Awrq9MGkVE2icN/k+fto/TFG9cFokQVIirXhidmOD3o+/fRmfflo07Ptf9Ck1Y6zliKkj
	 HpsHL8FF5O0Y9tXuhRyNNuIhWfEmWw8vXMOcmy3p9Cdj44PWbGswORogxBKNJgTldI/Fr
	 ie12nhQwb0kjOY4oyV6cuZUxPxe1xhkRer/w3D97ww8YhxOl1DXt8wewQpNDeMe2OYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="d/rrm1lf";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5578B606A327
	for <devicetree@vger.kernel.org>; Wed, 25 Nov 2026 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=d/rrm1lf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A61731F000CF;
	Wed, 25 Nov 2026 12:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795608390;
	bh=pr/D2uQnkV7DEguRqefa5NxldVdKC3hrX9EtLS4udHA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/rrm1lffDHyxbbvEOPiCqQO2KsZLcgaCfLe6Yw8aeN7IbMCSQYPCiNf/BZpJyl7u
	 bJCUdPsNP5Dd6/Sm5PF7B2/2SG+pi/g4GjQkASg63AZclSHjLc0Pvdb0xzHRbdIts4
	 ki7/Gz+EzVwCGEg6tORMaxMqQL3uKvzLhDQEUmlA4mOXOOJRKDUK5CYcCSNWfWLhpj
	 4KV1cpcTbpsV9NwjJOD/uope5dYSaDlXjFVipZbQj2lJae/ZIbgraciVjIVNPDOooI
	 0engGlZmMlX0G5b+ngTK9wXw2j676+xXtCgnmITDalkCanGrp1pIgRAqRl2+IVO2bD
	 ytrhM+zBTvWNQ==
Message-ID: <sashiko-outbox-233335@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Firefly AIO-3588Q
Reply-To: sashiko-reviews@lists.linux.dev
To: "Saeed Nourian" <saeednourian82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125114757.654051-3-saeednourian82@gmail.com>
References: <20261125114757.654051-1-saeednourian82@gmail.com>
 <20261125114757.654051-3-saeednourian82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 12:06:30 +0000
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
- [High] arm64: dts: rockchip: missing domain-supply on pd_gpu and
  pd_npu
- [Medium] arm64: dts: rockchip: deprecated snps,reset-* properties on
  gmac0/1
- [Medium] arm64: dts: rockchip: tsadc left disabled and pwm-fan
  unmapped
- [Medium] arm64: dts: rockchip: sdmmc uses broken-cd instead of
  cd-gpios
- [Low] arm64: dts: rockchip: missing GPIO pinctrl for pcie3x4 and PHY
  resets
--

commit 941a7a1be6e86ac4e133cb78a5dcd1d5cdaff5f1
Author: Saeed Nourian <saeednourian82@gmail.com>

arm64: dts: rockchip: Add Firefly AIO-3588Q

This commit adds a devicetree for the Firefly AIO-3588Q carrier board,
which hosts the Firefly iCore-3588Q SoM.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts b/=
arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts
> new file mode 100644
> index 0000000000000..a37f16260beb9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-firefly-aio-3588q.dts

[ ... ]

> +	fan: pwm-fan {
> +		compatible =3D "pwm-fan";
> +		#cooling-cells =3D <2>;
> +		cooling-levels =3D <0 50 100 150 200 255>;
> +		fan-supply =3D <&vcc12v_dcin>;
> +		pwms =3D <&pwm15 0 50000 0>;
> +	};

[Severity: Medium]
Should this board also enable &tsadc and bind &fan to a thermal zone via
cooling-maps?

rk3588-base.dtsi leaves &tsadc disabled, and rk3588-firefly-icore-3588q.dtsi
does not enable it either.  Without &tsadc enabled and cooling-maps
referencing &fan, all seven SoC thermal zones, passive CPU/GPU thermal
throttling, hardware over-temperature shutdown, and automatic fan control
remain inactive.

[ ... ]

> +&gmac0 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy0>;
> +	/*
> +	 * The PHY supplies the RGMII RX delay (rgmii-rxid), so the one in
> +	 * the SoC is disabled; the TX delay still comes from the SoC.
> +	 */
> +	phy-mode =3D "rgmii-rxid";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac0_miim
> +		     &gmac0_tx_bus2
> +		     &gmac0_rx_bus2
> +		     &gmac0_rgmii_clk
> +		     &gmac0_rgmii_bus>;
> +	snps,reset-gpio =3D <&gpio3 RK_PC7 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	/* Reset time is 20ms, 100ms for rtl8211f */
> +	snps,reset-delays-us =3D <0 20000 100000>;
> +	rx_delay =3D <0x00>;
> +	tx_delay =3D <0x47>;
> +	status =3D "okay";
> +};
> +
> +&gmac1 {
> +	clock_in_out =3D "output";
> +	phy-handle =3D <&rgmii_phy1>;
> +	/*
> +	 * The PHY supplies the RGMII RX delay (rgmii-rxid), so the one in
> +	 * the SoC is disabled; the TX delay still comes from the SoC.
> +	 */
> +	phy-mode =3D "rgmii-rxid";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&gmac1_miim
> +		     &gmac1_tx_bus2
> +		     &gmac1_rx_bus2
> +		     &gmac1_rgmii_clk
> +		     &gmac1_rgmii_bus>;
> +	snps,reset-gpio =3D <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
> +	snps,reset-active-low;
> +	/* Reset time is 20ms, 100ms for rtl8211f */
> +	snps,reset-delays-us =3D <0 20000 100000>;
> +	rx_delay =3D <0x00>;
> +	tx_delay =3D <0x4f>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Should the RTL8211F PHY reset properties be placed on the rgmii_phy0 and
rgmii_phy1 child nodes instead of using snps,reset-* on &gmac0 and &gmac1?

snps,reset-gpio, snps,reset-active-low, and snps,reset-delays-us are
deprecated in snps,dwmac.yaml.  In stmmac_mdio_reset(), the driver requests
snps,reset-gpio via devm_gpiod_get_optional() on each MDIO bus reset
without releasing it, which fails with -EBUSY if the MDIO bus is reset more
than once and bypasses phylib per-PHY reset handling.  Moving these to
reset-gpios, reset-assert-us =3D <20000>, and reset-deassert-us =3D <100000=
> on
rgmii_phy0 and rgmii_phy1 lets phylib manage the resets.

> +
> +&gpu {
> +	mali-supply =3D <&vdd_gpu_s0>;
> +	sram-supply =3D <&vdd_gpu_mem_s0>;
> +	status =3D "okay";
> +};

[Severity: High]
Are &pd_gpu and &pd_npu missing domain-supply properties for <&vdd_gpu_s0>
and <&vdd_npu_s0>?

In rk3588_pm_domains[], both RK3588_PD_GPU and RK3588_PD_NPU set
need_regulator =3D true, and rk3588-firefly-icore-3588q.dtsi marks
vdd_gpu_s0 as regulator-boot-on rather than regulator-always-on without
wiring domain-supply on &pd_gpu or &pd_npu.  If panthor probes after unused
boot-on regulators are turned off (or across a driver unbind/rebind), genpd
powers on RK3588_PD_GPU before panthor enables mali-supply, hanging the SoC
as described in f94500eb7328 ("arm64: dts: rockchip: Add GPU power domain
regulator dependency for RK3588").

[ ... ]

> +&pcie3x4 {
> +	reset-gpios =3D <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply =3D <&vcc3v3_pcie30>;
> +	status =3D "okay";
> +};
> +
> +&pinctrl {
> +	hym8563 {
> +		hym8563_int: hym8563-int {
> +			rockchip,pins =3D <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		led_pins: led-pins {
> +			rockchip,pins =3D <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie3 {
> +		pcie3_vcc3v3_en: pcie3-vcc3v3-en {
> +			rockchip,pins =3D <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};

[Severity: Low]
Should &pinctrl also define RK_FUNC_GPIO pin configurations for the
&pcie3x4 reset GPIO (gpio4 RK_PB6) and the two Ethernet PHY reset GPIOs
(gpio3 RK_PC7 and gpio3 RK_PB7)?

Without pinctrl entries and pinctrl-0 references on those nodes, pin muxing
and bias on the reset lines are left at hardware or bootloader defaults.

[ ... ]

> +&sdmmc {
> +	/* card detect does not generate events on this board, poll instead */
> +	broken-cd;
> +	bus-width =3D <4>;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	max-frequency =3D <150000000>;
> +	no-mmc;
> +	no-sdio;
> +	sd-uhs-sdr104;
> +	vmmc-supply =3D <&vcc3v3_sd>;
> +	vqmmc-supply =3D <&vccio_sd_s0>;
> +	status =3D "okay";
> +};

[Severity: Medium]
Could the missing card detect events be caused by inheriting the default
sdmmc_det pin mux from rk3588-base.dtsi instead of using cd-gpios?

In rk3588-base.dtsi, &sdmmc defaults to pinctrl-0 =3D <&sdmmc_clk &sdmmc_cmd
&sdmmc_det &sdmmc_bus4> inside RK3588_PD_SDMMC; once dw_mmc-rockchip
runtime-suspends and powers off RK3588_PD_SDMMC, the controller's internal
sdmmc_det logic can no longer detect card insertions, as noted in
c7a9549ce46e ("arm64: dts: rockchip: Switch microSD card detect to gpio on
Radxa ROCK 5 ITX/5C").  With broken-cd set instead, dw_mci_get_cd() always
reports a card present and polls every second whenever the slot is empty,
repeatedly powering on RK3588_PD_SDMMC and toggling vcc3v3_sd over I2C
while gpio0 RK_PA4 remains muxed to sdmmc_det.  Using cd-gpios =3D <&gpio0
RK_PA4 GPIO_ACTIVE_LOW> and overriding pinctrl-0 to omit &sdmmc_det routes
card detection through the always-on gpio0 controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125114757.6540=
51-1-saeednourian82@gmail.com?part=3D2
