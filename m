Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59DF63806C0
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 14:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784126414; cv=none; b=V17IedBm733WNEFIlbWAbmcjCoipqK5z1b2HEP9tcEnjQp0zDmj5CHic3yHohrn9wC4HEXwovfBRgPrpu2wZkdNq//5rqzVWnV8zmoTr2QT8Bls6i9CRQrOyp7rMgLVcCBB6OlQhDLRPQcZyvLVbYThhStAhH97xJTYrdkww+5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784126414; c=relaxed/simple;
	bh=p+o1OrFfnLYZru6jzbHWMiax7jmVVnaLAeWxPc064Qk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m/6HALAnrO7MI05uR6X8V0HzWWObnfkfttOstfc9815FE+qetQ+Lf14Ar7v8qTbmPgjBfKQHumrWCd95LXukSvztJpID8TTkB7+1eOIdgK4JBzEcSmnhJ/wUWallGvOvkaNI4elEFYRDQH2/FFzcY2Ku7hhHyBOQ+s0aJ2g8hJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nUrf3TSw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nUrf3TSw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A17D21F000E9;
	Wed, 15 Jul 2026 14:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784126413;
	bh=lR+T/rQBD6+zk+GpDWTTxfo3z3x+tQqgCFa8kcOzAN0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nUrf3TSwhXMpM/hq2g6Qp+XBjS0TVR343OQBs5U9ltVAgh/6Vd+xajHM1h9HGepl4
	 uj+viL41/3unFtNL9nLDYeo9uSt/Br80IR0XXxdzKUnbEwaD5AZ3DvZ0CRDddNRoye
	 qpYUTC/vsrqL959hw8ZtrOMuA3stCQRunR083dUvTY6zhajy3WmRDjAQaXIq51sszE
	 0B2pG8VSRkZqJ+HGzIqFq4YdzjL6jithZCmJrVaMm5dVlQJv4qzaLUAehNQJnoe3r/
	 GpvTFMDyn10tOhWjOGYbxfF4wYuOXkb7YGKsdGoUXUPCkQgqQmNtbWELnp/cB90F2/
	 vMY06uHI5k+2w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 07/11] drm/mediatek: mtk_dsi: Add support for MT8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260715135703.46540-8-angelogioacchino.delregno@collabora.com>
References: <20260715135703.46540-1-angelogioacchino.delregno@collabora.com>
 <20260715135703.46540-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 14:40:11 +0000
Message-Id: <20260715144012.A17D21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] DSI link rate calculations ignore DSC compression, breaking high-r=
esolution support.
--

--- Patch [7]: [PATCH v6 07/11] drm/mediatek: mtk_dsi: Add support for MT81=
89 ---
commit d3eecfadd8fa60f56b5a609d3b36986202e453a5
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Add support for MT8189

This commit adds support for the DSI IP in the MT8189 SoC, which supports a
higher link rate of 2.5Gbps. It introduces a max_link_rate_mbps parameter to
the driver data and updates the mode_valid callback to use this value
instead of a hardcoded 1.5Gbps limit.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index e1803f1b9c587..95f7d94bdad3b 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c

[ ... ]

> @@ -926,7 +928,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	}
>  	bit_per_pixel =3D ret;
> =20
> -	dsi->data_rate =3D DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> +	dsi->data_rate =3D DIV_ROUND_UP_ULL((u64)dsi->vm.pixelclock * bit_per_p=
ixel,
>  					  dsi->lanes);

[Severity: High]
This is a pre-existing issue, but does this calculation break DSC-enabled
panels? When DSC is used, bit_per_pixel appears to be the uncompressed
bpp. Using the uncompressed bpp instead of the compressed bpp for the
link rate calculation will configure the hs_clk much higher than intended,
which might exceed hardware limits or cause FIFO underflows.

>  	ret =3D clk_set_rate(dsi->hs_clk, dsi->data_rate);

[ ... ]

> @@ -1101,13 +1103,21 @@ mtk_dsi_bridge_mode_valid(struct drm_bridge *brid=
ge,
>  			  const struct drm_display_mode *mode)
>  {
>  	struct mtk_dsi *dsi =3D bridge_to_dsi(bridge);
> +	const struct mtk_dsi_driver_data *data =3D dsi->driver_data;
> +	u64 wanted_link_rate, max_link_rate;
>  	int bpp;
> =20
>  	bpp =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
>  	if (bpp < 0)
>  		return MODE_ERROR;
> =20
> -	if (mode->clock * bpp / dsi->lanes > 1500000)
> +	wanted_link_rate =3D mode->clock;
> +	wanted_link_rate *=3D bpp;
> +	max_link_rate =3D data->max_link_rate_mbps;
> +	max_link_rate *=3D dsi->lanes;
> +	max_link_rate *=3D KILO;
> +
> +	if (wanted_link_rate > max_link_rate)

[Severity: High]
This is a pre-existing issue, but will wanted_link_rate incorrectly reject
high-resolution compressed modes here? Since wanted_link_rate uses the
uncompressed bpp rather than the compressed bpp, it looks like high
resolution modes that require DSC to fit within the max_link_rate_mbps
will be erroneously rejected as MODE_CLOCK_HIGH.

>  		return MODE_CLOCK_HIGH;
> =20
>  	if (dsi->dsc) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715135703.4654=
0-1-angelogioacchino.delregno@collabora.com?part=3D7
