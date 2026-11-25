Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566501;
	b=KRYt+P9IbPHMn2nuTfHGYVqTeWebyxVE1L5TvCibgBXhGIRMMQDq0PID/RblksBiJE1X
	 pWEGRums9aaNkIZqpQcdKm+IoDe056Eyis+Y7gbsDwNVHYVTL4PVWx4jCKtsXCuOaiOow
	 vmf6Mh719QgIPU7/+PUBkLWXcWAgrI2uBYPezJ4HodQUaK94TD0BXZenUXPDbup7oilIm
	 41g6CeVcsHf0Tpf8p1wAkJdNZrMOgqaH1Bu+aCYFOoUoFvnUjqpanS9Rf+YTiC9xdVSw7
	 cfhCwvXiRcDnrqh2yv6pVcNRqo08xhUEsL6ivTc+Uc5y+rzW2DIMrfsFUge+un1TeOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566501;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=0Ogcn6Yj5HjgRG7LSf4omg5LzaKmfYWDCA7gXIBMrao=;
	b=Ddf2RzmT199jTkTQW/GlmM8Th7FOIRIJB8wZYi9VeA4Es6oqXIPvyxq6JWoivndpjMub
	 Z1xtKNJcrCi5i+R0v+6PKP/BFL48I4huQ2qPQ/UyLSDimO8M7JfVB4yGBn96l4AzhneAD
	 UC7kkkNXTZREbvRzQ+PY/5ZY/k6dxiiVUre7iGrhWEeVwzy0OOJ8v6xu1CPGv9DBkx1Mj
	 sezWnINE/fKgK9Ew1e8QKF4D9UddZ91Ui0GOH9tNOUVWUtaMykT4x4B+8WyjSATYqBpV1
	 WnmkrUTkm6jL+2dG9+un+FpLaw6IS41fm1UrfQ3JrNO2YI4u6KuBOpLi4fzIKaHcYZw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdX7KFWk;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEED1606A335;
	Wed, 25 Nov 2026 00:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FdX7KFWk
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABE681F000C6;
	Wed, 25 Nov 2026 00:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795566501;
	bh=0Ogcn6Yj5HjgRG7LSf4omg5LzaKmfYWDCA7gXIBMrao=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=FdX7KFWkdk6F3TEUkK51puLe42nJTvz8ze8Cw4uOcEn6+3T6teai6aklDGrDvmlhf
	 JRlVKrGazV4ZMO/adLV8UBL51u98CZt5m5qbWlU+DTLCLhTj39JxvZDM4T90R4fR0u
	 hvE6R6C8I+BfoIfmgAIikClNvwz93CY+6i1EC9HlSZo195Ad3oBMjUF1YTWxJtbLE8
	 qINMda980WwczCA4wyo7Bu99qT+0jP64Fe96A4xgDGip7zi2w0H8dyr+C/0igUbXgf
	 K4AiKlNx3jv/7WOm3fjvFRBWbAv98q2kVMnB49kO2TPkHKEdk1midmGQbwmooqeLjh
	 Kjs7PG2IPE2nw==
Subject: Re: [PATCH net-next v3 5/5] net: hix5hd2_gmac: Support fixed-link
From: netdev-bot+sashiko@kernel.org
To: mmyangfl@gmail.com
Cc: netdev@vger.kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shenjian15@huawei.com,
 shaojijie@huawei.com, devicetree@vger.kernel.org
Date: Wed, 25 Nov 2026 00:28:20 +0000
Message-ID: <179556650026.3135.16586116032189589789@kernel.org>
In-Reply-To: <20261124002442.19414-6-mmyangfl@gmail.com>
References: <20261124002442.19414-6-mmyangfl@gmail.com>
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

- [Low] hix5hd2_dev_probe()
  (drivers/net/ethernet/hisilicon/hix5hd2_gmac.c) now uses…
- [Low] The series' binding text (hisilicon,hisi-gmac-v1.yaml, `mdio`
  description) says: "With a fixed link, the MDIO bus is not registered…

--

net: hix5hd2_gmac: Support fixed-link

When the MAC node has no phy-handle but of_phy_is_fixed_link() returns
true, this commit registers a fixed PHY from the MAC DT node. For a fixed
link, MDIO bus registration is skipped unless an mdio child node is
present. phy-handle takes precedence over managed = "in-band-status".

