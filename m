Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F4C94A8423
	for <devicetree@vger.kernel.org>; Wed,  2 Sep 2026 15:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788361483; cv=none; b=jmHvb9fQxrQrOf662Bam4hroX8naBQeImAU8IdY91HqcrBxDHdr7Llzznq/8W5sF5TeUa9CFMZSpL5b9YRt8esPli+oGhmKMOgHa19HcNf3JMrG4rR/ik1y74PV2QmxA7lzN/NOoolJllEWtrEKz6//IPOcR7Q+pxB7MZ9/Glc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788361483; c=relaxed/simple;
	bh=NYZX7j9II59+3qolyvvaNINXB0jUopvkCai+qyRJl7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pyM/EZpcy7wcgic4fTnJn8u5OI5uSi0RWPwRumWMoZpW2NbXDPm3as+FsJS3o2dH9nZcWr/FqE8x1r7mACo2EV6jXMm2oH4u3QFbMVK6pC4MIPX6rIJPnSzwaRqvGS1psNJRf1wgh7yT3cO7t2GyYkQW7Mlvf3n5iIKAln2AM0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J13Dph+H; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J13Dph+H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FE21F00A3E;
	Wed,  2 Sep 2026 15:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788361481;
	bh=EjHGe2+c+iiJIyioUKvKNEOLJIJmWsEN6lX8BJvp+4I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J13Dph+HXa5wrUilH/3Qy/UufluuyIOU9F2srH+U8YJtllTgGQTLugCKWzt1qWrB1
	 cQw9r1/o7FOCtQKiXlbQU6vn//oKuO/0BJnHdLdNT+6s7xAUpo/Lnn0Mc3tIZxmmi0
	 mR/tI/x7RqBEqNqh8skoGYXTYn3dS+SjtY+H6Un5EZfQegWhDvWkt0/aBF+a0wDxX7
	 RzkYfVpJWJl9+1OZkX+F8pCSiKInf1T3WbsfjatRpiAPZoT9qsfeM8vcLkzkhM9Dpv
	 MleFvYc51uxGSLckgnH1EDc42uAWeEvKdvrdVy1PHgdAvZLtBEoVRZU5Gf6mmsuXhj
	 0NAN1qbSpoNPg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 08/10] net: stmmac: dwmac-rk: add SGMII
 support for RK3568
Reply-To: sashiko-reviews@lists.linux.dev
To: "Coia Prant" <coiaprant@gmail.com>
Cc: vkoul@kernel.org, wsa+renesas@sang-engineering.com, robh@kernel.org, devicetree@vger.kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, conor+dt@kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260901150111.141037-9-coiaprant@gmail.com>
References: <20260901150111.141037-1-coiaprant@gmail.com>
 <20260901150111.141037-9-coiaprant@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 15:04:41 +0000
Message-Id: <20260902150441.71FE21F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Hardware initialization failure: The interface selection bits 4:6 =
are not cleared for SGMII mode, contradicting the commit message and leavin=
g the MAC in an invalid state.

Pre-existing issues:
- [High] Unhandled Error: pm_runtime_get_sync() return value is ignored, po=
tentially causing hardware access without proper resume.
--

commit 5a7c3b38ba957e74b26623c8e3e94e4c77b594de
Author: Coia Prant <coiaprant@gmail.com>

net: stmmac: dwmac-rk: add SGMII support for RK3568

