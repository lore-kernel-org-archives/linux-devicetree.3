Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 756383DDDB0
	for <devicetree@vger.kernel.org>; Mon,  1 Jun 2026 17:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780334246; cv=none; b=VFCQ5YrjXRnyC+BrcTYYrvRhkLKHANsr/NTworQfdIo+t2wElmsJtfi1zjDGfEZ+IStYI0k84eUE1R5jnuxc0PAwDTPUfaTyTRT51GMfuhp9/VjkPsNEs4IRjOiza4lqIgl7GXsmgPqE3r+6wftCBDGoXSBXdcJGmqkA0x7wkzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780334246; c=relaxed/simple;
	bh=ISnv0ObWqNkg137vT0caKZwVflFtEoHIMVXxJqtVZdU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FiPrx6IlohmSlx+NwP6BHMr7qcSowCEJTTbeH8yv95I2ZK0moOCioohZ3wnxkcQWepQKx8NkHBC4+3fyDl/uw0MlV565aW6AUXBNq3JpdToOHomsHHZIMhe9IHPd+iE2HzzAPUcmEF4vYUaWmHndjNfu/ymt1sNcwpUYRkIjlVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DUE2TgBj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DUE2TgBj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCD11F00893;
	Mon,  1 Jun 2026 17:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780334245;
	bh=rUaR31Aw6ZXaK0XZYjFLaWT/BDPSgtKyGwDTrsW96oE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DUE2TgBjsEpRl4Ctd0dzUXSVrR6xX4H2oeP29dItROJGhJhozS19YqQyP3+WDCtaT
	 PySQbDIDcgakHvJbVz3B8nkx7ICfhKq2G4nP2uziPG49pIRdwtQSOZWhGy4nleeJxL
	 W6ADiM2f8HrALUaQ1jLTTgqUoi8vuLHPNYbUbVqCovKIazn6xfovWTeaRW1ycYvXkP
	 uHIm/yKlksB5IMNdSqUVkdMu7uwylxlcReg+j50foIb6623wudIa6SpHzfUoG9RHO9
	 sdTLOev2bxjjGpxgm8vwLnaX7jwMN9Ydpmi4P7wgRYobaiauNZhKIl6V0BhP3G9LAV
	 Ic4ERa0Yq7phg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V3 6/6] arm64: dts: rockchip: Add Anbernic RG Vita-Pro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601162951.254968-7-macroalpha82@gmail.com>
References: <20260601162951.254968-7-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 17:17:24 +0000
Message-Id: <20260601171724.EBCD11F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] Bluetooth `device-wake-gpios` and `enable-gpios` properties are sw=
apped relative to their physical pin assignments and pinctrl definitions.
- [Medium] Contradiction between the commit message's claimed Wi-Fi/BT modu=
le and the device tree configuration.
- [Medium] Dangerously high battery charge current limit.
- [Medium] Unrealistic ADC keys press threshold (likely raw ADC value inste=
ad of microvolts).
- [Medium] Battery capacity mismatch between commit message and DT.
- [Medium] The SPI joysticks cannot be accessed via userspace because there=
 is no child device node on the SPI bus.
- [Medium] The eMMC (`&sdhci`) node is missing explicit `vmmc-supply` and `=
vqmmc-supply` properties.
--

commit 6ca27e4d6b6c0850a8d0d4f25022dc6c12ca0c24
Author: Chris Morgan <macromorgan@hotmail.com>
Subject: arm64: dts: rockchip: Add Anbernic RG Vita-Pro

This patch adds the device tree for the Anbernic RG Vita-Pro handheld,
based on the Rockchip RK3576 SoC. It includes configurations for the
display, buttons, audio, battery, and various peripherals.

> diff --git a/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts=
 b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
> new file mode 100644
> index 0000000000000..7f703b5c8a298
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts

[ ... ]

