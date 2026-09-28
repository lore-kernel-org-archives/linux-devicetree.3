Received: from mail-qk2-f20.google.com (mail-qk2-f20.google.com [74.125.230.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A34F378822
	for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 19:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790625417; cv=none; b=pOEXPWR62a3+dlHQqM1CnIvlFYy+9dTbstmfBxKOIs8k5A/x6lrsVjOZo8LuNfceuiQMRW0UeyJD7kmS2Ium/7j8oNjVOOBG6TjvPCZT0DLIMsQD69JpXrv/1iFy8mmqibNw2gK8qAr6GQlGqSFhgaHUEts8Gd9jjv6QuCKZJ9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790625417; c=relaxed/simple;
	bh=vRo+mo/h92iXA1isnqSpqSzHaDD4+V9lhZPq2yH7Sy8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Lt+fqXqGOH27s2ySN8T1mRhesVgAoKO7pP3fF3tqqxoU1Zg/tipXUuh+vSMj+TDqFzxbKRR2OO2I1KZ5Rz4h8uZmIJRmPDYelijKPYczj26x9o0dMNcfgAblm+5z1xNrynaGXa6AT0peQ1QOCuIl+ilr9nJZxgEFYFqIaSaZiCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b=EoxIpCnR; arc=none smtp.client-ip=74.125.230.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20251104.gappssmtp.com header.i=@ndufresne-ca.20251104.gappssmtp.com header.b="EoxIpCnR"
Received: by mail-qk2-f20.google.com with SMTP id af79cd13be357-939656ff6d9so372308685a.1
        for <devicetree@vger.kernel.org>; Mon, 28 Sep 2026 12:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20251104.gappssmtp.com; s=20251104; t=1790625401; x=1791230201; darn=vger.kernel.org;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=;
        b=EoxIpCnRuxwX0jveR2ugAuYLvlCfHOZtB1Dk4Qnw4HQgo3dCVg4Xf1mXh61dCYPA3M
         mZKLjw2y6X8wAdWeBMFhTFXBrMUV3xjpFnru7ZO5gX+npBcVl21SS8vsxhxQtkyUA1hT
         ZNry0cEXorUTJ5ZUUmDgDgcVtsrLiBlgLy5WXWonBU031xPGftQHwWp7c5y6CeKBLpbs
         kAADbDg7JMqrsDCegTvmvQ1Eq23/iVouRQabDVEjoG9OkKYmPMhUl+XMg4ld8H/CBRA4
         +oesopa+B1QiyFA3neIKpwVSSxoubQ2wuroBsix+HVTwl2PG4FWX1IPUR99NT/arK3SI
         YIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790625401; x=1791230201;
        h=mime-version:user-agent:content-type:autocrypt:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qwTlmF74tysZPa3wLxs88tpebyN4z4d+xJbescqXPNk=;
        b=tq7duBCM+hRZRnjy7W+32fiG40PIT3mUpml+3o+sSji32RahVGKLR8f08vNgSLZAiY
         f5Ys1ekbkO1/77cCUMY3TM3klO2WiQW/BAtNG/0qqv5o7lBex0s5ZJ7PQG0ymNnwjPIT
         qXNhr7F7gwWkTIQlZBHzIJPHQBLy/k/A7Es+fnSti2+3YfeBAj6t0OKAPZoPHbEUf1tL
         rUJi0d5tsAUlOJcrypYmQ/1yq8a56BXQHSfgJIJIoge6vAZkrIRAaa07eppWit2dHBgc
         GgwjKx1BJJ6ToaEU8dD75TJQvZgv7aZMA2T889yCDb0aBTfK8eh1ir/gtM3rvKkMwEZk
         KYdQ==
X-Forwarded-Encrypted: i=1; AKwUvBzgwB40OlBJnVeXaNFMaKLEIUGf6CSpmNffZ0yGMjk+vQkgw2C4C+okpFM9jwEnMxZsobwIXGOV19Ot@vger.kernel.org
X-Gm-Message-State: AFuF++nOypiaCM5FlBTi5R0N02ScpQ8q7i59+uS3awgmvrtZBdGhWYGs
	RQgvAgg5u5npZ00/tNeHUrTRxwLStd1NdFCB3PWazU0dY5GaVtisyy0+sxhUGfdDSOE=
X-Gm-Gg: AYBFou0wBDAMVK7aGXVo/gI8GXGwe03l1JRK52XRf4DDtT0hOIqRLj8EYpntLn7EHbB
	AURMlf+DXwVUjxsOMyUl35+EHcoH9dzHxWORTC4ezFIpDBVQjRk5uGSQodKDSuHn4VVJ/IM38QU
	vFra6VprYMgEixK0DJumZbf3ldruhDtlWZheLaBYR+kIqhYucc0It/QxVsawN4VixLmSuVedllH
	tO3BETvXVt/XOKS+OJRgydpch4ZlDKYIqCgYoAsYARpkqqiDxWHgm3P/QR0O6nqhPQkQ77zrz3v
	yiHRCWyL/Zb+Y2oPeAi7f+IurCsR+svhggxPnWQrtai6QUaNW5SAaIpefHlNjUi6dGeUMI6taAS
	XKBVKxMK2Oy4lDgzYxVJFm+uUAXwDPAbj5CChIEH8J4HptZHY8YJZHD2xAIE5prNP0IXqZtaUcv
	X2m5vtXdDMZkwQ8x2qFgRprN7+Iv1TCY8xBOMCr2uQiPDvksbqn4aX7QEhG3o88jby8DPlY2g2b
	5yHMfJkYkP4Sw==
X-Received: by 2002:a05:620a:404c:b0:939:e735:c50e with SMTP id af79cd13be357-93c43cc2b53mr2141972085a.13.1790625400740;
        Mon, 28 Sep 2026 12:56:40 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:34bd::5ac? ([2606:6d00:11:34bd::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-914309a2bafsm87853036d6.7.2026.09.28.12.56.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 12:56:40 -0700 (PDT)
Message-ID: <038a8200d4491261d728874da2db82f00e10bd29.camel@ndufresne.ca>
Subject: Re: [PATCH v6 1/9] media: v4l2-common: Fix P010 format info
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, 
	linux-arm-kernel@lists.infradead.org, jackson.lee@chipsnmedia.com, 
	lafley.kim@chipsnmedia.com, marek.vasut@mailbox.org
Date: Mon, 28 Sep 2026 15:56:38 -0400
In-Reply-To: <20260624072043.238-2-nas.chung@chipsnmedia.com>
References: <20260624072043.238-1-nas.chung@chipsnmedia.com>
	 <20260624072043.238-2-nas.chung@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-bMG5akiRB3PaSzMQ1vw4"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-bMG5akiRB3PaSzMQ1vw4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 24 juin 2026 =C3=A0 16:20 +0900, Nas Chung a =C3=A9crit=C2=A0:
> V4L2_PIX_FMT_P010 is a 10-bit 4:2:0 semi-planar format, but its
> v4l2_format_info() entry described a 4:2:2 layout with a half-width
> chroma plane. Correct bpp and vdiv to match P010's real layout,
> consistent with the other semi-planar formats.
>=20
> Fixes: 5374d8fb75f3 ("media: Add P010 video format")
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Also picked, ty

> ---
>  drivers/media/v4l2-core/v4l2-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 65db7340ad38..4de8aa3ef7d2 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -323,7 +323,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
>  		{ .format =3D V4L2_PIX_FMT_NV20,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp_div =
=3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV24,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
>  		{ .format =3D V4L2_PIX_FMT_NV42,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> -		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 2, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_P010,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
>  		{ .format =3D V4L2_PIX_FMT_P012,    .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> =20
>  		{ .format =3D V4L2_PIX_FMT_YUV410,  .pixel_enc =3D V4L2_PIXEL_ENC_YUV,=
 .mem_planes =3D 1, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_div =
=3D { 1, 1, 1, 1 }, .hdiv =3D 4, .vdiv =3D 4 },

--=-bMG5akiRB3PaSzMQ1vw4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCarrGdgAKCRDZQZRRKWBy
9GsIAQD157B5+yx05js7VShECkIRRKuZFpkaapJRCcZGE091YAEA7bUrfvGnymk8
65ItzDCQxEdR13vz+niUH1vG8TVs0g0=
=uMFh
-----END PGP SIGNATURE-----

--=-bMG5akiRB3PaSzMQ1vw4--
