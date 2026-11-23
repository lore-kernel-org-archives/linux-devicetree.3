Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428800;
	b=QNkLDF+bMJdkz0IRLsZNlGMvKxR3J624tA56TyR/Uile7mkW1Ag4InPZHcSB7aav33jT
	 FdT98yPLMU6E5Xp3pNWAQ6/1Fjycd76WN+XTIJtKskc6zP08QZrb2ONjAKwHjhM8fxWGp
	 UoxbXfMYjNGslGEKpmU/m14iMIaT3PdsTr7Kd+iCFlNHlRJh1ENc+FNf3O+Hs9qasvkh5
	 cfmXxx8P1voqLfb+xCO6YWV/oot8PT2nV3L3Vh9dTY3MEqzy5sZxYoaSUR9WrR3m4rngR
	 5eChBPHRBPspmneiooXph0pPJczUqEj+uQ9jEbsYr48gGwJmyrlKdGo9yvLWP5Y9kwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428800;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=lyb37VHY3Cz0Xe1qCFGWBdDx+Gpu8rjZZrsCih1gYKE=;
	b=K5iGGzoy0woEaEtyQfHynYCX+6QKZ9Z7XZVfoTFo1+Az00wxJERqmTVOkqZwCgCNLwWf
	 6Odkcwd3AfxTOv6GEO7Cn/7oPE6p9dYuL6diXMHXV1cRmw6vC5UuFzHaNmVvxAo/wFOzJ
	 UdNBbLfumu4Qt60F3jpFuOpa335sIoArLxlNRiyua1+XQit/P9FodkWXSaXqRdNcvK/1A
	 CeKDZ03bxEi/uXgbBuBQ2I0prt/ksLdHeFQzSZXfRwHI60UEPLKsa6layRjT5UL0TMF1y
	 A8yplhunrBPhnLp/TgyXCxa3aWEwFg5ClCf80GGgYBRJdknlXQYQTHWb6TN5uws8AHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="n5w/vE7m";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D255606A69E;
	Mon, 23 Nov 2026 10:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n5w/vE7m
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 080571F000D4;
	Mon, 23 Nov 2026 10:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428799;
	bh=lyb37VHY3Cz0Xe1qCFGWBdDx+Gpu8rjZZrsCih1gYKE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=n5w/vE7m+gYv6JZcG/Zbjgr9P4R1G4Ww2IbRzZaGir/wA9LvLBstljTkaH4ggozfq
	 vE3U+r4IKeVVgz+blyoW4YtYqHVZwAAo4Ltxb60gasobFcveT7IzP1ojnRMHVm57oD
	 nBGNE1kAA9DWYHH6/untuMG1YYFcmrza0unqgc6nYFZRFi1fCYQD8r7eUwkHwt26N4
	 QGc13hLj4EwwLnUo8SOTciLEWR2gQTAdeNQq9gZ/ShENKTojQLUjhuo2ibuyz680Hc
	 9AgTifw8fPf0AQdeYqHN+gEJnz1NZI4FGBOab2cbOJgn+3TVmSQz77AsQCjPYFNwMl
	 +znmeqmYxMBEg==
Subject:
 Re: [PATCH net-next v7 5/7] net: ftgmac100: Require phy-mode for AST2700
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:18 +0000
Message-ID: <179542879858.3135.15143972557396175443@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-5-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-5-33c8ca2d0dd7@aspeedtech.com>
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

Thank you for your contribution! Sashiko AI review found 4 potential
issue(s) to consider.

Critical: 0 · High: 1 · Medium: 2 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] The new AST2700 phy-mode check in ftgmac100_mii_probe()
  (drivers/net/ethernet/faraday/ftgmac100.c, lines 1529-1533) can never…
- [Medium] The commit message says "The driver currently defaults to
  RGMII when the phy-mode property is missing" and describes the patch…
- [Medium] One AST2700 configuration can still probe without phy-mode: a
  node with an 'mdio' child but no 'phy-handle', 'fixed-link' or 'use-…
- [Low] The comment above of_get_phy_mode() in ftgmac100_mii_probe()
  (line 1527) still says "Default to RGMII.

--

net: ftgmac100: Require phy-mode for AST2700

This commit makes phy-mode a required property for AST2700. When
of_get_phy_mode() fails in ftgmac100_mii_probe(), probe now returns
-EINVAL for that SoC instead of falling back to RGMII.

> The driver currently defaults to RGMII when the "phy-mode" property
> is missing from the device tree. This default is no longer valid for
> AST2700, which also supports RMII via FTGMAC100_QUIRK_RMII_ENABLE.

