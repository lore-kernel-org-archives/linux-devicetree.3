Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB25336896
	for <devicetree@vger.kernel.org>; Fri,  8 May 2026 21:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274564; cv=none; b=kno3sPJouxAR4zGdv4nS5QFoVw3DefPhoSAYmk4DzDrbI1znq7l7bZaSu7AA3E8nD+FbU1NrM1wZnZ2Ho8aLWSrg6ZY/zVNWMaPixPclUa2akj3jyGpk8LSjLbnnEgGmeS9vCxDH1J9uT8yRuowtDcVnwZoxNYPekgjd1aSFXpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274564; c=relaxed/simple;
	bh=tEwEot8JgxznTaK6r+qVzOXlzy8RYLqMOhC3zclUKo8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KlNvG6Jpb9D2zVHqs/nbm+tINMgORGuozSwgoILUqhyfSEvYrGU+b6FbP9GG3RUWUShal0jBo4jduJJm3vwsPeNpCNIzntEzButXM5tCdv4isaIbf6695NH/nTnkaw3VgNDffyhq/Cn1XCshTgS1syXpcsmaS4NBHTkrFTvJKsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=cBqPJGss; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="cBqPJGss"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8b4000e51fdso24934286d6.1
        for <devicetree@vger.kernel.org>; Fri, 08 May 2026 14:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1778274560; x=1778879360; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=j/W7yF4iOzAybbzn+adlgTCiE6+XgdcWBL2jlioW4B0=;
        b=cBqPJGssJWVZYwodi2BArSB2L2//DQvdpQEPWE/+uxnVAJ41B9wBsHIGX0626BYp7M
         jGB0SeiHbqWcZgXyXE2/gG8QgBEdGJ8zrLnqISd5DXBiJpOMeykWiYP17OqHfyJVUZaC
         HZFo3KoQ8Bx48lDsztSplIFw4OWHOl9gdw6QIMME43iHUkttuQpi1uWTzlEK+iZwfE9e
         EgSOEKM2+Wf7WobOhcNu/GQdWxAix1NKAieiuD4WG2fdl1Zs5SiZcUjlosgI3lYK5VI1
         xcrOh+SwKoWwinj5G+o/QJ24U9+weFLeMu4jomGur/h8OSEIb0foccuQVXi3ZG0XfB5F
         4Agw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274560; x=1778879360;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/W7yF4iOzAybbzn+adlgTCiE6+XgdcWBL2jlioW4B0=;
        b=njuvTVgT0SMMPyRCe6eDi8tO63qhOKWZOYVr2iQlIwwteyQjbTOGjGS6lOrB2EARR/
         tR2WyUZyO+0aiHrt2kLy7oh2cXOOuFPSq+k/lbsxFvpQ1nMCN8Ea8aZNUVVbNCf6nodl
         Qc2eRBUbf+Gob/CdylZb6V4AcT91lckHIP8tUPPJ+NNLaVzz+7+rCheE28WvqYdCzJ0r
         ie+BI1hkSs/VCs4LDK6QBQElGnrLwe+UG5nCQz3mcO4yUrdZeZWfzNggOJtA18W/axux
         ynejfku/ZGRnNeE+2smZ3mJiugxEmzYbCLktyaJ8nGvL7Pwit383jcU/eK/4lsIwhy41
         Z98Q==
X-Forwarded-Encrypted: i=1; AFNElJ/iq6+AKWu/GMIsWQA0MFJ9uViS/+GunLp2s7DOq/TkZNjOnodb+CaN9c5KiAhdfAuNbo9WIGQK3CC9@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3gWJlDTFSL/R9+yc4oM6fz5sy+BlD0Qu86g8i1ILfjZ3hgFcx
	bg9iRTUKh42eJOqbedCI0JDWxt7D1Wn8Tw/gZH7K+fn2rNZt9k/eYgt/tPNLU4AKgQg=
X-Gm-Gg: Acq92OEMefgeAud0xP3f8H3l8Is72UyJMtml0tMm0Itq2LWiFKAzuQTQgh1ZEJW4C+N
	Q2iCyW8aufulYk+3BVXeEcv5rjQe0ArvS+xGPq/sWpJbEFPQKjpAjjSiPOwgMOGxB7TTf6aOgqR
	TW6b/9nAk8X6R7fgbcgcgBomVskHZUCLS+rTw1RtiBo5X3gkp/7N1WobFvmT0B6SUvzOx6FD4Du
	5PMrrQjisEAVR4OMB1Jb9U+UWqlssd0Jv//fMUNpxhtyqaJfTq5cCVQQtPOqhmwGfbZmK0F46/o
	SkEvIpSNQCyFPFGjneszm4auziputTN9+TubVHulVANyqDpt6EbPo94X78CVuUgXsUzhBgOdGAD
	DqHSop138jhy9PxvkMa8VTasAT0oC+9dqxAxOs0MbCSH0cRK2kE9Afz3iDaiAPhPjiOjngSuQfq
	gBepdP1rUd3AGplDxVNL3QH7JTOXCe
