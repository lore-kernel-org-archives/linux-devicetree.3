Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 052A5469828
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785348000; cv=none; b=ca+ljEzCut6WkO5V2q+B2UYbyA6+GxFUKbx3XufJ9GfZH6ZiIKmwW9dBLqQBx6LE7ywRsRyTdeZGp+ut4OfecdyOeLWoPhwI23rWrPfsFghXNUJRcCVWGMDVmGqeEhH2+ZLwRcUAOAn4HWYe/bf7qC/Usd4XkI9gfCAy0p+16M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785348000; c=relaxed/simple;
	bh=PFjYtGsVWcVPmrKY00WgdQvssom7EfPHrYeryBVZwM4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IJqXQRupsdGy5eFeedV9nmuFRAFBPPNRTyPZllaAEoIHMX5DHOcBcr7IaWzQAdTh9Az1fufB3ePx3HKKEuwPS8MbTPU4NG2RwLX8WirOyCLbs/k/zh5CR7CJrnvFnAISCzAadcEkEUr5QvpsPxKZeGMTZDfStir7I6efOgMGRKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k0TlBh85; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k0TlBh85"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B772F1F000E9;
	Wed, 29 Jul 2026 17:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785347996;
	bh=Afr8AYMx3BMn2gSwsRKx+oiaoVXcclqbOn2L0f9Bohs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k0TlBh850067w6GKBvF0eJQhok/oWcwB7gCBx3JSKxmovtZIDAfdvZ/96oXuq7jiX
	 EyQiTuzDC0EyUcjNxNcYZ5OplID+bhCpgPS6w4hAnBp/6xHsirjcEb96HqVPIC36kx
	 doOZ5ckF5RiD1oMkrNp88NpeEviAsW+Y6kvJP5bSHpMj1+kCbeSrsl6K1hXH64chPa
	 lWZnuSAQJ+A3cBIQcD39McX5nMkxPMJ8vh+3LhwLlCJHQo1taEI+a64bM1K9s/4Lc2
	 q5QWaxEyeeQcYztm77vOM7W3gaFTKVSQD6abZ4GJ5sUm5DylHp1bF2cDlxTh/aZoZo
	 2an1kMHsQOtug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, neil.armstrong@linaro.org, linux-amlogic@lists.infradead.org
In-Reply-To: <20260729175134.92909-4-robazzalberto@gmail.com>
References: <20260729175134.92909-1-robazzalberto@gmail.com>
 <20260729175134.92909-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 17:59:55 +0000
Message-Id: <20260729175955.B772F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Pin multiplexing conflict on GPIOX_16 between Wi-Fi reset and PWM =
clock.
- [Low] The LED node fails to override the legacy 'label' property, resulti=
ng in incorrect sysfs naming.
--

--- Patch [3]: [PATCH v5 3/3] arm64: dts: amlogic: add support for Orbbec Z=
ora P1 ---
commit 92879b64fc9510d716492c86c79ec3e7f0eaad2f
Author: Alberto Robazza <robazzalberto@gmail.com>

arm64: dts: amlogic: add support for Orbbec Zora P1

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A).
According to the original Linux dts, the board is a modded version
of the ODROID-N2, with Amlogic A311D instead of the original S922X
and WiFi and Bluetooth support.

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/ar=
m64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts

[ ... ]

> +	leds {
> +		/* Status led on Zora is actually green, same pin as N2, but reversed =
polarity */
> +		led-blue {
> +			function =3D LED_FUNCTION_STATUS;
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			gpios =3D <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
> +		};
> +	};

[Severity: Low]
Is this led-blue node missing a /delete-property/ for the label?

The device tree includes meson-g12b-odroid-n2.dtsi which defines a label
property for led-blue. When the LED subsystem parses this in
led_parse_fwnode_props(), it reads the inherited label and returns
immediately, ignoring the newly added color and function properties.

Will this cause the LED to appear as 'n2:blue' in sysfs instead of the
intended color-based name?

> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks =3D <&clock_32768>;
> +		clock-names =3D "ext_clock";
> +	};
> +
> +	clock_32768: clock-32768 {
> +		compatible =3D "pwm-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <32768>;
> +		pwms =3D <&pwm_ef 0 30518 0>;
> +	};
> +
> +	sound {
> +		model =3D "ZORA-P1";
> +	};
> +};
> +
> +&pwm_ef {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&pwm_e_pins>;
> +	pinctrl-names =3D "default";
> +};

[Severity: High]
Does this pin configuration create a multiplexing conflict on GPIOX_16?

The sdio_pwrseq node requests GPIOX_16 as a standard GPIO for the reset
sequence. However, pwm_ef requests the pwm_e_pins pinctrl group. Based on
drivers/pinctrl/meson/pinctrl-meson-g12a.c, pwm_e_pins maps directly to
GPIOX_16.

Since the pinctrl subsystem prevents concurrent claims of the same pin for
different functions, will one of these initializations fail and prevent
Wi-Fi from working?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729175134.9290=
9-1-robazzalberto@gmail.com?part=3D3
