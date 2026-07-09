Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636A5416CE5
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 12:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783598436; cv=none; b=WXrhQI2W6b57duE05YnsZ4I4i51ao4CgfOrDmmBAK+PYxqHEEKJIUMxs5oTsXjagswgeS2FV4c1K2ulz0A2FMZFyj1PoVNPojJ320du8rz7tMFYAqZM1AiO9pr3LfmPZxwasNeuVawoPyxbXF9eySrIxANkjZqxdsTF1kfsjiMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783598436; c=relaxed/simple;
	bh=+6+HxMPNiMV/SaDQj7awVOS5dS4EfUNo64NxSoZeEgU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QMRG+7GKHnni4PBvxrMWcgfu5fxzBPZRJoTzi8nWllVHySLOPsra4R1RjfogQ4Y0zQx8Ukb7gErmoa5bBcDRNs0Kg/1EgM210JDsNoniyjHfyKGs9BfwCslnGDCij+pClCj/rdeNqgXODfR/uqK5TGjjDw15zn7v9cz1HGT9uj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UZju8aeX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UZju8aeX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 123891F000E9;
	Thu,  9 Jul 2026 12:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783598433;
	bh=Xdy7Q718IMHWx41sRqXBrnpU0ZeFsc7LYSQLsD6AR+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UZju8aeXiNqvDHI3RabYydI1QOudm/GikyhLndVjWIRgRYG3hxSByIYyr8qvlD99N
	 ooplmveyp3L28nvOC7hgEeSRmoDz+njCwvWG0pdRz6lMyFc80fZtd7vTKPrEyYYwp7
	 YUr9UpGWl1kx/GePO5pdOwZYW5JDbcfJumzeu9UQIktL1tpiNDxfnS7LtGyc7iu9c9
	 X9v3535V8JialKRt9mx0ZZDNIhtA05n/Eas+wKCzptoy1zlCQz4agRVDgc2nVvCeaD
	 eolhNxDonoQxEFcbnqNtGIZTlEnu4q6kt3KYXSuP9tMiVW//sUVgEJ2cPRDMaGBngz
	 tj3PSvlVi1ggA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 10/12] drm/mediatek: mtk_dp: Add support for HotPlug
 Detection in DP AUX
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: conor+dt@kernel.org, dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260709113148.49090-11-angelogioacchino.delregno@collabora.com>
References: <20260709113148.49090-1-angelogioacchino.delregno@collabora.com>
 <20260709113148.49090-11-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 12:00:32 +0000
Message-Id: <20260709120033.123891F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Unhandled interrupt storm due to unconditional unmasking of AUX HP=
D interrupts on older SoCs.
- [High] Unsafe read-modify-write on the interrupt clear register `MTK_DP_A=
UX_TX_P0_INT_CLR` causes lost interrupts.
- [Medium] Missing `legacy_regoff` addition when polling the AUX HPD status=
 register `MTK_DP_AUX_P0_364C`.
--

--- Patch [10]: [PATCH v4 10/12] drm/mediatek: mtk_dp: Add support for HotP=
lug Detection in DP AUX ---
commit d87425adb9b3f30b1f231894a984a344e048ae99
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

drm/mediatek: mtk_dp: Add support for HotPlug Detection in DP AUX

This patch adds support for hotplug detection via DP AUX in MediaTek DP IP,
avoiding the need to power up the entire eDP/DP IP. It introduces a new
flag to select the HPD strategy.

> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index ea970a9bfe936..772ba311a34a7 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1047,7 +1048,30 @@ static u32 mtk_dp_swirq_get_clear(struct mtk_dp *m=
tk_dp)
>  	return irq_status;
>  }
> =20
> -static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
> +static u32 mtk_dp_aux_hwirq_get_clear(struct mtk_dp *mtk_dp)
> +{
> +	u32 irq_status =3D mtk_dp_read(mtk_dp, MTK_DP_AUX_TX_P0_INT_STA);
> +	u32 ret =3D 0;
> +
> +	if (irq_status) {
> +		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_TX_P0_INT_CLR,
> +				   irq_status, irq_status);

[Severity: High]
Can this read-modify-write operation drop newly arrived interrupts?

mtk_dp_update_bits() uses regmap_update_bits() which performs a
read-modify-write. By using irq_status as the mask, if the clear register
reads back with new interrupt bits set (that arrived after the INT_STA read=
),
the read-modify-write will preserve those new bits and write them back as 1=
s,
unintentionally clearing them before they are handled.

Should a full mask (like DP_TX_AUX_INT_MASK) be used here instead to ensure
non-target bits are zeroed out?

> +		mtk_dp_update_bits(mtk_dp, MTK_DP_AUX_TX_P0_INT_CLR,
> +				   0, irq_status);
> +	}
> +

