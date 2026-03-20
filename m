Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BE3D902D
	for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 17:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774029451; cv=none; b=cAHLMPnKstUH8bE70N2fZ5iDjVcCcTkiT8E5B+761oeIBSg6HAyfVCo+n86+lJ9J6eNVb1h/9e6MHVWncigjzCjzpIp5GNtJoJtmt4MujfRRGgAFISMMX8mkbUBof4laCzQd4KK/c0V1npWdp7va9/cYL8AKprouWEZCu/zPu5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774029451; c=relaxed/simple;
	bh=GYAEhNexLwhDhIm36mxaOuEEnayaPHcvgT1XQ3ECWc8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zo3UXc1eecLjFkQCj/KcnB5pRttlRY0pkBnIKNflHpwAO1bFeaEct1t+nqdXLUg5dZJ/VqayIwTCOWjSLZExSTEW/T4lrlzab3P0ouQmAsPkPPhCje0/uoYz/gSD0maIBZjrUJzhpDgngfvO5KIHConaCzzNgBsL/+ICLHILAmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca; spf=pass smtp.mailfrom=ndufresne.ca; dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b=srEmdTSH; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ndufresne.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ndufresne-ca.20230601.gappssmtp.com header.i=@ndufresne-ca.20230601.gappssmtp.com header.b="srEmdTSH"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-64ad9238d8fso3223418d50.3
        for <devicetree@vger.kernel.org>; Fri, 20 Mar 2026 10:57:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1774029449; x=1774634249; darn=vger.kernel.org;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=;
        b=srEmdTSHPCme7pfugCR9OzXQnsiGE5Iy/Pt5Skl3p0fGXw5JqkOW85nyi+9CnPRHHw
         CmGjLU26q/RLJW4LTmvfoKuyRtwmfHPJcYOLjVB41ATJlIpfsBzLercvctDkoGlb6/OZ
         HihLThiYAm3xXINDodogMLFlQRGf/zUuQMyQkulcN1zbS05z149L2sMKD9pR7UTy0SAr
         4oAiz+NnXE8hDN4C9mhsnEPSTQy7OyTmm5aDnniT4kcB0F9FX+HafHXXMDtfmUEVYDYl
         V3p4hnOVPNmbLefR2Zgysx6sdvIVdSb2KcOgtVhfzCsVzjiWk2V/nrf5Lym22ZhHZmaE
         tFGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774029449; x=1774634249;
        h=mime-version:user-agent:references:in-reply-to:date:cc:to:from
         :subject:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BZXTNHHD+BSxlXVxOCXva8hp/46OMc9TSMRxt1CQFHk=;
        b=Yt7fFflCAamX+B0F2JlzTPT/UPxWF2tyPUNh2kuxoTZ1wN718jKYoP3ZS4bS/PHZLV
         0Mw+p3V6qfz95Yuu8C6Gr90WwxwXnoOH89jgkVmOU8d6PeHJJwFdLJBtqq6iU/hbA4p/
         ABCQ9USVhUhvPCBiNa0P1MUCOQvhU9XH7N+1O4edPGKL2kEfleL/QngzZB2cBWul5zBk
         8VCxQqfuPQE5W0U4M41zb4H4vjIGojI+dReh6JGCLcNDflDfWbBv/j5ZOMGQvJYNQiK6
         Z6RpMXVmvRRkqpKnX78+U2e0tvKA7NCpk+hiYP6dFASivVZj5LH2ysrr/eOJ5zpRyKSc
         A1lg==
X-Forwarded-Encrypted: i=1; AJvYcCVtfzaxTEo9glwm8joWgBg9vSY49q+Q8bU42pLZLCPUrLeamshGKkUoY8XKDhZuH1lSXrFfYbOTWTdH@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6C5OW7F8GxlzD9eS1YpcHzxvk72PNigcG5QK6TCGpIEPhcB20
	qKDPEE+e2r0V1Wxfmd/xmgrnkTMho30xa7U2Q0u4Rs8JwGqi0owlsTOaqxAVI+K5RVE=
