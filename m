Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0237737AA6D
	for <devicetree@vger.kernel.org>; Mon, 10 Aug 2026 07:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786346697; cv=none; b=XY45srfHDs0wY7TbjXvViT0rA9MHRb1jt10LeeK6rK7vyaNqRnDi1lS2K/TazbvZ2QJ9+NoZppQmBKfjlEQqhXeavMupaO1dObbbo8hkVeg9ABwzoWit7VokozGuWQoA/6Eig0F5CiKbGm3hH9F54pOHE9yi9RGzlh4UnK4Vz8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786346697; c=relaxed/simple;
	bh=gCvZVuLK0Sbrjk4sAGF2LCUSUUwSQ8RBKGD9qfmWirE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GFfiEP3rSu2S2qxhpZULoawkZ9FuUpYr26WFLR/oW+lXDg/u4T2mAY9+hCrN62HREdjCFkExJqvzaGKtANX2OIwm6zxz43qRLuSut5hFff5uBQsOR3hTW+GGMoat090uMhj1vfGWFbTqc/VS8cIEkwYZ7UW5N+Nt9p3fpbuk9/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IcRRgAul; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IcRRgAul"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 426591F000E9;
	Mon, 10 Aug 2026 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786346695;
	bh=rJKvgd/yWsmWFrgCWryGxPm4tYIegi9MoinQj9HcxE8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IcRRgAulZkvZuYyqdgVB1ynfGUquYJI400XyjZ2I57aBpcBdH9eU+jTcpzonR7f3u
	 7TjXr0o950dFebfxnU1u6STtnStD41SDx5pcMGBxMQ9kM+gby+3C+BBhXlCCV/J1PO
	 WBLcCvN6zI0YKj4uPKB/JO0egu5XR6pZRQuk2k8/H3wx54uzgcbDLSxwJxt7W3liYY
	 n7Cz8h6QsamVUJ2IiLJVzTb9vgekCLQ8U7guPhTJMdyACG/IZH+nVFbezCdOs7yRZI
	 8OhNbCjxdSodINeRzZbFQsRx0nUB+bXxLIvn89lAlFHaEx+J+sKu/NzllO0xY8imcO
	 S7UoNpXm6tbTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 6/7] iio: light: ltr501: Add ltr329 driver support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260810-liteon-ltr329-v4-6-8bd3dfd15280@geanix.com>
References: <20260810-liteon-ltr329-v4-0-8bd3dfd15280@geanix.com>
 <20260810-liteon-ltr329-v4-6-8bd3dfd15280@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 10 Aug 2026 07:24:54 +0000
Message-Id: <20260810072455.426591F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Uninitialized kernel stack memory leak and functional corruption o=
n big-endian systems due to regmap_bulk_read/write type mismatch.
--

--- Patch [6]: [PATCH v4 6/7] iio: light: ltr501: Add ltr329 driver support=
 ---
commit 1db9cef73562002d6e7e4eeeed1f2b197809ecbf
Author: Esben Haabendal <esben@geanix.com>

iio: light: ltr501: Add ltr329 driver support

This adds support for the LTR-329ALS-01 chip, which is similar to the
LTR-303ALS-01, except it does not have interrupt support.

> diff --git a/drivers/iio/light/ltr501.c b/drivers/iio/light/ltr501.c
> index b36bd10a02624..cd5ff00ef5e26 100644
> --- a/drivers/iio/light/ltr501.c
> +++ b/drivers/iio/light/ltr501.c

[ ... ]

> @@ -1257,6 +1271,18 @@ static const struct ltr501_chip_info ltr501_chip_i=
nfo_tbl[] =3D {
>  		.channels =3D ltr301_channels,
>  		.no_channels =3D ARRAY_SIZE(ltr301_channels),
>  	},
> +	[ltr329] =3D {
> +		.partid =3D 0x0A,
> +		.als_gain =3D ltr559_als_gain_tbl,
> +		.als_gain_tbl_size =3D ARRAY_SIZE(ltr559_als_gain_tbl),
> +		.als_mode_active =3D BIT(0),
> +		.als_gain_mask =3D BIT(2) | BIT(3) | BIT(4),
> +		.als_gain_shift =3D 2,
> +		.no_irq_support =3D true,
> +		.info_no_irq =3D &ltr301_info_no_irq,
> +		.channels =3D ltr301_channels,
> +		.no_channels =3D ARRAY_SIZE(ltr301_channels),
> +	},
>  };

[Severity: High]
This is a pre-existing issue, but will this new ltr329 chip also be affected
by the big-endian stack leak in the driver's bulk read and write operations?

Looking at ltr501_trigger_handler() (and similarly in ltr501_read_thresh()
and ltr501_write_thresh()), the code uses regmap_bulk_read and=20
regmap_bulk_write to read or write 2 bytes into a 4-byte integer variable:

drivers/iio/light/ltr501.c:ltr501_trigger_handler() {
    ...
    int psdata;
    ...
    ret =3D regmap_bulk_read(data->regmap, LTR501_PS_DATA, &psdata, 2);
    ...
    scan.channels[j++] =3D psdata & LTR501_PS_DATA_MASK;
    ...
}

On big-endian systems, wouldn't reading 2 bytes into the address of psdata
only populate the upper half of the 32-bit integer, leaving the lower half
uninitialized?=20

Since the lower half contains uninitialized kernel stack memory,
doesn't masking and storing this in the IIO scan buffer leak stack memory to
userspace?

Similarly, wouldn't ltr501_write_thresh() corrupt the threshold configurati=
on
by writing 2 bytes from the lowest address of val (which are 0x00 on
big-endian)?

Could we fix this driver-wide issue by using 16-bit variables (like __le16)
for these 2-byte regmap_bulk_read and regmap_bulk_write operations?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260810-liteon-ltr=
329-v4-0-8bd3dfd15280@geanix.com?part=3D6
