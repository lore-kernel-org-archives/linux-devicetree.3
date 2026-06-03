Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE5A539C015
	for <devicetree@vger.kernel.org>; Wed,  3 Jun 2026 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780469462; cv=none; b=F93ghvyGd1KkbDcc5ECYPKbZA5kkc/oazv67cM4xBCxzIEy1ewMDww5mlObK505V8pY7Fgry1A8pQRIZHs28US2E8vZFoLfZBBN8TIPy7UiYLjmr5K3zBGs/ZmICBD8fm82t6psiiCG0YZi9/spenzNXEA1lSeQe5tvnHQYK8MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780469462; c=relaxed/simple;
	bh=7UgT4Y0Sg5i0XaY2iWMuD6e4dp2nTDdb/uWWVpkqeQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z05ZwlSYcCEeZBcTsAB0VNHzRrnStVO21tVFrtPx5P1IJTGD5bYhozQkTskjhdWq2viw0P9xXrXehAC8/gJMU0p20qMtV1nSYeqRplrUoOfyvaCvsZumZrajFowUT+R6UFIaQGWKxA1DW4Y6OPi3LdHd9h2+WRT/+H9OTrC8V2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ep3QBRIm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ep3QBRIm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B33F1F00899;
	Wed,  3 Jun 2026 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780469460;
	bh=uZslOKTrYrlb3vfYzwVIIYFSqOgwt3wl7RWrm4nXX9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ep3QBRImXYD/f5uP68xLUQhZ/gQbAgYDnSMcHCq0twyZ+y8+Q+OV1OBLM7ghRFR9P
	 HTlLeZkiiHzVhbz78HtHw0IXKODpCCGpzFK5fjv1g5orEjrDfDtbbj7ceCKRTR3X3n
	 syIs2d+V1bAEBT9HwSoOE0q/Zp8S45qbC5lMhZbtMnZuY/GwjnA6R9CuHq2hnOjoov
	 eVIPVbiaVs6BFZcdlsx1/dfbvqas3R+uuD+8GPt6uNOYXGJ3TyAgmEn7qJ/RFm46Os
	 BazFgG3u1DkObyaWCbeOOlsp7OeuKKiU3k/gnBoDBpMxX6u+LoTYWleb4LmsuOP+zo
	 De9siZZuI+Egg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/4] net: phy: at803x: add RX and TX clock management
 for IPQ5018 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
References: <20260602-ipq5018-gephy-clocks-v2-4-65a1f1d881f3@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 06:50:59 +0000
Message-Id: <20260603065100.5B33F1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mixing devm_clk_get_enabled() with manual clk_enable()/clk_disable=
() causes enable count imbalances, devres teardown conflicts, and fails to =
gate clocks.
- [Medium] Missing error check for clk_enable() calls.
--

commit b2bbbd0f6e2e237442a168520c225e85c25f2d4a
Author: George Moussalem <george.moussalem@outlook.com>

net: phy: at803x: add RX and TX clock management for IPQ5018 PHY

This commit adds RX and TX clock acquisition for the IPQ5018 PHY using
devm_clk_get_enabled(). It also attempts to manage power by manually toggli=
ng
these clocks in ipq5018_link_change_notify() based on the link state.

> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 63726cf98cd42..b7361a14220d8 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c

[ ... ]

> @@ -1062,6 +1065,16 @@ static int ipq5018_config_init(struct phy_device *=
phydev)
> =20
>  static void ipq5018_link_change_notify(struct phy_device *phydev)
>  {
> +	struct ipq5018_priv *priv =3D phydev->priv;
> +
> +	if (phydev->link) {
> +		clk_enable(priv->rx_clk);
> +		clk_enable(priv->tx_clk);

[Severity: Medium]
Should the return values of clk_enable() be checked here?

If clk_enable(priv->rx_clk) succeeds but clk_enable(priv->tx_clk) fails,
the hardware might be left in a partially enabled state without any logged
warning. Would it be better to explicitly rollback and disable the
previously enabled clocks if an error occurs to maintain a consistent state?

> +	} else {
> +		clk_disable(priv->rx_clk);
> +		clk_disable(priv->tx_clk);
> +	}
> +
>  	/*
>  	 * Reset the FIFO buffer upon link disconnects to clear any residual da=
ta
>  	 * which may cause issues with the FIFO which it cannot recover from.

[ ... ]

> @@ -1084,6 +1097,16 @@ static int ipq5018_probe(struct phy_device *phydev)
>  	priv->set_short_cable_dac =3D of_property_read_bool(dev->of_node,
>  							  "qcom,dac-preset-short-cable");
> =20
> +	priv->rx_clk =3D devm_clk_get_enabled(dev, "rx");

[Severity: High]
Does mixing devm_clk_get_enabled() with manual clk_enable() and clk_disable=
()
cause enable count imbalances?

Since devm_clk_get_enabled() establishes a base enable count of 1 and
registers an unconditional devres teardown action to call
clk_disable_unprepare(), manually toggling the clocks in
ipq5018_link_change_notify() could lead to a few unintended behaviors:

1. The count initializes to 1. If the link comes up, the count increases
   to 2. When the link goes down, it drops to 1. The hardware clocks are
   never actually gated since the count never reaches 0.

2. If the driver is unbound while the link is down (after a manual
   clk_disable()), devres will call clk_disable() again, dropping the
   enable_count below zero and triggering a kernel WARN.

3. If phy_stop() halts the PHY, it invokes the notify callback before
   phydev->link is cleared. If the link was up, clk_enable() is called
   again, inflating the count to 3. Devres cleanup will then only drop
   the count by 1, permanently leaking the clock reference.

Could this be resolved by using devm_clk_get() instead, and handling the
prepare/enable states directly?

> +	if (IS_ERR(priv->rx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
> +				     "failed to get and enable RX clock\n");
> +
> +	priv->tx_clk =3D devm_clk_get_enabled(dev, "tx");
> +	if (IS_ERR(priv->tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
> +				     "failed to get and enable TX clock\n");
> +
>  	priv->rst =3D devm_reset_control_array_get_exclusive(dev);

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602-ipq5018-ge=
phy-clocks-v2-0-65a1f1d881f3@outlook.com?part=3D4
