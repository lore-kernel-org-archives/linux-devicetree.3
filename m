Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795121063;
	b=rJRp+jzQrf+HEwGT2XXRVWHs1GQ9k/id9moDIQAaPdQaKukHpUuuxNF+6L1jMu/fr7X5
	 18anKf4w/J3XIu3jiu5EJd0YmfNSJamjqg2THNMpvM3I3Gm1kLJr3FaiGOdbkhEHCA1VV
	 QSmFvmM53ol/eXDGdX9BxW+t07svTl9rslNMcJMH4zJhoap3Atd/o+b37ENSaaer6sh/i
	 VBs5lzx5P7fBUuPQ36zPeb0I+I+DuwcBkMW+bv4t7YTnsWdbqll4QVqff/Ei092IFneDz
	 PvbiglZfvPVz6lszZtoWsHmQ+dMyn+2pPpBVtRHMrG8mE1qtMnU7luiB5BXHPv5HWSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795121063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:Autocrypt:
	 Content-Type:User-Agent:MIME-Version;
	bh=us/swDW+0MFA2SvkQqeJj7GMq8SlSvgHW9TCeExgemo=;
	b=tDnk0qluf1CLxnTcQ0zaBkv8kh2gpuNnYySqQ2lF+7St3JQXeYQcUJ6a9K52tRTCDluj
	 M8aQNjYfmvG9kfa60LCJ7PCdh0NO+JyvdZToGFTkbbOSUOYNVbItHHW4Edev3zAb2m2LL
	 O+BsXh1m2sCOBHrCrJjGNAGTQTxQfxd3lzIqRPQu/9Dw9UT/3MwrxIcg/IYv16tZsy+Ys
	 NHvA77UnlmZezMAfG+YQCrc49nanIJVKonz7T75aictanKosrDQ40iwiGywCV6eZrBVBL
	 gF5BENm5XzPSWMbvhgFd9+U4gDpLGUOmPdr8iZt8V3+kvxzIk3zBGQtnNpbEttuLboQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ndufresne.ca;
	spf=pass smtp.mailfrom=ndufresne.ca;
	dkim=pass header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rDkIjsGH;
	arc=none smtp.remote-ip=209.85.222.172
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E664A606B76A
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 20:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E664A606B76A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20260707.gappssmtp.com header.i=@ndufresne-ca.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rDkIjsGH
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9496577d4c4so13213385a.1
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 12:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20260707.gappssmtp.com; s=20260707; t=1795121062; x=1795725862; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=us/swDW+0MFA2SvkQqeJj7GMq8SlSvgHW9TCeExgemo=;
        b=rDkIjsGHGQOOrh35hLdYB48V6JN0+gzx4bHM7kVvCu/13WU6U9WlX8caRiuSfAscOX
         PLkDahS3IGH+/8JbvK4rVgIcY8LnnqQgfJIzNde/+1YDeYbkOBqQfl15MA/ulS/zeNdZ
         eCeLu8HM0UHl2Oejx/k4kxsKtkLLpmJv0cIAwaIkKkNrVPZxiqixwfCPu0UeXV57ljcW
         zj8QKn0SOtcJuptQJ2cdhnmgYcnjSEWCDSY2MFtpyET1F60Ks49HP0bOdlpkF+E5UbCv
         9rOI+lvEVnuTZpItGfsjohJxcrwJCm4WcdNZT/k/cxbSvd4cAdhXoeSYJGgkn4bhUMbQ
         3TiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121062; x=1795725862;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=us/swDW+0MFA2SvkQqeJj7GMq8SlSvgHW9TCeExgemo=;
        b=uwGQ7h0ukZfsF8rewJo+34qIM63mUbVUkQgBvVkOO0x8v6opCK0npz/gFawsyLSWpZ
         CiQ5KTDlTJntF7GcPO0VNZlNvgWpgrYOLKRZLm+fWgHs/1fedgpxGKmqYR33d6A7/mQy
         EP9/pO8YPvAVDycs0vpTGhTd1Oea/27+T3sKrjeRGlIz7wZADpdv99vBspmP1/fOve4S
         lNCdK+WaUEZoTbd1hNvi89cCZXvCNYTG/YNuAkRyqRzyLjFvdfIgIObjHLftaU+f5BJ9
         Bg5sTfvy3tBEbfyE8Zv0/2d9cjacKiF09JPriT1+bjJJrAdaskcfY9dJ3+f+7GTeb2TD
         dpuw==