> diff --git a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> index a176870079e96..b787b7777e924 100644
> --- a/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> +++ b/drivers/net/ethernet/hisilicon/hix5hd2_gmac.c
> @@ -1176,37 +1176,52 @@ static int hix5hd2_dev_probe(struct platform_device *pdev)
>  		hix5hd2_phy_reset(priv);
>  	}
>  
> -	bus = devm_mdiobus_alloc(dev);
> -	if (bus == NULL) {
> -		ret = -ENOMEM;
> +	priv->phy_node = of_parse_phandle(node, "phy-handle", 0);
> +
> +	/* In the case of a fixed PHY, the DT node associated
> +	 * to the PHY is the Ethernet MAC DT node.
> +	 */
> +	if (!priv->phy_node && of_phy_is_fixed_link(node)) {
> +		ret = of_phy_register_fixed_link(node);
> +		if (ret < 0)
> +			goto out_disable_clk;
> +		priv->phy_node = of_node_get(node);
> +	} else if (!priv->phy_node) {
> +		netdev_err(ndev, "not find phy-handle\n");
> +		ret = -EINVAL;
>  		goto out_disable_clk;
>  	}

[Severity: Low]
Is this condition broader than intended? of_phy_is_fixed_link() also
returns true for any managed value other than "auto":

drivers/net/mdio/of_mdio.c:of_phy_is_fixed_link() {
    ...
	err = of_property_read_string(np, "managed", &managed);
	if (err == 0 && strcmp(managed, "auto") != 0)
		return true;
    ...
}

Before this patch, a MAC node with managed = "in-band-status" and no
phy-handle failed probe with "not find phy-handle". Now it probes and goes
through of_phy_register_fixed_link(), which checks in-band-status first:

drivers/net/mdio/of_mdio.c:of_phy_register_fixed_link() {
    ...
	if (of_property_read_string(np, "managed", &managed) == 0 &&
	    strcmp(managed, "in-band-status") == 0) {
		/* status is zeroed, namely its .link member */
		goto register_phy;
	}
    ...
}

That registers a fixed PHY with link=0. It also skips any fixed-link
subnode, so the speed and duplex given there are ignored.

hix5hd2 is a plain phylib MAC. It connects with of_phy_connect() in
hix5hd2_net_open(), and hix5hd2_adjust_link() is the only place that
programs port speed and duplex. The driver has no in-band status reader
and never calls fixed_phy_set_link_update() or fixed_phy_change_carrier().
Would the link ever come up for such a node?

The binding in this series only exempts fixed-link from the phy-handle
requirement. The commit message only says phy-handle takes precedence
over in-band-status.

Should managed = "in-band-status" without a phy-handle be rejected here?
Another option is to check for a fixed-link description explicitly.

[ ... ]

>  	mdio_np = of_get_child_by_name(node, "mdio");
> -	ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
> +	if (mdio_np || priv->phy_node != node) {
> +		bus = devm_mdiobus_alloc(dev);

[ ... ]

> +		ret = devm_of_mdiobus_register(dev, bus, mdio_np ?: node);
> +		if (ret) {
> +			of_node_put(mdio_np);
> +			goto out_phy_node;
> +		}
> +	}

[Severity: Low]
What happens with a MAC node that has both a phy-handle and a fixed-link
subnode, but no mdio child?

phy-handle takes precedence, so priv->phy_node points at the PHY node and
priv->phy_node != node is true. The bus is then registered on the MAC
node itself. __of_mdiobus_register() finds the fixed-link child, which has
no reg, and scans every address:

drivers/net/mdio/of_mdio.c:__of_mdiobus_register() {
    ...
			/* be noisy to encourage people to set reg property */
			dev_info(&mdio->dev, "scan phy %pOFn at address %i\n",
				 child, addr);
    ...
}

The fixed-link node has no compatible, so it counts as a PHY, and
of_mdiobus_register_phy() is tried on it at each free address. This
produces the "scan phy fixed-link at address X" output that the commit
message says this change avoids.

The binding text in this series says:

    With a fixed link, the MDIO bus is not registered unless this node is
    present.

The binding does not forbid combining phy-handle with fixed-link. Should
the binding description or this condition be changed so they agree for
this case?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261124002442.19414-1-mmyangfl%40gmail.com
