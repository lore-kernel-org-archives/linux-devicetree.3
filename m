Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D03833B6F6
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 23:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779320945; cv=none; b=GpHLQFgarzxqnGVp6WH1mxXvYGJFR5CbujIIyYLJg7/DWOVKMSV3oFUAW7P+K/ozpcV8V+wWEiAzMhMYyXr8qG30W/rwnPnQk4cAR6rwxylHjaEv5Q5AUWRwi/jmJIadfsrEU6B5ANfLTkALHT2P8zXiuUna7J+auED8bij2baQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779320945; c=relaxed/simple;
	bh=oL+Jm993JMu3H+FBsZbdv1hcADypLittE0xvdPbSBhM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DWWLbhYnCNl995DGehuVvoSuLfo4V3byHBgHS8rgt8cZzXUp9am078LccuxKs0/sUBCxq/gb80m8Hemwc9UniR6AR/k/FAivObUGHXX1mgpgBBGvKiXjGaGWrp2xKc38CxtLzbajGIMI0OAqR5CQ9QVno07XRSk/gBQNGB7bk74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=w5nafVyv; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="w5nafVyv"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-911af978bf2so640691585a.1
        for <devicetree@vger.kernel.org>; Wed, 20 May 2026 16:49:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1779320941; x=1779925741; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=8FV7VoDr0F8Nqcq9fLS/TUF5Lj6uNIEv1Mp2biqd2wU=;
        b=w5nafVyvNA6TGobWxvvsiuGHEx4yEL4sSkvnokU/G6mimgmvYPkqDdDO7bI0QTmWXH
         fYZaYMwvflqadfnv5QSPsFEAsWO9CO+KbBhAkam/AyrL6PlW5b+ivA6gLnMapnIwZCYU
         TcbZ6VMNB36pBGxqz5xLmcmbU6U6tN8srt5L3o4WuPtuOMD26UviRrPlZMVZhBMnwW/O
         sHKuWFPr2jlMU5gTGdYbPUcgJOJAL3dcH+y7CBKkjZMpULj8059wYevDkYpmVNzLQspb
         sf1miJVMZe52S+suhQVflMugFnzAOwewLyaq41Um7fYb65j4jaM0b7Kg16/OOlMqS79V
         jGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779320941; x=1779925741;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FV7VoDr0F8Nqcq9fLS/TUF5Lj6uNIEv1Mp2biqd2wU=;
        b=CfvrEG5nOqt1kaIcyf8CK2OjSAZqxbUd8+tBB75JbN6fbfUV66e1f3n1e6hED0nq+/
         oAI8i1r2e2702mtkcN+BE2DTfr/l1goTiFWTqXIw6SWDL/TSadOSwnGQjDkRPvw6NDui
         agYqWe5kf49SsvC68p7i5Smu7IuYGSE0Q+6QkiJ8LX9fPuDeqINP/QVctDjnUj81y2Y5
         xOOltOaiBhbvoBtHOEyrmrWGtG/jrcSIxVFwuouHDqADJ+Aj1CVYSk0LsIgTw1NjMakr
         3DlYSviNUiDj1aXTf/JfVYd/+oNslyMotK1/tqZB9dGW5Gk7WdL+wAItRHnSaLQTD61C
         +qTA==
X-Forwarded-Encrypted: i=1; AFNElJ8XpRaYgpfswSB6iDBR49TU1IvF0/55vvvMj+3+eZW82gNJgWOn00lm543LFk31nzp4+ZV4NgJ8tF7/@vger.kernel.org
X-Gm-Message-State: AOJu0YwCirvThny4othl3EwiY/pXP2uTO/Zt1nghelcxrxzlxrjT8rIM
	H0hKEjovgd3LO/MVWNjx4ikCByiY1/NG2YvxC3SzTekB0r+/lFmCW+Kby4dT35z+9TI=
X-Gm-Gg: Acq92OE4rLayaGG7S4jEJ8DId4l4S1mV85lImPtR4LwsOa6/FmHALdD3Cll+EpmZiSO
	XoxSl/Xlu/vw5TF9eDf4GNX/tmiUhTc8QAVyC7EE1jAbID/9yqRF5akbZzcAlPQVm8Dj4E53s6f
	R3nDyrdSOw5pC1iFkfBJgRJN+SI/0oGfysfYFgWK8CGaS8EHlXUNqXGyhMfxjCmYn8RLh2mfPQt
	NJ/ifs5bxLd0no4F4oakryQWBAwAkwn6rARhaBItNneebV4xEoLNIl1RNi5SfZ8PRxEySCOyZbK
	4HeDZOBNZC5/aj3HAw7mWjZP4qFBCf1LxNb4VBIHoD8PnNK0tnXFsWYvTSVQGR2uoarAWBCuBpx
	m60XvH5MEzrx29dB30o49OXRgyaxe3Kz+TbpZBrQupC/Uc1Bs+ylI6dndrhGzDuWTp9HLN2cx7S
	NJFRuCONVae8lYYJc+cJ3ZRDrATsq8u7+7pP6sJSyfo3dl2yFB23ZefXXjFAtG4Ft1xmX4
