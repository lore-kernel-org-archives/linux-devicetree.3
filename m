Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F7D0301708
	for <devicetree@vger.kernel.org>; Mon,  8 Jun 2026 02:57:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780887476; cv=none; b=fFDHV6eGm84a75nQHGNlwSz/sln6/aFmdy1sprZGof9S4nX3V6A5iF8FLHEAwe0W57FjC1Wuqucm05bemE8Z08PVDX/ws3QUZ71ww+mLYiIwTAXl+SQnmQ7YNWdhLMY/k5+UwPzv/6jZBM1UkBFeRw8s9WkK1NZwP7gNVn1yAKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780887476; c=relaxed/simple;
	bh=1oThuVHaHRFixJ/o9S43JK0oOQ0HuJgYxFMYpqNsCn0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mS2z6dFvqECJi379AbKxpKy8rVMFqlFBPo+KNAv/1/fT7/SIu1Cl62C0DA3nQh+yU5ZhUjMVqQoLM3qw3vdYdTgoXz60JlXSpvaWOCIhs6WI2namdsMCHH4Nx++W4SV/pWb+VqOTInrSv33KTIE14r85/OKSV9hbXkjznRl8VJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=juqCv0JP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="juqCv0JP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB08E1F00893;
	Mon,  8 Jun 2026 02:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780887474;
	bh=bseez00jSu9j6zJSZAIiVzIlVDkbBGiNZQOGS6Xc0d8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=juqCv0JPdcmGg6wvNwaVVEGhPIdfUXJp8VXuBqZyOyQ7wLcoWEVJoB6/fUfPZo0W/
	 eBp4sTuwa0fXuWuludb0O9QEXz5L7/L1NPJNmqfqqwlXhDleK3XjN05w+//Ln3SCjN
	 vp8k0aRBplwN30xkPfPrOxsVAvMxoY9ZsPWJ19dcn4pFo4q6f+Aqi0pwCYbGurXlej
	 3IxzlspaMFp1Xm6xjOt4j3ITW/ufbPN4iwNhQ8sR21O+eOyHinbXWsgNGiO0Acp9ib
	 va9sdVY0hxU/w9l++Cy7StR6k5ddlSOf8lSJgvScqJJYVYxfuskoGGop5cipKzf093
	 hQVDb89nC3+6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/2] i2c: ls2x: Add clocks property parsing and
 adjust bus speed
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hongliang Wang" <wanghongliang@loongson.cn>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608024533.32419-3-wanghongliang@loongson.cn>
References: <20260608024533.32419-3-wanghongliang@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 02:57:54 +0000
Message-Id: <20260608025754.AB08E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [Critical] Calling `devm_clk_get_optional_enabled()` dynamically causes u=
nbounded memory leaks and unbalanced clock enable counts.
- [High] Calculation of the I2C prescale value lacks bounds checking, leadi=
ng to a kernel panic if `div` evaluates to 0.
- [Medium] The driver improperly repurposes the standard `clocks` property =
to read a raw 32-bit integer frequency in ACPI setups.
- [Medium] The strict check for `dev_of_node(dev)` breaks compatibility wit=
h ACPI PRP0001 matching, causing valid match data to be discarded.
- [Low] The numerator calculation `pclk * 10` can overflow a 32-bit integer=
, resulting in a miscalculated I2C bus speed.
--

commit 3bc9e29253442765caa0c735b574051e32efaa27
Author: Hongliang Wang <wanghongliang@loongson.cn>

i2c: ls2x: Add clocks property parsing and adjust bus speed

The i2c-ls2x driver supports dts and acpi parameter passing. It adds
clock framework parsing for device tree configurations, and reads
clock and clock-div properties directly for ACPI setups.

> diff --git a/drivers/i2c/busses/i2c-ls2x.c b/drivers/i2c/busses/i2c-ls2x.c
> index b475dd27b7af9..46dafa11b3013 100644
> --- a/drivers/i2c/busses/i2c-ls2x.c
> +++ b/drivers/i2c/busses/i2c-ls2x.c

[ ... ]

> @@ -107,12 +117,30 @@ static void ls2x_i2c_adjust_bus_speed(struct ls2x_i=
2c_priv *priv)
>  	else
>  		t->bus_freq_hz =3D LS2X_I2C_FREQ_STD;
> =20
> +	if (dev_of_node(dev)) {

[Severity: Medium]
Does this check break compatibility with ACPI PRP0001 configurations?

During probe(), the driver correctly reads priv->div from the compatible
string using device_get_match_data(), which supports both native Device Tree
and ACPI PRP0001. However, since dev_of_node() evaluates to NULL for ACPI
nodes, PRP0001 setups will be incorrectly routed to the native ACPI fallback
block.

This will discard the valid matched priv->div and attempt to read non-exist=
ent
native ACPI properties. Could this check for the presence of priv->div
instead?

> +		clk =3D devm_clk_get_optional_enabled(dev, NULL);

[Severity: Critical]
Does calling devm_clk_get_optional_enabled() here cause a devres memory leak
and unbalanced clock enable counts?

ls2x_i2c_adjust_bus_speed() is called by ls2x_i2c_init(), which is called n=
ot
only during probe, but also during normal operation and error recovery:

ls2x_i2c_resume() -> ls2x_i2c_init()
ls2x_i2c_xfer_one() -> ls2x_i2c_init()

Since devm_clk_get_optional_enabled() dynamically allocates a managed resou=
rce
and increments the clock reference and enable counts, calling it repeatedly
without releasing previous allocations will eventually exhaust system memory
and overflow the clock reference tracking.

Can the clock be acquired exactly once in probe() instead?

> +		if (!IS_ERR_OR_NULL(clk))
> +			pclk =3D clk_get_rate(clk);
> +		else
> +			pclk =3D LS2X_I2C_PCLK_FREQ;
> +
> +		div =3D priv->div;
> +
> +		val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;

[Severity: Low]
Can the numerator calculation pclk * 10 overflow a 32-bit integer?

Since pclk is a 32-bit unsigned integer, if the reference clock exceeds
approximately 429.49 MHz, the multiplication will wrap around and yield an
artificially small numerator.

While typical reference clocks might be lower, would it be safer to use 64-=
bit
precision like div_u64((u64)pclk * 10, ...) here?


[Severity: High]
Does this division lack bounds checking for a zero divisor?

If div evaluates to 0, this will result in a division by zero kernel panic.

This regression can happen if the device is manually bound via sysfs
driver_override without an ID match, causing device_get_match_data() to
return NULL. It can also happen in the ACPI branch below if a misconfigured
ACPI table sets clock-div to 0.

Should div be explicitly validated as greater than 0 before performing the
division?

> +	} else {
> +		/* clocks and clock-div are only ACPI properties. */
> +		if (!device_property_read_u32(dev, "clocks", &pclk) &&

[Severity: Medium]
Does this reuse the standard clocks property incorrectly for ACPI setups?

The clocks property is strictly defined in Device Tree and unified ACPI _DSD
environments as an array of phandles to clock providers. Reusing this exact
name to read a raw 32-bit integer frequency creates a binding conflict and
could break generic property parsers.

Could a standard, non-conflicting property name like clock-frequency or
ref-clock-frequency be used instead?

> +		    !device_property_read_u32(dev, "clock-div", &div))
> +			val =3D (pclk * 10) / (div * t->bus_freq_hz) - 1;
> +		else
> +			val =3D LS2X_I2C_PCLK_FREQ / (5 * t->bus_freq_hz) - 1;
> +	}
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608024533.3241=
9-1-wanghongliang@loongson.cn?part=3D2
