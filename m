Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA28A25B091
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343670; cv=none; b=u5+Wj7vvWLAZrqAwEXS9aqHn71xjaxAPkT77CHRVRUDTXMu/TihWZ/FQSnJm/5ifk4kymJ1FxgiJcqk3nnAaaPKY8AV5NRwfTflQgxOo9hlexapR23Ysf/CGme5HWdfA98lHGMKq4VkkIFnx+FTItQ699pTOKT5pw2U2UNFIQ6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343670; c=relaxed/simple;
	bh=GTwktwHPSESziFgaPA08svM9/iLRhxrxpEOuaSAJFdI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HFpscxKLxt/xpvZrVsIAZUk11JV6gmuadn9Ngyg+n/VeN6J/8JimlQzb/D0ZIlM8hoqnv29y/gg9JVePCavTkvrYFmRW4k6G035zNGMBpd9b1nBTXAJJPWYpunk/SvN7iM2LeyIseSlO9/7g7ZOX927mfoi+FA9OGp49/Uv2hGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB2txmg+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB2txmg+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 162571F00893;
	Fri, 25 Sep 2026 13:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343668;
	bh=WpuLh6/y0kv8f22KJO/Z+XfSJcgLvG9qZ2X9OJSv5ZA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YB2txmg+ONRqUMqcTgGylk9aua9Zm5c1qNhfYnnYz83HUM1P/KQKdOtTdPSrP9rR/
	 AtvbmhGd/uFtojaidnEe7QyWDqcJXwoN96p9W8D+sv9i6ee4TkRwkXVGSPBsgT/FSq
	 Z5l/gkl/mSVuEMcFafo10+R6uRAhTwxIdCwDnxBVhi3N1yCtiUfJrfwsfrnmmJ9wDO
	 3QyH8Mh7nkNrBs/umQeWiMRt31PropHJlItSb4Rtx/CBros1JuO3xtYsTxVOZsnZK3
	 fqshiO74Lt4oGh3QAWzAz+1ecjmj0M3X/3YfMjylkGOhlyyShD8JOLRhwVSubQy7Ob
	 5gkdSrTFSssfw==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 3/8] media: i2c: ds90ub960: Add 10-bit RGBIr formats
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925133001.2780868-4-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-4-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:41:07 +0000
Message-Id: <20260925134108.162571F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: v4l: UAPI macro collision for new RGBIr formats
- [Low] media: i2c: ds90ub960: dead code due to duplicate format entries
--

commit 4873d66b1c092adcf631de1fb4047b7f2d564358
Author: Jai Luthra <jai.luthra@linux.dev>

media: i2c: ds90ub960: Add 10-bit RGBIr formats
   =20
This commit adds 10-bit RGBIr formats to the ds90ub960 media driver. It def=
ines
new 4x4 RGBIr bayer formats by appending them to the supported formats list.

> diff --git a/drivers/media/i2c/ds90ub960.c b/drivers/media/i2c/ds90ub960.c
> index 7d7ba6d349fc4..c86b18e0b4b33 100644
> --- a/drivers/media/i2c/ds90ub960.c
> +++ b/drivers/media/i2c/ds90ub960.c
> @@ -664,6 +664,24 @@ static const struct ub960_format_info ub960_formats[=
] =3D {
>  	{ .code =3D MEDIA_BUS_FMT_SGBRG12_1X12, .bpp =3D 12, .datatype =3D MIPI=
_CSI2_DT_RAW12, },
>  	{ .code =3D MEDIA_BUS_FMT_SGRBG12_1X12, .bpp =3D 12, .datatype =3D MIPI=
_CSI2_DT_RAW12, },
>  	{ .code =3D MEDIA_BUS_FMT_SRGGB12_1X12, .bpp =3D 12, .datatype =3D MIPI=
_CSI2_DT_RAW12, },
> +
> +	{ .code	=3D MEDIA_BUS_FMT_SRGGB8_1X8, .bpp =3D 8, .datatype =3D MIPI_CS=
I2_DT_RAW8, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGRBG8_1X8, .bpp =3D 8, .datatype =3D MIPI_CS=
I2_DT_RAW8, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGBRG8_1X8, .bpp =3D 8, .datatype =3D MIPI_CS=
I2_DT_RAW8, },
> +	{ .code	=3D MEDIA_BUS_FMT_SBGGR8_1X8, .bpp =3D 8, .datatype =3D MIPI_CS=
I2_DT_RAW8, },
> +	{ .code	=3D MEDIA_BUS_FMT_SRGGB10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGRBG10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGBRG10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SBGGR10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },

[Severity: Low]
Are these format entries unreachable?

Since these 8 standard Bayer 8-bit and 10-bit formats are already present
earlier in the ub960_formats array, appending them here duplicates the exact
same format codes.

Because ub960_find_format() returns the first match it finds sequentially,
these appended duplicates will never be reached, introducing dead code.

> +
> +	{ .code	=3D MEDIA_BUS_FMT_SRGGI10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGRIG10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SBGGI10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGBIG10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },

[Severity: High]
Do these new RGBIr format IDs collide with existing UAPI definitions?

Looking at include/uapi/linux/media-bus-format.h, the newly added 10-bit RG=
BIr
media bus formats are assigned UAPI values 0x3021 through 0x3024:

include/uapi/linux/media-bus-format.h:
    #define MEDIA_BUS_FMT_SRGGI10_1X10      0x3021
    #define MEDIA_BUS_FMT_SGRIG10_1X10      0x3022
    #define MEDIA_BUS_FMT_SBGGI10_1X10      0x3023
    #define MEDIA_BUS_FMT_SGBIG10_1X10      0x3024

These exact hex values are already assigned to the 20-bit Bayer formats
(MEDIA_BUS_FMT_SBGGR20_1X20 through MEDIA_BUS_FMT_SRGGB20_1X20) further up =
in
the file.

This causes an unresolvable collision in the public userspace API, where the
kernel and userspace will be unable to distinguish between the 10-bit RGBIr
and 20-bit Bayer formats during format identification.

> +	{ .code	=3D MEDIA_BUS_FMT_SGIRG10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SIGGR10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SGIBG10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
> +	{ .code	=3D MEDIA_BUS_FMT_SIGGB10_1X10, .bpp =3D 10, .datatype =3D MIPI=
_CSI2_DT_RAW10, },
>  };
> =20
>  static const struct ub960_format_info *ub960_find_format(u32 code)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925133001.2780=
868-1-r-donadkar@ti.com?part=3D3