X-Received: by 2002:a05:620a:4093:b0:8eb:10d4:a46c with SMTP id af79cd13be357-914a2d017bfmr60714585a.35.1779320940615;
        Wed, 20 May 2026 16:49:00 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0? ([2606:6d00:15:e06b:3a7c:76ff:fea1:2ac0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-910ba182535sm2267012385a.8.2026.05.20.16.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 16:48:59 -0700 (PDT)
Message-ID: <e086dce57bc881f7eba2ad85869f81a81f8d84f3.camel@ndufresne.ca>
Subject: Re: [PATCH v7 05/28] media: v4l2-common: add
 v4l2_fill_pixfmt_mp_aligned helper
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sven =?ISO-8859-1?Q?P=FCschel?= <s.pueschel@pengutronix.de>, Jacob Chen
	 <jacob-chen@iotwrt.com>, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Rob Herring
	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, kernel@pengutronix.de, 
	sebastian.reichel@collabora.com, m.tretter@pengutronix.de, 
	p.zabel@pengutronix.de
Date: Wed, 20 May 2026 19:48:58 -0400
In-Reply-To: <20260521-spu-rga3-v7-5-3f33e8c7145f@pengutronix.de>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
	 <20260521-spu-rga3-v7-5-3f33e8c7145f@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-gxCVbPi2dtnLUStIFdG9"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-gxCVbPi2dtnLUStIFdG9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 21 mai 2026 =C3=A0 00:44 +0200, Sven P=C3=BCschel a =C3=A9crit=C2=
=A0:
> Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
> specify a custom stride alignment in bytes. This is necessary for
> hardware like the Rockchip RGA3, which requires the stride value to be
> aligned to a 16 bytes boundary.
>=20
> The code makes some assumptions about the v4l2 format to simplify the
> calculation. They currently hold for all known v4l2 formats.
>=20
> v4l2_format_plane_stride uses an unsigned int as argument type to avoid
> the later multiplication from overflowing the u8 value. All other places
> use u8, as no practical use cases for a larger alignment are known at
> the moment.
>=20
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Thanks for the update, my Rb still hold.

Nicolas

>=20
> ---
> Changes in v7:
> - Also adjust alignment when C plane is larger than the Y plane
> =C2=A0 Flagged by Sashiko:
> =C2=A0 https://sashiko.dev/#/patchset/20260515-spu-rga3-v6-0-e547152eb9c9=
%40pengutronix.de?part=3D5
>=20
> Changes in v6:
> - Fixed alignment multiplication of 0 for NV24 - flagged by Sashiko:
> =C2=A0 https://sashiko.dev/#/patchset/20260428-spu-rga3-v5-0-eb7f5d019d86=
%40pengutronix.de?part=3D5
> - Changed v4l2_format_plane_stride alignment parameter type to
> =C2=A0 avoid overflow for 64/128 byte alignment by multiplication.
> =C2=A0 Flagged by Sashiko URL above.
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 58 ++++++++++++++++++++++++=
+++--------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> =C2=A02 files changed, 50 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 3cc8b04e1ea63..b771ed9b659b0 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -432,14 +432,35 @@ static inline unsigned int v4l2_format_block_height=
(const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_stride(const struct v4=
l2_format_info *info, int plane,
> -						=C2=A0=C2=A0=C2=A0 unsigned int width)
> +						=C2=A0=C2=A0=C2=A0 unsigned int width, unsigned int byte_alignment=
)
> =C2=A0{
> =C2=A0	unsigned int hdiv =3D plane ? info->hdiv : 1;
> =C2=A0	unsigned int aligned_width =3D
> =C2=A0		ALIGN(width, v4l2_format_block_width(info, plane));
> =C2=A0
> -	return DIV_ROUND_UP(aligned_width, hdiv) *
> -	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp[plane] / info->bpp_div[p=
lane];
> +	/*
> +	 * Formats with a single memory plane derive the stride of the
> +	 * other planes from the y stride. To avoid hardware or software
> +	 * deriving a different stride for the composite plane,
> +	 * multiply the alignment accordingly.
> +	 *
> +	 * It assumes the following format properties:
> +	 * - bpp_div[0] =3D=3D bpp_div[1]
> +	 * - The multiplication factor doesn't differ between the non y planes
> +	 * - The multiplication factor is a power of 2
> +	 */
> +	if (info->mem_planes =3D=3D 1 && info->comp_planes > 1) {
> +		if (plane =3D=3D 0)
> +			byte_alignment *=3D DIV_ROUND_UP(
> +				info->hdiv * info->bpp[0], info->bpp[1]);
> +		else
> +			byte_alignment *=3D DIV_ROUND_UP(
> +				info->bpp[1], info->hdiv * info->bpp[0]);
> +	}
> +
> +	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
> +			=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp_div[plane],
> +		=C2=A0=C2=A0=C2=A0=C2=A0 byte_alignment);
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_height(const struct v4=
l2_format_info *info, int plane,
> @@ -453,9 +474,10 @@ static inline unsigned int v4l2_format_plane_height(=
const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_size(const struct v4l2=
_format_info *info, int plane,
> -						=C2=A0 unsigned int width, unsigned int height)
> +						=C2=A0 unsigned int width, unsigned int height,
> +						=C2=A0 u8 stride_alignment)
> =C2=A0{
> -	return v4l2_format_plane_stride(info, plane, width) *
> +	return v4l2_format_plane_stride(info, plane, width, stride_alignment) *
> =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_format_plane_height(info=
, plane, height);
> =C2=A0}
> =C2=A0
> @@ -476,8 +498,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *=
height,
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_apply_frmsize_constraints);
> =C2=A0
> -int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> -			u32 pixelformat, u32 width, u32 height)
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment)
> =C2=A0{
> =C2=A0	const struct v4l2_format_info *info;
> =C2=A0	struct v4l2_plane_pix_format *plane;
> @@ -494,23 +517,34 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
ne *pixfmt,
> =C2=A0
> =C2=A0	if (info->mem_planes =3D=3D 1) {
> =C2=A0		plane =3D &pixfmt->plane_fmt[0];
> -		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +		plane->bytesperline =3D v4l2_format_plane_stride(info, 0, width,
> +							=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0		plane->sizeimage =3D 0;
> =C2=A0
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0			plane->sizeimage +=3D
> -				v4l2_format_plane_size(info, i, width, height);
> +				v4l2_format_plane_size(info, i, width, height,
> +						=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 stride_alignment);
> =C2=A0	} else {
> =C2=A0		for (i =3D 0; i < info->comp_planes; i++) {
> =C2=A0			plane =3D &pixfmt->plane_fmt[i];
> =C2=A0			plane->bytesperline =3D
> -				v4l2_format_plane_stride(info, i, width);
> +				v4l2_format_plane_stride(info, i, width,
> +							 stride_alignment);
> =C2=A0			plane->sizeimage =3D plane->bytesperline *
> =C2=A0				v4l2_format_plane_height(info, i, height);
> =C2=A0		}
> =C2=A0	}
> =C2=A0	return 0;
> =C2=A0}
> +EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp_aligned);
> +
> +int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt,
> +			u32 pixelformat, u32 width, u32 height)
> +{
> +	return v4l2_fill_pixfmt_mp_aligned(pixfmt, pixelformat,
> +					=C2=A0=C2=A0 width, height, 1);
> +}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt_mp);
> =C2=A0
> =C2=A0int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt, u32 pixelforma=
t,
> @@ -530,12 +564,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
, u32 pixelformat,
> =C2=A0	pixfmt->width =3D width;
> =C2=A0	pixfmt->height =3D height;
> =C2=A0	pixfmt->pixelformat =3D pixelformat;
> -	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width);
> +	pixfmt->bytesperline =3D v4l2_format_plane_stride(info, 0, width, 1);
> =C2=A0	pixfmt->sizeimage =3D 0;
> =C2=A0
> =C2=A0	for (i =3D 0; i < info->comp_planes; i++)
> =C2=A0		pixfmt->sizeimage +=3D
> -			v4l2_format_plane_size(info, i, width, height);
> +			v4l2_format_plane_size(info, i, width, height, 1);
> =C2=A0	return 0;
> =C2=A0}
> =C2=A0EXPORT_SYMBOL_GPL(v4l2_fill_pixfmt);
> diff --git a/include/media/v4l2-common.h b/include/media/v4l2-common.h
> index 401d8506c24b5..edd416178c333 100644
> --- a/include/media/v4l2-common.h
> +++ b/include/media/v4l2-common.h
> @@ -558,6 +558,10 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt,=
 u32 pixelformat,
> =C2=A0		=C2=A0=C2=A0=C2=A0=C2=A0 u32 width, u32 height);
> =C2=A0int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pixfmt, u32 =
pixelformat,
> =C2=A0			u32 width, u32 height);
> +/* @stride_alignment is a power of 2 value in bytes */
> +int v4l2_fill_pixfmt_mp_aligned(struct v4l2_pix_format_mplane *pixfmt,
> +				u32 pixelformat, u32 width, u32 height,
> +				u8 stride_alignment);
> =C2=A0
> =C2=A0/**
> =C2=A0 * v4l2_get_link_freq - Get link rate from transmitter

--=-gxCVbPi2dtnLUStIFdG9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCag5IagAKCRDZQZRRKWBy
9B3EAQCblctzmCHnE4IzNyxPTekjBtwM2DOnr9we8+22BNglvwD/eI83aZeZuwIs
wByreLbm+gvFWRPRBbD3+tScLz5pWQo=
=CuZo
-----END PGP SIGNATURE-----

--=-gxCVbPi2dtnLUStIFdG9--
