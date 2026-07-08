Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CBEC3FE37C
	for <devicetree@vger.kernel.org>; Wed,  8 Jul 2026 08:21:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783498919; cv=none; b=aahjPL5kToZwOmznJFB6zR+o2A/DX4/PtLWKDJU/tGczWToTQCG0ZrpgV3uOL1VcSIulHJE9twbQmepe+MI706DzJFGgBmqnOk66Iu0edAcj25Rc/gCE21xmGA7eSCNDsxbz52xZRI/BhA/0tcZerFQ8jWV90ryyfOkWw30eNzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783498919; c=relaxed/simple;
	bh=xx1gGOcISwaW2sO87mrmUJc90D6SEI+QZi+hw4gzU8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IBtsmK0o5ZGl/tluXWJC4lUPah1XBfC8G7qXajmCu2MhuW7oN7eL3NJbGdr2TcND6VMXEm2eIxrlw/kbR2ts5A1aE23JT6UKp2Uvrx9uKocrtWv7oHMspkyRz2wVojSXqZ1XHHErCiuuFhi1dA+IEa/+AADyF8YZ3Tqvueybu18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SJHmPgxc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SJHmPgxc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D9A21F000E9;
	Wed,  8 Jul 2026 08:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783498914;
	bh=UdGNm1slb20QAzR03FXaCHtGeV2hKyDLxFkbtzEtQC4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SJHmPgxc4RMz5IgQ9LmlAJCUiuzfp23DnvQZWSmzZUKftorKXOPZXSoAgnNSFjyD6
	 AJx9+F7EOdr5cw0aknzIDz7SAcQrUCdH/TgVaGaroiov3rGbAQw3r1B4BpDoCO7+xn
	 xmbp0EzlLeytOCfe4d+LRPERVMkpZWjpDLIXU+GExAb30IcpcYZjKx9rtWqTgWn9h2
	 w+LJcBsTWlG7J8TQJM4H1yKSD8/0WABudR9KfY+1kmrCSkB8nNgdhJeYEIvaatOTYk
	 /A5XfP7NWEXo1B0U76aldB3UT/TkvQBeY3nwsDhJkzMnel9+AZu5wiUY91z2MhFoeH
	 Me1RImjCKOqsw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 3/6] net: stmmac: mediatek: rename MT2712 and
 MT8195 variant methods
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
References: <20260707-dwmac-mediatek-mt8189-v1-0-17f345eaaca3@collabora.com>
 <20260707-dwmac-mediatek-mt8189-v1-3-17f345eaaca3@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:21:53 +0000
Message-Id: <20260708082154.2D9A21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The return value of `mediatek_dwmac_init()` is ignored during driv=
er probe, allowing the driver to silently bind to unconfigured or unsupport=
ed hardware.
- [High] Early error return in `set_delay_v2()` causes state corruption of =
`mac_delay` values on unsupported PHY modes.
--

--- Patch [3]: [PATCH net-next 3/6] net: stmmac: mediatek: rename MT2712 an=
d MT8195 variant methods ---
commit e972fc035e44817992b0ce16715cf1cbcf9432c0
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

    net: stmmac: mediatek: rename MT2712 and MT8195 variant methods
   =20
    In preparation of newer SoC support, rename MT2712 and MT8195 variant
    methods and sub functions to more generic names.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drive=
rs/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> index 0cabab4fd89a3..28e87990b0a10 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
[ ... ]
> @@ -317,13 +317,13 @@ static void mt8195_delay_stage2ps(struct mediatek_d=
wmac_plat_data *plat)
>  	mac_delay->rx_delay *=3D 290;
>  }
> =20
> -static int mt8195_set_delay(struct mediatek_dwmac_plat_data *plat)
> +static int set_delay_v2(struct mediatek_dwmac_plat_data *plat)
>  {
>  	u32 gtxc_delay_val =3D 0, delay_val =3D 0, rmii_delay_val =3D 0;
>  	struct mac_delay_struct *mac_delay =3D &plat->mac_delay;
>  	u32 reg_offset =3D plat->variant->peri_eth_ctrl_offset;
> =20
> -	mt8195_delay_ps2stage(plat);
> +	delay_ps2stage_v2(plat);
> =20
>  	switch (plat->phy_mode) {
>  	case PHY_INTERFACE_MODE_MII:
> @@ -419,14 +419,14 @@ static int mt8195_set_delay(struct mediatek_dwmac_p=
lat_data *plat)
>  		     reg_offset + MT8195_PERI_ETH_CTRL2,
>  		     rmii_delay_val);
> =20
> -	mt8195_delay_stage2ps(plat);
> +	delay_stage2ps_v2(plat);

[Severity: High]
This isn't a bug introduced by this patch, but does the early return on
unsupported PHY modes in set_delay_v2() bypass this call?

If phy_mode is an unsupported mode, the switch statement falls through to t=
he
default case which returns -EINVAL. This skips the call to
delay_stage2ps_v2() that restores the mac_delay values.

Since the values are unconditionally divided at the start of the function:

    delay_ps2stage_v2(plat);
        mac_delay->tx_delay /=3D 290;
        mac_delay->rx_delay /=3D 290;

If this happens during suspend/resume cycles, won't the delays be cumulativ=
ely
truncated to zero?

> =20
>  	return 0;
>  }

[Severity: High]
This is a pre-existing issue, but is the return value of mediatek_dwmac_ini=
t()
intentionally ignored during driver probe?

Looking at mediatek_dwmac_probe() in this file:

    mediatek_dwmac_common_data(pdev, plat_dat, priv_plat);
    mediatek_dwmac_init(&pdev->dev, priv_plat);

    ret =3D mediatek_dwmac_clks_config(priv_plat, true);

If hardware initialization fails (for example, due to an unsupported PHY
interface returning -EINVAL), mediatek_dwmac_probe() ignores the return val=
ue
and proceeds with registration.

Could this result in the driver binding to unconfigured hardware, leaving a
phantom interface that fails to pass traffic?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707-dwmac-medi=
atek-mt8189-v1-0-17f345eaaca3@collabora.com?part=3D3