X-Gm-Gg: ATEYQzwglb+PqLg7wGAyKRlWZ9Z8odqma2Mv0zcOlsTxHSuvvxUoD/7X3MP2wtLc9IE
	IBwhwZ6vL8ejMFEuWZTo2UEcfjTp8JF2yJ5vqngbtfzEVulkiqGVF1RYXaLwY3PuUD7jgNSD2fJ
	beSWRdHPkMFMB1u42+iKpNWouptkuvf9Ds3visQZE5aIVaLjNH1zNIOZd2whTWm1Pk9TrMi7d+p
	RUjZ5qe+k5Kal7uzo8mF8N4tXj9STtJoZcCYI7a6AHPK9VN35F0LpmMtOrOQCY4iIoCg0rHLW6Y
	PEZRLfLm1EaHRT2OeQmDIoYuOX1M6WvWGQ1oaWBeYUgZGiRIiF1thLCpZfsNlBPUu6PGYoWME2K
	3gPlKmqe2VSEOLZ8rFi5OZtnB+SHNLe6oabAS9ekiI7m6Z79A5dTI54ttQ7/DLj+yqYjmKuQe/P
	mKf9NcuTYz+BUOLgfG7r8j5LfB3xxk
X-Received: by 2002:a53:b7d1:0:b0:64c:ac70:9422 with SMTP id 956f58d0204a3-64eaa8750damr3005530d50.79.1774029449330;
        Fri, 20 Mar 2026 10:57:29 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:b76d::5ac? ([2606:6d00:11:b76d::5ac])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64eabd6dc60sm1852148d50.6.2026.03.20.10.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 10:57:28 -0700 (PDT)
Message-ID: <90da83de861e8268745255720554ad23341e6839.camel@ndufresne.ca>
Subject: Re: [PATCH v3 16/27] media: rockchip: rga: check scaling factor
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
Date: Fri, 20 Mar 2026 13:57:26 -0400
In-Reply-To: <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
References: <20260127-spu-rga3-v3-0-77b273067beb@pengutronix.de>
	 <20260127-spu-rga3-v3-16-77b273067beb@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-qjIqyG00QdlUohxd10SX"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-qjIqyG00QdlUohxd10SX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 15:39 +0100, Sven P=C3=BCschel a =C3=A9crit=
