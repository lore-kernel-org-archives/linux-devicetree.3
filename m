Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428798;
	b=cqV5YIH6ycjq+3sTSgoxqJHingPswJOBp35/qseJ9ULc5A7kidCzuxX58eVOHj+KTwid
	 vy+PRoR2qPjcnh+UJg138iOJOUZ/UZxS8hqgS/CJ7TfBuQ6+OY64fgMl7HXpWjL2SwBN+
	 mjsyG1VXUqk3x/CZC4/rfLgbt33iXcChPwlLSKRwrjJNrldd/Ly9RxmmomeO/56UMOSPW
	 kdYIOqrRBAk45q8Nf4RTwVKRBh/OyUyPIophcOHCW5RxjhZyjWVDt2/35x+JfsibYutE3
	 FRp8o1jLhfZFk8BrGLujNoOTzNBVoueJLsIZPo0kIV9Y2TrGKA42EGkwwfkoYHRTvfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428798;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=NR3iuQfqAk5rmP8cCE7EmilEQ5+Oa88elKdPseevYNI=;
	b=K3DEG0/eXa9KHDYtG2/TFtyXX4RaAauv1h36PNWWO0NU37yO873OsdvCET4Xgzhlt66i
	 v6LEeevcJs9S886BQAnenATU/H27/vB0XxbwdkvhCWgfy5ooVoGFk+xe8R8tviry/LjJM
	 PVbcJ9rBL1AoFWU9bkrByMXZIKaHfkYEiEAHpGpVnX8+TDbiHDqvsopBwa7PYHiMwby1F
	 Nk4aZDufcB1bd3cZ6Sevc2IzGZ2sOkQbrk8lxX29MvWiAnnn1Sv5s4JF8/x4HbArVZ61c
	 F7zHeBCy9ZUGumeJmZrEBc1vK0ffYPacLrQW5fh/zHQiRb0s4d5aWH69gu9D5eR2/pA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2W6Mxb2;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D805606A33E;
	Mon, 23 Nov 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N2W6Mxb2
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 442471F000ED;
	Mon, 23 Nov 2026 10:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795428798;
	bh=NR3iuQfqAk5rmP8cCE7EmilEQ5+Oa88elKdPseevYNI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=N2W6Mxb2q5ZPnimXEkcmm6x6xZlvcSbVJZ/McfUHe9A8K6l5Cb7hSPb4uZduKlZXX
	 +qxLGGDi1z1VMQzM0/Gqh+IoBJI6k2MfkrWN7p/jcB7vyaU7ZIHOTLRIRZ6FT60vaa
	 iCQnl914kS/NOt7z6bE8fOw16DXKWPwLW0ZnMU/3jljyqOsxWT+KNZm5uhIMz5QbuY
	 jMBE1e5PGhEqqPLtMy9lBhabB7N8y0tC2GLhBP2FOyXiMHwbDbKb6PeBoApAJt3KNe
	 1Z/GeV5VVRJxoNbxpAsDHaZ9+gEO9AuyE78UF3LGx58N9OlCQCmWAl254kPyjV5SbR
	 4snH9Bdvm6AjA==
Subject:
 Re: [PATCH net-next v7 4/7] net: ftgmac100: Enable AST2700 RMII support
From: netdev-bot+sashiko@kernel.org
To: jacky_chou@aspeedtech.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 ratbert@faraday-tech.com, edumazet@kernel.org, hkallweit1@gmail.com,
 linux@armlinux.org.uk, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, andrew@lunn.ch
Date: Mon, 23 Nov 2026 10:13:16 +0000
Message-ID: <179542879685.3135.4031392021972838181@kernel.org>
In-Reply-To: <20261119-support_ast2700-v7-4-33c8ca2d0dd7@aspeedtech.com>
References: <20261119-support_ast2700-v7-4-33c8ca2d0dd7@aspeedtech.com>
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

Critical: 0 · High: 0 · Medium: 2 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The commit message says "ftgmac100_probe_dt() always attaches
  a phy_device before register_netdev() can succeed", and a new comment…
- [Medium] Speculative hardware-sequencing risk.

--

net: ftgmac100: Enable AST2700 RMII support

This adds a FTGMAC100_QUIRK_RMII_ENABLE match-data quirk for AST2700. It
also sets the new MACCR RMII enable bit (bit 20) in ftgmac100_start_hw()
when the attached PHY interface is RMII. The commit message argues that
netdev->phydev is always populated by the time ftgmac100_start_hw() runs.

> diff --git a/drivers/net/ethernet/faraday/ftgmac100.c b/drivers/net/ethernet/faraday/ftgmac100.c
> index 67b1fa464a421..9b7becb017262 100644
> --- a/drivers/net/ethernet/faraday/ftgmac100.c
> +++ b/drivers/net/ethernet/faraday/ftgmac100.c

[ ... ]

