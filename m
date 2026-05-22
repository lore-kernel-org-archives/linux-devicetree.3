Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF91E3CF688
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457810; cv=none; b=Ik/xNVSNoVa91oSaoAc9Fi1RqzJ57g52CMzpo2IlT+JKnKJ482srdb6ACAW+y5nLoNoCbyEkDV/Km0kEdp08SmDhxwDu1avTPPImgVUoIyW4vB0G+/590dkDINqTS7MLfUyVI/nVk/xKPJMOM+89kRNT1qTDtSMRy86ia6Z+3ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457810; c=relaxed/simple;
	bh=1nb0R2W1cC25XQdsE3PGaqusTuSWASCsCEQYU/U11PY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dKAJ1wRRyLgnfhYyV75jG5ZFDNsKvEBoRoPz8ZM0XdcpxGr2iXtF3Mlhbotz/pot5paSarfbllFbum+dzlDNCrsbV7CHJePy4D91l8nnx8FJ/0lgKiEFg2ti+zK39o1u+cYX0G2SvVBCiYd11LyNoz/IXjYqoxfB9vi9BLOdm1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFz8AmHE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFz8AmHE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4029D1F000E9;
	Fri, 22 May 2026 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779457808;
	bh=iEoJBKH/OvmtERSuZ7vyZm4WIdfCzMuJOWTt4mXbDTk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFz8AmHEIR0aNBfizgR7XCog/pd/W87Igw9n5lvDYeqKzMjeKp6T/vl/4gddeIugb
	 y0jBilSg9I/ri0T2d9xiUJd+r97BL19KXRBP/T+YIIYj+wWdm6Wej3pObLD8o04LhY
	 LBDaK0u8h+M485X8TTdNaIu/9zucPMTm2Mul54Tsfi09vInPhH/QdvmAS8f9AFOmFm
	 X/uCX0HLHzYjoxgFbFKTFzpGHXFz5ixstK9LFYUN7szgACJVcMub5GXLm+njb2uOXr
	 fr+Nu+TySPU5vIK9Ki+nHHa1V64xWolOvTXZP4+/3yLiF1uL9sKmZGI+QQRtd5qcjM
	 fpjdczS8GyvqA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] regulator: add SGM3804 Dual Output driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Neil Armstrong" <neil.armstrong@linaro.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-2-bd6b1c300ecc@linaro.org>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-2-bd6b1c300ecc@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 22 May 2026 13:50:07 +0000
Message-Id: <20260522135008.4029D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Enable GPIOs are requested with `GPIOD_ASIS` but never explicitly =
configured as outputs, preventing the regulator from powering up.
- [High] The driver performs I2C communication immediately after asserting =
the enable GPIO, bypassing the required IC power-on delay.
- [Medium] Incorrect regmap state handling on `regcache_sync()` failure lea=
ds to silent I2C write failures for active rails.
- [Medium] Hardware is powered down before setting the regmap to cache-only=
 mode in `sgm3804_disable()`, creating a race condition.
- [Low] The `ctx->lock` mutex is initialized without a corresponding `mutex=
_destroy()`, bypassing mutex debugging.
--

commit cd53576c2dc0f1b61e28aacf0d0ccbf347793fe0
Author: KancyJoe <kancy2333@outlook.com>

regulator: add SGM3804 Dual Output driver

Add support for the SG Micro SGM3804 Single Inductor Dual Output
Buck/Boost Converter. It uses a regmap cache because registers are only
writable when the enable GPIOs are active.

> diff --git a/drivers/regulator/sgm3804-regulator.c b/drivers/regulator/sg=
m3804-regulator.c
> new file mode 100644
> index 0000000000000..c3406cfb73d03
> --- /dev/null
> +++ b/drivers/regulator/sgm3804-regulator.c

[ ... ]

