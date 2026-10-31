Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434589;
	b=FnUGKvhoZIMcwy+MhPcJgch/N1sEUhVEnDvpJB/MNYqXcnxnhx3KZoQMQv6ybom9c8Sc
	 2GVgScAxo/giihV8KJlFA5kWhbscwAGa3UyUZcGN6adjpbqp80DPM04T95W6IgmYbxGjq
	 WqHfp1SrVF+V71LyvFjf9MUp/sWJlHblWf/DGLLL8LZOlZOq23oj4UTVr3qG0CWwg0FxW
	 HoW7v184Uyzs3WbBI3cfjqQRnz9hLZZyG24Hqb3He+N3TP4FHe0EsNFZDb7cLiXhXMaa6
	 HQ+RKT0HTpRy6MmMgaTSBZAu+NhVp1BaONnu1W9r/ACRJAc3hOU2WUcVSc4zOqFDNGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434589;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BU8vZrh+E0EyfqHBm3KO7jS+VxWPaY70+PTxu4tT8Pc=;
	b=AfEkCAKoZLpW2bW4b7WUAARswsR1/zhNpVa+guonLT3dnNkiB7GbC3kWMihWVIM/ITwZ
	 Uv0Kv4tPBPGWAMKLHUp1lOD7iLy9RwjOQI1CHH52o2M5Q4vTvys6n+4H8L7nQSDNwNdAS
	 YPUnk1hpHrv8ux5P+WTsKc8DXtHjTT3NlThY2MUJCzD8G+IctYF6HVfISrr+COgVJq8+M
	 A1za/GHnHkyvobwaEa7uIauT4Ick3uOvbhxEp3nwKfX/FOh6I5jRy/B5MqWKL19v1BgOz
	 Z1hVgalwFc+oG/S60Z3boeNYnlo9ZvBmZVxmFygg3zGSQpTgdSvPoilY4wWzoJb3XMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="gYkqG0/d";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F7D606A31A
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 08:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gYkqG0/d
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6493C1F000C1;
	Sat, 31 Oct 2026 08:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793434588;
	bh=BU8vZrh+E0EyfqHBm3KO7jS+VxWPaY70+PTxu4tT8Pc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYkqG0/dVWODGI86+tSX8qqPFMXVsJGAsoWLyYbHtsk/2V8kx9zU4bDh8KVyAooCY
	 +/sq2tjFPrqeGCoGBfvCvAtHbQgnR9gUtP1o1/LumaDueYYpeB7CJcu20YyUtf0CBL
	 5wvzOjSi6TcY/4xbi6umCmAaUz6KyrqBA4of3trjCycC1HzFmvCtiX4Juk6TWZhFBx
	 AaUweGdoFVo4t7ooQvrcLMKZYExGR8mHV1/sHosGbEKjmW85XDLHeyHTKs0DAGirE2
	 Wr18+kpeIYCcN2Vj5pHCo6tsnLV4BGl+pKpa6u+sHCTfZKuv3MTvRkQF24PlV3wZZv
	 ANnU8ix6CG3Sw==
Message-ID: <sashiko-outbox-191822@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] drm/msm/dpu: Add SM7250 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ishu Brar" <patches@brar.si>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
References: <20261031-dpu-sm7250-v1-0-159f403ec405@brar.si>
 <20261031-dpu-sm7250-v1-4-159f403ec405@brar.si>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 31 Oct 2026 08:16:27 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] drm/msm/dpu: missing qcom,sm7250 entry in qcom_ubwc_configs[] brea=
ks probe
- [Medium] drm/msm/dpu: wrong VIG scaler sblk and decimation caps in sm7250=
 catalog
--

commit c585a6f10d3dc7f0ad4fb0db73946dc4b06530db
Author: Ishu Brar <patches@brar.si>

drm/msm/dpu: Add SM7250 support

This commit adds hardware catalog definitions and device tree matching for
the DPU 6.1 display controller on the Qualcomm SM7250 platform.

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h b/dri=
vers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h
> new file mode 100644
> index 0000000000000..802a96598f362
> --- /dev/null
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_1_sm7250.h
> @@ -0,0 +1,311 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights reser=
ved.
> + * Copyright (c) 2015-2018, 2020 The Linux Foundation. All rights reserv=
ed.
> + *
> + * SM7250, SDE hardware revision 6.1.0. Block offsets are relative to the
> + * "mdp" register region.
> + */
> +
> +#ifndef _DPU_6_1_SM7250_H
> +#define _DPU_6_1_SM7250_H
> +
> +static const struct dpu_caps sm7250_dpu_caps =3D {
> +	.max_mixer_width =3D DEFAULT_DPU_OUTPUT_LINE_WIDTH,
> +	.max_mixer_blendstages =3D 0x9,
> +	.has_src_split =3D true,
> +	.has_dim_layer =3D true,
> +	.has_idle_pc =3D true,
> +	.has_3d_merge =3D true,
> +	.max_linewidth =3D 2880,
> +	.pixel_ram_size =3D DEFAULT_PIXEL_RAM_SIZE,
> +	.max_hdeci_exp =3D MAX_HORZ_DECIMATION,
> +	.max_vdeci_exp =3D MAX_VERT_DECIMATION,
> +};

