Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1768C382361
	for <devicetree@vger.kernel.org>; Sat,  6 Jun 2026 12:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749710; cv=none; b=SIN2M4EJWs7UJKGrTM+JjBos7msqStrsPr0I+EYKbBxzhqqdQc31U8nYwqLlugKAZakDuLn1lHxb2nYi45u0Q0NfxyzN2tcVvj85/X4fAyHfVDYTdXAGxQrQVbEPWAJxEVdUooaq82yHf0mz36jQiFy3rrt5LehdVS7WmyLmQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749710; c=relaxed/simple;
	bh=7uTHJSbHxKrAPwMlxLfK2zyZNDMhnu3O3rl/4vTC6PE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GpjMsGHvjs6GdZKgp4KmOgmr3jXrxAa02EQ3yndfKyIw2EpHk52H773hIp8fhaX4KyNmdfgG/NbRI25qJq54gpP724AHTiTKOtxOsc67C9/6dKA7Ea14uPIc026IeqQwm7q7kjYSgcMs55gwbuNbRBbrLTb3pxyRk/f7KbsMcPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvfabHmc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvfabHmc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05431F00893;
	Sat,  6 Jun 2026 12:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780749709;
	bh=mtQoEMqR6BC5Obm2T5pGPmUizz+W1DhcmrRtnI0bAiY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=SvfabHmc+6F+7Rsb0+T1DSPpCfKAnvxRID8XuulFD1bVBTc/K3Vl3f9+qvTa4XNQr
	 xIIpnmfS/Gbwk9CiiqNbVKVYTQ1DkKoNDXLPL/PkQPcqx4GT9QlaSVMvHESbYTSzk+
	 I4AoYHnAYE+2bqcz9e1p1+cPgOS7cu9UwwT7PEfNtaBwsLW7fEk1AU5BqaVq4u+c4Y
	 vgsaysLsrJBB6G8F0njeJxM8PrD7QQ33wh2maqjDBzXq+Z8Vb52cAFrf/4wwumqWCf
	 nDMT9YQL70ImFT6cn6CpKZBdI5j4INVyY11II2C1EjqNQKDP5RdCLFG8Our8qDIZHA
	 s9CFftYiZezfg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
References: <20260605-ipq5018-gephy-clocks-v3-4-f232d9ca0966@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 12:41:48 +0000
Message-Id: <20260606124148.C05431F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] The driver misuses the internal `__clk_is_enabled()` API and inclu=
des `<linux/clk-provider.h>` to manage clock toggling, leading to reference=
 count underflows and unintentional shutdown of shared clocks.
- [High] Missing `.remove` callback leads to leaked clock enable counts whe=
n the PHY device is unbound.
- [Medium] Unbalanced resource release in the error path of TX clock enable=
ment causes reference underflows.
- [Medium] The driver asserts the hardware FIFO reset while the RX and TX c=
locks are disabled, failing to properly handle error paths and potentially =
leaving the hardware in an inconsistent state.
--

commit 8e9cea7912c0693c446ddb3571dbf181e88348f0
Author: George Moussalem <george.moussalem@outlook.com>

net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

This commit adds RX and TX clock management for the IPQ5018 PHY. It manages
the clocks based on link state changes to improve power efficiency.

> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 63726cf98cd42..99bc710531a48 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c
> @@ -19,6 +19,8 @@
>  #include <linux/regulator/consumer.h>
>  #include <linux/of.h>
>  #include <linux/phylink.h>
> +#include <linux/clk.h>
> +#include <linux/clk-provider.h>

[Severity: High]
Is it appropriate to include linux/clk-provider.h here? This appears to be
a layering violation just to access the internal __clk_is_enabled API.