X-Received: by 2002:a05:6214:4c81:b0:8ac:b24a:f543 with SMTP id 6a1803df08f44-8bc464f4650mr207346636d6.50.1778274560503;
        Fri, 08 May 2026 14:09:20 -0700 (PDT)
Received: from ?IPv6:2606:6d00:15:e06b::c41? ([2606:6d00:15:e06b::c41])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8bf39c82420sm33673916d6.33.2026.05.08.14.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:09:19 -0700 (PDT)
Message-ID: <2818a1f2be8dac4c7bc83046ed3a9ba3a11cf62d.camel@ndufresne.ca>
Subject: Re: [PATCH v5 05/29] media: v4l2-common: add
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
	sebastian.reichel@collabora.com
Date: Fri, 08 May 2026 17:09:17 -0400
In-Reply-To: <20260428-spu-rga3-v5-5-eb7f5d019d86@pengutronix.de>
References: <20260428-spu-rga3-v5-0-eb7f5d019d86@pengutronix.de>
	 <20260428-spu-rga3-v5-5-eb7f5d019d86@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-DjeBDKHW1TZncnU04JxD"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-DjeBDKHW1TZncnU04JxD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 28 avril 2026 =C3=A0 11:00 +0200, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Add a v4l2_fill_pixfmt_mp_aligned helper which allows the user to
> specify a custom stride alignment in bytes. This is necessary for
> hardware like the Rockchip RGA3, which requires the stride value to be
> aligned to a 16 bytes boundary.
>=20
> The code makes some assumptions about the v4l2 format to simplify the
> calculation. They currently hold for all known v4l2 formats.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>

Reviewed-by: Nicolas Dufresne  <nicolas.dufresne@collabora.com>

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 51 ++++++++++++++++++++++++=
++---------
> =C2=A0include/media/v4l2-common.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +++
> =C2=A02 files changed, 43 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 2b5ccedeb6841..d64d7e76c834d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -431,14 +431,28 @@ static inline unsigned int v4l2_format_block_height=
(const struct v4l2_format_inf
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_stride(const struct v4=
l2_format_info *info, int plane,
> -						=C2=A0=C2=A0=C2=A0 unsigned int width)
> +						=C2=A0=C2=A0=C2=A0 unsigned int width, u8 byte_alignment)
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
> +	 * other planes from the y stride. Due to chroma subsampling this
> +	 * may cause the other plane strides to break the byte_alignment.
> +	 * Increase the alignment if necessary to prevent this.
> +	 *
> +	 * It assumes the following format properties:
> +	 * - bpp_div[0] =3D=3D bpp_div[1]
> +	 * - The multiplication factor doesn't differ between the non y planes
> +	 */
> +	if (info->mem_planes =3D=3D 1 && info->comp_planes > 1 && plane =3D=3D =
0)
> +		byte_alignment *=3D info->hdiv * info->bpp[0] / info->bpp[1];
> +
> +	return ALIGN(DIV_ROUND_UP(aligned_width, hdiv) * info->bpp[plane] /
> +			=C2=A0=C2=A0=C2=A0=C2=A0 info->bpp_div[plane],
> +		=C2=A0=C2=A0=C2=A0=C2=A0 byte_alignment);
> =C2=A0}
> =C2=A0
> =C2=A0static inline unsigned int v4l2_format_plane_height(const struct v4=
l2_format_info *info, int plane,
> @@ -452,9 +466,10 @@ static inline unsigned int v4l2_format_plane_height(=
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
> @@ -475,8 +490,9 @@ void v4l2_apply_frmsize_constraints(u32 *width, u32 *=
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
> @@ -493,23 +509,34 @@ int v4l2_fill_pixfmt_mp(struct v4l2_pix_format_mpla=
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
> @@ -529,12 +556,12 @@ int v4l2_fill_pixfmt(struct v4l2_pix_format *pixfmt=
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

--=-DjeBDKHW1TZncnU04JxD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaf5Q/QAKCRDZQZRRKWBy
9AnlAP9cooZ/VayjTUTxzM//lgkDGPmrBKHxbxW/WchUCxMWBwD/ez/nSbGJZ/64
eie7bw26VxXneIW/zvSNXCU5L5Fivgg=
=frYa
-----END PGP SIGNATURE-----

--=-DjeBDKHW1TZncnU04JxD--
