Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5FA42BC2C
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 14:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784556806; cv=none; b=sh/UT4mxLFppZoOIfJWGwNbbCgExL39c/V6wJZd5Pbajk7kpxG7oCr8yjoX8MRzD+3HyLAc8FrYRU3DTFasx5Us918+ZSkFj8uHOuKTSLEkEy2O49kP0klMLMlyHUUWR72b+2vyArPa47g1YmgbAboBfvhcDmHK0SxgoBRPnYF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784556806; c=relaxed/simple;
	bh=u2FKiiVbd6VN5sFs3ZrqO/a5eyrOOLGF/DnSY38Lj6k=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQ4peHojVkvATHhZtQURgQFRVMM182xq3i+3B6E2uwkN0t/GJIM7C/YIBLaloYyL5vPQeZL12jn5CJJs4QQUPuz3vPSRUm9N0cUuKAk5eqhDYlQgtAuLCg/uJdmCO75FIwlrQ080SN/Ibnin8pgOiDobRvofl3/P9NCUJb531Fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqOsEVG0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqOsEVG0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 124A31F000E9;
	Mon, 20 Jul 2026 14:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784556805;
	bh=GJucfKN46+sx2daqg/m0Y5Hzkr3stADaj+ArtzVeFko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aqOsEVG08J2syFm/MDVx4r8jf4HsN6/PO4Sk5CSGuKvGhXo4d/p9FtRuCpjfI/IqT
	 /iSviJaoP2DXEY4+SK7Iqxqe+nGt1H0QYXvbY8kULHKy5F37ILj1TPxsPE83xObZ7l
	 TDnKuEldxH3rtPycQ9W0IuH+HjUkoHtWJ+twYlF5BxhkSWK0nG5udzs5Kuxp5gGnLB
	 cRB/JhUwzIJIdkIHK1KX3efLT7yA5tcd9WS8xjwdrw5bC4kDFZxe7QEWOym2+XoZUU
	 zetkSjvE3pmUCoafLK7LmvcCKwx4ONgnPGS/0g3+yMaxmirlfqrG3KIDxYwPnyXaMM
	 MNsQOxfoFIrcQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 phy-next 8/8] phy: lynx-10g: use RCW override
 procedure for dynamic protocol change
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vladimir Oltean" <vladimir.oltean@nxp.com>
Cc: robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com
In-Reply-To: <20260720133642.136324-9-vladimir.oltean@nxp.com>
References: <20260720133642.136324-1-vladimir.oltean@nxp.com>
 <20260720133642.136324-9-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 14:13:24 +0000
Message-Id: <20260720141325.124A31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] An off-by-one error in the bounds check for `serdes_idx` within `f=
sl_guts_serdes_get_rcw_override` incorrectly rejects the final SerDes block=
 on the SoC.
- [High] Uninitialized lanes on `ls2088a` SerDes1 have their XGMII clock se=
lection bits blindly overwritten to GMII during RCW initialization.
--

--- Patch [8]: [PATCH v3 phy-next 8/8] phy: lynx-10g: use RCW override proc=
edure for dynamic protocol change ---
commit 7e0651dd0ae8f0fcd028d4877a54ccdb1dcfef2d
Author: Vladimir Oltean <vladimir.oltean@nxp.com>

phy: lynx-10g: use RCW override procedure for dynamic protocol change

Up until this patch, the only protocol change supported was between
1000Base-X/SGMII and 2500Base-X. The others require an RCW override
procedure which was lacking.

Since now the guts driver provides the means of applying this procedure,
make use of it and remove any comment which mentioned the limitation.

> diff --git a/drivers/phy/freescale/phy-fsl-lynx-10g.c b/drivers/phy/frees=
cale/phy-fsl-lynx-10g.c
> index 38def160ef1aa..5ece7889aed7b 100644
> --- a/drivers/phy/freescale/phy-fsl-lynx-10g.c
> +++ b/drivers/phy/freescale/phy-fsl-lynx-10g.c
[ ... ]
> @@ -1225,6 +1223,13 @@ static int lynx_10g_set_mode(struct phy *phy, enum=
 phy_mode mode, int submode)
>  	if (powered_up)
>  		lynx_10g_lane_halt(phy);
> =20
> +	if (lynx_10g_lane_mode_needs_rcw_override(lane, lane_mode)) {
> +		err =3D fsl_guts_lane_set_mode(priv->info->index, lane->id,
> +					     lane_mode);

[Severity: High]
This isn't a bug introduced by this patch, but does the underlying RCW over=
ride
procedure contain an off-by-one error that rejects the final SerDes block?

When this calls into fsl_guts_lane_set_mode(), it eventually hits a bounds
check in fsl_guts_serdes_get_rcw_override():

drivers/soc/fsl/guts.c:fsl_guts_serdes_get_rcw_override() {
    ...
    if (serdes_idx >=3D soc_data->num_serdes || serdes_idx <=3D 0)
        return -ERANGE;
    ...
}

Since serdes_idx is 1-based, and this uses >=3D instead of >, won't this
completely fail to apply the dynamic protocol change for any interface on
the last SerDes block (e.g. index 2 on SoCs with 2 SerDes blocks)?

[Severity: High]
This is a pre-existing issue, but does initializing the SerDes RCW
inadvertently corrupt unmanaged lanes on LS2088A?

When fsl_guts_lane_set_mode() is called for the first time on an LS2088A So=
C,
it triggers ls2088a_serdes_init_rcwcr() to build a new state for the RCW
utilizing soc.lanes_initialized:

drivers/soc/fsl/guts.c:ls2088a_serdes_init_rcwcr() {
    ...
    for_each_set_bit(i, &soc.lanes_initialized[serdes_idx - 1], MAX_NUM_LAN=
ES)
        if (lynx_lane_mode_uses_xgmii_mac(soc.lane_mode[serdes_idx - 1][i]))
            reg |=3D LS2088A_RCWSR30_SRDS_CLK_SEL_XGMII_Ln_S1(i);

    err =3D fsl_guts_rcw_rmw(29, reg,
                   LS2088A_RCWSR30_SRDS_CLK_EN_SEL_XGMII_S1 |
                   LS2088A_RCWSR30_SRDS_CLK_SEL_MSK);
    ...
}

Because the blanket mask LS2088A_RCWSR30_SRDS_CLK_SEL_MSK clears the bits
for all 8 lanes but only restores them for explicitly managed lanes, won't
unmanaged lanes (such as those used by DPDK or alternative firmware) have
their hardware protocol selection forced to 0 (GMII), potentially breaking
network connectivity?

> +		if (err)
> +			goto out;
> +	}
> +
>  	err =3D lynx_10g_lane_disable_pcvt(lane, lane->mode);
>  	if (err)
>  		goto out;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720133642.1363=
24-1-vladimir.oltean@nxp.com?part=3D8