> +	adc_keys_home: adc-keys-home {
> +		compatible =3D "adc-keys";
> +		io-channel-names =3D "buttons";
> +		io-channels =3D <&saradc 1>;
> +		keyup-threshold-microvolt =3D <1800000>;
> +		poll-interval =3D <60>;
> +
> +		button-home {
> +			label =3D "HOME";
> +			linux,code =3D <KEY_HOME>;
> +			press-threshold-microvolt =3D <1750>;

[Severity: Medium]
Is this threshold correct? 1750 microvolts (1.75mV) is extremely low and
would be highly sensitive to minor resistance or ground bounce. Was this
intended to be the raw 12-bit ADC value (where 1750 represents ~769mV)
rather than microvolts?

> +		};
> +	};
> +
> +	adc_keys_play: adc-keys-play {
> +		compatible =3D "adc-keys";
> +		io-channel-names =3D "buttons";
> +		io-channels =3D <&saradc 3>;
> +		keyup-threshold-microvolt =3D <1300000>;
> +		poll-interval =3D <60>;
> +
> +		button-play {
> +			label =3D "PLAY";
> +			linux,code =3D <KEY_PLAYPAUSE>;
> +			press-threshold-microvolt =3D <1750>;

[Severity: Medium]
Does this also use a raw ADC value instead of microvolts?

> +		};
> +	};
> +
> +	/*
> +	 * Values from BSP, except for internal resistance which was set
> +	 * to 80 micro ohms which is more likely 80000 micro ohms.
> +	 */
> +	battery: battery {
> +		compatible =3D "simple-battery";
> +		charge-full-design-microamp-hours =3D <8000000>;

[Severity: Medium]
The capacity here is configured to 8000mAh, which contradicts the 5000mAh
mentioned in the commit message. An incorrect capacity can cause battery
fuel gauge drivers to miscalculate the state of charge. Which value is
accurate?

> +		charge-term-current-microamp =3D <300000>;
> +		constant-charge-current-max-microamp =3D <10000000>;

[Severity: Medium]
Is the constant charge current intended to be 10A? While the charger IC
might have a hardware limit, 10 Amps is a 2C charge rate for a 5000mAh
battery, which seems dangerously high. Was this intended to be 1A or 2A?

[ ... ]

> +&sdhci {
> +	bus-width =3D <8>;
> +	full-pwr-cycle-in-suspend;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	status =3D "okay";
> +};

[Severity: Medium]
Does the eMMC node need explicit vmmc-supply and vqmmc-supply properties?
Omitting these forces the MMC subsystem to fall back to dummy regulators,
which triggers kernel warnings and can prevent the driver from executing
necessary power cycles during error recovery.

[ ... ]

> +&spi1 {
> +	num-cs =3D <1>;
> +	pinctrl-0 =3D <&spi1m2_pins>, <&spi1m2_csn0>;
> +	status =3D "okay";
> +
> +	/* SPI controlled MCU for joystick and joystick LEDs. */
> +};

[Severity: Medium]
How are the analog joysticks accessed from userspace? This node configures
the SPI controller but does not instantiate any child devices (such as a
spidev node). Without a child node, the kernel will not register a device,
and no userspace interface will be created.

[ ... ]

> +	bluetooth {
> +		compatible =3D "realtek,rtl8822cs-bt";

[Severity: Medium]
This node defines an RTL8822CS module over UART, but the commit message
indicates the hardware uses an RTL8852BE combo module (which typically uses
PCIe for Wi-Fi and USB for Bluetooth). Could you confirm which module is
correct?

> +		device-wake-gpios =3D <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		enable-gpios =3D <&gpio2 RK_PB5 GPIO_ACTIVE_HIGH>;

[Severity: High]
Are these GPIOs mapped correctly? The pinctrl defined earlier labels
RK_PB6 as bt_reset_gpio and RK_PB5 as bt_wake_gpio. Driving the wake pin
with the enable/reset logic and vice versa will leave the module in reset.

> +		host-wake-gpios =3D <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 =3D <&bt_reset_gpio>, <&bt_wake_gpio>, <&bt_wake_host_irq>;
> +		pinctrl-names =3D "default";
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601162951.2549=
68-1-macroalpha82@gmail.com?part=3D6