X-Forwarded-Encrypted: i=1; AL+hErFEAWxBdP3Fc8mPtPMHMFXwRGZwyj9WYxnmxiviVf1kCwpbn2o3ox4g+RP3X1tQfA6IergEEUCrdwMo@vger.kernel.org
X-Gm-Message-State: APuU4Z9Kv/oX4ZUknyxoiWgam8GjYRZdVijgZypHJTF5VGCgf3DDdqLV
	V0vc+sxaI/UwwKYWJHGfJjyAfLlUwnaL/xgqzuBm+1kHOLFlz7ED2dgk21Z0vtdZXDg=
X-Gm-Gg: AYBFou1Dx2sjkQrfD2R7DNc0UC9yWxOe4/NTbwVnF6s5BvVEaw5kiLwYbtH6xamg+m9
	kkYYBQ0hU7uImTGvHy8IaxqczJYaIB8oMS+TzEly/LwerkdxvJ7tno+zjj9utGuhLIBPZLuZYXP
	bSTJcYx4UqoOGvLP+rvtmWg7v19Uf+X8U4Z0m2gPO8hUljJjy6urBAURmlO0hnwtJVpyMP9pY11
	fuPorL+TZ7XorsLtlEjXx0VbY+iNJhMAjqP3uaLQrH8q+LUd6OE8zEi9GBs1A2TKCTlpChqSFtg
	YN3xVFO9e9LTPemdTd9/XfvRFTLDiMFzDL77/NCqrMYSv1OVcNix0hAAJ+3xU4UqMwY6A94TVCq
	+QQ/TIv7mxwjrG9seyjOQtydN8hGK3ZHHjjucW3gi6G9nNk721/4nnU5oRkGyceBMDbJPaszGBp
	OVc/cP+dL+l71FKsL26lmF/oXuW6K7qVfKGiAvkDcPgi9yF1oI54GZc6+h0OBOt7COEEmMWphzc
	ATMZ87KN12EyRVEd6T6yYuT0CVuAStackBNIDz/t0yux9kB/NuzgeHugrI51q3l6kRDkDbCE0F8
	/UhNImBLPjR0cEPCkC7uHR3I9Ev/bArxJhnrZ28sWjqr1Eys4CcItLc=
X-Received: by 2002:a05:620a:8802:b0:943:fe60:3748 with SMTP id af79cd13be357-949ba9d164fmr134691485a.25.1795121061732;
        Thu, 19 Nov 2026 12:44:21 -0800 (PST)
Received: from ?IPv6:2606:6d00:11:8ec9::c41? ([2606:6d00:11:8ec9::c41])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38b0fbsm47040385a.20.2026.11.19.12.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:44:20 -0800 (PST)
Message-ID: <3415e7b52c3d05214ec125b2b4f8612129c53ae0.camel@ndufresne.ca>
Subject: Re: [RFC PATCH 07/28] media: mali-vpu: implement TRY_FMT and S_FMT
 ioctls
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Charvi Mehta <charvi.mehta@arm.com>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>,  Krzysztof Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Philipp Zabel	 <p.zabel@pengutronix.de>, Vincenzo
 Frascino <vincenzo.frascino@arm.com>,  Rathinavel Sankaralingam
 <rath.sankaralingam@arm.com>, Shobhit Pandey <shobhit.pandey@arm.com>
