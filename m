Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDB32D780C
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 19:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784142906; cv=none; b=e9R42dkticI+qH3wxM6JozhO/gu8keinNR5bSc4YYoi+jc3oUjknW5RWRFViStq3eNwxUETaHQOWkFOEGWDeDjUmHpX+jtG3RqC0QZUN3wZxmSqYGeLJzvkfaKuLfJIrQQ951wH7XTd3PlnLiwYkvd7V18hqqRaTnJqiHvsd1eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784142906; c=relaxed/simple;
	bh=fx+1TVzYgwZ8xlM3sWEbm5tGLZMRrDgmVdM1WRdm+Ok=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kYbj9r1Eee0UGYSAmV7AcE3ccz4IYajradVZxOu7ZGdvILQNOufjIXEGXJo0TcYS0xGSU1n94AKxqJ2tyvR+eIrSpz4SJ0A4XkcOVrgdWiMSmZjO4eRXyQ7KNf+rS1IVKwnjRZu4OofSidgd2v2HnDaxE8rw7Ufnf0AONdE+poQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ls9L19PJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ls9L19PJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D033A1F00ACA;
	Wed, 15 Jul 2026 19:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784142896;
	bh=uM4epvXv9h1cGQUSasmZlR0KuyLAjXjxgDAwMcZOiv0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ls9L19PJHGR5kdAPfHuvfJ10FcwyfiY8cU7OPAt78KvTRDVzsaFHGAwRw5wfn7O69
	 CILju/ex0blGiviT3DDUVKGISnt7+gNH2zO9nTvLonl0IooyPagCjc+aksvRtNnegP
	 CAt8iLry6TMyx84jMr8bPyXMvkJyxEDU6+d54NI2/w0NBrrIh8wBzpr8vOJAhe6P6I
	 +796fRUiZYL6SFoXzTqIjUK3XwiomOnlRwxpDAKjjpM2A2ZkoS7kMmKh7aQzDs8AKl
	 AXXTz5SaegfN7K5atBCzJSfFBcGBFq6urFZXi+dx6ssFUt/iaNkcivKD6OlQ3wRAEY
	 2r7J8AvsULABg==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH 08/10] net: stmmac: dwmac-rk: add SGMII support for
 RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, linux-phy@lists.infradead.org, vkoul@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260714191341.690906-9-coiaprant@gmail.com>
References: <20260714191341.690906-1-coiaprant@gmail.com>
 <20260714191341.690906-9-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 19:14:55 +0000
Message-Id: <20260715191455.D033A1F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The SGMII initialization path inadvertently skips enabling the MAC=
 clocks, leading to hardware hangs or faults when MAC registers are accesse=
d.
--

--- Patch [8]: [RFC PATCH 08/10] net: stmmac: dwmac-rk: add SGMII support f=
or RK3568 ---
commit 7be50db2ac8c40c8451407f345aaaaf2d0538799
Author: Coia Prant <coiaprant@gmail.com>

net: stmmac: dwmac-rk: add SGMII support for RK3568

The RK3568 SoC integrates a Synopsys DesignWare XPCS that can be connected
to GMAC0 or GMAC1 in SGMII mode. Add the necessary glue logic to support
this configuration.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 386)

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> index 8d7042e689261..eca482b4b6bfc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
[ ... ]
> @@ -1379,6 +1441,9 @@ static int rk_gmac_powerup(struct rk_priv_data *bsp=
_priv)
>  	if (ret)
>  		return ret;
> =20
> +	if (bsp_priv->phy_iface =3D=3D PHY_INTERFACE_MODE_SGMII)
> +		goto set_mode;
> +

[Severity: High]
Does this goto skip enabling the MAC clocks? By jumping directly to set_mod=
e,
we bypass the call to gmac_clk_enable() further down in this function.

Can this cause a synchronous external abort when the MAC registers are acce=
ssed
subsequently while their clock domain remains disabled?

>  	ret =3D rk_get_phy_intf_sel(bsp_priv->phy_iface);
>  	if (ret < 0)
>  		return ret;
[ ... ]
> -	/*rmii or rgmii*/
> +set_mode:
> +	/* rmii, rgmii, sgmii */
>  	switch (bsp_priv->phy_iface) {
>  	case PHY_INTERFACE_MODE_RGMII:

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714191341.6909=
06-1-coiaprant@gmail.com?part=3D8