[ ... ]

> @@ -1062,8 +1086,28 @@ static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *m=
tk_dp)
>  	return irq_status;
>  }
> =20
> +static inline u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
> +{
> +	if (mtk_dp->data->aux_hpd_supported)
> +		return mtk_dp_aux_hwirq_get_clear(mtk_dp);
> +
> +	return mtk_dp_trans_hwirq_get_clear(mtk_dp);
> +}
> +
>  static void mtk_dp_hwirq_enable(struct mtk_dp *mtk_dp, bool enable)
>  {
> +	u32 mask, val;
> +
> +	/* On SoCs with working AUX HPD, the transmitter HPD register is ignore=
d by HW */
> +	if (enable) {
> +		mask =3D HPD_CONNECT_EVENT | HPD_INTERRUPT_EVENT | HPD_DISCONNECT_EVEN=
T;
> +		val =3D 0;
> +	} else {
> +		mask =3D DP_TX_AUX_INT_MASK;
> +		val =3D DP_TX_AUX_INT_MASK;
> +	}
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TX_AUX_INT_MASKING, val, mask);
> +

[Severity: High]
Does this code risk causing an unhandled interrupt storm on older SoCs?

Since MTK_DP_TX_AUX_INT_MASKING is updated unconditionally, the AUX HPD
interrupts are unmasked even if aux_hpd_supported is false.

If an older SoC triggers an AUX HPD interrupt, mtk_dp_hwirq_get_clear()
will branch to mtk_dp_trans_hwirq_get_clear() and ignore the AUX interrupt,
causing it to remain asserted and repeatedly trigger.

Should this unmasking be guarded by the aux_hpd_supported flag?

>  	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3418,
>  			   enable ? 0 :
>  			   IRQ_MASK_DP_TRANS_P0_DISC_IRQ |

[ ... ]

> @@ -2113,10 +2191,15 @@ static int mtk_dp_wait_hpd_asserted(struct drm_dp=
_aux *mtk_aux, unsigned long wa
>  	u32 val;
>  	int ret;
> =20
> -	ret =3D regmap_read_poll_timeout(mtk_dp->regs,
> -				       MTK_DP_TRANS_P0_3414 + mtk_dp->legacy_regoff,
> -				       val, !!(val & HPD_DB_DP_TRANS_P0_MASK),
> -				       wait_us / 100, wait_us);
> +	if (mtk_dp->data->aux_hpd_supported)
> +		ret =3D regmap_read_poll_timeout(mtk_dp->regs, MTK_DP_AUX_P0_364C,
> +					       val, !!(val & HPD_STATUS_DP_AUX_TX_P0_MASK),
> +					       wait_us / 100, wait_us);

[Severity: Medium]
Is the register address missing the legacy_regoff addition here?

Unlike mtk_dp_read() which automatically adds mtk_dp->legacy_regoff,
regmap_read_poll_timeout() operates directly on the regmap.

If a platform with aux_hpd_supported also uses a non-zero legacy_regoff, th=
is
will poll the wrong physical register address. The fallback path for older
SoCs correctly applies the offset manually.

> +	else
> +		ret =3D regmap_read_poll_timeout(mtk_dp->regs,
> +					       MTK_DP_TRANS_P0_3414 + mtk_dp->legacy_regoff,
> +					       val, !!(val & HPD_DB_DP_TRANS_P0_MASK),
> +					       wait_us / 100, wait_us);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709113148.4909=
0-1-angelogioacchino.delregno@collabora.com?part=3D10
