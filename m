Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A9D389DF0
	for <devicetree@vger.kernel.org>; Tue, 12 May 2026 21:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778622252; cv=none; b=he1z3pYsU971W5Z4tjLrCE4+MaljI+7tPfg6K9UEANC9cchJx/fsx8kV6qetiSa+4DLQGVKRJx9t6C8sM4wxw5XJo92QSA2WPpb3d1BvT0EsmHWoSN0wU/sXt+qerYcVfmLq2HPe5DfiH/7VrcQZn815ivA7P35msiKOVhxbAPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778622252; c=relaxed/simple;
	bh=xxSiW7xhY3ceNOyf1952en0PURdLur0lpQuEzVO9TEs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XsG6MHZHC+tSs0Fy8ScH5lA4Azgi8rv3RG6bwGdeyEgREN54rHRtQDP5Sg8Km/InDvxdgDKN3cN5pY8wtO5YqgPXuijgIkz9nYSRMwgDnBOx/Tm9mpyPz+j0AmJE76vo2Q+gBtcH6qT3XSgMMjWjmGhqUB+ejLSgL7wvrT+Wxr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C1KOszch; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C1KOszch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18368C2BCB0;
	Tue, 12 May 2026 21:44:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778622252;
	bh=xxSiW7xhY3ceNOyf1952en0PURdLur0lpQuEzVO9TEs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=C1KOszchOp42mq1dmE0kPY+rDL3x0ukmXN33YbRRK73CMpHblLrmQS0wKlMr0ZIHB
	 4sxxWoM6hpY04H7JiCIOQf9/KkBmNXAKAfvHSIh0L5tLRx+T1Rt5IyISmmbWdCJ7uI
	 SiFdpAv6IGVcCpA0gyVvAWQfoXaZg6NYqqIE96VCJo9IyRbDUNQPRjO/FVZMMQi39A
	 HyoBnq5ZnrKlw14N8cMbqbkUvo0fzeuU9weDppQBK9xY8uXRiyhVd1JTaM3vbJohqS
	 XqMKPuHvpwTEy19U1oMOaVIzDbJk0VZaLJSXhAJRbQTwBauaHajkrO5AcSjeU2Sv3E
	 YkmPZNLYMclyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] i2c: Add driver for gpio based busses with
 shared SCL
Reply-To: sashiko@lists.linux.dev
To: "Markus Stockhausen" <markus.stockhausen@gmx.de>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260511162528.84508-3-markus.stockhausen@gmx.de>
References: <20260511162528.84508-3-markus.stockhausen@gmx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 21:44:11 +0000
Message-Id: <20260512214412.18368C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The child fwnode reference is dropped at the end of the scoped loo=
p, leaving a dangling pointer in the adapter device.
- [High] An integer overflow in the clock-frequency calculation can cause a=
 division by zero panic.
- [Low] Usage of non-existent API `devm_mutex_init()` will cause a build fa=
ilure.
--

commit 26b139c7eeb6ff63f03c34df65162da9a405e505
Author: Markus Stockhausen <markus.stockhausen@gmx.de>

i2c: Add driver for gpio based busses with shared SCL

This commit introduces a new I2C driver for hardware designs that share a
single SCL line across multiple busses. It synchronizes data transfers
across up to 32 busses using a central mutex.

> diff --git a/drivers/i2c/busses/i2c-gpio-shared.c b/drivers/i2c/busses/i2=
c-gpio-shared.c
> new file mode 100644
> index 0000000000000..4c2e4011fcbf1
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-gpio-shared.c
[ ... ]
> +static int gpio_shared_probe(struct platform_device *pdev)
> +{
[ ... ]
> +	ctx =3D devm_kzalloc(dev, struct_size(ctx, bus, bus_count), GFP_KERNEL);
> +	if (!ctx)
> +		return dev_err_probe(dev, -ENOMEM, "memory allocation failed\n");
> +
> +	ret =3D devm_mutex_init(dev, &ctx->lock);

Is this devm_mutex_init() intended to be a different function? It does not
appear to exist in the kernel and will likely cause a build failure.

> +	if (ret)
> +		return dev_err_probe(dev, ret, "mutex initialization failed\n");
> +
> +	platform_set_drvdata(pdev, ctx);
> +
> +	ctx->scl =3D devm_gpiod_get(dev, "scl", GPIOD_OUT_HIGH_OPEN_DRAIN);
> +	if (IS_ERR(ctx->scl))
> +		return dev_err_probe(dev, PTR_ERR(ctx->scl), "shared SCL GPIO not foun=
d\n");
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		struct i2c_algo_bit_data *bit_data;
[ ... ]
> +		u32 bus_num, clock_freq;
[ ... ]
> +		/*
> +		 * clock-frequency specifies the I2C bus frequency. Convert to the hal=
f-period
> +		 * delay in microseconds that i2c-algo-bit expects. Default to 5 us (~=
100 kHz)
> +		 * if not specified. This is usually lower than the configured frequen=
cy,
> +		 * especially near the 400 kHz limit.
> +		 */
> +		if (!fwnode_property_read_u32(child, "clock-frequency", &clock_freq) &&
> +		    clock_freq > 0)
> +			bit_data->udelay =3D max(1u, DIV_ROUND_UP(1000000, 2 * clock_freq));

If clock-frequency is provided as 0x80000000 in the device tree, could the
32-bit unsigned multiplication 2 * clock_freq wrap around to 0? That would
cause DIV_ROUND_UP() to perform a division by zero panic.

> +		else
> +			bit_data->udelay =3D 5;
[ ... ]
> +		adap->dev.parent =3D dev;
> +		adap->owner =3D THIS_MODULE;
> +		adap->algo_data =3D bit_data;
> +		adap->bus_recovery_info =3D ri;
> +		device_set_node(&adap->dev, child);

Since device_for_each_child_node_scoped() automatically drops the fwnode
reference at the end of each iteration, and device_set_node() assigns the
pointer without incrementing the reference count, will this leave
adap->dev.fwnode pointing to unreferenced memory when the loop advances?

> +		snprintf(adap->name, sizeof(adap->name), "i2c-gpio-shared:%u", bus_num=
);
> +
> +		ret =3D devm_add_action_or_reset(dev, gpio_shared_del_adapter, adap);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511162528.8450=
8-1-markus.stockhausen@gmx.de?part=3D2
