Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2769130F95F
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029036; cv=none; b=XjChTVPGn2jWc6K+znG2LvM4E+2JGpYVRUak9uPSjEptswN+dAL/tAIkY2ckVPzO+XIaC5xEA6XSR2JpZv729EiuQpw9rXjxsxBN8pMejAA0x7uHzGsyVe+GBJQl7bN+cIpWjvMNZqCRFx6z2e7Pd/MtALDfPg4aAa1+mKUriTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029036; c=relaxed/simple;
	bh=h8RnyU8vTTf2be/mvzkS0tvVNvPjaBWRQlFOxtKHkCM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=svhJu1oDYd6KlHiYW/K4F9E+K34eb3k84ZX4g23QTCcmeP/a5AFgRcJxUf3EbrsRcW1t9YsyHvzUDN9eAVCv/NR4kq70mx2snDEPSxjhEZtDedwPAvrynVKfSzQxXZDc9MFSsWJj9QvH5h1FQvxO/2NK5h4lylGC2iNsbq6mr0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=EXHuBuj7; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="EXHuBuj7"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5ffd57b6fc6so566309137.1
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:50:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029032; x=1774633832; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3wqGsFiKB/araXt5Rn1zva+s4bqIbZIKgO/Chh82k=;
        b=EXHuBuj7S4nmlBHJ36yxrQiuvmtze49ud4X2yeZ6G4IPURcm4I9M4zBlIVXL/9FJ5c
         jxJV8azJhcLjokmxLltH/QhRt/9oVuANN8vsYhqldfbwL6Vr5Ow0q6U2/hURtuRTTwgD
         9BXiDMUQpr42ZkHF6SsDCF/qPipG3cX6Zdify0EM3lFpACNzUEt+TR7S17VBytMNWCYB
         Yeq/wAu64JPpMOZpBfHlh7zQHn7fB6BaLGFjTsD3O4y0xB5bWqiYWaKyCjGGSLR1NajY
         OJSb4zvFjFt81ibAO0c5WCQqQaaZoGrGR8Fdxd4z/oRldcJPUhKb40hFT5b6buhyfiNU
         DakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029032; x=1774633832;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9+3wqGsFiKB/araXt5Rn1zva+s4bqIbZIKgO/Chh82k=;
        b=DFAWiVQ/hEjDsdWJSqcweRKhtKwl/OidATdDINE453To7gFkdOsUgKBE/rNv/9U3xx
         d1EUh3uAPqGykO0V0ieM7z8g4aDBIEdaO6QE34Z3FghpMKzREErHZvA/6LqnKK+eSVIA
         l1TvH8qPJTXN4pQHlVN8rDd0qD43/tZpHe8/gFeKTYdhJTUrwdbEpmqV4Enj3YB/qO+N
         ZfGg0uFGbCWUKaVQLRKToymve1GsnGd91Nu0UDO4YXKd1J5DsTc6fhsQgSbTtmZHyHfu
         2eK4KXPTNV3qr0jxktVKf5zg0S/25xDKFmzyvEGSQSdekU5k2xMegt+rzYcGEqbzyDwU
         APPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoJoDzYPOtLvVJ+E/hpOltlzp2iK6WAY3k1gsD2beAf+f35T4fQt3gDsj9aZUkapNAXkM5zr4Ihkxl@vger.kernel.org
X-Gm-Message-State: AOJu0YxtGxekK4b4mLvAwF30RO524VIoSZkvChVuqC70JNEBMSrVsyOH
	ILauCPimmbcZtfaOl+PbV4zOV5m57ijs5hEXsvs/S8kQ08ego/JeFLM8riN2Wwwm3tk=
X-Gm-Gg: ATEYQzyYX+xtm38hNzwpS6V9TL4HmjvkKEd7BpgjtRcc0yIbG2wovjziza1PcG/Wm9W
	KbmEQCy3s9JDO7C5CiHHlIzz2SdqjxVeHWUg1aHsmktnP+K62hxOLoTj/lkyHBdfXIpelm8aoTY
	XnYQQU+Z/IpY2cFEMYfgz3Jsa0jAw4q03+VuBR5FbpfsvL+zdT00YuZfNSMPiqZf/9MIGGuidkZ
	9H5s+WTsZrlg8AopEewr/4oOEfVphGbJipQcS/VhszlhlhYrtbGaiYDlXM0zc7oJaadDobc6Eio
	aiVpG9Kms8RUb73VLYWPySkZn5OgIPijaLNLuSqVGsq296/43cPKVN55xCEnLW/JEKgVZg+U5U6
	dkZFLqH/aFUEnnq1a7v/TXXPlnR0lBL/HOfvossuTu78pffzQSEHvY/TYGgSHYbf6azH1ya4SaC
	vc6dg/KkpAxb3kfTCiHJ/8a6Ojf8+o
X-Received: by 2002:a67:e7cc:0:b0:5ff:ea89:44c8 with SMTP id ada2fe7eead31-602aea8d86cmr2035276137.2.1774029031769;
        Fri, 20 Mar 2026 10:50:31 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cddcadfaesm1907968e0c.13.2026.03.20.10.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:50:30 -0700 (PDT)
