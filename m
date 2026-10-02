Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A7828B4E2
	for <devicetree@vger.kernel.org>; Fri,  2 Oct 2026 12:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790942633; cv=none; b=FI9T3YVYli0bOcNChGMUZJEDAI1eG3YyUwUTC81pjHbcadz7scpz1jPyLNra5+7a2sDN0r+YTuGU6SYyHqWXYYKBGxTbg3joSa2jqYFuh3j51TbdE3geQ8ERwe+RjHtb+7LskuZNqRlyosmsS+mRbp73V47NAWl7BLiMarQ729Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790942633; c=relaxed/simple;
	bh=HoLKq4AJDy9dO6hdn2esRRgOdMbGVBMSKnYMPSBbx68=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fudMh+SFoaHOz4uELWWkpHQJLiAWxjLesj/jvPWOpO2P9Zg5+2d2yXFTlMLnCnsqApUQwJdZ0smpPgmOMrPAYHPSl1hQoX9OiU9gYhdL1Xw1FJogKvdi2LeTp17odgirDvE85QoWB3Rmm+b88dri3Dy+gPEhFy9MLSOIe8nANZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JMrqJ8gQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JMrqJ8gQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CA7E1F000FF;
	Fri,  2 Oct 2026 12:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790942631;
	bh=7N5CKJAGDc/z6GBo1nDUVNtCQ2xnN1GiKFaggWz9DO8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JMrqJ8gQRn3RVi11z1ld+uk6VLG48tmqTQF8cwpYfh5c2pY95Hcxhj6GPjlOmnB3t
	 feFaVEtE2Wb1v+cFJb/4FJ48L3tjXkehRSlCptjKB1z152G9jMOhKFvi7ZMYVgEQdz
	 pZdM+7a2Y7CliNIMe7bC7Mw3qTjG46w2cgy7Bsqbg4AHwJq3vHPJn5v+g/Iljscb9Q
	 zw9cm1oN6LE6CClNG40tkNCcYyor0GfAIwIY/inoPynB7dNBx4+ze2IAtVGq7sJbVO
	 XITLtcLJ1P2ywjEiDmhmQzc1Z6gh9idXqBHopaOsb/DaEKQgOd+zTuKGXwul/5YLLA
	 KGwxv6LXTVzvQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 5/6] iio: imu: inv_icm42607: Implement MREGx register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261002-b4-inv_icm42370p-v5-5-c65281b745c9@axis.com>
References: <20261002-b4-inv_icm42370p-v5-0-c65281b745c9@axis.com>
 <20261002-b4-inv_icm42370p-v5-5-c65281b745c9@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 02 Oct 2026 12:03:50 +0000
Message-Id: <20261002120351.5CA7E1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] iio: imu: inv_icm42607: error codes clobbered in mreg read/write
--

commit e8858e48c698c3e653b91adc09876f8bc8ccd389
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Implement MREGx register access

This commit implements indirect register access for MREG banks via a 16-bit
virtual regmap layered on top of the 8-bit bus regmap. It sets up the bank
switching sequence for MREG accesses while forwarding Bank 0 accesses
directly to the bus regmap.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 87b1499a3689f..ea0d50237817b 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_mreg_read(struct regmap *map, unsigned int reg,
> +				  u8 *data, size_t count)
> +{

[ ... ]

> +	ret =3D regmap_read(map, INV_ICM42607_REG_M_R, &val);
> +	if (ret)
> +		goto out;
> +
> +	fsleep(INV_ICM42607_MREG_ACCESS_DELAY_US);
> +
> +	*data =3D val;
> +out:
> +	/* Restore direct access. */
> +	ret =3D regmap_write(map, INV_ICM42607_REG_BLK_SEL_R, 0);

[Severity: High]
Does this overwrite the primary read error code in ret?

If the function jumps to the out label due to a bus error, and the cleanup
regmap_write succeeds (returning 0), it masks the original failure.

This causes the caller to receive a success code while operating on
uninitialized memory.

Since these values can be transformed and exposed to userspace, such as via
IIO sysfs attributes, could this lead to a kernel stack information leak?

> +	inv_icm42607_mclk_put(map, idle_set);
> +
> +	return ret;
> +}
> +
> +static int inv_icm42607_mreg_write(struct regmap *map, unsigned int reg,
> +				   const u8 *data, size_t count)
> +{

[ ... ]

> +	ret =3D regmap_write(map, INV_ICM42607_REG_M_W, *data);
> +	if (ret)
> +		goto out;
> +
> +	fsleep(INV_ICM42607_MREG_ACCESS_DELAY_US);
> +
> +out:
> +	/* Restore direct access. */
> +	ret =3D regmap_write(map, INV_ICM42607_REG_BLK_SEL_W, 0);

[Severity: High]
Similarly, does this overwrite the write error code?

If an I2C or SPI bus error happens earlier in the function and causes a jump
to the out label, a successful cleanup write will overwrite the error code
and falsely report success to the caller.

> +	inv_icm42607_mclk_put(map, idle_set);
> +
> +	return ret;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261002-b4-inv_icm=
42370p-v5-0-c65281b745c9@axis.com?part=3D5
