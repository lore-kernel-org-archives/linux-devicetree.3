Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7BB3AFD11
	for <devicetree@vger.kernel.org>; Fri, 25 Sep 2026 13:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790343598; cv=none; b=jqwRtch/iv6k30HnGAJ8hNQ0hKvqbweMTEtSPw1eUbcC0UO1USgd/csZBdx6JFQPhuhfw0BmHZGmffUc+Eizr5KiysR3dNHbKk0kvr4n1oaNglABHquzmwwrj7smUnjVxLX5+n1/OMrn+PzqpMkIKUJ68JE6R07HUyOz0cU9zhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790343598; c=relaxed/simple;
	bh=aAzmtevatwqQvAPgd8JKkBs7cDxyyEMBFDnvtiVYhHI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QQLaW2zKpwqHJ8O1JAwOtLuPd59Ee8RJMc31kC4UqBwwP3ONrr80GB/Xm3GeG2F4h1ibWVUJ+E8eEk2zf0dHj6ueYFeY3L4Esyi1DVXfvQ0ssO9sHD8Pg8hl4ATJi1l9JHWkwAFVXuPuxPdmZbgoYJqzTAPw6U8GBrtd6j1Oi9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FceuSqEv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FceuSqEv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E4F1F000FF;
	Fri, 25 Sep 2026 13:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790343596;
	bh=gnioTN28H+juCvuyz5rjvDRkMGIB5UNt4YSziAeFtg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FceuSqEvA5Z5PdTbqhLDpwZ0zd+/B3GQHx88NsW4QRlSrQhprnQh/9sa87REu3FSx
	 fWMV+qJ51DuPsQiUv3Uo/FCU/0JwzBqyiWAh6JzDy4/MBIqiRjR/nZfL/S9SyIVP6k
	 KWZ7jckz9KAW77PrfLV9WNzbCBnzy9Sxz2h9Lw70IL8y3t0DWF2Xyu4dnrg+LTrf1e
	 MReNLXxhz0HU5g8dOOsQNX3kjYMhWAP6TSyEKCwmAM2hRTleMCzQGf+xHp78A2F8pD
	 D6f03Pyc+28I2YEAMkh6CQIqVhc7Z2+N96Q5SaKHxpZA0eEI98fOVQxURJi4E0J+XU
	 szrLhOQpvU6pg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 2/8] media: v4l: Add 10-bit RGBIr formats
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rishikesh Donadkar" <r-donadkar@ti.com>
Cc: media-ci@linuxtv.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260925133001.2780868-3-r-donadkar@ti.com>
References: <20260925133001.2780868-1-r-donadkar@ti.com>
 <20260925133001.2780868-3-r-donadkar@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 13:39:55 +0000
Message-Id: <20260925133956.10E4F1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] media: UAPI value collision for 10-bit RGBIr formats
- [High] media: missing v4l2_format_info entries for 10-bit RGBIr formats
--

commit 01de78103df3428257eae7c1c28cacb32713e810
Author: Jai Luthra <jai.luthra@linux.dev>

media: v4l: Add 10-bit RGBIr formats

This patch introduces new 10-bit RGBIr formats to support camera sensors
that capture near-IR light along with the visible spectrum. The formats use
an expanded 4x4 CFA pattern to capture both low-light and day-light scenes.

> diff --git a/include/uapi/linux/media-bus-format.h b/include/uapi/linux/m=
edia-bus-format.h
> index 6005f033e62c0..c50042300a988 100644
> --- a/include/uapi/linux/media-bus-format.h
> +++ b/include/uapi/linux/media-bus-format.h
[ ... ]
> @@ -161,6 +161,14 @@
>  #define MEDIA_BUS_FMT_SGBRG20_1X20		0x3022
>  #define MEDIA_BUS_FMT_SGRBG20_1X20		0x3023
>  #define MEDIA_BUS_FMT_SRGGB20_1X20		0x3024
> +#define MEDIA_BUS_FMT_SRGGI10_1X10		0x3021
> +#define MEDIA_BUS_FMT_SGRIG10_1X10		0x3022
> +#define MEDIA_BUS_FMT_SBGGI10_1X10		0x3023
> +#define MEDIA_BUS_FMT_SGBIG10_1X10		0x3024

