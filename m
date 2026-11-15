Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794767497;
	b=WUcl8sQ25QX0WR7Ksovao5CtsdeBWIvg8ptwesPIB1tiYKdanMLliqo7JP9eIL+o9N2z
	 6aKFIRUoBG8ovjZP3Ej3rzD/oT1bEtcW+QWybpnDKyivIhuGx/wTyvxuUTe4L8SzSFmdL
	 dTauD3Zi2IaY8r2AMoKPq/BiRgO9NpOSQqRUa5JgSaPB2T8YiEi2Ldo8NOY4luhY+gdnU
	 TXLWvGwIlMODJTUj9HD8QxRWVNRcgTz5oiQ2TI5bIjv+HoB36vETh0Nxd39bOqng94zWc
	 g4hArz4ClAAaFNo88A4Df+/pNMHeVebi9Ls7icEj1b9xEKkl0zdYWffIylkC6SI1qJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794767497;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Y/1Hatc277SqrrKBX0E62L5sUBc4b0LV2RXlAuvtRlo=;
	b=NtsETW70N67GLu7SRE3bf/Y/AuiGwwMY94DspNTmlSOKmR9SngvqpNZS0Ic1JLXP+ppq
	 ilWJDdKh0eK9g2NZrfOIM0DzplKFBc6Ad6GDI8tUehnLzJ53DJqpBUyMFg4LYXOvSgJDy
	 EJYpa4AuKrq2y4pbIg9AZ5U1prBUlC4g/BvajGNSxeoVDWyLY/eee3Q3vrXQQk7jXOAU+
	 dRtH4DPwRoLohm81Fhph3msYTkAgJ2wigVmqvVpPdqngopxD5wczmqInCRFb7/dKmBRJc
	 ElqnZXqGmIgw1lKQNImcQsekSjdphcnZjMVBwdFlxeNyFceOybPAXa/z9o9qtNJ7Vzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgJmvYox;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E282606A31F
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 18:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QgJmvYox
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0F841F000C4;
	Sun, 15 Nov 2026 18:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794767497;
	bh=Y/1Hatc277SqrrKBX0E62L5sUBc4b0LV2RXlAuvtRlo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QgJmvYox7mrhMlDmL+tksOAU3Ka1ClvEqw7+xyI4LEiSO7OZ3hsO2S2LbrBk7arAa
	 iROqAlsF1HvHrVlHBotBH7/dk+W8AmnTrg9vsQiQK1RVolyUcsF+JP7VOdcudKCZ69
	 B65OIjbdik5ALsLss8IgM3xTxr74wjYK5bkzhvAdlP9JONWiHGahKKfnsnPXJJoABe
	 0wNXLo0pXmoxg7kzpTxv4AWGVNXkORbo9ptfjiSnbHuWazXC/rAOqYI+QwHuOjtEMb
	 bPGeLE+TkS0HpakZGC5OQAXCl1dgwysbNMzbYnj0qTcHUkewMTqij2swZiDb7RZiHv
	 nvYRPvcUX0B6w==
Message-ID: <sashiko-outbox-215722@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 3/6] net: xilinx: axienet: Propagate device
 reset failure from ndo_open
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261114182947.2908628-4-suraj.gupta2@amd.com>
References: <20261114182947.2908628-1-suraj.gupta2@amd.com>
 <20261114182947.2908628-4-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 15 Nov 2026 18:31:36 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] net: xilinx: axienet: u32 stats underflow on
  __axienet_device_reset() failure
- [Medium] net: xilinx: axienet: leaked legacy DMA rings and active DMA
  on open failure
--

commit 13e0ec7cb747f36a50832556f5abcdb18558f153
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Propagate device reset failure from ndo_open

This commit checks and propagates the return value of
axienet_device_reset() in axienet_open(), tracks whether ndo_open
completed via lp->datapath_up so axienet_stop() is a no-op otherwise,
handles reopen failures in axienet_resume(), and clears
lp->reset_in_progress on __axienet_device_reset() failure.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index 125ad3dbf6aa9..a553150faa89b 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> @@ -703,6 +703,17 @@ static int __axienet_device_reset(struct axienet_loc=
al *lp)
>  	}
> =20
>  out:
> +	/* On failure the block above is skipped, so clear the flag here.
> +	 * axienet_open() now returns on a reset error without scheduling the
> +	 * statistics work that used to clear it, which would otherwise leave
> +	 * axienet_stat() returning the frozen base until a reset succeeds.
> +	 */
> +	if (ret && (lp->features & XAE_FEATURE_STATS)) {
> +		write_seqcount_begin(&lp->hw_stats_seqcount);
> +		lp->reset_in_progress =3D false;
> +		write_seqcount_end(&lp->hw_stats_seqcount);
> +	}
> +
>  	mutex_unlock(&lp->stats_lock);
>  	return ret;
>  }

