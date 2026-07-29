Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0023A47CC9C
	for <devicetree@vger.kernel.org>; Wed, 29 Jul 2026 12:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785327023; cv=none; b=YP0qpx6XACZNO4l/BjnI2sqUJhMK8nNpiLTFBTWl+vQyUHndj+gPyrNUwpleazN5Pbq11Xjz0Wj+b00kHtOuqCRAD4GBvGaMJwvDMokdkZopFtQ3+cbtKFwYPnMC0tm5Lbbyaq7ZEkEFtG6QRKPwTI1mmMD5q0P4F/dHVHvc8Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785327023; c=relaxed/simple;
	bh=20QyRXZKqXQBTVCA6bkZ54kk7wxWZ8k6gL3c9o/GY/Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FnYMvtFBmzcXh28qWFPuPKU2gKsTWPwgacrwaECWRZgooPw3u9Ruun6gohBEgVDau5MtJfX2OwEQ1HXhsJjk2iVoxyqKBWMaYIaiaX7rSJfxxQPOfIWTO2ckdSKz7lXHxaLR4yl7PA2CoqluavLb7aAhHlKlIQ2KFXNvhUBhlDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A5z2iE3c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A5z2iE3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484781F000E9;
	Wed, 29 Jul 2026 12:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785327021;
	bh=LJVvew1XbbHDMn1ZUJqpVsG7gwiDaHbs30KxwmDH5gw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A5z2iE3cUlwaNNupSwovRrcIDVHWN9IQJt1YITeD8NVwJeQITX5V/fKVhn8+3hLng
	 kORwv7X6AAo3gUJp/gN/g2qQZRMwTbNqvvRDSy2tfLIoBtMTpO7z6rgF0+ABf/jmmN
	 Vg2gijC3VZ7nHitdJDsweC2jcYFjkJAuhogV1Sqa9b6+IYNbwXwOq4vgvA2/+WYVGJ
	 BoLQoW3xbYRmC3kgITee7XBEQsnGB8kPK7EcDehidQOxYBU8kAfJ6XkV/txldBEHz2
	 zWKOqj/QEiXJ/FiowKmxWhjLwKUsVNG+V2NsBSS18rZYn3w+rozbcNx3/TLZfOWFKL
	 /RInOaMG3sRQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] clk: si544: add support for si549
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGF2ZWwgTMO2Ymw=?= <pavel@loebl.cz>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260729115310.3490589-3-pavel@loebl.cz>
References: <20260729115310.3490589-1-pavel@loebl.cz>
 <20260729115310.3490589-3-pavel@loebl.cz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 12:10:20 +0000
Message-Id: <20260729121021.484781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] Missing NULL check for `i2c_get_match_data()` leads to a NULL poin=
ter dereference.
- [Low] The `si544_id` array uses positional initializers instead of named =
initializers, violating the I2C subsystem rules.

Pre-existing issues:
- [High] Unconditional dereference of `client->dev.of_node` causes a kernel=
 panic on non-DT systems.
- [High] Division by zero occurs in `si544_calc_center_rate()` if the hardw=
are returns 0 for the `HS_DIV` register.
--

--- Patch [2]: [PATCH v3 2/2] clk: si544: add support for si549 ---
commit 12920363f4810dc248ea69506597ff1f3d421e35
Author: Pavel L=C3=B6bl <pavel@loebl.cz>

clk: si544: add support for si549

This patch adds support for the Si549 programmable clock generator, which
differs from the Si544 primarily in internal oscillator frequency. It
introduces three types (A, B, and C) with different maximum output
frequencies and fixes the maximum frequency for the Si544 C variant.

> diff --git a/drivers/clk/clk-si544.c b/drivers/clk/clk-si544.c
> index 09c06ecec1a52..8e6c2487b79b8 100644
> --- a/drivers/clk/clk-si544.c
> +++ b/drivers/clk/clk-si544.c

[ ... ]

