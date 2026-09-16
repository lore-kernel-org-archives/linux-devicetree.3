Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C054EC651
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 11:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789557743; cv=none; b=Co70HxTiWuCiTmUmPAwhEaaHnzL6QHx3cHjrCQ8LWse6xeh2iZIAWXpZNsuGnYCsM4zIpNqkl5xERRLn2Rzk1ECY+ILpm+LLmZJn6ehFw6nzKbOy2h8t8sEU8d8Xg96EA0EO7JPXInS0Ehcq6O4s+PTTYd4goCMscwaAqqs27Y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789557743; c=relaxed/simple;
	bh=97rzvt0ZJKQOAXxp3Sl9GRR1pYdqsV+k3K474zkUkl4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M+NVF8KdPJ1uawq6ZL8mFXAkO/e5Is1X/pi292brWi6fdvj/9JEd4TcDnNlT/Jlx39P/kpVUwQJ5ifaOOngV95Pdfq2RRGXptG0W/Rdgug/Jy8ONhYBzv6ecbgzYfB9XOGeqe5QlWTf+IGeYCM/XGpzF63CiieZSABgjfqoKKeA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EpnZQ2YL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EpnZQ2YL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15D5A1F00893;
	Wed, 16 Sep 2026 11:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789557729;
	bh=3zHjGZCLlGrB7lndtjURpfV9iKrNFJrUnUmP3tXNNts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EpnZQ2YLByGN0rjPnQyV8o5e97bPSfJubeavcuk145G2V0pM4RteIjc2XeL+XyLZn
	 Se1l0qaDqRqoJBAm1PSiPmHZ433oeI1995VVp3wSgjcvKtwBNujmpUY/ZSADnwphv2
	 rYO8WFkPv/NFfQtH92lcxsJ4xAUiBz4Zzs8SDl5DENzazZ9pZlLnIqmMFlXrQZobdO
	 IE2HfohM7KzhbLWeE023zoar1WT5MeJutrgFVgqselTjsrHTk/l0C3Jt36irguHy3w
	 xFs2F971HCUCKJyZdO671h3mGyuLTyy9uVxAK8LWnXp/Ikqvk1HxK1Y9xiuSEocYIi
	 pkq4udt0tQyXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 02/13] drm/mediatek: Implement Display Stream
 Compression support
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com>
 <20260916110825.102631-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 11:22:08 +0000
Message-Id: <20260916112209.15D5A1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] drm/mediatek: dsc: Hardware enabled before configuration causing m=
id-flight reconfiguration
- [High] drm/mediatek: dsc: Stale dsc_config_done flag breaks non-DSC displ=
ay modes
- [Medium] drm/mediatek: mtk_dsi: Uninitialized DSC slice_chunk_size used i=
n early PS control write
--

commit 28d40a7882b85945a98abc9cb60efffdd694dc30
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: Implement Display Stream Compression support

This commit introduces a new driver for the Display Stream Compression (DSC)
IP and adds DSC parameter handling to the mtk_dsi driver to compute and
configure the required compression parameters.

> diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediat=
ek/mtk_crtc.c
> --- a/drivers/gpu/drm/mediatek/mtk_crtc.c
> +++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
[ ... ]
> @@ -406,6 +409,17 @@ static int mtk_crtc_ddp_hw_init(struct mtk_crtc *mtk=
_crtc)
>  	for (i =3D 0; i < mtk_crtc->ddp_comp_nr; i++) {
>  		struct mtk_ddp_comp *comp =3D mtk_crtc->ddp_comp[i];
[ ... ]
>  		mtk_ddp_comp_config(comp, width, height, vrefresh, bpc, NULL);
>  		mtk_ddp_comp_start(comp);
>  	}
> =20
> +	/* Setup the DSC if present, with the config coming from DSI */
> +	if (comp_dsc && comp_dsi) {
> +		dsc_cfg =3D mtk_dsi_get_dsc_config(comp_dsi->dev);
> +		if (dsc_cfg)
> +			mtk_ddp_comp_dsc_setup(comp_dsc, dsc_cfg);
> +	}

[Severity: High]
In the loop above, mtk_ddp_comp_start() is called for all components, which
would execute mtk_dsc_start() and set the DSC_EN bit. Since
mtk_ddp_comp_dsc_setup() is only called after this loop finishes, does this
enable the DSC IP hardware before its configuration registers are initializ=
ed?

> diff --git a/drivers/gpu/drm/mediatek/mtk_disp_dsc.c b/drivers/gpu/drm/me=
diatek/mtk_disp_dsc.c
> --- /dev/null
> +++ b/drivers/gpu/drm/mediatek/mtk_disp_dsc.c
[ ... ]
> +void mtk_dsc_stop(struct device *dev)
> +{
> +	struct mtk_dsc *disp_dsc =3D dev_get_drvdata(dev);
> +
> +	writel(0, disp_dsc->reg + DISP_REG_DSC_CON);
> +}

[Severity: High]
When the hardware is stopped here, the disp_dsc->dsc_config_done flag isn't
cleared. If the display pipeline is later restarted in a non-DSC mode, will
this stale flag cause mtk_dsc_start() to skip the bypass mode setup and
incorrectly enable the compression hardware?

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -393,9 +397,35 @@ static void mtk_dsi_rxtx_control(struct mtk_dsi *dsi)
> +static void mtk_dsi_ps_control_dsc(struct mtk_dsi *dsi, bool config_vact)
> +{
> +	const struct mtk_dsi_driver_data *data =3D dsi->driver_data;
> +	const u16 *reg_main =3D dsi->driver_data->reg_main;
> +	const short dsi_buf_bpp =3D 3;
> +	u32 ps_wc;
> +
> +	/* Word count */
> +	ps_wc =3D FIELD_PREP(DSI_PS_WC, dsi->dsc->slice_count * dsi->dsc->slice=
_chunk_size);

[ ... ]
> @@ -741,10 +828,17 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
[ ... ]
>  	mtk_dsi_phy_timconfig(dsi);
> =20
>  	mtk_dsi_ps_control(dsi, true);
>  	mtk_dsi_set_vm_cmd(dsi);
> -	mtk_dsi_config_vdo_timing(dsi);
> +	ret =3D mtk_dsi_config_vdo_timing(dsi);

[Severity: Medium]
When mtk_dsi_poweron() calls mtk_dsi_ps_control(dsi, true), it looks like
mtk_dsi_config_vdo_timing() hasn't run yet. Since the DSC parameters like
slice_chunk_size are computed inside mtk_dsi_config_vdo_timing(), does this
write an uninitialized or incorrect word count to the hardware registers
initially?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916110825.1026=
31-1-angelogioacchino.delregno@collabora.com?part=3D2
