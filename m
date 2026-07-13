Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626CF41B36C
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948405; cv=none; b=IXSKRJ50C7DcKg9gZiQ5VxG/uhQgUdMwSqcnucGn2T+5lpqShcwhzUhxjuDSVERvh8qP2ocNSDMYXjBKOKlLhjUWjZEZRhgJKsXN/fKLIasS6NfqJz4Me/DhqgGK1Fn6zHk6yjpeGGH7dmRUI5PONMWCjAKgMSR+trIR054MsHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948405; c=relaxed/simple;
	bh=BcI/23zzadA5mupTxa0BQ4cgvrlZod9sJZuwjllqBOw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZLik5B+fYi9Z3UnqUXHpIgAnq4RhW7K1Pm9ud+mn2mQgldFhn54r9sFKg/GKQs/0oyORvety4l57wpcRCnSKIzwfUiRgXS7nXgP2CTVMUL8zwiREm/rUrIS/yXbPUZD5qm+WVoO2II8AEOxZZRlDKUx2GGV38hlAWtoOZao47ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=etrzTFq1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="etrzTFq1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F1B31F000E9;
	Mon, 13 Jul 2026 13:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948404;
	bh=nPPbVfeBDtFBts62tQhN/as11CFK0syN/en3nddvyuU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=etrzTFq1dSmpmfZXwogFya7nUTs5i/r9/KLlbWzwuA+9kSQ0Ev52A6BBUG9uvHNtm
	 XUHP0CE1xr6We7HP1/y5hALn8ob4OhwuSab7xl34lsEYKw9w1XrINl+qvaL5do9r1q
	 3CgAq8blgWeez33TN0GCcV2AzH7ODyyDtRJ5pO9frHygw8ClfXXdq8nm27W6sTBLHf
	 BocY1b4a6R1Q47DilzyoWerfuS3NxuWRjwSq+R7TH0w9bcjadoMJa4hM9K+zO3nx+A
	 G4AlX1yhsCB5/Sk+R4REkJn56uuxsP7x9Epibi4p8ffwDlPQybet2TpxX+kcAIC2W3
	 a3EkMwySs5Tgg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/10] drm/mediatek: mtk_dsi: Add support for MT8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, conor+dt@kernel.org
In-Reply-To: <20260713130103.34654-7-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
 <20260713130103.34654-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:13:23 +0000
Message-Id: <20260713131323.9F1B31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] DSI link bandwidth and clock rate calculations ignore DSC (Display=
 Stream Compression), incorrectly rejecting valid high-resolution modes and=
 configuring the PHY clock out of spec.
--

--- Patch [6]: [PATCH v3 06/10] drm/mediatek: mtk_dsi: Add support for MT81=
89 ---
commit 89dc8fbb4f8f90dfbd3c155b69311aad3902771f
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dsi: Add support for MT8189

This commit adds support for the DSI IP in the MT8189 SoC. It increases the
maximum link rate to 2.5Gbps and introduces a max_link_rate_mbps parameter
to replace hardcoded values. It also casts calculations to u64 to avoid
overflows with higher pixel clock rates.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 4d5cb91c788f6..dffb6befc749e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -924,7 +926,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	}
>  	bit_per_pixel =3D ret;
> =20
> -	dsi->data_rate =3D DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> +	dsi->data_rate =3D DIV_ROUND_UP_ULL((u64)dsi->vm.pixelclock * bit_per_p=
ixel,
>  					  dsi->lanes);
> =20
>  	ret =3D clk_set_rate(dsi->hs_clk, dsi->data_rate);

[Severity: High]
Does this code ignore Display Stream Compression (DSC) when calculating the
PHY clock rate? The calculation uses the uncompressed bits per pixel, which
might set the DSI hardware PHY clock far higher than the actual compressed
link rate requires.

[ ... ]

> @@ -1099,13 +1101,21 @@ mtk_dsi_bridge_mode_valid(struct drm_bridge *brid=
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
>  		return MODE_CLOCK_HIGH;

[Severity: High]
Does this calculation also ignore DSC?=20

The wanted_link_rate is calculated using the uncompressed bpp instead of the
compressed bits per pixel. This could incorrectly reject valid high-resolut=
ion
display modes if their uncompressed bandwidth exceeds the DSI link's maximum
capacity.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713130103.3465=
4-1-angelogioacchino.delregno@collabora.com?part=3D6