Date: Thu, 19 Nov 2026 15:44:19 -0500
In-Reply-To: <20261119153758.1426673-8-charvi.mehta@arm.com>
References: <20261119153758.1426673-1-charvi.mehta@arm.com>
	 <20261119153758.1426673-8-charvi.mehta@arm.com>
Autocrypt: addr=nicolas@ndufresne.ca; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-7FuWGsgEm19K23CwFDyg"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-7FuWGsgEm19K23CwFDyg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

skipped a bit, while I remember...

Le jeudi 19 novembre 2026 =C3=A0 15:37 +0000, Charvi Mehta a =C3=A9crit=C2=
=A0:
> Implement VIDIOC_TRY_FMT and VIDIOC_S_FMT for the decoder OUTPUT and
> CAPTURE queues.
>=20
> Move format lookup and buffer layout calculation into shared helpers so
> session initialization and format negotiation use the same sizing rules.
>=20
> Signed-off-by: Charvi Mehta <charvi.mehta@arm.com>
> ---
>  drivers/media/platform/arm/mali-vpu/Makefile  |   3 +-
>  .../platform/arm/mali-vpu/mali-vpu-formats.c  |  81 +++++++++++
>  .../platform/arm/mali-vpu/mali-vpu-formats.h  |  10 ++
>  .../platform/arm/mali-vpu/mali-vpu-session.c  |  24 +---
>  .../platform/arm/mali-vpu/mali-vpu-vidioc.c   | 132 +++++++++++++++---
>  5 files changed, 209 insertions(+), 41 deletions(-)
>  create mode 100644 drivers/media/platform/arm/mali-vpu/mali-vpu-formats.=
c
>=20
> diff --git a/drivers/media/platform/arm/mali-vpu/Makefile b/drivers/media=
/platform/arm/mali-vpu/Makefile
> index 94ddde02fc528..1dc62621d9dc0 100644
> --- a/drivers/media/platform/arm/mali-vpu/Makefile
> +++ b/drivers/media/platform/arm/mali-vpu/Makefile
> @@ -6,6 +6,7 @@ mali-vpu-objs :=3D mali-vpu-probe.o \
>  =09=09mali-vpu-session.o \
>  =09=09mali-vpu-dec.o \
>  =09=09mali-vpu-buffer.o \
> -=09=09mali-vpu-vb2.o
> +=09=09mali-vpu-vb2.o \
> +=09=09mali-vpu-formats.o
> =20
>  obj-$(CONFIG_VIDEO_MALI_VPU) +=3D mali-vpu.o
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-formats.c
> new file mode 100644
> index 0000000000000..d268435432371
> --- /dev/null
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.c
> @@ -0,0 +1,81 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 ARM Limited.
> + */
> +
> +#include <linux/errno.h>
> +#include <linux/minmax.h>
> +#include <linux/mm.h>
> +#include <linux/overflow.h>
> +#include <linux/string.h>
> +#include <media/v4l2-common.h>
> +
> +#include "mali-vpu-formats.h"
> +#include "mali-vpu-session.h"
> +
> +const struct mali_vpu_format_desc *
> +mali_vpu_find_format(struct mali_vpu_session *sess, u32 pixfmt,
> +=09=09     enum v4l2_buf_type type)
> +{
> +=09const struct mali_vpu_format_list *fmt_list;
> +=09u32 i;
> +
> +=09switch (type) {
> +=09case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> +=09=09fmt_list =3D &sess->port_src.supported_fmts;
> +=09=09break;
> +=09case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> +=09=09fmt_list =3D &sess->port_dst.supported_fmts;
> +=09=09break;
> +=09default:
> +=09=09return NULL;
> +=09}
> +
> +=09for (i =3D 0; i < fmt_list->num_fmts; i++) {
> +=09=09if (fmt_list->fmts[i].fourcc =3D=3D pixfmt)
> +=09=09=09return &fmt_list->fmts[i];
> +=09}
> +
> +=09return NULL;
> +}
> +
> +int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
> +=09=09=09    u32 width, u32 height,
> +=09=09=09    struct v4l2_pix_format_mplane *pix_mp)
> +{
> +=09u32 sizeimage;
> +=09int ret;
> +
> +=09memset(pix_mp->reserved, 0, sizeof(pix_mp->reserved));
> +=09memset(pix_mp->plane_fmt, 0, sizeof(pix_mp->plane_fmt));
> +=09pix_mp->flags =3D 0;
> +
> +=09if (fmt->flags & V4L2_FMT_FLAG_COMPRESSED) {
> +=09=09pix_mp->width =3D width;
> +=09=09pix_mp->height =3D height;
> +=09=09pix_mp->pixelformat =3D fmt->fourcc;
> +=09=09pix_mp->num_planes =3D 1;
> +=09=09pix_mp->plane_fmt[0].bytesperline =3D 0;
> +
> +=09=09/*
> +=09=09 * Use one byte per pixel as the default compressed sizeimage,
> +=09=09 * with a minimum of one page, aligned to a page boundary.
> +=09=09 */
> +=09=09if (check_mul_overflow(width, height, &sizeimage))
> +=09=09=09return -EOVERFLOW;
> +
> +=09=09sizeimage =3D max_t(u32, PAGE_SIZE, sizeimage);
> +
> +=09=09if (sizeimage > U32_MAX - (PAGE_SIZE - 1))
> +=09=09=09return -EOVERFLOW;

The "moved" code is not exactly identical, and this is not said in the comm=
it
message. Depending on you max_width/height, this might all be exaggerated.

> +
> +=09=09pix_mp->plane_fmt[0].sizeimage =3D PAGE_ALIGN(sizeimage);
> +
> +=09} else {
> +=09=09ret =3D v4l2_fill_pixfmt_mp(pix_mp, fmt->fourcc, width, height);
> +=09=09if (ret)
> +=09=09=09return ret;
> +=09}
> +
> +=09return 0;
> +}
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> index 13031809fdb4d..5703142b93b46 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-formats.h
> @@ -7,6 +7,9 @@
>  #define __MALI_VPU_FORMATS_H__
> =20
>  #include <linux/types.h>
> +#include <linux/videodev2.h>
> +
> +struct mali_vpu_session;
> =20
>  enum mali_vpu_codec_fmt {
>  =09MALI_VPU_FORMAT_CODEC_H264,
> @@ -24,4 +27,11 @@ struct mali_vpu_format_list {
>  =09u32 num_fmts;
>  };
> =20
> +const struct mali_vpu_format_desc *mali_vpu_find_format(struct mali_vpu_=
session *sess,
> +=09=09=09=09=09=09=09u32 pixfmt,
> +=09=09=09=09=09=09=09enum v4l2_buf_type type);
> +int mali_vpu_fill_pixmp_fmt(const struct mali_vpu_format_desc *fmt,
> +=09=09=09    u32 width, u32 height,
> +=09=09=09    struct v4l2_pix_format_mplane *pix_mp);
> +
>  #endif /* __MALI_VPU_FORMATS_H__ */
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c b/dri=
vers/media/platform/arm/mali-vpu/mali-vpu-session.c
> index 95050296f9904..6867f51287f48 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-session.c
> @@ -5,14 +5,12 @@
> =20
>  #include <linux/err.h>
>  #include <linux/errno.h>
> -#include <linux/minmax.h>
> -#include <linux/mm.h>
>  #include <linux/string.h>
> -#include <media/v4l2-common.h>
>  #include <media/v4l2-mem2mem.h>
> =20
>  #include "mali-vpu-session.h"
>  #include "mali-vpu-dec.h"
> +#include "mali-vpu-formats.h"
>  #include "mali-vpu-variant.h"
>  #include "mali-vpu-vb2.h"
> =20
> @@ -32,23 +30,9 @@ static int mali_vpu_set_port_fmt(struct mali_vpu_port =
*port,
>  =09memset(&port->curr_fmt, 0, sizeof(port->curr_fmt));
>  =09port->curr_fmt.type =3D type;
> =20
> -=09if (fmt_default->flags & V4L2_FMT_FLAG_COMPRESSED) {
> -=09=09pix_mp->pixelformat =3D fmt_default->fourcc;
> -=09=09pix_mp->num_planes =3D 1;
> -=09=09pix_mp->width =3D width;
> -=09=09pix_mp->height =3D height;
> -=09=09pix_mp->plane_fmt[0].bytesperline =3D 0;
> -
> -=09=09/*
> -=09=09 * Use one byte per pixel as the default compressed sizeimage,
> -=09=09 * with a minimum of one page, aligned to a page boundary.
> -=09=09 */
> -=09=09pix_mp->plane_fmt[0].sizeimage =3D PAGE_ALIGN(max_t(u32, PAGE_SIZE=
, width * height));
> -=09} else {
> -=09=09ret =3D v4l2_fill_pixfmt_mp(pix_mp, fmt_default->fourcc, width, he=
ight);
> -=09=09if (ret)
> -=09=09=09return ret;
> -=09}
> +=09ret =3D mali_vpu_fill_pixmp_fmt(fmt_default, width, height, pix_mp);
> +=09if (ret)
> +=09=09return ret;
> =20
>  =09pix_mp->field =3D V4L2_FIELD_NONE;
> =20
> diff --git a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c b/driv=
ers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> index b993255b8c817..dd142527a1a0c 100644
> --- a/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> +++ b/drivers/media/platform/arm/mali-vpu/mali-vpu-vidioc.c
> @@ -7,6 +7,7 @@
>  #include <linux/module.h>
>  #include <linux/slab.h>
>  #include <linux/string.h>
> +#include <media/v4l2-common.h>
>  #include <media/v4l2-dev.h>
>  #include <media/v4l2-fh.h>
>  #include <media/v4l2-ioctl.h>
> @@ -168,32 +169,119 @@ static int mali_vpu_g_fmt(struct file *filp, void =
*fh, struct v4l2_format *fmt)
>  =09return ret;
>  }
> =20
> -static const struct mali_vpu_format_desc *mali_vpu_find_format(struct ma=
li_vpu_session *sess,
> -=09=09=09=09=09=09=09       u32 pixfmt, u32 type)
> +static int mali_vpu_try_format_common(struct mali_vpu_session *sess, str=
uct v4l2_format *fmt)
>  {
> -=09const struct mali_vpu_format_desc *fmt_list;
> -=09u32 num_fmts;
> -=09u32 i;
> +=09const struct mali_vpu_framesize_caps *fmsz =3D &sess->vpu_dev->varian=
t->frmsz_caps;
> +=09struct v4l2_pix_format_mplane *pix_mp =3D &fmt->fmt.pix_mp;
> +=09const struct mali_vpu_format_desc *vpu_fmt;
> +=09const struct v4l2_format *port_fmt, *port_fmt_dec;
> +=09struct vb2_queue *src_q;
> +=09u32 w, h;
> +=09int ret =3D 0;
> =20
> -=09switch (type) {
> -=09case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
> -=09=09fmt_list =3D sess->port_src.supported_fmts.fmts;
> -=09=09num_fmts =3D sess->port_src.supported_fmts.num_fmts;
> -=09=09break;
> -=09case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
> -=09=09fmt_list =3D sess->port_dst.supported_fmts.fmts;
> -=09=09num_fmts =3D sess->port_dst.supported_fmts.num_fmts;
> -=09=09break;
> -=09default:
> -=09=09return NULL;
> +=09vpu_fmt =3D mali_vpu_find_format(sess, pix_mp->pixelformat, fmt->type=
);
> +=09if (!vpu_fmt) {
> +=09=09port_fmt =3D mali_vpu_get_port_fmt(sess, fmt->type);

Maybe it would be better called get_default_port_fmt() ?

> +=09=09if (!port_fmt)
> +=09=09=09return -EINVAL;
> +
> +=09=09*pix_mp =3D port_fmt->fmt.pix_mp;
> +=09=09return 0;
> +=09}
> +
> +=09/* Requested format found, validate other fields */
> +=09w =3D pix_mp->width ? pix_mp->width : fmsz->width_default;
> +=09h =3D pix_mp->height ? pix_mp->height : fmsz->height_default;

No, width =3D 0 should return min_width, same for height, just drop, and le=
t the
below function do that. The default width/height are what you set on a fres=
h
session.

> +
> +=09v4l2_apply_frmsize_constraints(&w, &h, &fmsz->stepwise);
> +
> +=09/* Decode CAPTURE queue: lock geometry to input if streaming */
> +=09if (sess->role =3D=3D MALI_VPU_DECODER && fmt->type =3D=3D V4L2_BUF_T=
YPE_VIDEO_CAPTURE_MPLANE) {
> +=09=09src_q =3D v4l2_m2m_get_src_vq(sess->m2m_ctx);
> +=09=09if (vb2_is_streaming(src_q)) {
> +=09=09=09port_fmt_dec =3D &sess->port_src.curr_fmt;
> +=09=09=09w =3D port_fmt_dec->fmt.pix_mp.width;
> +=09=09=09h =3D port_fmt_dec->fmt.pix_mp.height;
> +=09=09}

This is try_fmt, it should not care if you are streaming or not.

> +=09}
> +
> +=09ret =3D mali_vpu_fill_pixmp_fmt(vpu_fmt, w, h, pix_mp);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09if (pix_mp->field =3D=3D V4L2_FIELD_ANY)
> +=09=09pix_mp->field =3D V4L2_FIELD_NONE;

Well, only if you support interlaced.

> +
> +=09return 0;
> +}
> +
> +static int mali_vpu_try_fmt(struct file *filp, void *fh, struct v4l2_for=
mat *fmt)
> +{
> +=09struct mali_vpu_session *sess =3D mali_vpu_get_session(filp);
> +=09int ret;
> +
> +=09mutex_lock(&sess->vq_lock);

This is suspicious, the vb queue already do some locking in most of the vid=
ioc
call.

> +
> +=09ret =3D mali_vpu_try_format_common(sess, fmt);
> +
> +=09mutex_unlock(&sess->vq_lock);
> +=09return ret;
> +}
> +
> +static int mali_vpu_s_fmt(struct file *filp, void *fh, struct v4l2_forma=
t *fmt)
> +{
> +=09struct mali_vpu_session *sess =3D mali_vpu_get_session(filp);
> +=09struct vb2_queue *vq;
> +=09struct v4l2_pix_format_mplane *pixmp_src =3D &sess->port_src.curr_fmt=
.fmt.pix_mp;
> +=09struct v4l2_pix_format_mplane *pixmp_dst =3D &sess->port_dst.curr_fmt=
.fmt.pix_mp;
> +=09int ret =3D 0;
> +
> +=09mutex_lock(&sess->vq_lock);
> +
> +=09vq =3D v4l2_m2m_get_vq(sess->m2m_ctx, fmt->type);
> +=09if (vb2_is_busy(vq)) {
> +=09=09ret =3D -EBUSY;
> +=09=09goto mutex_unlock_return;
>  =09}
> =20
> -=09for (i =3D 0; i < num_fmts; i++) {
> -=09=09if (fmt_list[i].fourcc =3D=3D pixfmt)
> -=09=09=09return &fmt_list[i];
> +=09ret =3D mali_vpu_try_format_common(sess, fmt);
> +=09if (ret)
> +=09=09goto mutex_unlock_return;
> +
> +=09/* OUTPUT provides initial CAPTURE geometry */
> +=09if (V4L2_TYPE_IS_OUTPUT(fmt->type)) {
> +=09=09const struct mali_vpu_format_desc *cap_fmt;
> +=09=09struct v4l2_pix_format_mplane *cap;
> +=09=09struct v4l2_pix_format_mplane *fmt_mp =3D &fmt->fmt.pix_mp;
> +
> +=09=09cap =3D &sess->port_dst.curr_fmt.fmt.pix_mp;
> +=09=09cap_fmt =3D mali_vpu_find_format(sess, cap->pixelformat,
> +=09=09=09=09=09       V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
> +=09=09if (!cap_fmt) {
> +=09=09=09ret =3D -EINVAL;
> +=09=09=09goto mutex_unlock_return;
> +=09=09}
> +
> +=09=09ret =3D mali_vpu_fill_pixmp_fmt(cap_fmt, fmt_mp->width, fmt_mp->he=
ight, cap);
> +=09=09if (ret)
> +=09=09=09goto mutex_unlock_return;
>  =09}
> =20
> -=09return NULL;
> +=09if (V4L2_TYPE_IS_OUTPUT(fmt->type))
> +=09=09sess->port_src.curr_fmt =3D *fmt;
> +=09else
> +=09=09sess->port_dst.curr_fmt =3D *fmt;
> +
> +=09/* Keep peer queue colorimetry aligned with input */
> +=09if (V4L2_TYPE_IS_OUTPUT(fmt->type)) {
> +=09=09pixmp_dst->colorspace=09=3D pixmp_src->colorspace;
> +=09=09pixmp_dst->ycbcr_enc=09=3D pixmp_src->ycbcr_enc;
> +=09=09pixmp_dst->quantization =3D pixmp_src->quantization;
> +=09=09pixmp_dst->xfer_func=09=3D pixmp_src->xfer_func;
> +=09}
> +mutex_unlock_return:
> +=09mutex_unlock(&sess->vq_lock);
> +=09return ret;
>  }
> =20
>  static int mali_vpu_validate_format(struct mali_vpu_session *sess, u32 p=
ixfmt)
> @@ -236,6 +324,10 @@ const struct v4l2_ioctl_ops mali_vpu_ioctl_ops_dec =
=3D {
>  =09.vidioc_enum_fmt_vid_cap=09=3D mali_vpu_enum_fmt,
>  =09.vidioc_g_fmt_vid_out_mplane=09=3D mali_vpu_g_fmt,
>  =09.vidioc_g_fmt_vid_cap_mplane=09=3D mali_vpu_g_fmt,
> +=09.vidioc_s_fmt_vid_out_mplane=09=3D mali_vpu_s_fmt,
> +=09.vidioc_s_fmt_vid_cap_mplane=09=3D mali_vpu_s_fmt,
> +=09.vidioc_try_fmt_vid_out_mplane=09=3D mali_vpu_try_fmt,
> +=09.vidioc_try_fmt_vid_cap_mplane=09=3D mali_vpu_try_fmt,
>  =09.vidioc_reqbufs=09=09=09=3D v4l2_m2m_ioctl_reqbufs,
>  =09.vidioc_querybuf=09=09=3D v4l2_m2m_ioctl_querybuf,
>  =09.vidioc_create_bufs=09=09=3D v4l2_m2m_ioctl_create_bufs,

--=-7FuWGsgEm19K23CwFDyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav9fowAKCRDZQZRRKWBy
9BLWAPsH2t1xTpcIQXRyMPDRfl1cgAhKt/GsMxIXKOO0KlhsSgEAz2VlIE72+vov
mW5Bj2INszhMWEg2qKWZ5/2XxLwNAwI=
=mevG
-----END PGP SIGNATURE-----

--=-7FuWGsgEm19K23CwFDyg--
