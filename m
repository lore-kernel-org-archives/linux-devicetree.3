Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D7047011A
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 08:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784708095; cv=none; b=AdzSmGY+vOkj29pFhS0paGi0DittdyUa59jNC4KuwzLiJBfNRM9H79sTWKDJVN47b8Zt0j5Bac5Z/h0QFRycODC2aBHvDnjvpa3H3BvCyj3XdeyDAx/KdaSnzyNeVKQQvwl/ph437cJm3Rz2tqwUgj7trIi91lJiLAUuLGg/kKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784708095; c=relaxed/simple;
	bh=6ruzaw4/NLpAiWcGLK5jUWcgDxS/b8PgRi+qyrmnPW0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nc/ToanxLeQ1FsXg0sC4Y9yrAmOSlz+Z37m0ok/OD0fkwybWfMKNWCSbAaOm415j7V4nOk0i56h4bZEL7amTIX5yZp99yCY35l/pv0Abqtq+R2mbYu/pgGfFAMH6+8Xe7VYEZoGjPnmG5+FQV1UBl64am6Z4oAtQjyfD47+bE6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UFI0kwAn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UFI0kwAn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA35A1F00A3A;
	Wed, 22 Jul 2026 08:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784708093;
	bh=oU482jnk9kdUlDA38+dUDDbAWDrcXU9KNqbP0DIoqm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UFI0kwAnkwdW4AuXfUa5ZR0bNmvHZJFBfqGrBbT+UzfrsncJ/rdZc9w8TBNhsIyjT
	 Nm8PXkvmL1sARfdRewOq8hDaBwvwz6DknXFPt7ubknt+hbL7LyHHhAT+d7pgCDG5Ux
	 DDdQ+jzwnntPhU+n+5ejSomj/aR4kXIbKnoT2L6CVKxfgrAo9CvYa24yiPWJHm6OVC
	 +mT8j/+yHZnn+8Rotfc9QYoVqSz79xhTW/XoIa80AJo7z8uNnj+TOfojvwZSBQCxUa
	 RoAuxJeQOdk0OkS3CvwHCzr2RhsU6B0e5FdO3KJVb+8vS82VrhBzST5mET3IzV7+yh
	 eHb4ujg+6Ajvw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 7/7] iio: dac: Add AD5529R DAC driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Janani Sunil" <janani.sunil@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260722-ad5529r-driver-v7-7-7781cd74ad75@analog.com>
References: <20260722-ad5529r-driver-v7-0-7781cd74ad75@analog.com>
 <20260722-ad5529r-driver-v7-7-7781cd74ad75@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 08:14:52 +0000
Message-Id: <20260722081452.EA35A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Out-of-bounds array write in `ad5529r_parse_channel_ranges` due to=
 missing bounds check on `st->num_channels`.
- [Medium] Missing required hardware delay between reset assertion and deas=
sertion.
--

--- Patch [7]: [PATCH v7 7/7] iio: dac: Add AD5529R DAC driver support ---
commit 190cbf7d47fe0e91c8bbafb4dfea2a90c159fb6b
Author: Janani Sunil <janani.sunil@analog.com>

iio: dac: Add AD5529R DAC driver support

This commit adds support for the Analog Devices AD5529R 16-channel,
12/16 bit Digital to Analog Converter. The device communicates over SPI
and supports per-channel output range configuration.

> diff --git a/drivers/iio/dac/ad5529r.c b/drivers/iio/dac/ad5529r.c
> new file mode 100644
> index 0000000000000..2fd1dd053da58
> --- /dev/null
> +++ b/drivers/iio/dac/ad5529r.c
[ ... ]
> +static int ad5529r_reset(struct ad5529r_state *st)
> +{
> +	struct reset_control *rst;
> +	int ret;
> +
> +	rst =3D devm_reset_control_get_optional_exclusive(&st->spi->dev, NULL);
> +	if (IS_ERR(rst))
> +		return PTR_ERR(rst);
> +
> +	if (rst) {
> +		ret =3D reset_control_assert(rst);
> +		if (ret)
> +			return ret;
> +
> +		/* Minimum reset low width (t_reset) is 20 ns per datasheet. */
> +		ret =3D reset_control_deassert(rst);

[Severity: Medium]
Since the datasheet requires a minimum reset low width of 20 ns, should the=
re
be a delay like ndelay(20) before deasserting the reset?

Back-to-back MMIO writes on fast hardware might toggle the reset line faster
than the required 20 ns.

> +		if (ret)
> +			return ret;
> +	} else {
[ ... ]
> +static int ad5529r_parse_channel_ranges(struct device *dev,
> +					struct ad5529r_state *st)
> +{
> +	s32 vals[2];
> +	int ret, range_idx;
> +	u32 ch;
> +
> +	device_for_each_child_node_scoped(dev, child) {
> +		ret =3D fwnode_property_read_u32(child, "reg", &ch);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Missing reg property in channel node\n");
> +
> +		if (ch >=3D 16)
> +			return dev_err_probe(dev, -EINVAL,
> +					     "Channel %u exceeds maximum 15\n",
> +					     ch);
[ ... ]
> +		st->output_range_idx[ch] =3D range_idx;
> +		ret =3D regmap_write(st->regmap_16bit,
> +				   AD5529R_REG_OUT_RANGE(ch), range_idx);
> +		if (ret)
> +			return dev_err_probe(dev, ret,
> +					     "Failed to configure range for ch %u\n",
> +					     ch);
> +
> +		st->channels[st->num_channels++] =3D AD5529R_DAC_CHANNEL(ch);

[Severity: High]
Does this code risk an out-of-bounds array write to st->channels[]?

While the code checks if the individual 'reg' property 'ch' is less than 16,
it does not verify the total number of child nodes. If a malformed Device T=
ree
contains more than 16 child nodes (for instance, due to duplicate 'reg'
values), st->num_channels will exceed the fixed size of st->channels[16] and
corrupt adjacent memory.

> +	}
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260722-ad5529r-dr=
iver-v7-0-7781cd74ad75@analog.com?part=3D7
