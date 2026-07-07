Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C6C3403F1
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 15:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783439785; cv=none; b=rxdT+7GJJU3pxea8TM+kx2tSZwqrwhWChsTHzMUOdmNJeWrIZaEmrAS1s3FrhchE3a92oAanH3sTnYxIJGYDZ7EEu+/rOnuRcjSrSilqSNUjZxDlwiTMT0nnnQuUKggWgmZhA/iFnzWu2BzjgfcMMimCOkE1h9Ku1avJnoULrx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783439785; c=relaxed/simple;
	bh=I1dPOYFavdoBMp6urjFN3pXRFk488GNJoWzNHRSdR9s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fRvnucBaX+Tn2xubB/f+qFtBFUmiV8wrYKO0r6KMIQw6TEnoNvcRJQnM8C0D6pCeI16liQZ4FaYVbfc4nlLP0mjSoJkWGvqUs3NjfN+YCobjECMrsgqV/77K0FS/jKYZT7kpVo7eh7qOECpgTwOQdCeifZNYwf5csKpgwNuIhV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ibq+mNhd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ibq+mNhd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68ED1F000E9;
	Tue,  7 Jul 2026 15:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783439784;
	bh=BR+iQpZJepEmz0MopDypdDGqAeRtQkbVo5FSmYXDYTw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ibq+mNhdF/OXAgu5Ou+Mm2q8Wgm5ue+pmOuErVVJcCjnib+lNS+R+K+c43Vpr1UO5
	 pZN1S2YVFWxrbPHjed6P1ZLnLNayIpTahyWzkDoyRZjsAtNOrYiGxvYhX0TmkUQNnk
	 t4WBT+Er/phINwAZsgdxxIGUcR89nVrJwxxvxEYqEkrAnWT8eZ43eYS2VpRmGVjww7
	 G7rJvCws3rrOO8TDetOeKJLrs3y7CIG1MaeTdMipAAP13w5XG8rSgjv7fZ3az4OhNr
	 rA2565nPjCA8dS1XXQUFJQZGW4qNZIoTQ05kXhCIFaWSmjyzOoG/kNOem+vTldwPRi
	 6qiwYTTb+dTaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 06/12] phy: phy-mtk-dp: Support set_lanes in
 configure and properly cleanup
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260707154245.198361-7-angelogioacchino.delregno@collabora.com>
References: <20260707154245.198361-1-angelogioacchino.delregno@collabora.com>
 <20260707154245.198361-7-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 07 Jul 2026 15:56:23 +0000
Message-Id: <20260707155623.E68ED1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inconsistent use of device pointers for error logging in `mtk_dp_ph=
y_power_off` and `mtk_dp_phy_reset`.
--

--- Patch [6]: [PATCH v3 06/12] phy: phy-mtk-dp: Support set_lanes in confi=
gure and properly cleanup ---
commit cab309557ac4fcb462c5b8978a8cd660acab1ec1
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Support set_lanes in configure and properly cleanup

This commit adds support for enabling a specifically requested number of
lanes in the .configure() callback. It also updates the power off and reset
callbacks to disable all lanes for proper hardware cleanup.

> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c
[ ... ]
> @@ -263,31 +281,68 @@ static int mtk_dp_phy_power_on(struct phy *phy)
[ ... ]
>  static int mtk_dp_phy_power_off(struct phy *phy)
>  {
>  	struct mtk_dp_phy *dp_phy =3D phy_get_drvdata(phy);
>  	const struct mtk_dp_phy_pdata *pdata =3D dp_phy->pdata;
>  	const u8 *regs_dig =3D pdata->regs_dig_glb;
>  	const u8 *regs_ana =3D pdata->regs_ana_glb;
> -	int ret_cktx, ret_aux;
> +	int ret_cktx, ret_aux, ret;
> =20
>  	ret_cktx =3D regmap_set_bits(dp_phy->regmap,
>  				   pdata->off_ana_glb + regs_ana[DP_PHYA_GLB_FORCE_CTRL_1],
>  				   CKM_CKTX0_EN_FORCE_MODE);
> +	if (ret_cktx)
> +		dev_err(&phy->dev, "Could not disable CKTX0: %d\n", ret_cktx);
[ ... ]
> +	ret =3D mtk_dp_phy_disable_all_lanes(dp_phy);
> +	if (ret) {
> +		dev_err(dp_phy->dev, "Could not disable lanes for poweroff!\n");

[Severity: Low]
Should this use &phy->dev instead of dp_phy->dev for error logging?

The adjacent error handlers for CKTX and AUX in this same function log=20
errors using &phy->dev. Mixing device pointers might lead to inconsistent=20
device names in the kernel log.

> +		return ret;
>  	}
[ ... ]
> @@ -307,6 +363,11 @@ static int mtk_dp_phy_reset(struct phy *phy)
[ ... ]
>  	/* Setting bits means go out of reset */
>  	regmap_set_bits(dp_phy->regmap, pdata->off_dig_glb + reg_rst, DP_GLB_SW=
_RST_PHYD);
> =20
> +	/* Disable all lanes and continue reset even if this fails, but notify =
*/
> +	ret =3D mtk_dp_phy_disable_all_lanes(dp_phy);
> +	if (ret)
> +		dev_err(dp_phy->dev, "Could not disable lanes during reset!\n");

[Severity: Low]
Similarly here, would it be better to use &phy->dev for consistency with=20
the rest of the API implementation?

> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707154245.1983=
61-1-angelogioacchino.delregno@collabora.com?part=3D6
