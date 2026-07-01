Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07672480DC4
	for <devicetree@vger.kernel.org>; Wed,  1 Jul 2026 13:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782911233; cv=none; b=By4i+Fp9nVZtOBxf20lR7GXn/vRwmsGTqU7Db4WdXsc/qyMKAaFPzLYNu42ZEZZgv7Y14+uuXBreYCnMKYS3xoI8+cgKQbzRwKTaKODEq+vI91nKMribOFy8WVFTkmFCnikhiFqU2NIr4cYbLqcyFGHi9Y7p715S78/k70grQSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782911233; c=relaxed/simple;
	bh=GZtVUwSC8cnyx50RIT4wPxvEYK7TMhOtYlR1MDiPuhs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Py8MWfPzC7aEKeR1lRThfx2G0/QpG/OpzVJ3jfR5C8N9SJ+KUFp5r5SUOncdKWpgr2xumXpGeGZRks8fEoJnONfhlqs/GEenYY63W7StQMWqLInBVnkA0Wk3a+XOUh+l5N3U6OXl7WFzuoMwTuiZPEkNIezKbk7eSCHfFs6lhVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mb7888WF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mb7888WF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C83071F000E9;
	Wed,  1 Jul 2026 13:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782911231;
	bh=s13JqDASJEsHLe7U0vrNcTPlNBmxFIye296NKUa1xoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mb7888WFK8KsqrAkU9bHEuxSJrAFxmghKNks6GW3CHK+4HrDuVGmnyY2eLi66r782
	 sOPCY7KgA2PZtZ6kHDQGAnRn2BTkkUapqWGEskpvTBrQ7iKoEhFUy7ZsaTvBLS+f3R
	 xdEwWuzfepEC5tXXcyA4W047P2BoxT4SYD/PMWbzyc40YooPwKZ5QB+pUnGT7uLt7g
	 QqgVPcQPc7QVvJNWV1gV5WM92tCSyw9MyuyV4VDLGkCzS2JHrIOXJHAbj8tAcj9W16
	 Chbl7xgN2/1aoeYYMcQ1eHIC7R5GQPa2hY2s7ivI19AA0vEv+i7q40PSrQQ3fNuDOl
	 rpoiFy4SCMecA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/12] phy: phy-mtk-dp: Add PHYD Lane EN register mask
 to SoC data
Reply-To: sashiko-reviews@lists.linux.dev
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, robh@kernel.org, conor+dt@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20260701122008.19509-12-angelogioacchino.delregno@collabora.com>
References: <20260701122008.19509-1-angelogioacchino.delregno@collabora.com>
 <20260701122008.19509-12-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 13:07:10 +0000
Message-Id: <20260701130710.C83071F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] mtk_dp_phy_disable_all_lanes() executes undefined behavior if init=
ially zero, and incorrectly clears lanes by shifting the lane index instead=
 of a bitmask.
--

commit d17ede4ab4b1189e133fc8f8e84c59aaf2d2590e
Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

phy: phy-mtk-dp: Add PHYD Lane EN register mask to SoC data

This commit prepares for supporting newer SoCs by moving the PHYD_TX_LN_EN
register mask into the SoC-specific data structure.

> diff --git a/drivers/phy/mediatek/phy-mtk-dp.c b/drivers/phy/mediatek/phy=
-mtk-dp.c
> index 7c8c04787b78c..f067acef222f7 100644
> --- a/drivers/phy/mediatek/phy-mtk-dp.c
> +++ b/drivers/phy/mediatek/phy-mtk-dp.c

[ ... ]

> @@ -442,7 +446,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp=
_phy *dp_phy)
>  		return ret;
> =20
>  	/* Get mask of currently enabled lane */
> -	val =3D FIELD_GET(PHYD_TX_LN_EN, val);
> +	val =3D field_get(pdata->mask_dig_tx_ln, val);
> =20
>  	/* Disable all lanes (needs to be done one by one, from last to first) =
*/
>  	do {
> @@ -451,7 +455,7 @@ static int mtk_dp_phy_disable_all_lanes(struct mtk_dp=
_phy *dp_phy)
> =20
>  		ret =3D regmap_clear_bits(dp_phy->regmap,
>  					pdata->off_dig_glb + regs[DP_PHYD_TX_CTL_0],
> -					FIELD_PREP(PHYD_TX_LN_EN, lane_num));
> +					field_prep(pdata->mask_dig_tx_ln, lane_num));

[Severity: High]
This is a pre-existing issue, but does this loop safely handle the case
where val is initially 0?

Since this is a do-while loop, if no lanes are currently enabled, fls(0)
will evaluate to 0, which leaves lane_num as -1. This would then result
in an out-of-bounds shift during the BIT(lane_num) calculation.

Additionally, should lane_num be passed into field_prep() as a bitmask
(e.g., BIT(lane_num)) rather than the raw integer index?=20

Passing the integer index directly (like 2 or 3) instead of a bitmask
appears to generate an incorrect value, which could cause regmap_clear_bits=
()
to clear the wrong bits in the register and leave lanes incorrectly powered=
 on.

>  		if (ret)
>  			return ret;
>  	} while (val);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701122008.1950=
9-1-angelogioacchino.delregno@collabora.com?part=3D11
