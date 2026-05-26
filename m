Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B171922FD
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 03:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779767392; cv=none; b=gtYg/jFaNPHlZZGF/SR2VOR3FUu8gnNedPN5EFWr8wvaA+n4F27v8IHYJBMvfJO6+K2Zd/WARa+vc4L2BDzPFZuraYunD70+dfmxXVL7dT/nkWI5kbOmWDx1vmxeQ+Ygmeysr3oUiolHvnLNDPbfcnYNLogPIfibCMgZNd8uydk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779767392; c=relaxed/simple;
	bh=dDKEz8f+gIiDmp7YrUpq4mVwiK6V0yz2S6OJP9GTAcI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UGpLZtRSv0OCTpnk5a1QEZJ64hxbg0p5bX2s2hpJarfiP+aWxv1J+S2vhKe+Dy0LtHNvAb8Qzt9Kp0QNjOMBUgWv2mksXpFMqfPaKvajTWHBSpYNrxdajnAwI5k6KnpBuoLFvzf9iNMFhPI6988ZTte7+uqr1/w244UIJ3nNpws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xq7zXVYz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xq7zXVYz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B16281F000E9;
	Tue, 26 May 2026 03:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779767391;
	bh=+ULWGYT0LXtyu0w8c/7KKCsnLdphCDHbFDYlpUbfVbE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xq7zXVYzc+svheiHMdSbBFRv9wT+EGnJvyJPC9EV9g95hDBoZ3jUAIGnVahAnDzf1
	 MXzXUBOcO6qdyZPZzuAzc+foH3xZj8Yf/1SAoPp1rs70RtNdBjV0w9Z3BsSbka59d4
	 kMspydstcsqBSQr2TzNXzK+QeobNdJtkysKAKSdRQqgPdE4l651YONdUx9yPtNFlPG
	 Os3guv/ZwVyBNFtadU3ZmzHEvG8NqlBXT6S/i3VHIiZL38kXGdaKt9vZT5nNLoS7JT
	 mQth2W2WJiI2hH/DOoGxKiKmUcxRWBas7dJkm8oealGJNAoKAGExX0EwFt9W38/KI3
	 eQqRn/fHrfhPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/2] i2c: ls2x: Add clocks property parsing and
 adjust bus speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260526031021.32662-3-wanghongliang@loongson.cn>
References: <20260526031021.32662-3-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 03:49:50 +0000
Message-Id: <20260526034950.B16281F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:

New issues:
- [High] Calling `devm_clk_get_optional_enabled()` dynamically inside the h=
ardware initialization function causes unbounded devres memory leaks, unbal=
anced clock enable counts, and potential memory reclaim deadlocks.
- [High] The driver silently ignores `-EPROBE_DEFER` from `devm_clk_get_opt=
ional_enabled()`, failing to defer probe and instead initializing with an i=
ncorrect fallback frequency.
- [High] Unvalidated `div` values from device match data or ACPI properties=
 can cause a division by zero kernel panic during prescaler calculation.
- [Medium] Repurposing the standard "clocks" property as a `u32` integer fo=
r ACPI violates standard device property bindings.
- [Medium] The I2C clock prescaler calculation uses 32-bit arithmetic, whic=
h can overflow if the reference clock is too large.

Pre-existing issues:
- [High] Hardware interrupts are enabled before the IRQ handler is register=
ed, risking unhandled interrupt storms.
--

commit 09494456e295e0b7fa53296c66ae490bc54b296b
Author: wanghongliang <wanghongliang@loongson.cn>

    i2c: ls2x: Add clocks property parsing and adjust bus speed

This commit adds clock property parsing for the i2c-ls2x driver to
adjust the bus speed based on the reference clock and divider values
obtained from device tree or ACPI.

> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> index b475dd27b7af9..6d332e59452d2 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c
[ ... ]
> @@ -107,12 +117,29 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i=
2c_priv *priv)
>  	else
>  		t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
> =20
> +	if (dev_of_node(dev)) {
> +		clk =3D devm_clk_get_optional_enabled(dev, NULL);

[Severity: High]
Does calling devm_clk_get_optional_enabled() during hardware initialization
risk memory leaks and unbalanced clock counts?

ls2x_i2c_adjust_bus_speed() is called from ls2x_i2c_init(), which executes
during probe, resume, and when an I2C transfer times out in
ls2x_i2c_xfer_one().

Calling a devres allocation function on every timeout or resume cycle
allocates new memory and increments the clock enable count each time without
a matching disable, leading to unbounded leaks. Additionally, performing
devres allocations in the transfer path can cause memory reclaim deadlocks.

> +		if (clk && !IS_ERR(clk))
> +			pclk =3D clk_get_rate(clk);
> +		else
> +			pclk =3D LS2X_I2C_PCLK_FREQ;

[Severity: High]
If devm_clk_get_optional_enabled() returns -EPROBE_DEFER, will this code
fail to defer the probe?

By catching the error here and silently falling back to LS2X_I2C_PCLK_FREQ,
the hardware will initialize assuming a 50 MHz clock instead of waiting for
the clock provider to be ready. This could leave the clock unenabled by the
framework and lead to incorrect bus speeds.

> +
> +		div =3D priv->div;
> +
> +		val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;

[Severity: High]
Can 'div' be zero here, leading to a division by zero panic?

If the device is bound manually via sysfs without a matching compatible
string, device_get_match_data() will return NULL, leaving priv->div as 0.

[Severity: Medium]
Will the calculation (pclk * 10) overflow 32-bit arithmetic if the reference
clock rate exceeds approximately 429.5 MHz?

Casting to 64-bit for the multiplication would prevent wraparound.

> +	} else {
> +		if (!device_property_read_u32(dev, "clocks", &pclk) &&

[Severity: Medium]
Does reading "clocks" as a raw 32-bit integer violate standard device
bindings?

In generic device properties and Device Tree, the "clocks" property is
strictly standardized to contain an array of references (phandles) to clock
providers. Overloading this standardized property to store an integer can
cause generic parsing code to fail. Should a standard property like
"clock-frequency" be used instead?

> +		    !device_property_read_u32(dev, "clock-div", &div))
> +			val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;

[Severity: High]
Could a zero value in the "clock-div" ACPI property cause a division by zero
panic here?

> +		else
> +			val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
> +	}
> +
[ ... ]
> @@ -295,6 +322,8 @@ static int ls2x_i2c_probe(struct platform_device *pde=
v)
>  	if (!priv)
>  		return -ENOMEM;
> =20
> +	priv->div =3D (unsigned int)(unsigned long)device_get_match_data(dev);
> +

[Severity: High]
This is a pre-existing issue, but does initializing the hardware before
requesting the shared IRQ risk an unhandled interrupt storm?

ls2x_i2c_probe() currently performs:

	ls2x_i2c_init(priv);

	ret =3D devm_request_irq(dev, irq, ls2x_i2c_isr, IRQF_SHARED, ...);

ls2x_i2c_init() writes CTR_READY_MASK (which includes LS2X_CTR_IEN, bit 6)
to the hardware control register, enabling the device to assert interrupts.

If the device asserts an interrupt immediately on the shared IRQ line, it
will fire before devm_request_irq() completes. Other drivers sharing the IRQ
will return IRQ_NONE, leading to an unhandled interrupt storm that could
cause the kernel to permanently disable the shared IRQ line.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526031021.3266=
2-1-wanghongliang@loongson.cn?part=3D2
