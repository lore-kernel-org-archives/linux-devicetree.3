Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ACDBE56A
	for <devicetree@vger.kernel.org>; Thu, 11 Jun 2026 20:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210470; cv=none; b=ELEPdRSQFJHyutCOVfwAItE68ABFOKIrF9RoPG0t/zn9p5wqTCitGi/zmKbEsgZ9CIROVTGsamiZj+kgztUStS+/97T6IZ7UTY/M6oiL7tbXyMiwGx/HC0d5Nazuc1k4+eoLmzv1Du6LWZ14O+cuh0HLg/DFIevJYnxm9awS1ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210470; c=relaxed/simple;
	bh=wfnV9mehN/32aF9vds/DjL8h7Q3vFlEd6p3vsxnrLtY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bRxXd7aed7cqMtT+KegvnqZShgpWKmrAly2i7CDwXclVV+WGoVQavE4MwS1GNvHzTVebrBJQdBWNj082Sw69SaxJmHub7y8DOEK7ecuczAmYNdkPF7pvkTlT+Jqbfp+ALbD3FWjFauKeJYs4lk1LZkKjGly7le9IUK6NH/8vdKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cE9ESQU2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cE9ESQU2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304D01F000E9;
	Thu, 11 Jun 2026 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781210467;
	bh=g6FbvSY2WYeS74l6Wy3lIwtK7CpYiw9bhjs72vCtCSo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cE9ESQU2ushR2HpOl4bcB5J6BZK1zIx+KHqOMUF76ZG54XbQuJdQzN+2R+nXMU2ks
	 I99p7lQ27dssMvpfAD7q2twCdlrJNxb5O+qZZwUPppobGVkdebi3yeUk47Cc9AhyeA
	 3D/mBJq6cotKc35dzxkAgOlDLaoxjtcUuGMeCpKOdXXT6ALge6TMVtjMVia+BWiG3D
	 c4yQn9u6lTz9qOZLaF2fvsU27VP3rgTaIGIr+9BDohfU5IjUDN3AudlNZkC8fgUjN2
	 zir4WXufijeWR7jNwlXtt2fBzC5yJNeHefobfiOWdT8SdoUdLUq8ZVyec72QZwfiwz
	 fforLuGAi5ssQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH V12 4/9] iio: imu: inv_icm42607: Add SPI For icm42607
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chris Morgan" <macroalpha82@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260611202607.85376-5-macroalpha82@gmail.com>
References: <20260611202607.85376-5-macroalpha82@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 20:41:06 +0000
Message-Id: <20260611204107.304D01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Double application of FIELD_PREP macro on an already prepped value.
--

commit de269946a2a02ebf320879fcd7727f3ff6aa4aa7
Author: Chris Morgan <macromorgan@hotmail.com>

iio: imu: inv_icm42607: Add SPI For icm42607

Add SPI driver support for InvenSense ICM-42607 devices.

> diff --git a/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c b/drivers/ii=
o/imu/inv_icm42607/inv_icm42607_spi.c
> new file mode 100644
> index 0000000000000..0c8deb1f33e22
> --- /dev/null
> +++ b/drivers/iio/imu/inv_icm42607/inv_icm42607_spi.c
[ ... ]
> @@ -0,0 +1,107 @@
[ ... ]
> +static int inv_icm42607_spi_bus_setup(struct inv_icm42607_state *st)
> +{
> +	unsigned int val;
> +	int ret;
[ ... ]
> +	val =3D FIELD_PREP(INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK,
> +			 INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_I2C_DIS);

[Severity: Low]
Does this code apply the FIELD_PREP() macro twice?

INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_I2C_DIS is already defined using
FIELD_PREP() in the header. Applying it again here works only because the
mask shift happens to be zero. If the mask had a non-zero shift, this double
preparation would trigger a compile-time error.

> +	return regmap_update_bits(st->map, INV_ICM42607_REG_INTF_CONFIG0,
> +				  INV_ICM42607_INTF_CONFIG0_UI_SIFS_CFG_MASK,
> +				  val);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611202607.8537=
6-1-macroalpha82@gmail.com?part=3D4
