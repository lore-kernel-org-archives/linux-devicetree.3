Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428796;
	b=UtZLkQUOn/5YlQMqW28B+ofZ+BNTeZtppAV/K+jrFSH6cD/GBsxrRLugA8hG+dLvFqbd
	 1cffKQ0YnpfOOWtB8tOSRp3x5yt5Wi/bSRAU2Cz/fCkoL+aEGvQkzGzhp+jfX0AF626rG
	 TSL5Jo/nFT5Q5Jat+X12oWeDiafYvHb3E1Z+lg+uBoySL8/QCdBL76J6bg29Gbwy4IelG
	 HP26877eFzJLdSxX8vM6IIIuF1cVm1R+E/hhwAUDaqCPVec90zKQjxZJCywqL9tcKpjis
	 igZdWOhaS4KavdJ89+quz4bwCaPZv4pHRuqZUnsFb+qmpXyvR7Ls4OhygGBO3sHqRag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428796;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=+3u3YHjcbeHf6btn75vHawYuV1pEQVZUpBuy+G6atJk=;
	b=QtPxTx6DyPv+y9AO2zGayR58uxM6cLOGTTrTNCrAiT8heWYcwGVXUtbsgl5SE7b97Ro4
	 Fwzu+jkHEMuwS1h9oC8zMcWaL9EfxV/ap/28oOvaC/KNM8oIarbarBWdg1YESoTyiO5W+
	 J9YNWpexwesXDxJi+tmERn+hZA5xekTnvtS4cjaqPV+Kh4lwc7+XcKHeDYTLX+7tCM1k8
	 svy1k8HX8/RQf9wQpjT4F1Vr403V5vyVuytvAWng8xEEaTGI9do886FD0SzJuOH30MlDp
	 34dSQwC5om/NRz5XX7570FOyvuWilrdOGZ9FI5pJnovG+hEjEVQEqLcdt7+7uk9Po1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NSqXk3sg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF85606A32E;
	Mon, 23 Nov 2026 10:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NSqXk3sg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FEB01F000C4;
	Mon, 23 Nov 2026 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428796;
	bh=+3u3YHjcbeHf6btn75vHawYuV1pEQVZUpBuy+G6atJk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NSqXk3sgW2FKATPeYI0L05/qAFaxApwBKGMW6WVWWbgJrtwpzyN/IY2+5qHUNSlIH
	 ZvhmL+gzEUdA7HUYH3rdxTtY6XERpg4tPRh8V9hiSy6xet7r8Mu3cdl/WYYklhYosD
	 mZFMc7x7qJHIcRWe5yZCMxWVITbJMkhIhYDDaOZg0LAn/dLKwQheH+xKCF4pIbEhzW
	 JbSTh9RqroEO9E/X0Kgl4uvHwCudnhJJMRCMlTJ61nouS8CugTgfeUV+X7z7+D3G1t
	 jdXSKbOB3njzhaEaGLSiBL4ev3bnC1au+g0NndgZazbqDy0fN0eVrSeStqx785pAXA
	 nZzclL/JE/iuw==
Subject:
 Re: [PATCH net-next v7 3/7] net: ftgmac100: Add AST2700 compatible support
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:15 +0000
Message-ID: <179542879503.3135.9192959618986539421@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-3-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-3-33c8ca2d0dd7@aspeedtech.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 (1) · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The binding and the driver disagree on how an AST2700 PHY is
  wired up.
- [Low] At this revision AST2700 gets the 32-bit Aspeed handling and
  nothing more.
- [Low] Several driver comments that list which Aspeed generations share
  a behaviour were not updated when this patch put AST2700 in the…

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but this patch
  extends it to AST2700.

--

net: ftgmac100: Add AST2700 compatible support

This commit adds an FTGMAC100_AST2700 mac_id with matching match data,
and adds the "aspeed,ast2700-mac" compatible to the OF match table.
AST2700 gets the same Aspeed descriptor masks and is_aspeed handling
as AST2400/2500/2600.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 6d2fe5c2f3903..67b1fa464a421 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -37,7 +37,8 @@ enum ftgmac100_mac_id {
>  	FTGMAC100_FARADAY = 1,
>  	FTGMAC100_AST2400,
>  	FTGMAC100_AST2500,
> -	FTGMAC100_AST2600
> +	FTGMAC100_AST2600,
> +	FTGMAC100_AST2700
>  };

[Severity: Low]
This isn't a bug, but FTGMAC100_AST2700 now sits in the same class as
AST2600. Should the comments that list the Aspeed generations be updated
to match?

The rclk field in struct ftgmac100 still says:

	/* AST2500/AST2600 RMII ref clock gate */
	struct clk *rclk;

is_aspeed is now set for AST2700, so ftgmac100_setup_clk() fetches RCLK
for AST2700 as well.