[ ... ]

> +static const struct dpu_sspp_cfg sm7250_sspp[] =3D {
> +	{
> +		.name =3D "sspp_0", .id =3D SSPP_VIG0,
> +		.base =3D 0x4000, .len =3D 0x1f8,
> +		.features =3D VIG_SDM845_MASK_SDMA,
> +		.sblk =3D &dpu_vig_sblk_qseed3_2_4,
> +		.xin_id =3D 0,
> +		.type =3D SSPP_TYPE_VIG,
> +		.clk_ctrl =3D DPU_CLK_CTRL_VIG0,
> +	}, {
> +		.name =3D "sspp_1", .id =3D SSPP_VIG1,
> +		.base =3D 0x6000, .len =3D 0x1f8,
> +		.features =3D VIG_SDM845_MASK_SDMA,
> +		.sblk =3D &dpu_vig_sblk_qseed3_2_4,
> +		.xin_id =3D 4,
> +		.type =3D SSPP_TYPE_VIG,
> +		.clk_ctrl =3D DPU_CLK_CTRL_VIG1,
> +	}, {

[Severity: Medium]
Should SSPP_VIG0 and SSPP_VIG1 in sm7250_sspp[] use dpu_vig_sblk_qseed3_3_0
instead of dpu_vig_sblk_qseed3_2_4, and should max_hdeci_exp and
max_vdeci_exp be omitted from sm7250_dpu_caps?

During dpu_kms_hw_init() -> dpu_rm_init() -> dpu_hw_sspp_init(),
sm7250_sspp[] binds sspp_0 and sspp_1 to the DPU 5.x QSEED3LITE v2.4
sub-block (dpu_vig_sblk_qseed3_2_4) and sm7250_dpu_caps advertises hardware
decimation limits.

All other DPU 6.x catalog definitions with a VIG scaler (SM8250, SC7180,
SM6115, SM6350, and SM6375) use dpu_vig_sblk_qseed3_3_0 and omit
max_hdeci_exp and max_vdeci_exp, as hardware decimation was removed in DPU
6.0 (similar to the fixes for SM8250 and SM6115 in commits 03c0c3cb22a4 and
38164e990a42).

[ ... ]

> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/ms=
m/disp/dpu1/dpu_kms.c
> index da3556eb6ecc2..6eb6f65ada91d 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -1506,6 +1506,7 @@ static const struct of_device_id dpu_dt_match[] =3D=
 {
>  	{ .compatible =3D "qcom,sm6350-dpu", .data =3D &dpu_sm6350_cfg, },
>  	{ .compatible =3D "qcom,sm6375-dpu", .data =3D &dpu_sm6375_cfg, },
>  	{ .compatible =3D "qcom,sm7150-dpu", .data =3D &dpu_sm7150_cfg, },
> +	{ .compatible =3D "qcom,sm7250-dpu", .data =3D &dpu_sm7250_cfg, },
>  	{ .compatible =3D "qcom,sm8150-dpu", .data =3D &dpu_sm8150_cfg, },
>  	{ .compatible =3D "qcom,sm8250-dpu", .data =3D &dpu_sm8250_cfg, },
>  	{ .compatible =3D "qcom,sm8350-dpu", .data =3D &dpu_sm8350_cfg, },

[Severity: High]
Will probing fail on SM7250 without a corresponding "qcom,sm7250" entry in
qcom_ubwc_configs[] in drivers/soc/qcom/ubwc_config.c?

Both dpu_kms_hw_init() and msm_mdss_init() call qcom_ubwc_config_get_data():

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:dpu_kms_hw_init() {
	...
	dpu_kms->mdss =3D qcom_ubwc_config_get_data();
	if (IS_ERR(dpu_kms->mdss)) {
		rc =3D PTR_ERR(dpu_kms->mdss);
		DPU_ERROR("failed to get UBWC config data: %d\n", rc);
		goto err_pm_put;
	}
	...
}

Because qcom_ubwc_configs[] has no entry matching "qcom,sm7250",
of_machine_get_match_data(qcom_ubwc_configs) returns NULL and
qcom_ubwc_config_get_data() returns ERR_PTR(-EINVAL), aborting both MDSS and
DPU initialization.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261031-dpu-sm7250=
-v1-0-159f403ec405@brar.si?part=3D4