[Severity: Medium]
Can clearing lp->reset_in_progress here without updating
lp->hw_last_counter[] cause a 32-bit unsigned underflow in
axienet_stat() and axienet_stats_update()?

At the start of __axienet_device_reset(), axienet_stats_update(lp, true)
saves the pre-reset counter values in lp->hw_last_counter[], and writing
XAXIDMA_CR_RESET_MASK resets the Axi Ethernet core and zeroes the
hardware statistics registers.  If the subsequent PhyRstCmplt poll times
out and jumps to out, the loop that resynchronizes lp->hw_last_counter[]
is skipped.  With lp->reset_in_progress cleared, axienet_stat() reads
zero from the hardware counter and subtracts the non-zero pre-reset
lp->hw_last_counter[stat] in 32-bit unsigned arithmetic, inflating the
reported 64-bit statistics by ~2^32 (and permanently folding that
underflow into lp->hw_stat_base[] on the next axienet_stats_update()):

drivers/net/ethernet/xilinx/xilinx_axienet_main.c:axienet_stat() {
    ...
	if (lp->reset_in_progress)
		return lp->hw_stat_base[stat];

	counter =3D axienet_ior(lp, XAE_STATS_OFFSET + stat * 8);
	return lp->hw_stat_base[stat] + (counter - lp->hw_last_counter[stat]);
}

> @@ -1776,6 +1787,10 @@ static int axienet_open(struct net_device *ndev)
>  	axienet_lock_mii(lp);
>  	ret =3D axienet_device_reset(ndev);
>  	axienet_unlock_mii(lp);
> +	if (ret) {
> +		dev_err(lp->dev, "axienet_device_reset() failed: %d\n", ret);
> +		return ret;
> +	}
> =20
>  	ret =3D phylink_fwnode_phy_connect(lp->phylink, dev_fwnode(lp->dev), 0);
>  	if (ret) {
> @@ -1806,6 +1821,8 @@ static int axienet_open(struct net_device *ndev)
>  			goto err_phy;
>  	}
> =20
> +	lp->datapath_up =3D true;
> +
>  	return 0;
> =20
>  err_free_eth_irq:
> @@ -1834,6 +1851,16 @@ static int axienet_stop(struct net_device *ndev)
>  	struct axienet_local *lp =3D netdev_priv(ndev);
>  	int i;
> =20
> +	/* axienet_resume() calls ndo_open directly, so unlike the netdev core
> +	 * it can leave the device running after a failed open. Tearing down
> +	 * below would then stop a phylink that open already stopped and
> +	 * disconnected, and free interrupts it never requested.
> +	 */
> +	if (!lp->datapath_up)
> +		return 0;
> +
> +	lp->datapath_up =3D false;

[Severity: Medium]
When axienet_open() fails on the non-dmaengine path after
axienet_dma_bd_init() succeeds, does returning with lp->datapath_up set
to false leak the DMA descriptor rings and leave DMA running?

In the !lp->use_dmaengine path, axienet_device_reset() calls
axienet_dma_bd_init(), which allocates lp->tx_bd_v, lp->rx_bd_v and RX
skbs and starts DMA, and then enables XAE_OPTION_TXEN | XAE_OPTION_RXEN.
If phylink_fwnode_phy_connect() or axienet_init_legacy_dma() then fails
(or if lp->axienet_config->mac_init() fails inside
axienet_device_reset()), axienet_open() returns an error without calling
axienet_dma_stop() or axienet_dma_bd_release().  Because
lp->datapath_up remains false, axienet_stop() (including via
netif_close() in axienet_resume()) now returns early as well, leaving
hardware DMA active and leaking the coherent rings and mapped RX skbs,
which are overwritten on the next axienet_open().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261114182947.2908=
628-1-suraj.gupta2@amd.com?part=3D3
