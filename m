Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4929A551987
	for <devicetree@vger.kernel.org>; Thu, 17 Sep 2026 13:51:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789653086; cv=none; b=ohAcXIQimvBi8j4kcdDLdMCT4dR4QSHNwnGabV4AgBp8euOfDGlt8dxypKvpY0635oXu9Qq3oCH75M6TtaSrrozMIoQdNdMumBVHfEyh1AXY9njBVS37dLA38WwqKJ6G3enB4dDHWaI/lImcennzEr5WuFif1oMfgPJS65nIsrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789653086; c=relaxed/simple;
	bh=/8C1Br6Zw8CDolaxk3jalr6t81HmbGbP8tZrMuNxhmc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qIDrhMjVUhgwnbAni4rsR2ttzBUr664R8//v6LXZFcQWr6OvrXuuT8JLCB8OcKc73egA8wVYoC/6/cnXx49Y2yhJrmoaxrHsy+nKJumLoqxmD1qNeAM3+DGeiTeLkJEv3Oi1igLm4C7Y7QbkgJOD4lrAPy3qUmqaDsWhe4AG6eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1jTycSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1jTycSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 074261F000FF;
	Thu, 17 Sep 2026 13:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789653074;
	bh=uATn+NQx4fEAQhUa9rycjTH8rOopZJduIrDS+6jvKPM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d1jTycSwntbAnH6yYKJi/yHfaHDkD+uwydHXXFZX9AG5ZlU+rGdh40Mn2qaMvDUUP
	 urhuqN4AT3TR5li092y6552PRn/80IhCYZHkPvSxx8S174zZLL9yRGAffXv+QF2Fko
	 y7Ss1orsANs4j3cEKHW8CbNlT4acnnGglPKrRu0vwuimXnHlsESi5kwY3XP4Pviz4m
	 bi3zHJz13GX+L3v2m4w9cxwIlqJOxJuM1N8HAh07rjKt7SbpxYnAeDFhsTLom0re5o
	 topwmWJrimFtV2F2lHfXhgc/BN7+aHapOj4VawvCTUS929gN/2/iT3x6VI8Qe6m4u5
	 b72cBC+FRMvmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] iio: imu: inv_icm42607: Implement MREGx register
 access
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kanak Shilledar" <kanak.shilledar@axis.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260917-b4-inv_icm42370p-v4-4-fd9373f123c9@axis.com>
References: <20260917-b4-inv_icm42370p-v4-0-fd9373f123c9@axis.com>
 <20260917-b4-inv_icm42370p-v4-4-fd9373f123c9@axis.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 13:51:13 +0000
Message-Id: <20260917135114.074261F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] iio: missing BLK_SEL state restoration on error path
--

commit 73a51c00960ea7003bf6f6db7c54135d8950eb5e
Author: Kanak Shilledar <kanak.shilledar@axis.com>

iio: imu: inv_icm42607: Implement MREGx register access

This commit implements indirect register access for the MREGx banks in the
ICM42607 driver. It adds routines for bank switching via the BLK_SEL regist=
ers,
applying the required bus delays, and restoring direct access.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c b/drivers/i=
io/imu/inv_icm42607/inv_icm42607_core.c
> index 114e7afcda391..9d572b3ffb15b 100644
> --- a/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_core.c

[ ... ]

> +static int inv_icm42607_mreg_read(struct regmap *map, unsigned int reg,
> +				  u8 *data, size_t count)
> +{

[ ... ]

> +	ret =3D regmap_write(map, INV_ICM42607_REG_BLK_SEL_R, blk_sel);
> +	if (ret)
> +		goto out;
> +
> +	ret =3D regmap_write(map, INV_ICM42607_REG_MADDR_R,
> +			   FIELD_GET(INV_ICM42607_REG_ADDR_MASK, reg));
> +	if (ret)
> +		goto out;

[Severity: Medium]
If this regmap_write() fails, the code jumps to out without restoring
INV_ICM42607_REG_BLK_SEL_R to 0.

Does this leave the device locked in indirect access mode if a transient
I2C error occurs here, and turn a recoverable error into a persistent device
failure by corrupting subsequent standard register operations?

[ ... ]

> +static int inv_icm42607_mreg_write(struct regmap *map, unsigned int reg,
> +				   const u8 *data, size_t count)
> +{

[ ... ]

> +	ret =3D regmap_write(map, INV_ICM42607_REG_MADDR_W,
> +			   FIELD_GET(INV_ICM42607_REG_ADDR_MASK, reg));
> +	if (ret)
> +		goto out;
> +
> +	ret =3D regmap_write(map, INV_ICM42607_REG_M_W, *data);
> +	if (ret)
> +		goto out;

[Severity: Medium]
Similarly in inv_icm42607_mreg_write(), if writing to INV_ICM42607_REG_M_W
fails, the function jumps to out.

Could this also skip the BLK_SEL_W restoration and risk leaving the device =
in
an incorrect bank state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917-b4-inv_icm=
42370p-v4-0-fd9373f123c9@axis.com?part=3D4