The comment in ftgmac100_probe_dt() ("2600 has an independent MDIO
controller, not part of the MAC") and the one in ftgmac100_setup_mdio()
("The AST2600 has a separate MDIO controller") also apply to AST2700 now,
but neither mentions it.

These comments are still unchanged at the end of the series.

[ ... ]

> @@ -2017,7 +2018,8 @@ static int ftgmac100_probe(struct platform_device *pdev)
>  
>  	if (priv->mac_id == FTGMAC100_AST2400 ||
>  	    priv->mac_id == FTGMAC100_AST2500 ||
> -	    priv->mac_id == FTGMAC100_AST2600) {
> +	    priv->mac_id == FTGMAC100_AST2600 ||
> +	    priv->mac_id == FTGMAC100_AST2700) {
>  		priv->rxdes0_edorr_mask = BIT(30);
>  		priv->txdes0_edotr_mask = BIT(30);
>  		priv->is_aspeed = true;

[Severity: High]
This is a pre-existing issue that was not introduced by this patch, but
setting is_aspeed for AST2700 carries it over to the new compatible.

ftgmac100_reset_and_config_mac() dereferences phydev without checking
for NULL:

	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {

ftgmac100_probe_dt() can return 0 with no PHY attached. This happens
when the node has no use-ncsi, no fixed-link and no phy-handle, but does
have an mdio child:

	if (!ftgmac100_has_child_node(np, "mdio")) {
		...
		err = ftgmac100_mii_probe(netdev);
		...
	}

	return 0;

In that case register_netdev() succeeds with netdev->phydev == NULL, and
the first open runs:

ftgmac100_open()
  ftgmac100_reset_and_config_mac()
    priv->netdev->phydev->interface

ftgmac100_open(), ftgmac100_stop() and ftgmac100_phy_disconnect() all
check netdev->phydev for NULL already. So a NULL phydev after probe
seems to be an expected state.

The binding accepts such a node, since an mdio child is allowed and
phy-handle is optional.

Can this oops in ndo_open, with rtnl held, for an AST2700 node like this?

There is also a later patch in the series, "net: ftgmac100: Enable
AST2700 RMII support". It says that ftgmac100_probe_dt() always attaches
a phy_device before register_netdev() can succeed, and it adds another
unguarded phydev->interface dereference in ftgmac100_start_hw(). Does
that assumption still hold given the path above?

[ ... ]

> @@ -2131,6 +2133,10 @@ static const struct ftgmac100_match_data ftgmac100_match_data_ast2600 = {
>  	.mac_id = FTGMAC100_AST2600
>  };
>  
> +static const struct ftgmac100_match_data ftgmac100_match_data_ast2700 = {
> +	.mac_id = FTGMAC100_AST2700
> +};
> +

[Severity: Low]
At this revision AST2700 only gets the 32-bit Aspeed handling. The
driver never calls dma_set_mask*(). ftgmac100_init_hw() writes only the
low 32 bits of the ring bases:

	iowrite32(priv->rxdes_dma, priv->base + FTGMAC100_OFFSET_RXR_BADR);

ftgmac100_alloc_rx_buf() also keeps only the low 32 bits in the
descriptor:

	rxdes->rxdes3 = cpu_to_le32(map);

AST2700 DRAM starts at 0x400000000 (memory@400000000 in
ast2700-evb.dts). Would the MAC be able to DMA at all on AST2700 at this
point in the series?

A later patch in the series, "net: ftgmac100: Add AST2700 upper DMA
address support", seems to fix this. It adds FTGMAC100_QUIRK_DMA_35BIT,
the 35-bit DMA mask, the high ring base registers and the descriptor
high address bits.

The Kconfig dependencies also prevent building the driver for arm64
until "net: ftgmac100: Allow building on ARM64":

	depends on ARM || COMPILE_TEST
	depends on !64BIT || BROKEN

So this state probably can't be reached on real hardware during
bisection. Would it still make sense to wire up the compatible after the
DMA support lands in the series?

>  static const struct ftgmac100_match_data ftgmac100_match_data_faraday = {
>  	.mac_id = FTGMAC100_FARADAY
>  };
> @@ -2142,6 +2148,8 @@ static const struct of_device_id ftgmac100_of_match[] = {
>  	  .data = &ftgmac100_match_data_ast2500 },
>  	{ .compatible = "aspeed,ast2600-mac",
>  	  .data = &ftgmac100_match_data_ast2600 },
> +	{ .compatible = "aspeed,ast2700-mac",
> +	  .data = &ftgmac100_match_data_ast2700 },

[Severity: Medium]
Do the binding and the driver agree on how an AST2700 PHY gets
connected?

ftgmac100_probe() only calls ftgmac100_setup_mdio() for FARADAY, AST2400
and AST2500. For AST2700, priv->mii_bus is therefore always NULL:

	if (priv->mac_id == FTGMAC100_FARADAY ||
	    priv->mac_id == FTGMAC100_AST2400 ||
	    priv->mac_id == FTGMAC100_AST2500) {
		err = ftgmac100_setup_mdio(netdev);

This means a non-NC-SI AST2700 node only probes successfully if it has
phy-handle or fixed-link. Otherwise one of two things happens.

Without an mdio child, ftgmac100_probe_dt() calls ftgmac100_mii_probe(),
which always fails here:

	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}

With an mdio child, ftgmac100_probe_dt() returns 0 with no PHY attached.
That leads to the NULL phydev dereference described above.

At the end of the series, faraday,ftgmac100.yaml only requires one of
phy-mode or use-ncsi for aspeed,ast2700-mac. It leaves phy-handle
optional and allows an mdio child. So a node such as
compatible = "aspeed,ast2700-mac"; phy-mode = "rgmii"; passes
dt_binding_check, but then either fails to probe or binds with no PHY.

The binding patch justifies the phy-mode requirement by pointing at the
AST2700 phy-mode check in ftgmac100_mii_probe(). That check is added by
"net: ftgmac100: Require phy-mode for AST2700", and it sits after the
!priv->mii_bus guard, which always returns -ENODEV for AST2700. Can that
check ever run?

On the phy-handle/fixed-link path, of_phy_get_and_connect() already
returns NULL when of_get_phy_mode() fails.

Should the binding require phy-handle or fixed-link for AST2700 when
use-ncsi is absent?

>  	{ .compatible = "faraday,ftgmac100",
>  	  .data = &ftgmac100_match_data_faraday },
>  	{ }

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com
