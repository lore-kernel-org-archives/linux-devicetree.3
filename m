Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F663E51C5
	for <devicetree@vger.kernel.org>; Mon, 12 Oct 2026 12:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791807357; cv=none; b=tUIuvaj4CHt7hrrTcJCnSI33VFH0NPYTKqWPppNA/tqFCZ4WBKh5loZJgojYrM+K4Twy8D+Z03owlyMWglFykU849MWQzRjefunyc1dDao7/qCGgRlm98nzKWCTXWI8JPDpLcNI9W51aZZchYx3wJsLgY9EfNBiiFwEdo0Ml0jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791807357; c=relaxed/simple;
	bh=IAU3jT9rNgTCZKX0PllZrbfXz9MPpVra82z4mY4kH3w=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=qetkRTpjg6chIzLXiTe+KvwWGzECcG0NdJG7qlKcQWjUXs6NyWARYcgBbq1jHMhPDMHtlAITIarjEp1ipUvWHw2Gz1w/Py9rew0kKjvTWLcxgeGQb5BzPk0XiZQgeZ0v9bsBi4l8iHePndU3yFe+dMPHKs89jYAqtdHT/mEnQOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLj73O9k; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLj73O9k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE3E1F0089B;
	Mon, 12 Oct 2026 12:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791807355;
	bh=Rj6LgDhjRI60e5ZxiiDXMl4ARrhybZ799mEEt+Qc6lo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VLj73O9kCLJpbWGUNrPxNrgTwu6HBcpQ7MkLevio4hE82zCKm1cmGn5G3FnfZmaNu
	 SaiHgLfwZ+CWpv6YcuNNbkUQyjkkutCWx3aZRnOYceqq/CESmjiPigIaqD7MNUTZ9+
	 bdhEPNtuCtJKK1TpOe01DtQOeOxhneCXSdQy8Z7qZsx68ba2e1r3RY0m/EFLqWuycT
	 nzKGZwJobKxsSQ/BYVPwEd+iH405YBeRt+t7mqqQeF4nVPbM3gjIXEROLmp7NQMxrF
	 zMc8M+78T7iqWV5VcQHpxDWc09LWtymO11XyNS46gJKEnT9XR7mY/QWhnld+wFagbb
	 DBBUO2Ma3pmGg==
Message-ID: <sashiko-outbox-168077@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] arm64: dts: apple: t8140: Add pinctrl nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yureka Lilian" <yureka@cyberchaos.dev>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-4-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
 <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-4-6c757966a99e@cyberchaos.dev>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 12 Oct 2026 12:15:54 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] pinctrl: apple: KASAN slab-out-of-bounds read during regmap initia=
lization
- [High] pinctrl: apple: NULL pointer deref in apple_gpio_set_reg due to la=
zy regmap init
--

commit cd1bf71ed5d4ae5b51b2eed6ad8a3f10605beb2b
Author: Yureka Lilian <yureka@cyberchaos.dev>

arm64: dts: apple: t8140: Add pinctrl nodes

This commit adds the pin controller nodes present on the Apple Silicon T8140
(A18 Pro) SoC. It introduces the new apple,t8140-pinctrl compatible nodes
like pinctrl_nub and pinctrl_ap, which are prerequisites for enabling the
I2C and PCIe controllers.

> diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/a=
pple/t8140.dtsi
> index 150d91bdf6fcc..339a6b4f283d2 100644
> --- a/arch/arm64/boot/dts/apple/t8140.dtsi
> +++ b/arch/arm64/boot/dts/apple/t8140.dtsi

[ ... ]

> @@ -162,6 +169,29 @@ aic: interrupt-controller@301000000 {
>  			power-domains =3D <&ps_aic>;
>  		};
> =20
> +		pinctrl_nub: pinctrl@3081f0000 {
> +			compatible =3D "apple,t8140-pinctrl";
> +			reg =3D <0x3 0x081f0000 0x0 0x4000>;
> +			power-domains =3D <&ps_nub_gpio>;
> +
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&pinctrl_nub 0 0 30>;
> +
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 473 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 474 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 475 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 476 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 477 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 478 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 479 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			apple,npins =3D <30>;
> +		};
> +

[Severity: High]
This problem wasn't introduced by this patch, but does adding this node with
npins < 512 trigger a KASAN slab-out-of-bounds read in the driver?

When devm_gpiochip_add_data() is called during probe, gpiolib allocates
a 1-word valid_mask for the 30 pins. When get_direction() calls
apple_gpio_get_reg(), it triggers a lazy regmap initialization via
devm_regmap_init_mmio().

Because the driver statically sets num_reg_defaults_raw =3D 512 and uses
REGCACHE_FLAT, regcache_hw_init() iterates 512 times, calling
apple_gpio_readable_register() for each index:

drivers/pinctrl/pinctrl-apple-gpio.c:apple_gpio_readable_register() {
	...
	return gpiochip_line_is_valid(&pctl->gpio_chip, reg / 4);
}

Will this pass an unconstrained register index up to 511 directly to
gpiochip_line_is_valid(), causing a deterministic KASAN slab-out-of-bounds
read on the 1-word valid_mask?

If the out-of-bounds read returns 1, could the driver also attempt to read
non-existent hardware registers, triggering unhandled Data Aborts or SError=
s?

[ ... ]

> @@ -179,6 +209,96 @@ wdt: watchdog@3082b0000 {
>  			interrupts =3D <AIC_IRQ 507 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20

[ ... ]

> +		pinctrl_ap: pinctrl@31a000000 {
> +			compatible =3D "apple,t8140-pinctrl";
> +			reg =3D <0x3 0x1a000000 0x0 0x100000>;
> +			power-domains =3D <&ps_gpio>;
> +
> +			gpio-controller;
> +			#gpio-cells =3D <2>;
> +			gpio-ranges =3D <&pinctrl_ap 0 0 216>;
> +			gpio-reserved-ranges =3D <134 1>;
> +
> +			interrupt-controller;
> +			#interrupt-cells =3D <2>;
> +			interrupt-parent =3D <&aic>;
> +			interrupts =3D <AIC_IRQ 263 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 264 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 265 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 266 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 267 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 268 IRQ_TYPE_LEVEL_HIGH>,
> +			             <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			apple,npins =3D <216>;
> +		};

[Severity: High]
Does exposing these new pinctrl devices to consumers lead to a NULL pointer
dereference in apple_gpio_set_reg() due to lazy regmap initialization?

drivers/pinctrl/pinctrl-apple-gpio.c:apple_gpio_pinctrl_probe() {
	...
	pctl->pctldev =3D devm_pinctrl_register(&pdev->dev, &pctl->pinctrl_desc, p=
ctl);
	...
}

Because the pinctrl device is exposed to consumers early before groups,
functions, and the regmap are initialized, what happens if a consumer driver
probes concurrently and requests pins during this window?

drivers/pinctrl/pinctrl-apple-gpio.c:apple_gpio_set_reg() {
	...
	regmap_update_bits(pctl->map, REG_GPIO(pin), mask, value);
	...
}

Will apple_gpio_pinmux_set() call apple_gpio_set_reg() and unconditionally
dereference the uninitialized (NULL) pctl->map, causing a kernel panic on b=
oot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261012-apple-a18-=
pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev?part=3D4
