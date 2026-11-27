Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795743800;
	b=2KjAqcY7vHS7WjsfwV+pc/bjPUSp/OjgE0nH7Rf2kIpiNr2f+QFtQp48ev42jKa4fskH
	 Gbo6SBbBM6d9q2dblsWusg73Rm0VFtrd3ZHyDb85oupRc74UOiM6x/LasJNzKV7+9mFU4
	 XvcJ/lrsyo8d2h6J5lbYgrx979emzk3exp41cXkpDNs+zwJl6e6USNycBq55MThMK4UZW
	 EX6/IDVkmvAEJOKORXs0/RC6KJo/B1iJ8C8J/9KpxXA1aoSgMoLCg8TLdnCibPOZgzibT
	 nqwNPYSIbNBhiafBM43cIfb1aDzPL80TOjBovrvJjklxZPxLMfDHh6V9aPgMsRB7Iug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795743800;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=Y/ZQbh30QVryTCiZlteV2hYSBClLcTqEk7Mc1ddXGBE=;
	b=5GBS+OXvPwhW+C+WZJ0DEuCxwYorwBElBTBQivW3cKGEb0ab3UT1oCuF6bSNfyLEXDCT
	 f/XgtBBwT/OaPv+6z8Vannvwy8NBjYxugE3UN5BfHj8EBjZlmL5pny01ZNbm0HDCOGQ1N
	 G9iqQP8AG97Cxb7mb7MZ4bRdjtwJDHrnPs0pyi6w+PKBG3YrW1HusOb8gW8BwcKqYAKKp
	 6Efjjuw6zomEjJ86KddwdoLPZcL6FYwd2nSdhyM208Xrs7UfNX1WT1jXIhHlNnjK28fxz
	 eW1ixJx56z96zkuxDhbK/ujvDsu9FAcLeexCLJn+bblMOjMI6kNMHF42YBoxWTEnDbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9OOVRIm;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 335FD606A31E;
	Fri, 27 Nov 2026 01:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9OOVRIm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3A31F000C1;
	Fri, 27 Nov 2026 01:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795743799;
	bh=Y/ZQbh30QVryTCiZlteV2hYSBClLcTqEk7Mc1ddXGBE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=m9OOVRIm3/j5XNAoOLQcydd9DwOMZxWAAoo9RJWN88EJ7pZ9jO+AQgLoyWiA8WBKg
	 otKEKjIN0O9beYXaY8as7F/c4qESGjjgt7sJwXutVXu5i9eov03sbDdP50dxay26B4
	 aYaBF5MQ0fAhNp3nHUipV8QoCtofIPaBfcUMte7MklFIlNz9DaCL0ao4P0t3ZfIcpQ
	 1+SRJOo2uQoE/fBhQ+xNIW3mL9+NxsY8RJOW4u2G6CrfIhmo9uEw5Ed8G+AZx53bW2
	 VUHr8FU4AQ/GVMkmofn8fwkOrCaFTsgg4f7kYBfu2HNwuLm1aciOF/0xZ7xaQ2IrDE
	 7wR111cYEhnlA==
Subject: Re: [PATCH net-next v4 5/5] net: hix5hd2_gmac: Support fixed-link
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Fri, 27 Nov 2026 01:43:18 +0000
Message-ID: <179574379856.3135.451399791466560621@kernel.org>
In-Reply-To: <20261126005524.4156940-6-mmyangfl@gmail.com>
References: <20261126005524.4156940-6-mmyangfl@gmail.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] hix5hd2_dev_remove() in
  drivers/net/ethernet/hisilicon/hix5hd2_gmac.c still calls…
- [Medium] The commit message says phy-handle takes precedence over
  of_phy_is_fixed_link() (for managed = "in-band-status").

--

net: hix5hd2_gmac: Support fixed-link