[Severity: Critical]
Does this code assign values that directly collide with the 20-bit Bayer
formats defined at 0x3021 through 0x3024?

These exact hex values are already used by the 20-bit Bayer formats
(MEDIA_BUS_FMT_SBGGR20_1X20 through MEDIA_BUS_FMT_SRGGB20_1X20) defined jus=
t a
few lines prior. Any userspace program or kernel driver using these UAPI
constants to negotiate formats will encounter unresolvable ambiguity.

Additionally, code attempting to switch on both families will fail to compi=
le
due to duplicate case values.

> +#define MEDIA_BUS_FMT_SGIRG10_1X10		0x3025
> +#define MEDIA_BUS_FMT_SIGGR10_1X10		0x3026
> +#define MEDIA_BUS_FMT_SGIBG10_1X10		0x3027
> +#define MEDIA_BUS_FMT_SIGGB10_1X10		0x3028
> =20
>  /* JPEG compressed formats - next is	0x4002 */
>  #define MEDIA_BUS_FMT_JPEG_1X8			0x4001
[ ... ]
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index 5373dba640fae..c56af0826f592 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -744,6 +744,15 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_SGBRG16 v4l2_fourcc('G', 'B', '1', '6') /* 16  GBGB=
.. RGRG.. */
>  #define V4L2_PIX_FMT_SGRBG16 v4l2_fourcc('G', 'R', '1', '6') /* 16  GRGR=
.. BGBG.. */
>  #define V4L2_PIX_FMT_SRGGB16 v4l2_fourcc('R', 'G', '1', '6') /* 16  RGRG=
.. GBGB.. */
> +	/* 10bit raw bayer with IR (4x4) */
> +#define V4L2_PIX_FMT_SRGGI10 v4l2_fourcc('R', 'G', 'I', '0') /* 10 RGBG.=
. GIrGIr.. */

[Severity: High]
Are these new formats missing from the v4l2_format_info() array in
drivers/media/v4l2-core/v4l2-common.c?

When a standard V4L2 core helper such as v4l2_fill_pixfmt_aligned() or
v4l2_fill_pixfmt_mp_aligned() is used with these new formats,
v4l2_format_info() will return NULL, causing those helpers to immediately
return -EINVAL.

Any driver that natively supports these formats and relies on standard V4L2
helpers to calculate bytes-per-line and size constraints will fail to
negotiate or capture.

> +#define V4L2_PIX_FMT_SGRIG10 v4l2_fourcc('G', 'R', 'I', '0') /* 10 GRGB.=
. IrGIrG.. */
> +#define V4L2_PIX_FMT_SBGGI10 v4l2_fourcc('B', 'G', 'I', '0') /* 10 BGRG.=
. GIrGIr.. */
> +#define V4L2_PIX_FMT_SGBIG10 v4l2_fourcc('G', 'B', 'I', '0') /* 10 GBGR.=
. IrGIrG.. */
> +#define V4L2_PIX_FMT_SGIRG10 v4l2_fourcc('G', 'I', 'R', '0') /* 10 GIrGI=
r.. RGBG.. */
> +#define V4L2_PIX_FMT_SIGGR10 v4l2_fourcc('I', 'G', 'R', '0') /* 10 IrGIr=
G.. GRGB.. */
> +#define V4L2_PIX_FMT_SGIBG10 v4l2_fourcc('G', 'I', 'B', '0') /* 10 GIrGI=
r.. BGRG.. */
> +#define V4L2_PIX_FMT_SIGGB10 v4l2_fourcc('I', 'G', 'B', '0') /* 10 IrGIr=
G.. GBGR.. */
> =20
>  /* HSV formats */
>  #define V4L2_PIX_FMT_HSV24 v4l2_fourcc('H', 'S', 'V', '3')

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925133001.2780=
868-1-r-donadkar@ti.com?part=3D2
