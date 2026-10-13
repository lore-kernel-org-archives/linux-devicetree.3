Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B5B51D537
	for <devicetree@vger.kernel.org>; Tue, 13 Oct 2026 15:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791905363; cv=none; b=qczd0yQpoQ6bWfEqnlEmNZNLBuJz5AvmLsQezVTNGh3qzKHqL0kLUE8PTBU9p0rQLAETswxQUWmrFxGVyTOLvidnxHwTQSmBp2neFeGL6kRPr9gVs8nufpcgrktVhgpmH04yVhVdYaGxEbduWSdMzOZqCthIM8mx5yCTxjwE/NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791905363; c=relaxed/simple;
	bh=ZTIfTs10eZ6hYw9g01vosgzYIl2ccW/rnZ/33jnAu6Q=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=S2qZ5qOIlhQsPStBa2lcuJoS0u0wCXGizBl2TvK3ZKpWP7bjqEK1Nm9UQe/CenX5u1uciSZeWefdIrKD3EmlVpZGj898x1DPnj9DmtPfs/s0FQYo9rG/7fxIAwsTI1RSljPTtD9fYag5a8TV1WAdklaPOHx9ir6QkvWM75/aF30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BXD9/+fX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BXD9/+fX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2D431F000FF;
	Tue, 13 Oct 2026 15:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905362;
	bh=M4EWKLFb4fZEb4BKtDdunvGJ+FmjVNQ04Qc56bisrT0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BXD9/+fXbA+uZh1hQ9t0ZASr6n7pv/z3/IVaKSJqTxHS7QeeQiDF43LE5O3RDmXvj
	 OUzvHrYos1/CxC6cNBcVkpzBGr2RTBhu8Q9IcpgN4V8QrwDjK5dMpGKPb8KH5fE+cP
	 9zd5M7t4pmJMUIGkBOVVlqSzAstk1363jHznUOWDB1+66wCa3C3Ocs3Ze0SkT+7T2L
	 9fCUq8wvULHjiaZpMFWmrnbrucRv7RavPeFGg/qSFmdVBRRv+fuwi3b7MwBMh8ey8t
	 SZGjHRI4yaeyF22+3peZR8UCEqfWlyuwvnOKBuFCmRyQ4Lj3uUbWeUNXh6z/O9BF2X
	 MVzfvTX5c1X0g==
Message-ID: <sashiko-outbox-169998@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/13] media: sony-starvis2: Add support for IMX585
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dave Stevenson" <dave.stevenson@raspberrypi.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com>
References: <20261013-media-starvis2-v2-0-3670722d250a@raspberrypi.com>
 <20261013-media-starvis2-v2-13-3670722d250a@raspberrypi.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 15:29:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] media: duplicate .active_area initialization in imx585_variant_def=
 leaves .native_area zeroed
--

commit 189fbc745613583120b9ef2ff05d5e60a02d4cb3
Author: Dave Stevenson <dave.stevenson@raspberrypi.com>

media: sony-starvis2: Add support for IMX585

This commit adds support for the IMX585 8MPix Starvis 2 sensor.

> diff --git a/drivers/media/i2c/sony-starvis2.c b/drivers/media/i2c/sony-s=
tarvis2.c
> index 1ce2b86c57acc..c9a3dd4fe529b 100644
> --- a/drivers/media/i2c/sony-starvis2.c
> +++ b/drivers/media/i2c/sony-starvis2.c

[ ... ]

> +const struct starvis2_variant imx585_variant_def =3D {
> +	.name =3D "imx585",
> +	.id_reg =3D CCI_REG16_LE(0x5a1d),
> +	.id_mask =3D 0x3ff,
> +	.id_value =3D 0x259,
> +	.active_area =3D {
> +		.top =3D 0,
> +		.left =3D 0,
> +		.width =3D 3857,
> +		.height =3D 2201,
> +	},
> +	.active_area =3D {
> +		.top =3D 20,
> +		.left =3D 0,
> +		.width =3D 3856,
> +		.height =3D 2180,
> +	},

[Severity: High]
Does this code inadvertently leave .native_area uninitialized?

By defining .active_area twice, the second definition overwrites the first,
leaving .native_area implicitly zero-initialized. When userspace queries
V4L2_SEL_TGT_NATIVE_SIZE via starvis2_get_selection(), it will inadvertently
receive a 0x0 native area.

Was the first .active_area initialization intended to be .native_area?

> +	.pixel_rate =3D 594000000,
> +	.pix_per_clk =3D 8,
> +	.common_regs =3D imx585_common_regs,
> +	.num_common_regs =3D ARRAY_SIZE(imx585_common_regs),
> +	.vmax_default =3D 2250,
> +	.hmax_min_link_freq =3D imx585_min_hmax_2lane,
> +	.hmax_min_pixel_array =3D 550,
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013-media-star=
vis2-v2-0-3670722d250a@raspberrypi.com?part=3D13
