Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2018E3016FB
	for <devicetree@vger.kernel.org>; Sat,  9 May 2026 20:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778360325; cv=none; b=HBT2hOQeuQuEaOuL2HftF0KMgCsyPw6WHnRnF1GsAc4dbynVz7HxkKtk6mgGtsfQOoTUYjF2OV0cXvIeTHQHSv/xW/u0Xij89sQIlTyQcT4E13tmfATUUWY+9ZEydJyB1aTjRp74Quwz/aX1q/5XOZWblPc8/e6mPZZ96X+QxiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778360325; c=relaxed/simple;
	bh=K1zQxxbd1H3OWcraQHxFfKItp+qylGCH1My81aZjtK8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ORXZXPyVNDKBKAXvWuwBZ2E/qG3W76FUSHL84ReHugRbAvas+m83O9BEX8iGLhpJFyZVSMI+vDqtShC6w7wqrtcJ2fA395ja7yDBSi83P/fa4OAYIaS3m/vfbElMxkmIGy+7qBd4cXwT2X72FUKaRQqxz5BnTu/SL0BijEEPJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PQ6cxVkP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PQ6cxVkP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E51FC2BCB2;
	Sat,  9 May 2026 20:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778360324;
	bh=K1zQxxbd1H3OWcraQHxFfKItp+qylGCH1My81aZjtK8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PQ6cxVkP9W+Y77YPTPhArbPHNRVL1is+dQk/CH1Q2iawaayUYuKMtpLkoyJlhbke2
	 f4FkEw3PyoaKP7tS8T9rLdte0VCs/FOzgxp/plhGEh7Kycpi/Nvt6Flh2cR8/T29fS
	 URDSSLmYBWpHu/m5V2eOi7jgTF9exdM5bPo76Wk0jT4sIpBtGUhg32zrcKiSa40OyM
	 gsO1j1tYLKq2SUt4Py5qLAELc0eHLjndOGIgiVV4ZavMrEKrqxVgT2K5fMv1nWN5Gg
	 u5iLpM3ak9Sr+MXImYCFlnIhJzMPdHIkIU8SPFq5ln7HFHr2GzWS9aqWPluw/jlcZC
	 FqkC6bj8nkybw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] drm/sun4i: vi_layer: Limit formats for DE33
Reply-To: sashiko@lists.linux.dev
To: "Jernej Skrabec" <jernej.skrabec@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260509190015.79086-5-jernej.skrabec@siol.net>
References: <20260509190015.79086-5-jernej.skrabec@siol.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 09 May 2026 20:58:43 +0000
Message-Id: <20260509205844.7E51FC2BCB2@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Exposing YCBCR color properties on a plane that does not support=
 YUV formats introduces UAPI inconsistency.
--

commit 929b63037079ff8fc9eaecabce5ad91bde84083f
Author: Jernej Skrabec <jernej.skrabec@gmail.com>

drm/sun4i: vi_layer: Limit formats for DE33

This commit removes YUV formats from the supported list for DE33 planes
without scaler support. A new format array containing only RGB formats is
introduced and used when scaling is unavailable.

> diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun=
4i/sun8i_vi_layer.c
> --- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c

[ ... ]

> @@ -410,8 +437,17 @@ struct sun8i_layer *sun8i_vi_layer_init_one(struct d=
rm_device *drm,
>  	layer->cfg =3D cfg;
> =20
>  	if (layer->cfg->de_type >=3D SUN8I_MIXER_DE3) {
> -		formats =3D sun8i_vi_layer_de3_formats;
> -		format_count =3D ARRAY_SIZE(sun8i_vi_layer_de3_formats);
> +		/*
> +		 * TODO: DE33 drivers doesn't support scaling yet, which is a
> +		 * requirement for YUV support.
> +		 */
> +		if (layer->cfg->scaler_mask & BIT(phy_index)) {
> +			formats =3D sun8i_vi_layer_de3_formats;
> +			format_count =3D ARRAY_SIZE(sun8i_vi_layer_de3_formats);
> +		} else {
> +			formats =3D sun8i_vi_layer_de3_no_yuv_formats;
> +			format_count =3D ARRAY_SIZE(sun8i_vi_layer_de3_no_yuv_formats);
> +		}

Since sun8i_vi_layer_de3_no_yuv_formats only contains RGB formats, should
the driver skip calling drm_plane_create_color_properties() for this
configuration?

Later in sun8i_vi_layer_init_one(), the driver unconditionally calls
drm_plane_create_color_properties(), which exposes YCBCR color encoding and
range UAPI properties. Could this expose confusing or meaningless YUV
properties to userspace for planes where only RGB formats are supported?

>  	} else {
>  		formats =3D sun8i_vi_layer_formats;
>  		format_count =3D ARRAY_SIZE(sun8i_vi_layer_formats);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509190015.7908=
6-1-jernej.skrabec@siol.net?part=3D4
