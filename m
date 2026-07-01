Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5057929DB9A
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 14:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914957; cv=none; b=kDtQlTLldGyKIQYcJcnMFKpii8Ce8PStboCoC4LCbJ4gHX/x/DOfjhEdWt7ekLNRNhsawhHMRLIz75ocynsaLAffKoiAzcT+ZBRqWqEIMi/vRYAAzPAzZ2AyXznsWJVJjYmyCnXSmn+rQ/YXq3A2IXMlEkhvwVbF+GpE8EVwtx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914957; c=relaxed/simple;
	bh=nVfF6qVc2598lqoEiid5sVtt7tUjpUGMJAWAKe6MS44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cF9FqVwHVWsQMg5IOOQIzpC20GuRjZXyaVsYMt8XEUOID0nPXyunAw6JmrMQVcxTmaWZNo1DLiL5pIhDHnl1Khhhc3Ri9KHRhthupToOKWRHhcX7CxklKpIY0WNoWejSBqV+Bzwb4HJ/BcXlY8ISxZoNsm4Q6AAewQExPLVP7Ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YkmBQd2N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YkmBQd2N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D151E1F000E9;
	Wed,  1 Jul 2026 14:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782914956;
	bh=4sod2++HE5GNde89J9Vk/9nGUJpRaReQ/yFbSXrvJ+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YkmBQd2N1wfHLMAseikNwMrPyg7KVWWZIPWldCFuaMyFFeGc8tb8J/iy9ugxEhhrh
	 +4cF3mP/k6xyG/+0iYugHF+JiKTG8Cc9Qp6FbdrhzDrEgoLnHyDNvAtnMKdHE4fhsI
	 3/TXZtlVWL8Jc0ly8MDguyLvhzncq7i/RQenHkkXDvLU3eB9PRYPx17gFVSGnKQV1d
	 0n+UAo5bcfAY2r/FtRFPMWnqVtTxn5lS1fV5isIXSaIubvxtBUWzAhflcB1/rs3XkG
	 vMx7X0O68ePoxPm24xlKp8WXhdNVijfPpOdH7n90SOpoTfuVRNF5eOnnwXU/GsmEnW
	 KvoQXjDu+81LQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] drm/mediatek: mtk_dp: Clarify XTAL freq and
 Debounce registers
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org
In-Reply-To: <20260701122024.19557-12-angelogioacchino.delregno@collabora.com>
References: <20260701122024.19557-1-angelogioacchino.delregno@collabora.com>
 <20260701122024.19557-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 14:09:15 +0000
Message-Id: <20260701140915.D151E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect mask definitions for HPD interrupt thresholds causing =
them to evaluate to 0 and conceptually overlap with debounce thresholds.
--

commit 7214d6f29b496392f70fbd0b4f1b03755f68eecb
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dp: Clarify XTAL freq and Debounce registers

This commit clarifies the meaning of the sub-fields in the crystal frequency
and transmitter interrupt debounce registers. The goal is to increase human
readability.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 605ead7fa9bf6..b861a5df93167 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c

[ ... ]

> @@ -1248,28 +1254,29 @@ static void mtk_dp_initialize_aux_hpd_detect_sett=
ings(struct mtk_dp *mtk_dp)
> =20
>  static void mtk_dp_initialize_hpd_detect_settings(struct mtk_dp *mtk_dp)
>  {
> -	u32 val;
> -
>  	/* Mask AUX TOP interrupt, as this uses transmitter for HPD */
>  	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_IRQ_MASK,
>  			   AUX_TOP_IRQ_MSK, AUX_TOP_IRQ_MSK);
> =20
> -	/* Debounce threshold */
> +	/* Set Hotplug debounce threshold time: xtal_period * deb_thd */
>  	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
>  			   8, HPD_DEB_THD_DP_TRANS_P0_MASK);
> =20
> -	val =3D (HPD_INT_THD_DP_TRANS_P0_LOWER_500US |
> -	       HPD_INT_THD_DP_TRANS_P0_UPPER_1100US) << 4;
> -	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> -			   val, HPD_INT_THD_DP_TRANS_P0_MASK);
> -
>  	/*
> -	 * Connect threshold 1.5ms + 5 x 0.1ms =3D 2ms
> -	 * Disconnect threshold 1.5ms + 5 x 0.1ms =3D 2ms
> +	 * Set interrupt debounce threshold time
> +	 * VAL  |  0     1     2     3  INT_THD
> +	 * Low  | 100   300   500   700 uS
> +	 * High | 700   900  1100  1300 uS
>  	 */
> -	val =3D (5 << 8) | (5 << 12);
>  	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3410,
> -			   val,
> +			   FIELD_PREP_CONST(HPD_INT_LOW_THD_DP_TRANS_P0_MASK, 2) |
> +			   FIELD_PREP_CONST(HPD_INT_HIGH_THD_DP_TRANS_P0_MASK, 2),
> +			   HPD_INT_THD_DP_TRANS_P0_MASK);

[Severity: Medium]
Will this result in setting the interrupt debounce thresholds to 0?

Because HPD_INT_LOW_THD_DP_TRANS_P0_MASK and HPD_INT_HIGH_THD_DP_TRANS_P0_M=
ASK
are defined as GENMASK(1, 0) and GENMASK(3, 2) instead of their absolute
positions within HPD_INT_THD_DP_TRANS_P0_MASK (GENMASK(7, 4)), the values
produced by FIELD_PREP_CONST fall outside the update mask.=20

The combined value evaluates to 0xA (bits 3:0), which means the=20
regmap_update_bits() call will silently clear bits 4 through 7 instead of=20
setting them.

[ ... ]

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/medi=
atek/mtk_dp_reg.h
> index 9caf743f4fe61..418a2318c656e 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> +++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
> @@ -253,6 +253,8 @@
>  #define MTK_DP_TRANS_P0_3410				0x1410
>  #define HPD_DEB_THD_DP_TRANS_P0_MASK				GENMASK(3, 0)
>  #define HPD_INT_THD_DP_TRANS_P0_MASK				GENMASK(7, 4)
> +#define HPD_INT_HIGH_THD_DP_TRANS_P0_MASK			GENMASK(3, 2)
> +#define HPD_INT_LOW_THD_DP_TRANS_P0_MASK			GENMASK(1, 0)

[Severity: Medium]
Are these masks defined at the wrong bit positions?

They appear to overlap with HPD_DEB_THD_DP_TRANS_P0_MASK (bits 3:0). If they
are meant to be sub-fields of HPD_INT_THD_DP_TRANS_P0_MASK (bits 7:4), shou=
ld
they be defined as GENMASK(7, 6) and GENMASK(5, 4) instead so they work
correctly with FIELD_PREP_CONST()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122024.1955=
7-1-angelogioacchino.delregno@collabora.com?part=3D11
