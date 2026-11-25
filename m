Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566498;
	b=ycfPFSZzLfNFciXqkSKR64GrvigIW1AvpEyV/YiuMLjk7edpb9rCJ7RuZ8iMaq4U1s9D
	 osFnLZ3oyZOFhak1bFpPfAtb52EGXwsziH/XBJP0A5Cc9HCC+D4Ey4dxVg2aOkBEMFf8Y
	 b4TsExKNYt6s/ie7sMNpSvhaP6EIFhXXxoASO/nCXsQxRMsHrf67i3wfzsUtFyHg83E+i
	 jWsA7OiFiUb2brG4MMaUfX9r+/HLOYkJ7T6to5kedGFxJlZIZpkm6yuXXZ/ri8nrGbqKv
	 0Z2skxj0OQVEFLzx2pnvsoJ3fMOMKFrWBUMPGnBf1TnhU4ebec37/w5fmoS37eLYUDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566498;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=5a10cI1NNFwvgv0ajxBZX9RkTJkKO0tcJCd7rfmnHMM=;
	b=ZZetLd8cKc6RdaG1MPGcBTnxEAGeQd6hpQwTEQSTO5HQC9gppKjtz34skCYUD7DJI+v2
	 fuqcq+/MAPnJE2NDeTHbBG8cRiwguyUEGxM1vPRWre2H6LQ+Kk2v1EkDbVmsETMnfhgP/
	 AHxF7NuNnRDBgMT47Eov1yyLhWPlnqS4KfiU8msU20e10LBlQjPdsPfxiCy5Ueh7QMKfT
	 CT3IX3gPsr8pzzDFQ1t4Sr8Aj6tAaw5iFA9UN/KpLmjQbci5kD+2UMacMoljcS7vQGNIi
	 dGl093Y1QALXC8RBTBG3QiM4VbkIAHnroNUrWqgzeY3HEKUbHZGRSbmEBkkvraM4vhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knB6QgT4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E09606A323;
	Wed, 25 Nov 2026 00:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=knB6QgT4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C05C81F000C6;
	Wed, 25 Nov 2026 00:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795566498;
	bh=5a10cI1NNFwvgv0ajxBZX9RkTJkKO0tcJCd7rfmnHMM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=knB6QgT4a1UZ0lm/BWaHGvQeRHbHE/envNasEl94wwCI9cA6HF4Wfa2l3x+ou8gaS
	 scckdpSImxoAi/FbBzOzmGYcVu2qrNUpPq+6R/w6xRoagvqBeLUp/N2xUD8nrgHLNd
	 8rXk7j7JVAmzM6gRtptuXpjilJbyGfPwkybG3Av3tC+J0rloZDHQhlEYMYHvYN01Gp
	 QbkSM/7sLVIh+T0/x2dvyIaeCPMIEZvVFlJ30REfLu30ypl/8NjwQEczswll0Lh7mQ
	 4gdudGFq1ggcOHAOiSB2xnA14YBAYlGkZ9q1QQFSShJzCiU4BEqEhW8R/q3XOvL06S
	 WaNIxs/TtOXPQ==
Subject: Re: [PATCH net-next v3 3/5] net: hix5hd2_gmac: Use mdio child node
 for MDIO bus if it exists
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Wed, 25 Nov 2026 00:28:17 +0000
Message-ID: <179556649734.3135.14403923700572284098@kernel.org>
In-Reply-To: <20261124002442.19414-4-mmyangfl@gmail.com>
References: <20261124002442.19414-4-mmyangfl@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In hix5hd2_dev_probe()
  (drivers/net/ethernet/hisilicon/hix5hd2_gmac.c), the patch finds the…

--

net: hix5hd2_gmac: Use mdio child node for MDIO bus if it exists

This commit makes hix5hd2_dev_probe() look for an "mdio" child of the MAC
node. If one exists, the MDIO bus is registered against that child instead
of the MAC node itself, following the earlier macb change.

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index d129aeceb641e..a176870079e96 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c

[ ... ]

> @@ -1189,7 +1190,9 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  	snprintf(bus->id, MII_BUS_ID_SIZE, "%s-mii", dev_name(&pdev->dev));
>  	priv->bus = bus;
>  
> -	ret = devm_of_mdiobus_register(dev, bus, node);
> +	mdio_np = of_get_child_by_name(node, "mdio");
> +	ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
> +	of_node_put(mdio_np);
>  	if (ret)
>  		goto out_disable_clk;

[Severity: Medium]
What happens here when the mdio child exists but has status = "disabled"?

of_get_child_by_name() ignores the status property. In that case mdio_np
is non-NULL and the disabled node is passed to devm_of_mdiobus_register().
__of_mdiobus_register() then rejects it:

drivers/net/mdio/of_mdio.c:__of_mdiobus_register() {
    ...
	/* Do not continue if the node is disabled */
	if (!of_device_is_available(np))
		return -ENODEV;
    ...
}

The -ENODEV goes back through the goto out_disable_clk path, and the whole
Ethernet device fails to probe.

Before this patch the MAC node was always passed in. Its child scan uses
for_each_available_child_of_node(), so a disabled child was just skipped.

The same lookup is still there at the end of the series. After "net:
hix5hd2_gmac: Support fixed-link", any non-NULL mdio_np forces bus
registration:

	mdio_np = of_get_child_by_name(node, "mdio");
	if (mdio_np || priv->phy_node != node) {

So a fixed-link MAC with a disabled mdio child would also fail probe with
-ENODEV. That doesn't match the binding text "With a fixed link, the MDIO
bus is not registered unless this node is present."

Would of_get_available_child_by_name() work better here? Other net drivers
such as rzn1_a5psw, owl-emac, ibm emac and mtk_star_emac use it for the
same lookup, and it would treat a disabled mdio child as absent.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124002442.19414-1-mmyangfl%40gmail.com