> +static int sgm3804_sync_regcache_state(struct sgm3804_data *ctx)
> +{
> +	guard(mutex)(&ctx->lock);
> +
> +	/* If both GPIOs are down, IC is powered down and I2C writes will fail =
*/
> +	if (!gpiod_get_value_cansleep(ctx->gpios[SGM3804_POS_RAIL]) &&
> +	    !gpiod_get_value_cansleep(ctx->gpios[SGM3804_NEG_RAIL])) {
> +		regcache_cache_only(ctx->regmap, true);
> +		regcache_mark_dirty(ctx->regmap);
> +	} else {
> +		int ret;
> +
> +		/* At least a GPIO is up, we can write registers */
> +		regcache_cache_only(ctx->regmap, false);
> +		ret =3D regcache_sync(ctx->regmap);
> +		if (ret) {
> +			regcache_cache_only(ctx->regmap, true);

[Severity: Medium]
If one regulator is already successfully enabled, and the user attempts to
enable the second one but the I2C transfer fails, does this permanently sti=
ck
the regmap cache in cache-only mode?

Any subsequent voltage or discharge changes to the active rail will only up=
date
the software cache and fail to write to the physical hardware.

> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}

[ ... ]

> +static int sgm3804_enable(struct regulator_dev *rdev)
> +{
> +	struct sgm3804_data *ctx =3D rdev->reg_data;
> +	int ret;
> +
> +	ret =3D gpiod_set_value_cansleep(ctx->gpios[rdev_get_id(rdev)], 1);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D sgm3804_sync_regcache_state(ctx);

[Severity: High]
Does this perform I2C communication immediately after asserting the enable
GPIO, bypassing the required IC power-on delay?

The driver specifies .enable_time =3D 40000, but because the driver issues
I2C commands synchronously inside the enable callback, the regulator core's
delay hasn't occurred yet.

Will sending I2C commands immediately result in I2C NACK errors?

> +	if (ret)
> +		goto err;
> +
> +	return 0;
> +
> +err:
> +	gpiod_set_value_cansleep(ctx->gpios[rdev_get_id(rdev)], 0);
> +	return ret;
> +}
> +
> +static int sgm3804_disable(struct regulator_dev *rdev)
> +{
> +	struct sgm3804_data *ctx =3D rdev->reg_data;
> +	int ret;
> +
> +	ret =3D gpiod_set_value_cansleep(ctx->gpios[rdev_get_id(rdev)], 0);
> +	if (ret)
> +		return ret;
> +
> +	return sgm3804_sync_regcache_state(ctx);

[Severity: Medium]
Is there a race condition here if the hardware is powered down before
setting the regmap to cache-only mode?

If this is the last active rail, the physical IC loses power immediately.
If another thread concurrently accesses the shared regmap to set the voltage
on the other rail, it could attempt an I2C transaction on the powered-off I=
C.

> +}

[ ... ]

> +static int sgm3804_probe(struct i2c_client *i2c)
> +{
> +	struct device *dev =3D &i2c->dev;
> +	struct sgm3804_data *ctx;
> +	int ret, i;
> +
> +	ctx =3D devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
> +	if (!ctx)
> +		return -ENOMEM;
> +
> +	mutex_init(&ctx->lock);

[Severity: Low]
Is this missing a corresponding mutex_destroy()?

Since ctx is allocated with devm_kzalloc(), the memory will be freed without
destroying the mutex, which bypasses the kernel's CONFIG_DEBUG_MUTEXES
infrastructure.

Would it be better to use devm_mutex_init() instead?

> +
> +	ctx->regmap =3D devm_regmap_init_i2c(i2c, &sgm3804_regmap_config);
> +	if (IS_ERR(ctx->regmap))
> +		return dev_err_probe(dev, PTR_ERR(ctx->regmap),
> +				     "failed to init regmap\n");
> +
> +	/* Get enable GPIOs */
> +	for (i =3D 0; i < ARRAY_SIZE(sgm3804_regulator_desc); i++) {
> +		const struct regulator_desc *reg =3D &sgm3804_regulator_desc[i];
> +		struct fwnode_handle *child;
> +
> +		child =3D device_get_named_child_node(dev, reg->of_match);
> +		if (!child) {
> +			dev_err(dev, "missing child '%s'\n", reg->of_match);
> +			return -EINVAL;
> +		}
> +
> +		ctx->gpios[i] =3D devm_fwnode_gpiod_get(dev, child, "enable",
> +						      GPIOD_ASIS, reg->name);

[Severity: High]
Does this prevent the regulator from powering up?

The GPIOD_ASIS flag leaves the pin's hardware direction unconfigured.
If the bootloader left the pin as an input, calling gpiod_set_value_canslee=
p()
in sgm3804_enable() will fail and return -EPERM because the pin is not
configured as an output.

Could the GPIO direction be explicitly configured as an output instead?

> +		fwnode_handle_put(child);
> +		if (IS_ERR(ctx->gpios[i]))
> +			return dev_err_probe(dev, PTR_ERR(ctx->gpios[i]),
> +					     "failed to get '%s' enable GPIO\n",
> +					     reg->name);
> +	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260522-topic-sm86=
50-ayaneo-pocket-s2-sgm3804-v5-0-bd6b1c300ecc@linaro.org?part=3D2
