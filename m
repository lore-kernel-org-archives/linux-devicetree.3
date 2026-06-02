Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767C41DF73C
	for <devicetree@vger.kernel.org>; Tue,  2 Jun 2026 13:19:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780406364; cv=none; b=tgxHo9pYBnGNJ2W7mNEscBc5+xZ9FuV0LElL4RdPapH1PeqvfFANrD+uPDdjDioGdgy3E68JEbF65R/sAMORv6Z/d0WByqzLn4nwT/5AtH3sIHVXrad1uKPA268+ba+nnP7hbbkIT7rVQ3DBh48m4EwJqtdrRREj7kC7+GOXI3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780406364; c=relaxed/simple;
	bh=o3d1bHFw56gmF0ju75wNfx8s6SgffzgLZu0PLHaqi5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EP5p2yNqG8dHrTi5C6wXWt9bVxmWf17xPxL1MTQWtPYVBPtl1auOCjTPaSx9qy0W5juu5E+OkgQUflcifs8w1vpGd8wm8YMPrDKpE2njtn5V4T7AnmwP8UIGIMvf2iRST4DzPsCUItuIsgJ5d7e8jYidaSJBRMOJFJy4MiI4V5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aW5xJGjv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aW5xJGjv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBF3C1F0089A;
	Tue,  2 Jun 2026 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780406363;
	bh=qjKwJjnPjclKRv6ciOxVYAUR7Joywo8ZaUuK8ISG5ak=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aW5xJGjv6NM4hVwIp+YQKFXyvjr05UIJVY0HJCgOOaVXuwtxsiZtCEkIxNYoFXOOu
	 G1aQgdNtKsSy3xNEFDyGMyiZSZtjKliQPixzEEzbLWDmskRvEEj5VF0M4I3hXnIemc
	 IYFmpPtEABdap9aYXsX6oUfiUyAAnLeG80utQLZtqQ6lBOVoKQ4NGnIZ2Yg6bLJVpL
	 XVwlLs1Vkwe8M7KHQK53P3sSbyNXH4Nj3omcdjj+0zIxkpC3bVRIJKXkel3MRmcoFt
	 bQWFeCdYEOGbxuZvhJS4OI/eR7g3lvYulS7ZgArQjHJZOahU7UiK5IbqhOZlkv1C/W
	 yp40wQkRw0Idw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] net: phy: qca,at803x: add RX and TX clock
 management for IPQ5018 PHY
Reply-To: sashiko-reviews@lists.linux.dev
To: "George Moussalem via B4 Relay" <devnull+george.moussalem.outlook.com@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260601-ipq5018-gephy-clocks-v1-3-2df8287712c3@outlook.com>
References: <20260601-ipq5018-gephy-clocks-v1-3-2df8287712c3@outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 13:19:22 +0000
Message-Id: <20260602131922.DBF3C1F0089A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unbalanced clock reference counting causing CCF underflow warnings
--

commit 05a5fab6d0a0c9ba1c5e411c7e94bc9ff8040850
Author: George Moussalem <george.moussalem@outlook.com>

net: phy: qca,at803x: add RX and TX clock management for IPQ5018 PHY

This patch acquires and enables the RX and TX clocks for the IPQ5018
PHY datapath. It also gates these clocks upon link state changes to
improve power management.

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
> +	} else {
> +		clk_disable(priv->rx_clk);
> +		clk_disable(priv->tx_clk);
> +	}
> +

[Severity: High]
Will this lead to unbalanced clock reference counts and Common Clock
Framework (CCF) underflow warnings?

Because ipq5018_link_change_notify() is invoked on every PHY state
transition, it can be called multiple times consecutively while
phydev->link remains false (for example, transitioning from PHY_NOLINK
to PHY_HALTED). This would result in multiple calls to clk_disable()
without corresponding clk_enable() calls.

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
> +	if (IS_ERR(priv->rx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->rx_clk),
> +				     "failed to get and enable RX clock\n");
> +

[Severity: High]
If the driver unbinds while the link is down, won't the unconditional
cleanup registered by devm_clk_get_enabled() trigger another CCF
underflow warning?

The initial devm_clk_get_enabled() sets the enable count to 1. If the
link goes down, the count drops to 0. When devres cleans up on unbind,
it will attempt to disable the clock again. Should state tracking be
added, or should this use devm_clk_get() instead if the clock state
is going to be managed dynamically?

> +	priv->tx_clk =3D devm_clk_get_enabled(dev, "tx");
> +	if (IS_ERR(priv->tx_clk))
> +		return dev_err_probe(dev, PTR_ERR(priv->tx_clk),
> +				     "failed to get and enable TX clock\n");
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601-ipq5018-ge=
phy-clocks-v1-0-2df8287712c3@outlook.com?part=3D3
