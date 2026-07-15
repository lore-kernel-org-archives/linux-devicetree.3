Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CF0043304C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784117248; cv=none; b=EvtiRb77vYUkFrjSo9AuXqOZfb/Yqlzaf+7ruvFEbQAh1+YESXCt9VRweq5etUFkQyGxwvpRcNlC65skMBNMz42mXGut3oPIRgUNZgRKmyZxZcDsX1xbJh05ZLQQ1UpxcsiFoCXk2UEKYK8SEusMSgoABQ6ajzrxl8zV875k18Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784117248; c=relaxed/simple;
	bh=c50mBumgZqOwGBFER8joGbdAiAGCkMQcgU2Eo8/5s9I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=I3LXtljzsSrF4EDKWTPt5M1EPV0SgwCc8Cc9htNp9/U9AWwzvvIK+T91Ug6Tz+R+YCG7NZH0+VmgIF0np2TZUQgg5n6chWTrdEz/NhyZ8gIfmeih7jwNO68icpcVkzJ7Zzw1IZdyMOX3FTGgU+2o1XiqCfU9rkXMZ7CoZBlo0mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aB4wbB2T; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aB4wbB2T"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807D91F000E9;
	Wed, 15 Jul 2026 12:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784117239;
	bh=/vwPcJgkd3EGzY7keaiQPMxacmd0OZ5f0z/laVrqwoo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aB4wbB2T80derXj6mviNAAQY2/Vl32CUCEBn4FPXck/0i5Y1Ufa3QS2tL/jBVBavG
	 k6xwCFfQgiqxUhHIdR70zGL1jkeJ72Z82NPqIJi5NMqXQHosxdwUbXAkvxkHp4R6AW
	 ryy6Hi+5vf7UzRqhNF2rSoxc+x7U8i4yYbAUJzoYHJX3o/Ktw8GEbQJZ6kfIbogopw
	 xrfXjFKe0Z4uMKWkRMo4ef5I2kZt/kz7v0Evm+075sIoQrDgOoNR3JgpKahmj41AgC
	 Dzf2To6tnEDf2BMO5aBQbGifR3pZqjNK2qDj6GtwY9GBv0IOeE/NGrrVdTB4Z2ch2b
	 PRDneZru0wSzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 07/11] drm/mediatek: mtk_dsi: Add support for MT8189
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260715114916.19690-8-angelogioacchino.delregno@collabora.com>
References: <20260715114916.19690-1-angelogioacchino.delregno@collabora.com>
 <20260715114916.19690-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:07:18 +0000
Message-Id: <20260715120718.807D91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Bandwidth check and PHY clock calculations do not account for DSC =
compression, incorrectly rejecting high-resolution modes and over-clocking =
the PHY.

Pre-existing issues:
- [High] Error path in `mtk_dsi_poweron` fails to decrement `refcount`, per=
manently leaving the DSI driver in a corrupted state.
- [High] Signal interruptions during IRQ waits are incorrectly treated as s=
uccessful operations.
--

--- Patch [7]: [PATCH v5 07/11] drm/mediatek: mtk_dsi: Add support for MT81=
89 ---
commit b1ac2564850b4d8fbc42fa9bf9284c320bec103e
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
drm/mediatek: mtk_dsi: Add support for MT8189

This commit adds support for the DSI IP in the MT8189 SoC, which supports a
higher link rate of 2.5Gbps. It introduces a max_link_rate_mbps member to
handle SoC-specific link rates dynamically instead of using a hardcoded
value, and casts calculations to u64 to prevent overflows.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index c5db63b93ff91..3f58683be70fa 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -926,7 +928,7 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>  	}
>  	bit_per_pixel =3D ret;
> =20

[Severity: High]
This is a pre-existing issue, but does this error path permanently leak the
reference count?

In mtk_dsi_poweron(), dsi->refcount is incremented at the start of the
function. If mipi_dsi_pixel_format_to_bpp() fails, the function returns
directly instead of jumping to the err_refcount label:

static int mtk_dsi_poweron(struct mtk_dsi *dsi)
{
        ...
        if (++dsi->refcount !=3D 1)
                return 0;

        ret =3D mipi_dsi_pixel_format_to_bpp(dsi->format);
        if (ret < 0) {
                dev_err(dev, "Unknown MIPI DSI format %d\n", dsi->format);
                return ret;
        }

Would this leave the DSI driver in a state where subsequent calls incorrect=
ly
assume the hardware is already powered on?

> -	dsi->data_rate =3D DIV_ROUND_UP_ULL(dsi->vm.pixelclock * bit_per_pixel,
> +	dsi->data_rate =3D DIV_ROUND_UP_ULL((u64)dsi->vm.pixelclock * bit_per_p=
ixel,
>  					  dsi->lanes);

[Severity: High]
Does this PHY clock calculation need to account for DSC compression?

By using the uncompressed bit_per_pixel here, could this clock the PHY at
the uncompressed data rate instead of the compressed DSC rate, potentially
over-clocking the PHY and breaking the DSC feature?

> =20
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

[Severity: High]
Similarly, does the wanted_link_rate calculation fail to account for the
DSC bit rate?

If bpp remains the uncompressed value (e.g., 24 for RGB888) instead of
the compressed rate from dsi->dsc->bits_per_pixel, will this incorrectly
reject valid high-resolution DSC modes by returning MODE_CLOCK_HIGH?

> +	max_link_rate =3D data->max_link_rate_mbps;
> +	max_link_rate *=3D dsi->lanes;
> +	max_link_rate *=3D KILO;
> +
> +	if (wanted_link_rate > max_link_rate)
>  		return MODE_CLOCK_HIGH;

[ ... ]

[Severity: High]
This isn't a bug introduced by this patch, but are signal interruptions
incorrectly treated as successes during IRQ waits?

In mtk_dsi_wait_for_irq_done(), wait_event_interruptible_timeout() can
return -ERESTARTSYS if interrupted by a signal.

However, both mtk_dsi_host_send_cmd() and mtk_dsi_switch_to_cmd_mode()
evaluate this negative error code with a logical NOT:

drivers/gpu/drm/mediatek/mtk_dsi.c:mtk_dsi_host_send_cmd()
{
        ...
        if (!mtk_dsi_wait_for_irq_done(dsi, flag, 2000))
                return -ETIME;
        else
                return 0;
}

Since -ERESTARTSYS is non-zero, the condition evaluates to false, taking
the else branch and returning 0 (success). Will this cause the driver
to silently ignore interrupted hardware operations and incorrectly assume
state changes have completed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715114916.1969=
0-1-angelogioacchino.delregno@collabora.com?part=3D7
