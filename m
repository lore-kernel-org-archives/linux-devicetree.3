Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D0F3B47CB
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 12:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782909548; cv=none; b=I8HITP/Q/qguSd621lR3yL/Dgi6N8weQqk8rc9C3FpbKy48+v5fPM6PiXM5BaSaFoegLV8rDf0CIKNjMgkcPR3uZAWrChMzB+WSkfGBR15PzZsOOfkI7abcPOSWfMs9xIqwyoLTFmwcUtSGw7pOXXgj4syH5z14eDtvksqhmbi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782909548; c=relaxed/simple;
	bh=T4e3jdBkkTGSiBPGC+8gvcbRbMJqivgD2lyYXrt5ATc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=s52c2xHMQN+DcTAI1eo6lUPlGmD6oi6i5T6WWVPDAHEhMDVwBXTPVj4Q78F+EoFaw6qoi87KjBmhqzEfZ5IXVuLSoQzTJzcVDKRtrlEoPHBXmdBcMJ3ZJXpbtMkpjZA7+7BXxz1NJHnqJeMCPwN5miCc3J5kwrVxM+pomRc51TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o1GXLvg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o1GXLvg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97BD1F000E9;
	Wed,  1 Jul 2026 12:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782909547;
	bh=KQxD+BDucLd1j70ef6LoNzXEdO8IcXi/OcuAmbgGP9E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=o1GXLvg8bWxPNq/IZqiGTy+27SX67f/viurF+m0Muguxdf3ovdcWTANQ4bHoZla1M
	 3xwJuFiZu3mARxdLyFUWraZ4+680Z3GWbdO3vabKtAYmRm5wWQpF21VGzXAHrBFRsd
	 54OypaoZ7k8xvIESxk3jC0u5JNRAIQYlG6Wcfft3D1HN1SM4QovS/IqafQxbjkIKYI
	 foC8xTrkcy1Ianndzm2SpeJk8qyekPUPT7btsT3gIzNg0byhmyIC2M31H51qxczxti
	 LI8EMdjYJnc+GXR88u7EF6cneNVVyVJ0FHZ4+Cz7AmAZZNarM7dlzEYQxz013pB0JK
	 bRuz2a6mnmxXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/12] phy: phy-mtk-dp: Implement power_on and power_off
 PHY callbacks
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, vkoul@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org
In-Reply-To: <20260701122008.19509-6-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-6-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 12:39:06 +0000
Message-Id: <20260701123906.D97BD1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The power_on and power_off callbacks use the digital register layo=
ut array to look up an analog register offset, causing register operations =
to modify the wrong hardware offset.
- [Medium] The error path in `mtk_dp_phy_power_on()` fails to unwind previo=
usly applied hardware state if a subsequent step fails, leaking power state.
--

commit db1c6c4d46cae7dc24770e2f52553b8292fbfbc9
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Implement power_on and power_off PHY callbacks

Add .power_on() and .power_off() callbacks to mtk_dp_phy_dev_ops
to be able to call those with phy_power_on() and phy_power_off()
API in the DisplayPort driver to be able to stop using all of
those hardcoded register writes in that external driver.

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index ce33f6812bae6..586e727956332 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c

[ ... ]

> @@ -200,6 +236,53 @@ static int mtk_dp_phy_configure(struct phy *phy, uni=
on phy_configure_opts *opts)
>  	return 0;
>  }
> =20
> +static int mtk_dp_phy_power_on(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy =3D phy_get_drvdata(phy);
> +	const struct mtk_dp_phy_pdata *pdata =3D dp_phy->pdata;
> +	const u8 *regs =3D pdata->regs_dig_glb;
> +	int ret;
> +
> +	/* Enable AUX Channel with RX De-Glitch and input clock detection */
> +	ret =3D regmap_write(dp_phy->regmap,
> +			   pdata->off_dig_glb + regs[DP_PHYD_AUX_RX_CTL],
> +			   PHYD_DIG_DPAUX_RX_EN |
> +			   PHYD_DIG_XTP_GLB_CKDET_EN |
> +			   PHYD_DIG_DPAUX_RX_DEGLITCH_EN);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D regmap_clear_bits(dp_phy->regmap,
> +				pdata->off_ana_glb + regs[DP_PHYA_GLB_FORCE_CTRL_1],

[Severity: High]
Here regs points to the digital register array pdata->regs_dig_glb, but it =
is
being indexed with DP_PHYA_GLB_FORCE_CTRL_1, which is an analog register
enum. Does this result in reading the wrong offset (fetching the offset for
DP_PHYD_BIT_RATE instead of DP_PHYA_GLB_FORCE_CTRL_1) and corrupting the
bitrate configuration?

> +				CKM_CKTX0_EN_FORCE_MODE);
> +	if (ret)
> +		return ret;

[Severity: Medium]
If regmap_clear_bits() fails here, the function returns the error without
unwinding the previous successful write to DP_PHYD_AUX_RX_CTL. Since the PHY
core will not call phy_power_off() if phy_power_on() returns an error, does
this leave the RX channel and clock detection permanently enabled?

> +
> +	return 0;
> +}
> +
> +static int mtk_dp_phy_power_off(struct phy *phy)
> +{
> +	struct mtk_dp_phy *dp_phy =3D phy_get_drvdata(phy);
> +	const struct mtk_dp_phy_pdata *pdata =3D dp_phy->pdata;
> +	const u8 *regs =3D pdata->regs_dig_glb;
> +	int ret;
> +
> +	ret =3D regmap_set_bits(dp_phy->regmap,
> +				pdata->off_ana_glb + regs[DP_PHYA_GLB_FORCE_CTRL_1],

[Severity: High]
Similarly to mtk_dp_phy_power_on(), this uses the digital register array
regs indexed with the analog enum DP_PHYA_GLB_FORCE_CTRL_1. Should this use
pdata->regs_ana_glb instead to avoid writing to the wrong hardware offset?

> +				CKM_CKTX0_EN_FORCE_MODE);
> +	if (ret)
> +		return ret;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122008.1950=
9-1-angelogioacchino.delregno@collabora.com?part=3D5
