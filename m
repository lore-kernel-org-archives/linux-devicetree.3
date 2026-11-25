Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566497;
	b=QZF/kM9Ejdb7u40Z1sxWwIAKuouYfFFd+VUb+OaQXxieL75xKeHwl4Jdwwkt9Uukux3j
	 i45jxSQ55RknHy1Syq5Se0EUDWcz7G0QFDZwYkxMQSNE2FXnA5laeQqasqCjNPUrNi8Nv
	 UvkIXPKnnCmnEp5v6mrnB2w6P725k2Xr7K0puGJQ4Y0hy7EgqDQLvKH7lgWtDVdJiMF2y
	 le/xE0Xm984/dLH7xZHa436sMT9f3kpDv7h85uW0qQ9Bk8+GLXy8Q8+NXD/uaPF9smC5s
	 p9iWmeWJZ4QQf9wlTgAW8ywxyQFCvXaRD3V+SGTPqmOZcgr4SEMW8a0YHzhfKiHjQTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566497;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=4cYK1lEzGFvAYvDZ/avImi3mF1WEUIb3JoIJl5AZEJ4=;
	b=mSM58L586hZuPPm7wELbPezAvQC0ftTGZRmulyelBQjEmNANmttazuAENf10cYlnW20w
	 2oQad+g59DwEs2dkn+QeF22C3KjZdIWLjGwkzH/OOGoK9m63rmjsLfUD8QyHNs4pb0kfN
	 v22MMR3BmqkHjSsXYODUPexc0o88Y8Bgy9IbOQOcG6VYOxp6p8v6VGDjnZOr0MfyO73jB
	 rCLpN9F+3NirsgsO5D3UY5ptaDFDuYGKzTRHWH0fFarsAEvbYJMvzbZ5VrUEudNkyh7SG
	 r9aYktLFm9bqKiZw18T4ezGmnBJA8Fc9HvmmzFnOC2fsjrpU/aownziqmxSXH7YRGQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Bg76va/U";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FCE2606A31E;
	Wed, 25 Nov 2026 00:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Bg76va/U
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62B811F000C4;
	Wed, 25 Nov 2026 00:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795566497;
	bh=4cYK1lEzGFvAYvDZ/avImi3mF1WEUIb3JoIJl5AZEJ4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Bg76va/UXXf+7TnAoEKv76ySXVUwHA/njtFfkdkEXayn1Uw3hmPMk393MKQcN9l7z
	 5aXvOmh1eYNtyTYzOklkeOra795PEm/s7IEcwPdbjxSECyk/zHccrKQXuxGtxlNypk
	 J/rp10/mCpp/lA7/ioBRlTv17a27suzPIvxqRmKgxlFrd0lm3dHfXQjoQRl/6ZwnBs
	 /WQlXsy7lP+jLwIqs2b6CSTZczfQSIGW7bk5WulKfNl2U1lpNowCUDRlLtCJ+1n0nZ
	 A9nO/LseZIAZ+O5WCAe5Vb7TKG2jAxrP0nEaPTUszQx53F3ExImEM5Smv+bikN8fvQ
	 cvugdxjifom3A==
Subject: Re: [PATCH net-next v3 1/5] net: hix5hd2_gmac: Use devm_ managed
 netdev and MDIO bus
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Wed, 25 Nov 2026 00:28:15 +0000
Message-ID: <179556649591.3135.5859948318668585825@kernel.org>
In-Reply-To: <20261124002442.19414-2-mmyangfl@gmail.com>
References: <20261124002442.19414-2-mmyangfl@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] On a probe failure, the MDIO bus is now torn down after the MAC
  clocks are already off.

--

net: hix5hd2_gmac: Use devm_ managed netdev and MDIO bus

This commit switches hix5hd2_gmac to devm_alloc_etherdev(),
devm_mdiobus_alloc() and devm_of_mdiobus_register(). It drops the
manual free_netdev() and mdiobus_unregister()/mdiobus_free() calls from
the probe error path and from hix5hd2_dev_remove().

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index 12a5657653f85..d129aeceb641e 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c

[ ... ]

> @@ -1189,21 +1189,21 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
>  	priv->bus = bus;
>  
> -	ret = of_mdiobus_register(bus, node);
> +	ret = devm_of_mdiobus_register(dev, bus, node);
>  	if (ret)
> -		goto err_free_mdio;
> +		goto out_disable_clk;

[ ... ]

> @@ -1269,16 +1269,10 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  	hix5hd2_destroy_hw_desc_queue(priv);
>  out_phy_node:
>  	of_node_put(priv->phy_node);
> -err_mdiobus:
> -	mdiobus_unregister(bus);
> -err_free_mdio:
> -	mdiobus_free(bus);
>  out_disable_clk:
>  	clk_disable_unprepare(priv->mac_ifc_clk);
>  out_disable_mac_core_clk:
>  	clk_disable_unprepare(priv->mac_core_clk);
> -out_free_netdev:
> -	free_netdev(ndev);
>  
>  	return ret;
>  }

[Severity: Low]
Does this change when the MDIO bus is torn down, relative to the clocks,
if hix5hd2_dev_probe() fails?

Before this patch, a failure after of_mdiobus_register() ran
mdiobus_unregister() while mac_ifc_clk and mac_core_clk were still
enabled. Now the error path disables both clocks and returns. Devres then
runs devm_mdiobus_unregister() -> mdiobus_unregister() with the clocks
off.

These failures take that path:

- missing phy-mode or phy-handle
- platform_get_irq() errors, including -EPROBE_DEFER
- devm_request_irq() failure
- descriptor queue allocation failure
- register_netdev() failure

If the bus scan found a PHY and bound it to a driver, mdiobus_unregister()
calls phy_remove() through device_del(). phy_remove() can do MDIO I/O:

phy_remove()
    phy_leds_unregister()
        led_classdev_unregister()
            led_set_brightness(LED_OFF)
    phydev->drv->remove()

The LED_OFF write happens unless the DT sets retain-state-shutdown.

Those accesses go through hix5hd2_mdio_read() and hix5hd2_mdio_write().
Both poll the MAC register window in priv->base:

hix5hd2_mdio_wait_ready() {
    ...
	for (i = 0; readl_relaxed(base + MDIO_SINGLE_CMD) & MDIO_START; i++) {
		if (i == timeout)
			return -ETIMEDOUT;
		usleep_range(10, 20);
	}
    ...
}

With the MAC block unclocked, could these accesses time out (up to 10000
iterations per access)? Could they read a stale ready value and lose the
write, or stall the bus on some SoCs?

Before this patch, hix5hd2_dev_remove() already called
mdiobus_unregister() with the clocks off, because probe and ndo_stop
both disable them. The new ordering only affects the unwind after a
failed probe.

The same ordering is still there after the later patch in this series,
"net: hix5hd2_gmac: Support fixed-link". Its out_phy_node and
out_disable_clk labels disable the clocks while devres still holds the
registered bus.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124002442.19414-1-mmyangfl%40gmail.com