Message-ID: <79bed98f003cbd09ffddc4ad21bdbad998f29477.camel@ndufresne.ca>
Subject: Re: [PATCH v3 12/27] media: rockchip: rga: calculate x_div/y_div
 using v4l2_format_info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de
Date: Fri, 20 Mar 2026 13:50:29 -0400
In-Reply-To: <20260127-spu-rga3-v3-12-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-12-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-8llJ0AxXppJ7Gm/JlUMB"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-8llJ0AxXppJ7Gm/JlUMB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Calculate the x_div and y_div variables with the information from
> v4l2_format_info instead of storing these in the rga_fmt struct.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c | 45 +++++++----------=
-----------
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 2 --
> =C2=A02 files changed, 11 insertions(+), 36 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index c0218a71fee04..7405355c334ad 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -42,6 +42,7 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_a=
ddr_offset *offset,
> =C2=A0{
> =C2=A0	struct rga_corners_addr_offset offsets;
> =C2=A0	struct rga_addr_offset *lt, *lb, *rt, *rb;
> +	const struct v4l2_format_info *format_info;
> =C2=A0	unsigned int x_div =3D 0,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 y_div =3D 0, uv_stride =3D 0, pixel_widt=
h =3D 0;
> =C2=A0
> @@ -50,8 +51,16 @@ rga_get_addr_offset(struct rga_frame *frm, struct rga_=
addr_offset *offset,
> =C2=A0	rt =3D &offsets.right_top;
> =C2=A0	rb =3D &offsets.right_bottom;
> =C2=A0
> -	x_div =3D frm->fmt->x_div;
> -	y_div =3D frm->fmt->y_div;
> +	format_info =3D v4l2_format_info(frm->pix.pixelformat);
> +	/* x_div is only used for the u/v planes.
> +	 * When the format doesn't have these, use 1 to avoid a division by zer=
o.
> +	 */
> +	if (format_info->bpp[1])
> +		x_div =3D format_info->hdiv * format_info->bpp_div[1] /
> +			format_info->bpp[1];
> +	else
> +		x_div =3D 1;
> +	y_div =3D format_info->vdiv;
> =C2=A0	uv_stride =3D frm->stride / x_div;
> =C2=A0	pixel_width =3D frm->stride / frm->pix.width;
> =C2=A0
> @@ -476,128 +485,96 @@ static struct rga_fmt formats[] =3D {
> =C2=A0		.color_swap =3D RGA_COLOR_ALPHA_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> =C2=A0		.depth =3D 32,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_ABGR32,
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR8888,
> =C2=A0		.depth =3D 32,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_XBGR32,
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_XBGR8888,
> =C2=A0		.depth =3D 32,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_RGB24,
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_RGB888,
> =C2=A0		.depth =3D 24,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_BGR24,
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_RGB888,
> =C2=A0		.depth =3D 24,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_ARGB444,
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR4444,
> =C2=A0		.depth =3D 16,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_ARGB555,
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_ABGR1555,
> =C2=A0		.depth =3D 16,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_RGB565,
> =C2=A0		.color_swap =3D RGA_COLOR_RB_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_BGR565,
> =C2=A0		.depth =3D 16,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV21,
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV61,
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> =C2=A0		.depth =3D 16,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV12,
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV12M,
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420SP,
> =C2=A0		.depth =3D 12,
> -		.y_div =3D 2,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_NV16,
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422SP,
> =C2=A0		.depth =3D 16,
> -		.y_div =3D 1,
> -		.x_div =3D 1,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_YUV420,
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> =C2=A0		.depth =3D 12,
> -		.y_div =3D 2,
> -		.x_div =3D 2,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_YUV422P,
> =C2=A0		.color_swap =3D RGA_COLOR_NONE_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV422P,
> =C2=A0		.depth =3D 16,
> -		.y_div =3D 1,
> -		.x_div =3D 2,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.fourcc =3D V4L2_PIX_FMT_YVU420,
> =C2=A0		.color_swap =3D RGA_COLOR_UV_SWAP,
> =C2=A0		.hw_format =3D RGA_COLOR_FMT_YUV420P,
> =C2=A0		.depth =3D 12,
> -		.y_div =3D 2,
> -		.x_div =3D 2,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index 640e510285341..27b3c9b4f220c 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -20,8 +20,6 @@
> =C2=A0struct rga_fmt {
> =C2=A0	u32 fourcc;
> =C2=A0	int depth;
> -	u8 y_div;
> -	u8 x_div;
> =C2=A0	u8 color_swap;
> =C2=A0	u8 hw_format;
> =C2=A0};

--=-8llJ0AxXppJ7Gm/JlUMB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2I5QAKCRDZQZRRKWBy
9HXSAP9GjiFmMpaSBl7D7aoiLJ85W7ghWm/nFJLKJ4Yic8msvAEApMGuun1hXrrx
DPKjOSakcRloYNmZpjU2L1vH4k7Jwg4=
=9BJ9
-----END PGP SIGNATURE-----

--=-8llJ0AxXppJ7Gm/JlUMB--