[Severity: Medium]
Is this description accurate for AST2700? No AST2700 probe path seems to
reach the RGMII default.

With use-ncsi, ftgmac100_probe_ncsi() connects with
PHY_INTERFACE_MODE_RMII and never reads phy-mode.

With phy-handle or fixed-link, of_phy_get_and_connect() already fails
when phy-mode is missing:

	ret = of_get_phy_mode(np, &iface);
	if (ret)
		return NULL;

With the legacy MDIO scan, ftgmac100_mii_probe() returns -ENODEV on the
NULL mii_bus before it reads phy-mode.

The RGMII fallback only applies to FARADAY, AST2400 and AST2500. Could the
commit message say that this patch does not change AST2700 behaviour? As
written, it suggests a silent RGMII default on AST2700 has been fixed.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 9b7becb017262..5a578a62df673 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c
> @@ -1526,8 +1526,13 @@ static int ftgmac100_mii_probe(struct net_device *netdev)
>  
>  	/* Default to RGMII. It's a gigabit part after all */

[Severity: Low]
This isn't a bug, but this comment no longer matches the code. On
FTGMAC100_AST2700 a missing phy-mode now returns -EINVAL instead of
defaulting to RGMII.

>  	err = of_get_phy_mode(np, &phy_intf);
> -	if (err)
> +	if (err) {
> +		if (priv->mac_id == FTGMAC100_AST2700) {
> +			dev_err(priv->dev, "phy-mode is required for this SoC\n");
> +			return -EINVAL;
> +		}

[Severity: High]
Can this check ever run on AST2700? Before it reaches of_get_phy_mode(),
ftgmac100_mii_probe() checks priv->mii_bus:

	if (!priv->mii_bus) {
		dev_err(priv->dev, "No MDIO bus available\n");
		return -ENODEV;
	}

priv->mii_bus is only assigned in ftgmac100_setup_mdio(). ftgmac100_probe()
only calls that for the older MACs:

	if (priv->mac_id == FTGMAC100_FARADAY ||
	    priv->mac_id == FTGMAC100_AST2400 ||
	    priv->mac_id == FTGMAC100_AST2500) {
		err = ftgmac100_setup_mdio(netdev);

priv comes zeroed from devm_alloc_etherdev(), so priv->mii_bus is always
NULL on AST2700. ftgmac100_mii_probe() therefore returns -ENODEV before the
new FTGMAC100_AST2700 test.

Here is what ftgmac100_probe_dt() does for an AST2700 node without
phy-mode:

  use-ncsi: ftgmac100_probe_ncsi() hardcodes RMII, which the binding
  allows.

  phy-handle or fixed-link: of_phy_get_and_connect() already returns NULL,
  so probe fails with "Failed to connect to phy" with or without this
  patch.

  mdio child, no phy-handle: ftgmac100_mii_probe() is skipped and
  ftgmac100_probe_dt() returns 0 without checking phy-mode.

  no mdio child, no phy-handle: ftgmac100_mii_probe() fails with "No MDIO
  bus available" before the new check.

This patch changes the result of none of these paths. The check is still
unreachable, and unchanged, at the end of the series in "net: ftgmac100:
Allow building on ARM64".

Also, "dt-bindings: net: ftgmac100: Add AST2700 compatible" justifies its
oneOf(phy-mode, use-ncsi) rule by pointing to "ftgmac100_mii_probe(), where
the AST2700 phy-mode check lives".

Would this check work better in ftgmac100_probe_dt(), after the use-ncsi
branch and before the fixed-link/phy-handle/mdio split?

[Severity: Medium]
Related to the above: an AST2700 node with an mdio child node but no
phy-handle, fixed-link or use-ncsi still probes without phy-mode.

ftgmac100_probe_dt() {
	...
	if (!ftgmac100_has_child_node(np, "mdio")) {
		...
		err = ftgmac100_mii_probe(netdev);
		...
	}

	return 0;
}

The device then registers with netdev->phydev == NULL. On open, would
ftgmac100_reset_and_config_mac() dereference a NULL phydev here for any
is_aspeed device?

	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {

ftgmac100_start_hw() makes a similar read for the RMII quirk added in
"net: ftgmac100: Enable AST2700 RMII support". That commit says
"ftgmac100_probe_dt() always attaches a phy_device", which does not seem to
hold for this path.

The NULL phydev read on open can also be reached on AST2600 with the same
DT layout. For AST2700, moving the phy-mode check into ftgmac100_probe_dt()
right after the use-ncsi branch would cover this case.

>  		phy_intf = PHY_INTERFACE_MODE_RGMII;
> +	}

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com
