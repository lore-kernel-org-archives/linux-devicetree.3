Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589D239E80
	for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 12:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784637520; cv=none; b=fcQPbgl1+JzVJWiJsNI/muLs6voXDL1cqsHSlpK+L95Xh32EYS+Usz8l+glKKoRx1uSfAStK4AvAQx5lCBlA2DJrWpdiC6IXYV1pO7o2WleU/6CVwmnxKZjfxKqNLes/LEdr5xAm5xQ1d+bnLy4EoA4ZdpL3ovUJKZ8hBWRMZO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784637520; c=relaxed/simple;
	bh=rDMRtVuHHWipzCxHL1xTl46YIBw2Y7V4adheHFtsJOk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wxmzm4Dx1P3kSvkmGoY6ztxsNiI/KZaqt/oqlKuzzj1OeakG8glJlA05e7mt/1NN6xRqxQI9cAKi5yUhWS5eHfc/XN/NBWkyVW7vdaFdr4VvV6sFo3CDIvVup5r2+lBYrN9w2eWgoG/QycBCjGOZrju+OtxT9HtMvU7qgs2lztE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blMpuF30; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blMpuF30"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79B81F000E9;
	Tue, 21 Jul 2026 12:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784637519;
	bh=fOaN2z8EnBWbkqx5vDWplxNXeKW0iNM2wfH/Bh29qIY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=blMpuF30FANYwzopMcyMhPZpLOPo+ZNh8WYVXrqsdIu9yJ6VneHx16lCuPG3FaTHy
	 GCgIvKxzLtYsdBqmzIgMAb4p+tZ8nMtQX1VKaCAlbqyD6+ul67UYFungGPl4uhvAMv
	 wArCXk/QR30ZLSPF37KmuOydynaJDVBSdH/m88J9NN8pYAjYzFmPanEE8czPQviIfe
	 iYAQEL18duCQkguTZuaxVjlHb8w1e7TudkqYnBh9aILRqeIT6ZGffK2tdHeliGe8Pi
	 A/VhP2XWVcDreA1skRY/FvNvbsr1s1kxcOMWz0q1Q9ki2JR8inCv5yjMOrV99+JLIi
	 ecgEuvadIBbPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 2/2] i2c: ls2x: Add clocks property parsing and
 adjust bus speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260721122604.12717-3-wanghongliang@loongson.cn>
References: <20260721122604.12717-1-wanghongliang@loongson.cn>
 <20260721122604.12717-3-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 12:38:38 +0000
Message-Id: <20260721123838.C79B81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] 32-bit arithmetic overflow in prescaler calculation can cause a di=
vide-by-zero kernel panic.
- [High] Calculating the prescaler `val` can underflow to -1 and wrap to 65=
535, causing the I2C bus to stall.
- [Medium] Abuse of standard 'clocks' property name to pass an integer freq=
uency in ACPI.
--

--- Patch [2]: [PATCH v8 2/2] i2c: ls2x: Add clocks property parsing and ad=
just bus speed ---
commit 6ae7434ddbd04758b9a4e167725900c5fa4d51c1
Author: Hongliang Wang <wanghongliang@loongson.cn>

i2c: ls2x: Add clocks property parsing and adjust bus speed

The i2c-ls2x driver supports dts and acpi parameter passing.
In dts, uses clock framework, by parsing clocks property to
get i2c bus reference clock, and define the div of reference
clock by device data.
In acpi, by passing clocks property to describe i2c bus reference
clock and clock-div property to describe the div of reference clock.

> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> index b475dd27b7af9..25f8301ae14fe 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c

[ ... ]

> @@ -107,12 +116,13 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i=
2c_priv *priv)
>  	else
>  		t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
> =20
> +	val =3D (priv->pclk * 10) / (priv->div * t->bus_freq_hz) - 1;

[Severity: High]
Can this calculation overflow using 32-bit arithmetic?

If the numerator (priv->pclk * 10) exceeds roughly 429.49 MHz, it will
overflow. Additionally, if an ACPI table specifies a clock-div and bus_freq=
_hz
such that (priv->div * t->bus_freq_hz) is exactly a multiple of 2^32, the
denominator could silently wrap to 0, resulting in a divide-by-zero panic.

[Severity: High]
Could this calculation also underflow to -1 if the requested bus frequency
is higher than what the reference clock supports?

If (priv->pclk * 10) is less than (priv->div * t->bus_freq_hz), the integer
division evaluates to 0. Subtracting 1 would underflow to -1, which then
wraps to 65535 when cast to the u16 val. This maximum prescaler value would
slow the i2c bus down to a crawl without returning an error.

[ ... ]

> @@ -304,6 +315,29 @@ static int ls2x_i2c_probe(struct platform_device *pd=
ev)
>  	if (irq < 0)
>  		return irq;
> =20
> +	if (dev_of_node(dev)) {
> +		clk =3D devm_clk_get_optional_enabled(dev, NULL);
> +		if (IS_ERR(clk))
> +			return PTR_ERR(clk);
> +		if (clk)
> +			priv->pclk =3D clk_get_rate(clk);
> +		else
> +			priv->pclk =3D LS2X_I2C_PCLK_FREQ;
> +
> +		priv->div =3D (unsigned long)device_get_match_data(dev);
> +		if (!priv->div)
> +			priv->div =3D LS2X_I2C_2K_CLOCK_DIV;
> +	} else {
> +		/* clocks and clock-div are only ACPI properties. */
> +		ret =3D device_property_read_u32(dev, "clocks", &priv->pclk);

[Severity: Medium]
Does this abuse the standard clocks property name in ACPI?

The clocks property is typically reserved by devicetree and ACPI _DSD
bindings for an array of clock provider references (phandles). Overloading
it here to pass a raw 32-bit integer frequency breaks generic property
parsers and firmware validation tools.

Would it be better to use a vendor-specific property name like
loongson,clock-frequency when reading a raw integer?

> +		if (ret)
> +			priv->pclk =3D LS2X_I2C_PCLK_FREQ;
> +
> +		ret =3D device_property_read_u32(dev, "clock-div", &priv->div);
> +		if (ret || !priv->div)
> +			priv->div =3D LS2X_I2C_7A_CLOCK_DIV;
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721122604.1271=
7-1-wanghongliang@loongson.cn?part=3D2