>  #include <linux/reset.h>
>  #include <linux/phy_port.h>
>  #include <dt-bindings/net/qca-ar803x.h>
[ ... ]
> @@ -1062,6 +1066,35 @@ static int ipq5018_config_init(struct phy_device *=
phydev)
> =20
>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>  {
> +	struct ipq5018_priv *priv =3D phydev->priv;
> +	int ret;
> +
> +	if (phydev->link) {
> +		if (!__clk_is_enabled(priv->rx_clk)) {

[Severity: High]
Could checking __clk_is_enabled() cause a reference count underflow?

Since __clk_is_enabled() returns the global hardware state, it might return
true if the clock is shared or left enabled by the bootloader. If the driver
skips calling clk_prepare_enable() here, it fails to acquire its own
reference. Later on link-down, it might call clk_disable_unprepare() and
underflow the reference count.

> +			ret =3D clk_prepare_enable(priv->rx_clk);
> +			if (ret) {
> +				dev_err(&phydev->mdio.dev,
> +					"failed to enable RX clock\n");
> +				goto reset_fifo;
> +			}
> +		}
> +
> +		if (!__clk_is_enabled(priv->tx_clk)) {
> +			ret =3D clk_prepare_enable(priv->tx_clk);
> +			if (ret) {
> +				dev_err(&phydev->mdio.dev,
> +					"failed to enable TX clock\n");
> +				clk_disable_unprepare(priv->rx_clk);

[Severity: Medium]
Will this error path unconditionally drop a reference to the RX clock even
if the driver bypassed enabling it just above?

If rx_clk was already enabled in hardware, the driver didn't take a
reference, so this call to clk_disable_unprepare() could result in an
immediate clock reference count underflow.

> +			}
> +		}
> +	} else {
> +		if (__clk_is_enabled(priv->rx_clk))
> +			clk_disable_unprepare(priv->rx_clk);
> +		if (__clk_is_enabled(priv->tx_clk))
> +			clk_disable_unprepare(priv->tx_clk);
> +	}
> +
> +reset_fifo:
>  	/*
>  	 * Reset the FIFO buffer upon link disconnects to clear any residual da=
ta
>  	 * which may cause issues with the FIFO which it cannot recover from.
>  	 */
>  	mdiobus_modify_changed(phydev->mdio.bus, phydev->mdio.addr,
>  			       IPQ5018_PHY_FIFO_CONTROL, IPQ5018_PHY_FIFO_RESET,
>  			       phydev->link ? IPQ5018_PHY_FIFO_RESET : 0);

[Severity: Medium]
Can the hardware FIFO reset take effect if the underlying datapath clocks a=
re
not running?=20

During link down, the RX and TX clocks are disabled right before this
register write. Additionally, if clock enablement fails during link-up,
the driver jumps to reset_fifo and writes to the control register with the
clocks disabled, potentially leaving the hardware in an inconsistent state.

>  }
> =20
>  static int ipq5018_probe(struct phy_device *phydev)
>  {
>  	struct device *dev =3D &phydev->mdio.dev;
>  	struct ipq5018_priv *priv;
[ ... ]
> +	priv->rx_clk =3D devm_clk_get(dev, "rx");
> +	if (IS_ERR(priv->rx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
> +				     "failed to get RX clock\n");
> +
> +	priv->tx_clk =3D devm_clk_get(dev, "tx");
> +	if (IS_ERR(priv->tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
> +				     "failed to get TX clock\n");
> +
>  	priv->rst =3D devm_reset_control_array_get_exclusive(dev);
>  	if (IS_ERR(priv->rst))
>  		return dev_err_probe(dev, PTR_ERR(priv->rst),
>  				     "failed to acquire reset\n");
> =20
>  	ret =3D reset_control_reset(priv->rst);
>  	if (ret)
>  		return dev_err_probe(dev, ret, "failed to reset\n");
> =20
>  	phydev->priv =3D priv;
> =20
>  	return 0;
>  }

[Severity: High]
Does this driver leak clock enable counts on unbind?

The clocks are dynamically prepared and enabled during link changes, but
the PHY driver structure lacks a .remove callback to clean them up.
If the PHY device is forcefully unbound, generic phy_remove() clears the
state, and the devm framework drops the clock handles, but the hardware
enable counts are never decremented, permanently leaking the clocks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605-ipq5018-ge=
phy-clocks-v3-0-f232d9ca0966@outlook.com?part=3D4