This commit adds support for SGMII mode on the RK3568 SoC by providing the
necessary glue logic and XPCS configuration. It introduces callbacks to set
up the GMAC GRF register and handle PCS initialization, while also fixing
clock enable ordering in the powerup sequence.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%=
20Part1%20V1.1-20210301.pdf (Page 386)

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net=
/ethernet/stmicro/stmmac/dwmac-rk.c
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
[ ... ]
> @@ -851,18 +857,32 @@ static void rk3568_set_to_rgmii(struct rk_priv_data=
 *bsp_priv,
>  		     RK3568_GMAC_CLK_TX_DL_CFG(tx_delay));
> =20
>  	regmap_write(bsp_priv->grf, con1,
> +		     RK3568_GMAC_MODE_RMII_RGMII |
>  		     RK3568_GMAC_RXCLK_DLY_ENABLE |
>  		     RK3568_GMAC_TXCLK_DLY_ENABLE);
>  }
> =20
> +static void rk3568_set_to_sgmii(struct rk_priv_data *bsp_priv)
> +{
> +	u32 con1;
> +
> +	con1 =3D (bsp_priv->id =3D=3D 1) ? RK3568_GRF_GMAC1_CON1 :
> +				     RK3568_GRF_GMAC0_CON1;
> +
> +	regmap_write(bsp_priv->grf, con1, RK3568_GMAC_MODE_SGMII_QSGMII);
> +}

[Severity: High]
The commit message mentions "bit 7 set, interface selection bits 4:6 cleare=
d",
but this write only targets bit 7 using RK3568_GMAC_MODE_SGMII_QSGMII (which
is GRF_BIT(7)). Does this leave the interface selection bits 4:6 in their
previous state instead of clearing them? Could this cause the SGMII interfa=
ce
to fail to initialize properly?

[ ... ]
> @@ -1379,16 +1441,19 @@ static int rk_gmac_powerup(struct rk_priv_data *b=
sp_priv)
>  	if (ret)
>  		return ret;
> =20
> +	ret =3D gmac_clk_enable(bsp_priv, true);
> +	if (ret)
> +		return ret;
> +
> +	if (bsp_priv->phy_iface =3D=3D PHY_INTERFACE_MODE_SGMII)
> +		goto set_mode;

[Severity: High]
Because PHY_INTERFACE_MODE_SGMII takes this goto set_mode, it skips the
generic GRF interface selection mask configuration right below it. Since
rk3568_set_to_sgmii() also doesn't clear bits 4:6, is there anywhere that t=
he
clearing mask is actually applied for SGMII?

> +
>  	ret =3D rk_get_phy_intf_sel(bsp_priv->phy_iface);
>  	if (ret < 0)
> -		return ret;
> +		goto clk_disable;
> =20
>  	intf =3D ret;
> =20
[ ... ]
> @@ -1447,15 +1509,20 @@ static int rk_gmac_powerup(struct rk_priv_data *b=
sp_priv)
>  		if (bsp_priv->ops->set_to_rmii)
>  			bsp_priv->ops->set_to_rmii(bsp_priv);
>  		break;
> +	case PHY_INTERFACE_MODE_SGMII:
> +		dev_info(dev, "init for SGMII\n");
> +		if (bsp_priv->ops->set_to_sgmii)
> +			bsp_priv->ops->set_to_sgmii(bsp_priv);
> +		break;
>  	default:
>  		dev_err(dev, "NO interface defined!\n");
> +		ret =3D -EINVAL;
> +		goto clk_disable;
>  	}
> =20
>  	ret =3D rk_phy_powerup(bsp_priv);
> -	if (ret) {
> -		gmac_clk_enable(bsp_priv, false);
> -		return ret;
> -	}
> +	if (ret)
> +		goto clk_disable;
> =20
>  	pm_runtime_get_sync(dev);
> =20
> @@ -1463,6 +1530,10 @@ static int rk_gmac_powerup(struct rk_priv_data *bs=
p_priv)
>  		bsp_priv->ops->integrated_phy_powerup(bsp_priv);
> =20
>  	return 0;

[Severity: High]
This is a pre-existing issue, but the return value of pm_runtime_get_sync()
is ignored here. If the device power domain fails to resume, would the
subsequent integrated_phy_powerup() hardware access trigger a synchronous
external abort or cause silent data corruption?

> +
> +clk_disable:
> +	gmac_clk_enable(bsp_priv, false);
> +	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260901150111.1410=
37-1-coiaprant@gmail.com?part=3D8
