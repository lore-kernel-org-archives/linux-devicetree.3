Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6852303CAB
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774028883; cv=none; b=nw9vpJzvIRbqUZ3bkRfyJFaASLHrQ5dL5yq+gyogWRX9H0NEPfdvDgbSqnBOzWaWEj1faMIMlCeyk8Vvv2z6M2nX2gLKFx+l7um1vMqn5rz+18Qs7itZl/D7OSn3MFlqhTve1Nh6ph8tG13a5UlSivEhWfE3HRrLbH/WXCPJqB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774028883; c=relaxed/simple;
	bh=ppq+woC9EgkhRjYSo1FqN2MHY1nF7CaPwY54og0DPeI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UT9pk7ysXF3olOICLtjgvSeEukKp6AaYrJcQ08xwnCyB90ADN81C5J5iNEahI1BgdIpfZEUo6blMCVMn3zlMRc9gGCQPieIfH7wlXeLwzmYVSaw6URToW2TPfWFCpoEBbab2+DX3bCxDALJgJTGdXVwd3Cf2PL0DVign6lq4/Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=zynVHsnG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="zynVHsnG"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cfbfdabf3fso201891685a.3
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774028880; x=1774633680; darn=vger.kernel.org;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=;
        b=zynVHsnGGICsqohvhuI3aYPDbUWbEYQDBT9gcn85VcYAA7uKBQouoEAprXGin9Vesq
         jmFvF61rFz+Js+UgLMFYsWa6zSde4E6dEuLRzmue6iFFDiNUbFW0pbRAZcxyihmgNNn8
         a8/RDeY9L2MegP7qGIyyvUBZ8UFj4IYobhDlfGCg37BEFL76JZQMuT5D8fItu9jxM5hq
         coHSetnavTnfJoofZKJUBFFzvc8r5q7hZw/DBDszv3Db7AIMn3pwJfsBRDUGeDSq4+sG
         waFH7H4A9b7vMKePlCE2UHBaNornfW0GTdHqimbS6kE1DK/QjZzGBxtW+NAb/D598naH
         +oxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774028880; x=1774633680;
        h=mime-version:user-agent:autocrypt:references:in-reply-to:date:cc:to
         :from:subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H3CCOGtwXJ4+/c4xKC51d2CLIBrX+gi1qbIE0AmJJek=;
        b=PcZy7BOl4vBkOFQAD9NPeyKQSZMB/6WPd41UG+G4wPCN8XiS9g2m4lMoHd4Nab78Lx
         4LTcAisemtcD8eNkguish9+uS7Axjl+eayTzCe4WN0n0TBc5FMcFFT1CMMJoDPTEgWiP
         UXcz6fu2jzTTzJzzRpTjD4G1CKmbm6odJf95U6ESxhc/DxrupiykvCrRhPTeUXs0wC/G
         5YyNRZ2hJprWBZvTypsrZ0r9oqg5bNMrjS1IA1AX5QJkPMFX0FS+yZ2cpOr8zdMVgvJx
         yJnCgB7e1lfyNNHWA+iqdg5oi9VTvEezRO6wH4RDdCP7R0Wm25ucP91R0lwZMF6iJIcj
         +d6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWniGk2T9lYfg72mNuy9AO1uWed9f55Lkwb0abc4vvWO77aif04e4ZQmGn9Ey1pUOVWDlmHcNwlVCe@vger.kernel.org
X-Gm-Message-State: AOJu0YzfaoLacNBTjgYUYchfg/4clsNTzr5hhwB6T/92KyVgFdUqa7pP
	pRK76ufNyaDSx3btvvTRAcUYgxLB4Wb4ywpgVthG8RV6RRbjxe5AguzjL7C0totX700=
