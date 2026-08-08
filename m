Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2D43B1B3
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 04:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162307; cv=none; b=Q15h+1+oEEOBCPxkgF4FhLqB1p/HVGEyo+3q2O8w47/x42QWe/gAaMskEYk0lXr5pJgUwVJSQy/zalG1Ll1wbtXsUIuwPEspiwqHrX8B+fIhDHYAhiHxj5cehE4OSkKBKzvAuHag6EfpCy1P12eMlBqViRnNAuK4YVSnxx7UNx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162307; c=relaxed/simple;
	bh=H9RxuJTVk0JTyM6gMbqTmVOzE90q3MzGgX1B9tfBkR0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uzMue2qOMeh2GneRk0PR/PCEc9AUU7sVf4VvRDVoFQ/y37wOFhFV8+GqoCMW84jxyX3yBwHNTWvaZPPn2QmBHPelsHXV+LPePlXGqh8svgKCb4Co7YQ+ZrxLqTr8BisXrNQGstEnEmP5qP9G5/Hc1vEUVsJxNlNexwWScAYCMhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MMAVJyya; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MMAVJyya"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D991F000E9;
	Sat,  8 Aug 2026 04:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786162306;
	bh=3ze6SCKBecsCjkyJfRhQ+u/4IBIwvhtpkNFk63l14z4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MMAVJyyaKnkpCr6XNRDz4g1Qmxvp2lvps40C+V9QWiUNJV7iLQK4QmHZnxw2Giqkc
	 +0dIHR/Ine40a8AIoYcdj0AXsTUCgy/EJ/0rzkQTLdNUeMqpkyO3lrwpqebzTYtl++
	 YpbL5ttIau0F5dJTPzUIXe3MpCPT6Fl/fuL1u0GuTum7kOwwSuotrxlRpqxBUDPc6R
	 oaOfsd1a5q8/HN6uLpkhxuDEvCK4v/MZLWoAJbT25aywQpvnzHr0H8uf4Hr8t5MNDO
	 Xo1e2eiwYMd2JCwZtPELel1BoduOzEc3HhzHmkpgAWEuIh1hK6dVLpwrnbIYxzvBpy
	 2cHi9OPrJxa3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kurt Borja" <kuurtb@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807-ads126x-v3-2-f89925d72792@gmail.com>
References: <20260807-ads126x-v3-0-f89925d72792@gmail.com>
 <20260807-ads126x-v3-2-f89925d72792@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 04:11:45 +0000
Message-Id: <20260808041146.24D991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Inadequate delay after device reset will cause initialization to f=
ail or silently leave the ADC in its default state, corrupting all data rea=
ds.
- [Medium] Regmap debugfs accesses bypass the driver's custom transfer lock=
, causing an unconditional lockdep splat.
--

--- Patch [2]: [PATCH v3 2/9] iio: adc: add the ti-ads1262 driver ---
commit 4680c0f9dff8858f99d46d1498d733421fe96922
Author: Kurt Borja <kuurtb@gmail.com>

iio: adc: add the ti-ads1262 driver

Add the ti-ads1262 driver with initial support for the primary ADC (ADC1).
The ADS1263 auxiliary ADC (ADC2) is handled by a separate driver and
interoperability considerations were taken into account.

> diff --git a/drivers/iio/adc/ti-ads1262.c b/drivers/iio/adc/ti-ads1262.c
> new file mode 100644
> index 0000000000000..d78e5e3ae13ee
> --- /dev/null
> +++ b/drivers/iio/adc/ti-ads1262.c
[ ... ]
> +static int ads1262_dev_reset(struct ads1262 *st)
> +{
> +	int ret;
> +
> +	if (st->reset_gpiod) {
> +		ret =3D gpiod_set_value_cansleep(st->reset_gpiod, 1);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * The RESET pulse timing requirement is 4 clock cycles, at the
> +		 * minimum clock rate this is 4 microseconds.
> +		 */
> +		fsleep(4);
> +
> +		ret =3D gpiod_set_value_cansleep(st->reset_gpiod, 0);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * The RESET timing requirement is 8 clock cycles, at the
> +		 * minimum clock rate this is 8 microseconds
> +		 */
> +		fsleep(8);
> +	} else {
> +		ret =3D ads1262_dev_cmd(st, ADS1262_OPCODE_RESET);
> +		if (ret)
> +			return ret;
> +
> +		/*
> +		 * The RESET timing requirement is 8 clock cycles, at the
> +		 * minimum clock rate this is 8 microseconds
> +		 */
> +		fsleep(8);

[Severity: High]
Is the 8 microsecond delay sufficient for the device to initialize after re=
set?

The standard ADC initialization requirement is typically much longer, requi=
ring
4096 clock cycles for recovery (which corresponds to ~555 microseconds at
7.3728 MHz or ~4 milliseconds at 1 MHz).

If the delay is severely inadequate, the device might ignore the subsequent
SPI configuration writes in ads1262_dev_configure().

This could leave the STATUS and CRC bytes enabled in the data output format
by default, causing ads1262_channel_read() to read the 1-byte STATUS follow=
ed
by the upper 24 bits of data instead of the actual 32-bit conversion data,
corrupting the readings.

> +	}
> +
> +	return 0;
> +}
[ ... ]
> +static const struct regmap_config ads1262_regmap_config =3D {
> +	.reg_bits =3D 8,
> +	.val_bits =3D 8,
> +	.writeable_reg =3D ads1262_writeable_reg,
> +	.readable_reg =3D ads1262_readable_reg,
> +	.volatile_reg =3D ads1262_volatile_reg,
> +	.reg_defaults =3D ads1262_reg_defaults,
> +	.num_reg_defaults =3D ARRAY_SIZE(ads1262_reg_defaults),
> +	.max_register =3D ADS1262_ADC2FSC1_REG,
> +	.can_sleep =3D true,
> +	.cache_type =3D REGCACHE_MAPLE,
> +};

[Severity: Medium]
Could this configuration cause a lockdep warning when accessing the regmap
debugfs interface?

The driver provides custom regmap callbacks that assert st->xfer_lock is he=
ld,
but ads1262_regmap_config does not define custom .lock and .unlock callback=
s.
Because of this, the regmap core will use its default internal mutex.

When userspace reads the regmap debugfs file, it will call into
ads1262_regmap_read() without holding st->xfer_lock:

> +static int ads1262_regmap_read(void *context, const void *reg_buf,
> +			       size_t reg_size, void *val_buf, size_t val_size)
> +{
> +	struct ads1262 *st =3D context;
> +	u8 tx[2];
> +
> +	lockdep_assert_held(&st->xfer_lock);

This assertion would unconditionally fail.

> +
> +	/*
> +	 * The register read operation uses a two byte command header followed
> +	 * by the register data:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807-ads126x-v3=
-0-f89925d72792@gmail.com?part=3D2