> @@ -355,6 +359,12 @@ static void ftgmac100_init_hw(struct ftgmac100 *priv)
>  static void ftgmac100_start_hw(struct ftgmac100 *priv)
>  {
>  	u32 maccr = ioread32(priv->base + FTGMAC100_OFFSET_MACCR);
> +	/*
> +	 * Only reached once the device is open, so a phy_device is already
> +	 * attached: a discrete PHY via "phy-handle", a "fixed-link" node, or
> +	 * NC-SI's internal fixed 100M PHY.
> +	 */
> +	struct phy_device *phydev = priv->netdev->phydev;

[Severity: Medium]
Is this invariant actually guaranteed? The commit message says:

  ftgmac100_probe_dt() always attaches a phy_device before
  register_netdev() can succeed

But ftgmac100_probe_dt() has a path that returns 0 without attaching a PHY:

drivers/net/ethernet/faraday/ftgmac100.c:ftgmac100_probe_dt() {
    ...
	if (!ftgmac100_has_child_node(np, "mdio")) {
		...
		err = ftgmac100_mii_probe(netdev);
		...
	}

	return 0;
}

Take a node with an mdio child and none of use-ncsi, fixed-link or
phy-handle. It skips both of_phy_get_and_connect() and
ftgmac100_mii_probe(), and register_netdev() then succeeds with
netdev->phydev == NULL.

The ast2700-mac binding seems to allow this. It only requires one of
phy-mode or use-ncsi, phy-handle is optional and an mdio child is
allowed. So phy-mode = "rmii" plus an mdio node with no phy-handle
passes schema validation.

The rest of the driver also treats a NULL phydev as a valid state. For
example, ftgmac100_open() does:

	if (netdev->phydev) {
		/* If we have a PHY, start polling */
		phy_start(netdev->phydev);

ftgmac100_stop(), ftgmac100_reset() and ftgmac100_phy_disconnect() check
for NULL in the same way.

The commit message cites ftgmac100_reset_and_config_mac() as precedent.
That check has the same latent problem, and it runs before every path
into ftgmac100_start_hw():

	if (priv->is_aspeed && priv->netdev->phydev->interface == PHY_INTERFACE_MODE_RMII) {

So with such a DT, ftgmac100_open()->ftgmac100_reset_and_config_mac()
would oops first, and that NULL dereference predates this patch.

This patch does write the false invariant into both the commit message
and the source. It also adds a second unguarded phydev->interface
dereference that would need fixing too if the one in
ftgmac100_reset_and_config_mac() were made NULL safe. The final patch in
this series doesn't seem to change either dereference or
ftgmac100_probe_dt().

Would it make sense to guard this with a phydev check, or to cache the
DT phy-mode at probe time? Another option would be for
ftgmac100_probe_dt() to fail on Aspeed parts when no PHY gets attached.

>  
>  	/* Keep the original GMAC and FAST bits */
>  	maccr &= (FTGMAC100_MACCR_FAST_MODE | FTGMAC100_MACCR_GIGA_MODE);
> @@ -383,6 +393,11 @@ static void ftgmac100_start_hw(struct ftgmac100 *priv)
>  	if (priv->netdev->features & NETIF_F_HW_VLAN_CTAG_RX)
>  		maccr |= FTGMAC100_MACCR_RM_VLAN;
>  
> +	if ((priv->quirks & FTGMAC100_QUIRK_RMII_ENABLE) &&
> +	    phydev->interface == PHY_INTERFACE_MODE_RMII) {
> +		maccr |= FTGMAC100_MACCR_RMII_ENABLE;
> +	}

[Severity: Medium]
Does the AST2700 need the RMII interface select to be in place across the
MAC soft reset?

FTGMAC100_MACCR_RMII_ENABLE is set only here, in the same MACCR write
that turns on TXDMA/RXDMA/TXMAC/RXMAC. The maccr that
ftgmac100_reset_and_config_mac() passes to ftgmac100_reset_mac() holds
only the speed bits:

	/* The doc says reset twice with 10us interval */
	if (ftgmac100_reset_mac(priv, maccr))
		return -EIO;
	usleep_range(10, 1000);
	return ftgmac100_reset_mac(priv, maccr);

ftgmac100_start_hw() also masks MACCR down to FAST_MODE | GIGA_MODE
before rebuilding it.

So on every open, reset_task or link change, an RMII AST2700 port goes
through the SCU reset, both SW_RST cycles and ftgmac100_init_hw() in the
default non-RMII mode. That includes NC-SI ports, which connect with
PHY_INTERFACE_MODE_RMII. The port switches to RMII only when the MAC and
DMA are enabled.

On AST2500/AST2600 the RMII selection is in the SCU, so it is already set
before the MAC reset.

If the interface select (and its clock source mux) must be stable during
SW_RST or before MAC enable, the SW_RST poll in ftgmac100_reset_mac()
could time out with "Hardware reset failed". The MAC could also start
with inconsistent clock domains. This depends on AST2700 hardware
behaviour that can't be confirmed from the code alone.

phydev->interface doesn't change after probe. Could the bit be added to
the maccr built in ftgmac100_reset_and_config_mac() and kept by the mask
in ftgmac100_start_hw()?

> +
>  	/* Hit the HW */
>  	iowrite32(maccr, priv->base + FTGMAC100_OFFSET_MACCR);
>  }

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119-support_ast2700-v7-0-33c8ca2d0dd7%40aspeedtech.com