X-Gm-Gg: ATEYQzxRW7VT1/V1wQUQD+rzwoI1ENYbydTRFQvOXemPt6BmFIlRtMauXrkPJyM/3Qn
	ZoXj+DViX1BS+TwmBPrTxHpEVrYN5f6/44oviF1gUZ6b72F3XjjeXtGDhH7HZUO7FDdTw+wCRT+
	c9b10wIqa6A9MXmyq3D6a3HqrTKdSCmuQkMwnDDxI4b28oDPWiqXjnt+M2SNw7Crgt86rd6VVQi
	KLGDbKut5txV81uRghP2kSn0HNLcSDyJYO5/uTK7/uP3y6Zwnzr+ofipLTJkdGqATK9PFMdQqw7
	5xwfMjzd3Q5pLpYMNslOU028Wuf8JPK/rrmbtOhubClFWQdHYwdnj7SLP4RannnBE9qtVVZT4HG
	bCjFXDlyB4ZS0V8Knn8bRa+aKiV1zgtvJgvQAI4vIETPUt3trOUwfiw6fB+DPlTncHwRPfGXsFI
	/2APRbF2WcXi3Xs57ikN/QEYg6rjh2sO4TM7IkH5Q=
X-Received: by 2002:a05:620a:1a29:b0:8cd:982d:411d with SMTP id af79cd13be357-8cfc7f6c676mr563879485a.52.1774028879543;
        Fri, 20 Mar 2026 10:47:59 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89c85214a43sm25647846d6.6.2026.03.20.10.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:47:58 -0700 (PDT)
Message-ID: <c154098ce7fd5d6bfcb44066b7c1f0cde07ff81d.camel@ndufresne.ca>
Subject: Re: [PATCH v3 11/27] media: rockchip: rga: avoid odd frame sizes
 for YUV formats
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
Date: Fri, 20 Mar 2026 13:47:57 -0400
In-Reply-To: <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-11-77b273067beb@pengutronix.de>
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
	protocol="application/pgp-signature"; boundary="=-aiCC/tPL3UyCTVFf/HVn"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-aiCC/tPL3UyCTVFf/HVn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Avoid odd frame sizes for YUV formats, as they may cause undefined
> behavior. This is done in preparation for the RGA3, which hangs when the
> output format is set to 129x129 pixel YUV420 SP (NV12).
>=20
> This requirement is documented explicitly for the RGA3 in=C2=A0 section 5=
.6.3
> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
> x/y offsets and stride aligning requirements. But the vendor driver for
> the RGA2 also contains checks for the width and height to be aligned to
> 2 bytes.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
> =C2=A01 file changed, 14 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 21a3c6cd38dbc..4fa6adb10b7ee 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0	struct rga_fmt *fmt;
> +	struct v4l2_frmsize_stepwise frmsize =3D {
> +		.min_width =3D hw->min_width,
> +		.max_width =3D hw->max_width,
> +		.min_height =3D hw->min_height,
> +		.max_height =3D hw->max_height,
> +		.step_width =3D 1,
> +		.step_height =3D 1,
> +	};
> +
> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> +		frmsize.step_width =3D 2;
> +		frmsize.step_height =3D 2;

For V4L2_PIX_FMT_YUV422P and NV16 this is 2/1. I believe you can generalize=
 this
with the format info, and skip this conditions:

		.step_with =3D info->vdiv,
		.step_height =3D info->hdiv

Though, I'm saying that from a pixel format perspective, if the HW needs 2/=
2 for
all YUV formats, let me know, I'll give my Rb.

Nicolas

> +	}
> =C2=A0
> =C2=A0	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> =C2=A0		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *p=
riv, struct v4l2_format *f)
> =C2=A0	if (!fmt)
> =C2=A0		fmt =3D &hw->formats[0];
> =C2=A0
> -	pix_fmt->width =3D clamp(pix_fmt->width,
> -			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw->min_width, hw->max_width);
> -	pix_fmt->height =3D clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frms=
ize);
> =C2=A0	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt-=
>height);
> =C2=A0	pix_fmt->field =3D V4L2_FIELD_NONE;
> =C2=A0

--=-aiCC/tPL3UyCTVFf/HVn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2ITQAKCRDZQZRRKWBy
9FnHAP9MXGaIWpolRasMrqQ7Y5bXCM/vLXshxf2/etb9oydBUwD+KLxgWdY37E/D
WBZ3ODJn/aS23VsB+5pnmZYe6avkqgI=
=XjGb
-----END PGP SIGNATURE-----

--=-aiCC/tPL3UyCTVFf/HVn--
