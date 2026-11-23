Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795474976;
	b=cbFZ6TpW7rJBcR0Ui4C4EIad5sXCBM1Sh975UG6IPcx6wp8bPGW5YZ9XsY3C7D3Lzlwi
	 fTo9t60XIsNFlbGnTVTf9khCbWYolCPxjGyK8XP9cmWL9TwLTc4dpJGkSQmf4C0CRHt8h
	 ocEe0OAZcJkZfqJb5+NMCaawBrpYvtsLzkuuUSaw9yeQeW6PVbu+6qyQEY1cmXEK5/8hm
	 Oc+JLHuFY1W5PnCPkshLriShSHofpsOP/8QggNwFu2pSR/6DLZbCw7cFzasW+wQzL+w7F
	 ION8lr6NR8k4KL7H3fdN0oUo3Bz2t8ZVmZZI0CDxw3klBA8tY1bUiCKnsdr7gQzS8hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795474976;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=FInmTlBBCijcidrB7kILO5RuU05i+OIdvD0BtPtPq/s=;
	b=ODJBSjexS80re/TY7i1385vWus43tNlM/H+4BVJQ3nZypUmNZmqPMyVtJq1Ywbl9vNmz
	 1oj6N4tpovAo5rVpJJMydeZSFifh+Y+qfeBAs9tpLvxm8CgFLjWhSPRaqPIv43FlWDyxd
	 bnXRCUqT5ixewgsbgAFTRhG8t3+cdwlBnlexM0Q7mC+2AEgM77VUBvIC51jmd696lKLxJ
	 9yt+VkUObGADMyzl7B+TYGtlJUtVhFPvsvD+qckAV/grwHX2XNkPtpSzidPrBigmvFQTL
	 RNXRyXIrY4v2IIkq4MWpwhkB/brcZOGIsobfGKQky5b/R7DmPfgBMKqgZ2/hFPoufqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NU91a9hh;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7D2606A31E;
	Mon, 23 Nov 2026 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NU91a9hh
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3FC1F000CA;
	Mon, 23 Nov 2026 23:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795474975;
	bh=FInmTlBBCijcidrB7kILO5RuU05i+OIdvD0BtPtPq/s=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=NU91a9hhn63oTiYUAPjPGFF9+yK2JqPYxw/ALPef7cC3xiAgjdPmHgNS6PzTZ3IOe
	 oNA4OC8viaH7nEp4QPIqjj7fPhpxEte29OuZuC1hLGHAlTBIPWUL6yb9xkFiwkiHOF
	 s8uKnU+KA4iEm59YAvaYBkIFWg4hmwRYG1PJmkzzo8sf2HY6wOnVCXv22TarcRmw8T
	 FVnTGf6IELtxwsR4q84k0oxjNld+yvgJeU3AOFDZFCu7UWS/M6iIHu1/PH3+Kk3LNz
	 +ksoqqtMDtQBnDkQO082uV55EBmrjK1oFnYS+kVeRtHkJM5MIxlQ3MdqFNeDND57cf
	 Hes9rTwca5vzw==
Subject: Re: [PATCH net-next v2 2/2] net: hix5hd2_gmac: support fixed-link and
 mdio child
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Mon, 23 Nov 2026 23:02:54 +0000
Message-ID: <179547497461.3135.10844552053295953627@kernel.org>
In-Reply-To: <20261122230134.3366017-3-mmyangfl@gmail.com>
References: <20261122230134.3366017-3-mmyangfl@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In hix5hd2_dev_probe()
  (drivers/net/ethernet/hisilicon/hix5hd2_gmac.c), the MDIO bus is now…
- [Low] hix5hd2_dev_probe() now uses of_phy_is_fixed_link(node) to choose
  between the fixed-link path and the phy-handle path, and also to…

--

net: hix5hd2_gmac: support fixed-link and mdio child

This commit adds fixed-link support to hix5hd2_gmac. With it, the MAC can
probe when it is wired directly to another MAC with no PHY. It also
registers the MDIO bus on an "mdio" child node when one is present. When
the MAC node has a fixed-link and no mdio child, it skips the MDIO bus
entirely.

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index 12a5657653f85..9a2a3fa1455fb 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c

[ ... ]

> @@ -1175,23 +1176,35 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  		hix5hd2_phy_reset(priv);
>  	}
>  

[ ... ]