> @@ -258,15 +270,16 @@ static unsigned long si544_calc_center_rate(
>  		const struct clk_si544_muldiv *settings)
>  {
>  	u32 d =3D settings->hs_div * BIT(settings->ls_div_bits);
> +	u32 fxo =3D settings->xo_freq;
>  	u64 vco;
> =20
>  	/* Calculate VCO from the fractional part */
> -	vco =3D (u64)settings->fb_div_frac * FXO;
> -	vco +=3D (FXO / 2);
> +	vco =3D (u64)settings->fb_div_frac * fxo;
> +	vco +=3D (fxo / 2);
>  	vco >>=3D 32;
> =20
>  	/* Add the integer part of the VCO frequency */
> -	vco +=3D (u64)settings->fb_div_int * FXO;
> +	vco +=3D (u64)settings->fb_div_int * fxo;
> =20
>  	/* Apply divider to obtain the generated frequency */
>  	do_div(vco, d);

[Severity: High]
This is a pre-existing issue, but can this result in a division by zero if
the hardware returns 0 for the HS_DIV register?

During driver probe, si544_get_muldiv() reads the HS_DIV register from the
I2C device. If the hardware is uninitialized or malfunctioning, settings->h=
s_div
evaluates to 0:

si544_get_muldiv() {
    ...
    settings->hs_div =3D (reg[1] & 0x07) << 8 | reg[0];
    ...
}

This would cause the divisor d to be 0 here in si544_calc_center_rate(),
leading to a division by zero when executing do_div(vco, d).

[ ... ]

> @@ -446,7 +459,7 @@ static int si544_probe(struct i2c_client *client)
>  	init.num_parents =3D 0;
>  	data->hw.init =3D &init;
>  	data->i2c_client =3D client;
> -	data->max_freq =3D (uintptr_t)i2c_get_match_data(client);
> +	data->chip_info =3D i2c_get_match_data(client);

[Severity: High]
Is it possible to hit a NULL pointer dereference here if the driver is bound
manually via sysfs?

If the driver is bound without a matching id_table entry (for example, via
driver_override), i2c_get_match_data() can return NULL. This NULL pointer is
then unconditionally assigned to data->chip_info.

Later in si544_get_muldiv(), the unvalidated pointer is dereferenced:

si544_get_muldiv() {
    ...
    settings->xo_freq =3D data->chip_info->xo_freq;
    ...
}

Could a NULL check be added for data->chip_info before continuing the probe?

> =20
>  	if (of_property_read_string(client->dev.of_node, "clock-output-names",
>  			&init.name))
>  		init.name =3D client->dev.of_node->name;

[Severity: High]
This isn't a bug introduced by this patch, but could this fallback path
trigger a NULL pointer dereference on non-Device Tree systems?

On platforms like ACPI or board files where client->dev.of_node is NULL,
of_property_read_string() safely handles the NULL pointer and returns -ENOS=
YS.
This causes the if condition to evaluate to true.

The fallback path then unconditionally dereferences client->dev.of_node to
access its name, which will cause a kernel panic if it is NULL.

[ ... ]

> @@ -478,18 +491,54 @@ static int si544_probe(struct i2c_client *client)
>  	return 0;
>  }

[ ... ]

>  static const struct i2c_device_id si544_id[] =3D {
> -	{ "si544a", 1500000000 },
> -	{ "si544b", 800000000 },
> -	{ "si544c", 350000000 },
> +	{ "si544a", (kernel_ulong_t)&clk_si544a_info },
> +	{ "si544b", (kernel_ulong_t)&clk_si544b_info },
> +	{ "si544c", (kernel_ulong_t)&clk_si544c_info },
> +	{ "si549a", (kernel_ulong_t)&clk_si549a_info },
> +	{ "si549b", (kernel_ulong_t)&clk_si549b_info },
> +	{ "si549c", (kernel_ulong_t)&clk_si549c_info },
>  	{ }
>  };

[Severity: Low]
Are these array initializations compliant with the I2C subsystem requiremen=
ts?

The I2C subsystem guidelines state that initialized arrays of type
struct i2c_device_id must use named initializers, but these new entries use
positional initializers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260729115310.3490=
589-1-pavel@loebl.cz?part=3D2
