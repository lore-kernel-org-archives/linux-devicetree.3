Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055CC456DEC
	for <devicetree@vger.kernel.org>; Tue, 28 Jul 2026 15:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785252473; cv=none; b=Ju/ZofdDKySL7U5EVbDqjKldGYNwZUYMrNc2lultQUkIFhquhT0KJGrWaRuus0dq04dqKPxXS9xIr9aWhcptRbVRVI/NuZJys9EnKGj5bySWVE+LfU2Md51zmWgP6NLMK04BWdxqtmmSkBFHMG8NgxzMpu1+ebWgzImNKUZvaeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785252473; c=relaxed/simple;
	bh=1/bjjvbTlUOBq/FB3uB44r9mQottnrhB8wLHlD9wlo8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WFH0G6gdoTv0jdAwzYUzsExPOpVS7pX+qGG8nT/zmfvrwmFfUf+nRToYnylZebLWYHJMQF0+RONaU2mMncUupG+SlOapEOsdNXhNIUgY8lg/HhXlwPuGeos3y4jc4qxWAC7gIZXLbQrEh0VE1nVkspmECmugWnUdi8+9eFHpHIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hzxT5UHC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hzxT5UHC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8436E1F000E9;
	Tue, 28 Jul 2026 15:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785252471;
	bh=W8w/owoiNELu2CkqU6dxEn7OSV6A6lF/E01dxAwiJKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hzxT5UHCThGccjTsbnhRJ3BEtA6x5sh1En2u95HNcHxh3m4M/BWyu27xdesxHEg+m
	 GBLrXfBHZhBD6Hn9u1mNEY0VFu4etzd/6dWEebh4Dp5SzmX3qPxbOpI4f50mx0a7dZ
	 j8c6D2lpN+un9V3exR6GMmuhLVj7ttRNLWCBeydfl4nOAM7EsoeiFQatSprnMUaDpi
	 qpVP8t1fRBuTqMjzcNPnM0B2CEC603Xk7/3rCeuPU3WGXJMJWB+WDHQ/+Bai+mQQ98
	 7A/vhSEtvUzVKQL51YaMjXZXYPUAXIKneNj0V4bIrMifmMBKaTe21POemB/8njIs5J
	 XnugZ2X5j+n/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alberto Robazza" <robazzalberto@gmail.com>
Cc: linux-amlogic@lists.infradead.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260728151636.236393-4-robazzalberto@gmail.com>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-4-robazzalberto@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 15:27:50 +0000
Message-Id: <20260728152751.8436E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware / Pin Multiplexing Conflict on GPIOX_16
- [Medium] Logic Error / Device Tree Overrides (Failed LED Rename)
--

--- Patch [3]: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Z=
ora P1 ---
commit a86fe3a994f708a5d2fc9e72b435f89e92f8a493
Author: Alberto Robazza <robazzalberto@gmail.com>

arm64: dts: amlogic: add support for Orbbec Zora P1

The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
BCM4345C5 Bluetooth over UART_A).

> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/ar=
m64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> index 0000000000000..d003582fd9e95
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

[Severity: Medium]
Will this still result in the LED being named n2:blue in sysfs?

Since this node inherits from meson-g12b-odroid-n2.dtsi, it looks like the
original label property might still be present. Because led_compose_name()
in drivers/leds/led-core.c prioritizes the label property over function and
color, the inherited label may bypass these new properties.

Would we need to add /delete-property/ label; here to ensure the new color
is properly reflected in the sysfs name?

[ ... ]

> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks =3D <&wifi32k>;
> +		clock-names =3D "ext_clock";
> +	};

[ ... ]

> +&pwm_ef {
> +	status =3D "okay";
> +	pinctrl-0 =3D <&pwm_e_pins>;
> +	pinctrl-names =3D "default";
> +};

[Severity: High]
Can this cause a pin multiplexing conflict?

It appears GPIOX_16 is requested as a static GPIO reset line for
sdio_pwrseq above, but pwm_ef also requests pwm_e_pins, which maps to the
exact same GPIOX_16 pin for the 32kHz clock output.

Could this cause the pinctrl subsystem to reject the secondary request with
-EBUSY during boot, or potentially force the pin into conflicting
electrical states?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728151636.2363=
93-1-robazzalberto@gmail.com?part=3D3