> +	bus = NULL;
> +	mdio_np = of_get_child_by_name(node, "mdio");
> +	if (mdio_np || !of_phy_is_fixed_link(node)) {
> +		bus = mdiobus_alloc();
> +		if (!bus) {
> +			ret = -ENOMEM;
> +			of_node_put(mdio_np);
> +			goto out_disable_clk;
> +		}

[Severity: Medium]
In hix5hd2_dev_probe(), if the MAC node has a fixed-link but no "mdio"
child, this condition is false. mdiobus_alloc() and of_mdiobus_register()
are never called, and bus and priv->bus stay NULL.

Are MDIO devices described as direct children of the MAC node then
silently ignored?

The binding from the preceding patch ("dt-bindings: net:
hisilicon,hisi-gmac-v1: allow fixed-link and mdio child") still says this
for the mdio property:

    Node containing PHY children. If this node is not present, then PHYs
    will be direct children.

The binding also still references mdio.yaml at the MAC node level. So a
fixed-link node with direct <name>@<addr> MDIO children looks
binding-valid. Examples would be a PHY used by another MAC, or a switch
managed over this GMAC's MDIO lines. In that case nothing is probed and
no warning is printed.

Separately, the commit message says:

    Register the bus based on if the PHY attached to a given interface is
    described in the device tree or not, like commit ef8a2e27289e ("net:
    macb: fix probing of PHY not described in the dt").

Is that accurate? macb_mdiobus_register() always registers the bus. It
only chooses between DT-based and scan-based registration:

drivers/net/ethernet/cadence/macb_main.c:macb_mdiobus_register() {
    ...
	for_each_available_child_of_node(np, child)
		if (of_mdiobus_child_is_phy(child)) {
			of_node_put(child);
			return of_mdiobus_register(bp->mii_bus, np);
		}

	return mdiobus_register(bp->mii_bus);
}

Also, of_mdiobus_child_is_phy() returns true for any child that has no
compatible property:

drivers/net/mdio/of_mdio.c:of_mdiobus_child_is_phy() {
    ...
	if (!of_property_present(child, "compatible"))
		return true;
    ...
}

Under the macb logic, the fixed-link subnode would therefore still count
as a PHY. of_mdiobus_register(np) would still run and print the "scan phy
fixed-link at address X" messages.

The code here takes a different approach: it registers no bus at all for
fixed-link. Could the commit message describe what the code does instead?

The commit message also doesn't mention that an "mdio" child is now used
as the bus node. Before this patch it was scanned as a reg-less PHY
candidate of the MAC node.

[ ... ]

> @@ -1199,11 +1212,18 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  		goto err_mdiobus;
>  	}
>  
> -	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
> -	if (!priv->phy_node) {
> -		netdev_err(ndev, "not find phy-handle\n");
> -		ret = -EINVAL;
> -		goto err_mdiobus;
> +	if (of_phy_is_fixed_link(node)) {
> +		ret = of_phy_register_fixed_link(node);
> +		if (ret < 0)
> +			goto err_mdiobus;
> +		priv->phy_node = of_node_get(node);
> +	} else {
> +		priv->phy_node = of_parse_phandle(node, "phy-handle", 0);

[Severity: Low]
of_phy_is_fixed_link() also returns true when the node sets managed to
anything other than "auto". This happens even with no fixed-link property
or subnode:

drivers/net/mdio/of_mdio.c:of_phy_is_fixed_link() {
    ...
	err = of_property_read_string(np, "managed", &managed);
	if (err == 0 && strcmp(managed, "auto") != 0)
		return true;
    ...
}

What happens to a node with managed = "in-band-status", a phy-handle and
no mdio child? Before this patch the driver ignored managed and connected
the real PHY through phy-handle.

After this patch:

- no MDIO bus is registered, because of the bus condition above
- phy-handle is never parsed
- of_phy_register_fixed_link() takes the in-band-status path:

drivers/net/mdio/of_mdio.c:of_phy_register_fixed_link() {
    ...
	if (of_property_read_string(np, "managed", &managed) == 0 &&
	    strcmp(managed, "in-band-status") == 0) {
		/* status is zeroed, namely its .link member */
		goto register_phy;
	}
    ...
}

hix5hd2 has no PCS or in-band status handling, so nothing ever sets the
fixed PHY's link. Would the interface stay link-down permanently?

The binding from this series only drops the phy-handle requirement when
fixed-link is present:

  - if:
      not:
        required:
          - fixed-link
    then:
      required:
        - phy-handle

So the binding still treats such a node as a phy-handle configuration.

No in-tree hix5hd2 DTS uses managed, and of_phy_get_and_connect() uses the
same precedence. The commit message doesn't mention this behaviour change,
though.

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261122230134.3366017-1-mmyangfl%40gmail.com