=C2=A0:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.
>=20
> There are two relevant scenarios that have to be considered to protect
> against invalid scaling values:
>=20
> When the output or capture is already streaming, setting the format on
> the other side should consider the max scaling factor and clamp it
> accordingly. This is only done in the streaming case, as it otherwise
> may unintentionally clamp the value when the application sets the first
> format (due to a default format on the other side).
>=20
> When the format is set on both sides first, then the format won't be
> corrected by above means. Therefore the second streamon call has to
> check the scaling factor and fail otherwise.
>=20
> As try functions should only be state aware if specified, the scaling
> limitation is only done in s_fmt.
>=20
> Signed-off-by: Sven P=C3=BCschel <s.pueschel@pengutronix.de>
> ---
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.c |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga-hw.h |=C2=A0 1 +
> =C2=A0drivers/media/platform/rockchip/rga/rga.c=C2=A0=C2=A0=C2=A0 | 47 ++=
++++++++++++++++++++++++++
> =C2=A0drivers/media/platform/rockchip/rga/rga.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 1 +
> =C2=A04 files changed, 50 insertions(+)
>=20
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media=
/platform/rockchip/rga/rga-hw.c
> index dcd540ed3fd5b..7a4070665fed7 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -584,6 +584,7 @@ const struct rga_hw rga2_hw =3D {
> =C2=A0	.max_width =3D MAX_WIDTH,
> =C2=A0	.min_height =3D MIN_HEIGHT,
> =C2=A0	.max_height =3D MAX_HEIGHT,
> +	.max_scaling_factor =3D MAX_SCALING_FACTOR,
> =C2=A0	.stride_alignment =3D 4,
> =C2=A0
> =C2=A0	.setup_cmdbuf =3D rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media=
/platform/rockchip/rga/rga-hw.h
> index f4752aa823051..fffcab0131225 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -14,6 +14,7 @@
> =C2=A0
> =C2=A0#define MIN_WIDTH 34
> =C2=A0#define MIN_HEIGHT 34
> +#define MAX_SCALING_FACTOR 16
> =C2=A0
> =C2=A0#define RGA_TIMEOUT 500
> =C2=A0
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/pl=
atform/rockchip/rga/rga.c
> index 6947c472a8b01..fad921ddd8348 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -405,10 +405,36 @@ static int vidioc_s_fmt(struct file *file, void *pr=
iv, struct v4l2_format *f)
> =C2=A0	struct v4l2_pix_format_mplane *pix_fmt =3D &f->fmt.pix_mp;
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	struct rockchip_rga *rga =3D ctx->rga;
> +	const struct rga_hw *hw =3D rga->hw;
> =C2=A0	struct vb2_queue *vq;
> =C2=A0	struct rga_frame *frm;
> =C2=A0	int ret =3D 0;
> =C2=A0	int i;
> +	struct rga_frame *limit_frm =3D NULL;
> +
> +	/* Limit before try_fmt to avoid recalculating the stride */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streaming)
> +		limit_frm =3D &ctx->out;
> +	if (V4L2_TYPE_IS_CAPTURE(f->type) &&
> +	=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streaming)
> +		limit_frm =3D &ctx->in;
> +	if (limit_frm) {
> +		const struct v4l2_frmsize_stepwise frmsize =3D {
> +			.min_width =3D DIV_ROUND_UP(limit_frm->pix.width,
> +						=C2=A0 hw->max_scaling_factor),
> +			.max_width =3D
> +				limit_frm->pix.width * hw->max_scaling_factor,
> +			.min_height =3D DIV_ROUND_UP(limit_frm->pix.height,
> +						=C2=A0=C2=A0 hw->max_scaling_factor),
> +			.max_height =3D
> +				limit_frm->pix.height * hw->max_scaling_factor,
> +			.step_width =3D 1,
> +			.step_height =3D 1,

Is there a risk to re-introduce odd sizes ? Should this be the hdiv / vdiv
values ?

> +		};
> +		v4l2_apply_frmsize_constraints(&pix_fmt->width,
> +					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &pix_fmt->height, &frmsize);
> +	}
> =C2=A0
> =C2=A0	/* Adjust all values accordingly to the hardware capabilities
> =C2=A0	 * and chosen format.
> @@ -568,12 +594,33 @@ static int vidioc_s_selection(struct file *file, vo=
id *priv,
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> +static bool check_scaling(const struct rga_hw *hw, u32 src_size, u32 dst=
_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >=3D dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >=3D src_size;
> +}
> +
> =C2=A0static int vidioc_streamon(struct file *file, void *priv,
> =C2=A0			=C2=A0=C2=A0 enum v4l2_buf_type type)
> =C2=A0{
> =C2=A0	struct rga_ctx *ctx =3D file_to_rga_ctx(file);
> =C2=A0	const struct rga_hw *hw =3D ctx->rga->hw;
> =C2=A0
> +	if ((V4L2_TYPE_IS_OUTPUT(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)->streamin=
g) ||
> +	=C2=A0=C2=A0=C2=A0 (V4L2_TYPE_IS_CAPTURE(type) &&
> +	=C2=A0=C2=A0=C2=A0=C2=A0 v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)->streamin=
g)) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		if (!check_scaling(hw, ctx->in.pix.width, ctx->out.pix.width) ||
> +		=C2=A0=C2=A0=C2=A0 !check_scaling(hw, ctx->in.pix.height, ctx->out.pix=
.height))
> +			return -EINVAL;
> +	}
> +
> =C2=A0	hw->setup_cmdbuf(ctx);
> =C2=A0
> =C2=A0	return v4l2_m2m_streamon(file, ctx->fh.m2m_ctx, type);
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/pl=
atform/rockchip/rga/rga.h
> index c741213710b32..454af283b1694 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -150,6 +150,7 @@ struct rga_hw {
> =C2=A0	size_t cmdbuf_size;
> =C2=A0	u32 min_width, min_height;
> =C2=A0	u32 max_width, max_height;
> +	u8 max_scaling_factor;
> =C2=A0	u8 stride_alignment;
> =C2=A0
> =C2=A0	void (*setup_cmdbuf)(struct rga_ctx *ctx);

--=-qjIqyG00QdlUohxd10SX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCab2KhgAKCRDZQZRRKWBy
9PM7AP9jGP5aoYcuwSgumkHCKGfz+EC3ON3LYoZEHTq181prOwD9EQ6lsBj+nyKz
T6YbQyqWaVwY9slYUWGL40d6F+8IIAY=
=9adu
-----END PGP SIGNATURE-----

--=-qjIqyG00QdlUohxd10SX--
