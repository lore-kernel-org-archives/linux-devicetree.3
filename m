Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470343E7BB2
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 10:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783937589; cv=none; b=QYhRMmPcFdU/5ouaQliZE5BLQkzg3HuKekNskHHNA5WdLqLfM45WOA3EmQRVXSyUh3mAAvr/DvYg4u0himViK42KdzvPXYCqeyF9C8bYPBq62gZItbukHoO/21aWAXqzm5zmZ5knh7hIzXexb6UO3MIhW/uRHcD72730XrIxeZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783937589; c=relaxed/simple;
	bh=1Hiz2GKMANLC5pxNYmmo0sFIya4KNhecb75s5tgxka4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S2BgPtW3cDLTXza66IljodP53jksQliSsEqFuamuGhOmsPV6JEUDyUiEM2Wa7ZOJ8Ka12Mk+SmvLM8OyV4JApUHaAxPvvhENrzxftecuZyObJw7Lxt8Yplgox3jhScWXlllMOvCOt4xKBHCUtl24e8e1qzqF8fYzK/ZKWsAIxdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E/kFnxQ1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E/kFnxQ1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C5E11F000E9;
	Mon, 13 Jul 2026 10:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783937585;
	bh=nC4OZ58ETTeCF7peTj2WIW3KIY2k58M6dxPQQ2rjIu0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E/kFnxQ1f6XZc1s44fE+SqxhUrPobwn67/oPEQC3tfYBeEsfB736uCbEzomk8D1UL
	 Gd3U1rDCy0M4yNPFAGVwa1Z7ioQR93YAqyiwtfntGfk0+BO0rnq5yTwjvFZtgYvtTV
	 5T9iNKjc2KWkgcUEKY36AViK3Yxl49wJrcQRldopcJXxj0O7nAeSJfBWkldZfwJ8k1
	 NIWpzw0XuvKbhnJrLHD6tlQkMnnjiJzNap92x7qAv3aQu+HekmLxqcurdidXPdAxnh
	 oQlaaGGfirN9DIpz2K0qIeSpv9ZRs7bP2nm363lW4W7HN/GbystGLWnDrZacif+KRd
	 coyPdvH2xSvXA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 06/10] drm/mediatek: mtk_dsi: Add support for MT8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260713095837.16590-7-angelogioacchino.delregno@collabora.com>
References: <20260713095837.16590-1-angelogioacchino.delregno@collabora.com>
 <20260713095837.16590-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 10:13:05 +0000
Message-Id: <20260713101305.9C5E11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Inaccurate link rate overestimation falsely rejects valid modes an=
d incorrectly configures the PHY clock when DSC is enabled.

Pre-existing issues:
- [High] Silent 32-bit integer overflow when calculating DSI data rate for =
high-resolution panels on 32-bit architectures.
- [Medium] 32-bit signed integer overflow in `wanted_link_rate` calculation=
 allows maliciously crafted modes to bypass the maximum link rate security =
check.
--

--- Patch [6]: [PATCH v2 06/10] drm/mediatek: mtk_dsi: Add support for MT81=
89 ---
commit 06bb023e18f2fab2efd045626f608227b5c0522f
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drm/mediatek: mtk_dsi: Add support for MT8189

This commit adds support for the DSI IP in the MT8189 SoC, which supports a
higher link rate of 2.5Gbps. It introduces a max_link_rate_mbps member to
parameterize the maximum link rate per SoC and updates the mode validation
callback to use this new parameter with 64-bit math.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 6a77ce8eea91f..2df2a9d5ec038 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -1070,13 +1072,20 @@ mtk_dsi_bridge_mode_valid(struct drm_bridge *brid=
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
> +	wanted_link_rate =3D mode->clock * bpp;

[Severity: Medium]
This is a pre-existing issue, but does this calculation allow a 32-bit sign=
ed
integer overflow? Since mode->clock and bpp are both evaluated as 32-bit
signed integers, an abnormally high clock value could wrap around to a small
positive value before being zero-extended and assigned to the 64-bit
wanted_link_rate. Could this allow crafted modes to bypass the maximum link
rate check?

[Severity: High]
Does this calculation also overestimate the link rate when Display Stream
Compression (DSC) is enabled? By using the raw uncompressed bpp instead of
the compressed bit rate (dsi->dsc->bits_per_pixel), high-resolution
DSC-enabled displays might be falsely rejected as MODE_CLOCK_HIGH.

[Severity: High]
This is a pre-existing issue, but does a similar 32-bit integer overflow oc=
cur
in mtk_dsi_poweron() on 32-bit architectures?=20

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_poweron() {
    ...
    dsi->data_rate =3D DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
                                      dsi->lanes);
    ...
}

On 32-bit systems, pixelclock is a 32-bit unsigned long. For high-resolution
panels, the multiplication could overflow the 32-bit limit before the macro
casts the result to unsigned long long, resulting in a corrupted frequency
being sent to clk_set_rate().

Additionally, does mtk_dsi_poweron() configure the hardware DSI HS clock
using the uncompressed data rate rather than the DSC compressed data rate?
If so, could this overclock the hardware and cause it to fail when DSC is
active?

> +	max_link_rate =3D data->max_link_rate_mbps;
> +	max_link_rate *=3D dsi->lanes;
> +	max_link_rate *=3D KILO;
> +
> +	if (wanted_link_rate > max_link_rate)
>  		return MODE_CLOCK_HIGH;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713095837.1659=
0-1-angelogioacchino.delregno@collabora.com?part=3D6
