Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D3A4189CD
	for <devicetree@vger.kernel.org>; Mon, 13 Jul 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948264; cv=none; b=O5aMviBOAJG+KlbJ8IecW3VAFHae88KIrcHTcb4DD9xNMnYDxLbQB1qQnCuwIW/DUChmAt8+YdAsIDfOZBfT5zgltl2LTNQt3nkwhEtqUR9Bi8yA5UVLIn4KYtLcF3sxNGu0M0wAs4Ad+K40qhmDiMNt3D2IZU/bJ0tC4+hvmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948264; c=relaxed/simple;
	bh=L5IB1Ul101waovoahMoprgTlycFD1QPeFEHNiAg1ShU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gVPYL8Rm0l3HrpK55oOLQZ5OJedIJJiHbTV9d1S2LVYt/syZvWDDXj8B0xtIhNukOO08pMmgbr3OvxQeI/V+UhMJjVi/MVuSu7KhaOkFqAIH5DLsyGLhRtv2Qy4fQ8uDmF2xAkfzsVN/D31ovY1ZYZ6FO278kFQ4kH5oa+LIgjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJspJBMN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJspJBMN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A11C21F00A3A;
	Mon, 13 Jul 2026 13:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783948263;
	bh=Rx34yiMHP3dtMokDvLG+d6m0CB0mXQweyMxiFGb19VE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VJspJBMNKJGHM9OilSAAIgNQwAHhCAgi1z8b8BFHWSWcz/xYLnrfgiey+HgQYPsir
	 g+1Yq4FQzTMGoByw3gcTVjqvw71VvSpC88grbJhzikLyFHWa6d7itzkU+T20tPQ+Gx
	 s12D7N+eOdxFpMmGFDkDdUR6TmXKit8+qJhgWiOEVKcXhdIQV2JzhymHO5jFfFXzZ6
	 //KsofN2K4cEPBjMk0j6t18VN1a0xOmAYipNpl1aOvXd302HVQdhuHMGLvKcNXuCWa
	 ztets/uNngJxpRJBRipNN+BdzrhTHKX08A5zgL9ZR++D6ZhQpU7WUhSrTD7SvKEZz8
	 NDFUana+uoMUA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 07/10] drm/mediatek: mtk_dsi: Add support for MT8196
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260713130103.34654-8-angelogioacchino.delregno@collabora.com>
References: <20260713130103.34654-1-angelogioacchino.delregno@collabora.com>
 <20260713130103.34654-8-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 13:11:02 +0000
Message-Id: <20260713131102.A11C21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Unit mismatch between DSI data rate (Hz) and pixel clock rate (MHz=
) leads to integer underflow and incorrect QoS hardware buffer configuratio=
n.
- [High] 64-bit division by a non-constant variable causes a build error on=
 32-bit platforms.
--

--- Patch [7]: [PATCH v3 07/10] drm/mediatek: mtk_dsi: Add support for MT81=
96 ---
commit 92e543d518b805c7b9129880068f5a6955059779
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: drm/mediatek: mtk_dsi: Add support for MT8196

This commit adds support for the new DSI IP in the MT8196 SoC. It
implements hardware buffer configuration and initializes QoS parameters
required by this newer hardware.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index dffb6befc749e..573299f0e63b6 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
[ ... ]
> @@ -776,6 +872,91 @@ static int mtk_dsi_set_dsc_params(struct mtk_dsi *ds=
i)
>  	return drm_dsc_compute_rc_parameters(dsc);
>  }
> =20
> +static void mtk_dsi_config_hw_buffers(struct mtk_dsi *dsi)
> +{
[ ... ]
> +	tmp =3D (u64)dsi->data_rate * dsi->lanes;
> +	data_rate_per_buf =3D tmp / 8 / buffer_unit;

[Severity: High]
Does this 64-bit division break builds on 32-bit platforms?

Since tmp is a u64 and buffer_unit is a non-constant u32, this will likely
cause an undefined reference to __udivdi3 or __aeabi_uldivmod when compiling
for 32-bit architectures. Should this use div_u64() instead?

> +
> +	/* Calculate valid threshold and avoid exceeding FIFO size */
> +	out_valid_thresh =3D MTK_DSI_DEFAULT_QOS_VALID_FIFO_US * data_rate_per_=
buf;

[Severity: High]
Are there unit mismatches in these rate calculations?

Since dsi->data_rate is in Hz, data_rate_per_buf is calculated
as buffers per second (e.g., ~15,000,000). Multiplying it by
MTK_DSI_DEFAULT_QOS_VALID_FIFO_US (25) will result in a huge value
that will always over-saturate the FIFO limit.

> +	out_valid_thresh =3D min(out_valid_thresh, MTK_DSI_MAX_FIFO_BYTES - 1);
> +	mtk_dsi_mask(dsi, reg_qos[DSI_QOS_BUF_CON1], BUF_OUT_VALID_THRESH, out_=
valid_thresh);
> +
> +	/* Enable ULTRA signal trigger between SOF and VACT */
> +	mtk_dsi_mask(dsi, data->reg_adv[DSI_VDE], VDE_BLOCK_ULTRA, 0);
> +
> +	/* Calculate fill rate with line counter mode for DSI Video Mode */
> +	if (dsi->format =3D=3D MIPI_DSI_FMT_RGB565)
> +		dsi_buf_bpp =3D 2;
> +	else
> +		dsi_buf_bpp =3D 3;
> +
> +	pclk_mhz =3D dsi->vm.pixelclock / HZ_PER_MHZ;
> +	fill_rate =3D pclk_mhz * data->pixels_per_iter * dsi_buf_bpp / buffer_u=
nit;
> +
> +	/* Calculate QoS Anti-Latency parameters */
> +	sodi_hi =3D MTK_DSI_MAX_FIFO_BYTES * num_hw_buffers;
> +	sodi_hi -=3D (fill_rate - data_rate_per_buf) * 12 / 10;

Similarly, here fill_rate is computed using pclk_mhz and results in
buffers per microsecond (e.g., ~40). Subtracting the much larger
buffers-per-second value of data_rate_per_buf will cause an integer
underflow, resulting in incorrect hardware buffer configurations.

Could data_rate_per_buf be converted to a per-microsecond rate to align
with fill_rate and the microseconds constant?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713130103.3465=
4-1-angelogioacchino.delregno@collabora.com?part=3D7
