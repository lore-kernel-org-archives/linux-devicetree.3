Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63C2A37B41A
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 08:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498920; cv=none; b=R8m0EqIU3J6pnA4Qq30eDFqgJ8FJeB+b3axyXwMIKiEtYuBlb4j7N2Zsk8uLgZp8QkdFrBqcFmfI0cGcPEtM1gXHf7u1Y5I9nJzS4bAtn4RTYweonJSFg1LAwl2EfkvRV2iGxPb26d6wOUlDE0vXiiF2Txhti2y9iDJJ6tqVllM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498920; c=relaxed/simple;
	bh=U5FJU9f1qLhPj4AWyB6KLYsKp4/bAtR4p1eBa42ycqc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WzDjsHD3g6QcX0cL8jUEI/JqAU0EmNip3CR3OIAjQerpRimx2UG88y0iAEYqQPl1d5qpZCXvAfhFxwTOJTpz/3FOYJ5DCXNMlbEihJUBYPOrawe8yBplWftmmi3RJ7QPojB9Ry/HRwSXTXmRFrsTDbIV2PoA0bxlkZKbyHRUiq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dia+i83B; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dia+i83B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14FE1F00A3A;
	Wed,  8 Jul 2026 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498915;
	bh=inL3nHuucFpzo7s/E1QKBOqhv5cGMc9f7GCEEyfTUoI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Dia+i83BsX1m1YRN7jgF5QPVuXCpavD8o89RcKtUtc9rr/oGSxfkwlfECt8XU56We
	 NN6AzcFleoWhtI+g7Q90r9Jw6VnKs5InKYIQf/YJ6LxX4Y+jATze+E3ez7+Hgt3gO8
	 hdO16WjDnCp5OXpwRheQfYJwahbMx/Fu2934Co0MZJc1rfa5DEKlzpznLxaJdE8Qu8
	 dxgliesgzuCa5b91I6suW844+97/qg/MV72SBBEHvbohs1Zj/oXqwefYwqQPEz2BhN
	 znRIGTGemPmXOisZvOXgB4O047ge3zg18mbdJl53BOnGGnrdz1Fhgt0D05dk5k7SFf
	 E1SEb2lxxJ3Mw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/6] net: stmmac: mediatek: add support for TX
 deallocation adjustment feature
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-5-17f345eaaca3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:21:54 +0000
Message-Id: <20260708082154.F14FE1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The fine stage delay field MT8189_CTRL0_DLY_GTXC_STAGE_FINE is d=
efined as a multi-bit mask but is incorrectly used as a value, unconditiona=
lly setting all 6 bits to 1. Additionally, reciprocal delay functions are n=
ot updated to account for fine stages.
--

--- Patch [5]: [PATCH net-next 5/6] net: stmmac: mediatek: add support for =
TX deallocation adjustment feature ---
commit 848888a93a986153c930951bd429a61b8a876923
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

net: stmmac: mediatek: add support for TX deallocation adjustment feature

The MT8189 SoC has in the Ethernet control 0 register from the
peripheral configuration (pericfg) additional bits to adjust the TX
deallocation.

In preparation of MT8189 SoC support, add its definition, use in the
set_delay_v2 callback, and a support flag in the platform data.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index bcc0baef3f718..6b0a42b5839f2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> @@ -37,7 +37,8 @@
>  #define ETH_FINE_DLY_RXC	BIT(0)
> =20
>  /* Peri Configuration register for mt8189 */
> -#define MT8189_CTRL0_TXC_OUT_OP		BIT(20)
> +#define MT8189_CTRL0_TXC_OUT_OP			BIT(20)
> +#define MT8189_CTRL0_DLY_GTXC_STAGE_FINE	GENMASK(11, 6)

[ ... ]

> @@ -402,6 +407,9 @@ static int set_delay_v2(struct mediatek_dwmac_plat_da=
ta *plat)
>  		gtxc_delay_val |=3D FIELD_PREP(MT8195_DLY_GTXC_STAGES, mac_delay->tx_d=
elay);
>  		gtxc_delay_val |=3D FIELD_PREP(MT8195_DLY_GTXC_INV, mac_delay->tx_inv);
> =20
> +		if (plat->variant->use_stage_fine)
> +			gtxc_delay_val |=3D MT8189_CTRL0_DLY_GTXC_STAGE_FINE;

[Severity: Medium]
Does this unintentionally set all 6 bits of the fine stage delay to 1?

MT8189_CTRL0_DLY_GTXC_STAGE_FINE is defined as GENMASK(11, 6), making it a
multi-bit mask. Other delay configurations in this function use FIELD_PREP()
with a specific value, like FIELD_PREP(MT8195_DLY_GTXC_STAGES,
mac_delay->tx_delay).

If this is intended to hold a programmable fine delay value, should it be
using FIELD_PREP() instead of ORing the mask directly into gtxc_delay_val?

Additionally, does delay_stage2ps_v2() need to be updated to account for
these fine stages when reconstructing the picosecond delay?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-dwmac-medi=
atek-mt8189-v1-0-17f345eaaca3@collabora.com?part=3D5
