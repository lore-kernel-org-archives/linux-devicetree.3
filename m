Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA0A37F00F
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 09:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612389; cv=none; b=gmLxAA2aznb6J8rcQHAMLEwpXG50mkDrzvVIapTR1qWhbzT4kqlgbHkprDY66GAPg9hyNAoYTMQVz3QBz+dJ1wRNPMqoRC5X7qQAynyoLMYe8N6saLwqkivvf9ON3Lb1PYQko8I22zmgEzsweieVZXxI34mIykATBOC1bTfgxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612389; c=relaxed/simple;
	bh=XKUBxpsCek/wzbuP6mLWX2fvV53KOXuXzvzt2nX7IS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yx1z/TuB0rxtM0gzrBv6kRB0GQSrHJpsSbXZLzPGY1VPaZNvrZmeGIQjkaGEpdbNQNldvwMs6oCkauq0BhTK3v0bU0R2wxLJkiiSW85ysHmDBl6HVaZHC3w887bF6Uk2XfY7jdFZASE8uJ+aF8zwj4YVpO/kYDsDXO5bJIkQGSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEJZIqnN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEJZIqnN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD5A51F00A3A;
	Thu, 13 Aug 2026 09:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786612386;
	bh=EZn5LzzGjDsPsMzufMOnFtrS5aXRZMHmbVs0YbN17wY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EEJZIqnNZVGp6Hk5mTHUhrOpHnB57AXHRQZ5xLxHBFjUFBzTO3eXSqU+jq9jtYbGj
	 pTm7vcgXKNq/7FNWiLKn2goxCqkBKelmDn2X6VxNA8n6iunl69pRpJRBRa65ruS6Zq
	 fYbfoyvelalHIx1I3xiyQyonRoALhTUNG9pNhVM29B1yoQqVlOd5EUeha65R2KUki6
	 ACkOiojGUDnUt8CLCpp8IaPyv/R+7A7/Bx1rd9lj7AKsi746ABvfKSaiHCu3wH1KE1
	 mnQeh/oXhQsuAveyMke0JkY3Rb+15FIiRTfUtsw19OM3tJI8+4y+egAdPfmzSNilmF
	 sI/aXItt+3/Wg==
From: sashiko-bot@kernel.org
Subject: Re: [net-next,PATCH v2 2/5] net: ethernet: stmmac: stm32: support
 the phy-supply regulator binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Christophe Roullier" <christophe.roullier@foss.st.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260812091122.566439-3-christophe.roullier@foss.st.com>
References: <20260812091122.566439-1-christophe.roullier@foss.st.com>
 <20260812091122.566439-3-christophe.roullier@foss.st.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 09:13:05 +0000
Message-Id: <20260813091305.CD5A51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] `phy_power_on()` unconditionally returns 0, masking regulator er=
rors, creating dead code, and causing unbalanced disables.
- [Medium] `stm32mp1_suspend` fails to restore the PHY power state if `clk_=
prepare_enable` fails, leaving the device in an inconsistent state.
- [Medium] `stm32_dwmac_parse_data()` improperly masks real errors from `de=
vm_regulator_get_optional()`, treating them as missing regulators.
--

--- Patch [2]: [net-next,PATCH v2 2/5] net: ethernet: stmmac: stm32: suppor=
t the phy-supply regulator binding ---
commit 82bd267f7e4d9d57647e83b70366ec6a5796b345
Author: Christophe Roullier <christophe.roullier@foss.st.com>

net: ethernet: stmmac: stm32: support the phy-supply regulator binding

Configure the phy regulator if defined by the "phy-supply" DT phandle.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/=
net/ethernet/stmicro/stmmac/dwmac-stm32.c
> index e1b260ed4790b..4597f605ec1bb 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c

[ ... ]

> @@ -423,6 +425,16 @@ static int stm32_dwmac_parse_data(struct stm32_dwmac=
 *dwmac,
>  	if (IS_ERR(dwmac->regmap))
>  		return PTR_ERR(dwmac->regmap);
> =20
> +	dwmac->regulator =3D devm_regulator_get_optional(dev, "phy");
> +	if (IS_ERR(dwmac->regulator)) {
> +		if (PTR_ERR(dwmac->regulator) =3D=3D -EPROBE_DEFER) {
> +			dev_dbg(dev, "phy regulator is not available yet, deferred probing\n"=
);
> +			return -EPROBE_DEFER;
> +		}
> +		dev_dbg(dev, "no regulator found\n");
> +		dwmac->regulator =3D NULL;
> +	}
> +

[Severity: Medium]
Should this code propagate legitimate errors other than -EPROBE_DEFER and
-ENODEV?

The devm_regulator_get_optional() function returns -ENODEV if the regulator
is absent, but it can also return real errors like -ENOMEM or -EINVAL. By
treating all other errors as "no regulator found" and setting the regulator
to NULL, couldn't this hide actual initialization failures?

>  	if (dwmac->ops->is_mp2)
>  		return 0;

[ ... ]

> @@ -522,6 +534,27 @@ static int stm32_dwmac_resume(struct device *dev, vo=
id *bsp_priv)
>  	return stm32_dwmac_init(priv->plat);
>  }
> =20
> +static int phy_power_on(struct stm32_dwmac *bsp_priv, bool enable)
> +{
> +	int ret;
> +	struct device *dev =3D bsp_priv->dev;
> +
> +	if (!bsp_priv->regulator)
> +		return 0;
> +
> +	if (enable) {
> +		ret =3D regulator_enable(bsp_priv->regulator);
> +		if (ret)
> +			dev_err(dev, "fail to enable phy-supply\n");
> +	} else {
> +		ret =3D regulator_disable(bsp_priv->regulator);
> +		if (ret)
> +			dev_err(dev, "fail to disable phy-supply\n");
> +	}
> +
> +	return 0;
> +}
> +

[Severity: Medium]
Should this function return ret instead of unconditionally returning 0?

Because it always returns 0, the caller stm32_dwmac_probe() can never see
an error, rendering its if (ret) check dead code. Furthermore, if
regulator_enable() fails, the probe will continue with an unpowered PHY,
and the teardown path might later attempt to disable a regulator that was
never successfully enabled.

[ ... ]

> @@ -614,16 +653,26 @@ static void stm32_dwmac_remove(struct platform_devi=
ce *pdev)
>  		dev_pm_clear_wake_irq(&pdev->dev);
>  		device_init_wakeup(&pdev->dev, false);
>  	}
> +
> +	phy_power_on(priv->plat->bsp_priv, false);
>  }
> =20
>  static int stm32mp1_suspend(struct stm32_dwmac *dwmac)
>  {
> +	/* Keep the PHY up if we use Wake-on-Lan. */
> +	if (!device_may_wakeup(dwmac->dev))
> +		phy_power_on(dwmac, false);
> +
>  	return clk_prepare_enable(dwmac->clk_ethstp);
>  }

[Severity: Medium]
Is there a missing rollback path here if clk_prepare_enable() fails?

If the clock enablement fails, the system suspend is aborted and the PM
core will not call the driver's resume callback. Since the PHY was already
powered off above, wouldn't this leave the device in an inconsistent,
non-functional state with an unpowered PHY?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812091122.5664=
39-1-christophe.roullier@foss.st.com?part=3D2