This patch adds fixed-link support to hix5hd2_gmac. When the node has no
phy-handle, the driver now registers a fixed PHY from the MAC node. It
also skips MDIO bus registration for a fixed link unless an "mdio" child
node is present.

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index b3b2aa1b76988..eeb7221c0cde8 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c

[ ... ]

> +	bus = NULL;
>  	mdio_np = of_get_available_child_by_name(node, "mdio");
> -	ret = of_mdiobus_register(bus, mdio_np ?: node);
> +	if (mdio_np || (priv->phy_node != node &&
> +			!of_phy_is_fixed_link(node))) {

[Severity: Medium]
The commit message says:

    of_phy_is_fixed_link() also returns true for managed = "in-band-status";
    give phy-handle precedence over it, like fec and gianfar.

Does this condition keep that precedence for bus registration?

priv->phy_node == node only happens when the fixed-link branch ran, and
of_phy_is_fixed_link(node) is already true there. So the test reduces to
"mdio_np || !of_phy_is_fixed_link(node)".

of_phy_is_fixed_link() in drivers/net/mdio/of_mdio.c returns true for any
managed value other than "auto":

	err = of_property_read_string(np, "managed", &managed);
	if (err == 0 && strcmp(managed, "auto") != 0)
		return true;

Consider a node with phy-handle, managed = "in-band-status", and the PHY
as a direct child of the MAC node with no "mdio" subnode. The
hisilicon,hisi-gmac-v1.yaml binding only forbids direct PHY children
when fixed-link is present, so this layout is allowed.

For that node of_mdiobus_register() is never called, so the PHY is never
created. hix5hd2_net_open() then fails here:

	phy = of_phy_connect(dev, priv->phy_node,
			     &hix5hd2_adjust_link, 0, priv->phy_mode);
	if (!phy) {
		...
		return -ENODEV;

Before this patch the bus was always registered on mdio_np ?: node, and
this layout worked. This configuration also leaves priv->bus NULL, which
leads to the remove issue below.

Would "mdio_np || priv->phy_node != node" be the intended test here?

> +		bus = devm_mdiobus_alloc(dev);
> +		if (!bus) {
> +			ret = -ENOMEM;
> +			of_node_put(mdio_np);
> +			goto out_phy_node;
> +		}
> +
> +		bus->priv = priv;
> +		bus->name = "hix5hd2_mii_bus";
> +		bus->read = hix5hd2_mdio_read;
> +		bus->write = hix5hd2_mdio_write;
> +		bus->parent = &pdev->dev;
> +		snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii",
> +			 dev_name(&pdev->dev));
> +		priv->bus = bus;

[ ... ]

> @@ -1294,6 +1314,8 @@ static void hix5hd2_dev_remove(struct platform_device *pdev)
>  	if (HAS_CAP_TSO(priv->hw_cap))
>  		hix5hd2_destroy_sg_desc_queue(priv);
>  	hix5hd2_destroy_hw_desc_queue(priv);
> +	if (priv->phy_node == pdev->dev.of_node)
> +		of_phy_deregister_fixed_link(pdev->dev.of_node);
>  	of_node_put(priv->phy_node);
>  }

[Severity: High]
Can hix5hd2_dev_remove() dereference a NULL priv->bus now?

Just above this hunk, remove still does:

	unregister_netdev(ndev);
	cancel_work_sync(&priv->tx_timeout_task);
	mdiobus_unregister(priv->bus);

With this patch, hix5hd2_dev_probe() only allocates the bus and sets
priv->bus inside the new conditional block. Take the fixed-link case
this patch adds support for, with no phy-handle and no "mdio" child.
Probe succeeds and priv->bus stays NULL, because the private area from
devm_alloc_etherdev() is zeroed.

On unbind or rmmod, mdiobus_unregister() dereferences bus right away:

	if (WARN_ON_ONCE(bus->state != MDIOBUS_REGISTERED))
		return;

The probe error path gained an "if (bus)" check. Does remove need the
same check on priv->bus?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261126005524.4156940-1-mmyangfl%40gmail.com
