Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE11287247
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 18:13:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786126395; cv=none; b=ZvzNNzzLZGpUh1Q6cZgr+21obPrchPwKyF/BbVKOCFQwb9ZOX1cpGGVYijf/9GhzTemilo0ypgjwKbV26MGp5wAfn42JuaIzc2Yu5TTwipaOl7r0hSTLm8siVYudTqA457E9/uSNsEWaLRiKScRQLN09g1xZcwHgcsoZT3IGm5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786126395; c=relaxed/simple;
	bh=OHpSWQibKeTj1oMdr8/IGQ7ojDT411QEwi4nkhXGeos=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=r6MnQFAIorM27HtrOrh87cHTuN98b7fXEaLiwci65sAM0FWH03s/P6EKQnT89ZHrzI7TCcVKCrJNWNc2Mnfi2W4wcCPVQSRZw1O/8rPfbthsPDwRnCMl8DoKBuEDHeO+94y/V+26jQldhOYnnbTiiBYO5EZr7zvy3OxUhFKR6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jnmVT5h8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jnmVT5h8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBCC91F000E9;
	Fri,  7 Aug 2026 18:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786126393;
	bh=QkaSQXAd42qV6tLhf6MDFvVUzRfaANjKUxh/8H/TBxM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jnmVT5h89fObcy62BCz50l6d/b1DuCZebV1xgTWL2orFQt2T1swAOUnzOIRi3sxy7
	 jGhiJ3mV5fZOztzDag1c9PnU9S5vF5z6BHvWaV9ARyczPt8Gfox/Mnm04XBr/tW+2q
	 27OZksxEVsqmZGy3J4uyjhaLHbwBOMiF7yDNSeAVkUDpzxcPyAT5DgGv61z5S+jkjA
	 KB5pki4ubT+JrqBGA/fc0OG0EtUmo9dnirjwYnXZSzHm7/wePA4MN18QWoWoMYZHtm
	 LNZG10VkNeA35nvv5dfc++LrV7bqVNvtJe2Nj6NGuL+tTmKCRzZIjfoaY/vExVtopr
	 38FF35NBmwNHg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/7] net: xilinx: axienet: Introduce
 axienet_config for MAC-specific ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Suraj Gupta" <suraj.gupta2@amd.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260806181153.1213996-3-suraj.gupta2@amd.com>
References: <20260723123838.125145-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-1-suraj.gupta2@amd.com>
 <20260806181153.1213996-3-suraj.gupta2@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 18:13:12 +0000
Message-Id: <20260807181313.BBCC91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] Unconditional scheduling of the periodic stats refresh work, eve=
n if the MAC type does not implement stats_update.

Pre-existing issues:
- [High] axienet_open() unconditionally overwrites the return value of axie=
net_device_reset(), ignoring initialization failures.
- [High] axienet_stop() leaks SKB buffers and DMA mappings when using the d=
maengine path.
- [High] The DMA error handler tears down the TX and RX rings without stopp=
ing the network stack's TX queue, leading to concurrent memory corruption.
--

--- Patch [2]: [PATCH net-next v2 2/7] net: xilinx: axienet: Introduce axie=
net_config for MAC-specific ops ---
commit c91bc423b631f26b67969fe9f4dd575e433a235f
Author: Suraj Gupta <suraj.gupta2@amd.com>

net: xilinx: axienet: Introduce axienet_config for MAC-specific ops

This commit introduces an axienet_config structure to abstract
MAC-type-specific operations and capability flags. It populates this
configuration from the OF match table and updates the driver to use these
callbacks instead of open-coding 1G behavior. This prepares the driver for
supporting additional MAC types in the future.

> diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/=
net/ethernet/xilinx/xilinx_axienet_main.c
> index fcf517069d161..b3deba1d96f7e 100644
> --- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
> +++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
[ ... ]
> @@ -576,14 +573,25 @@ static void axienet_stats_update(struct axienet_loc=
al *lp, bool reset)
>  	write_seqcount_end(&lp->hw_stats_seqcount);
>  }
> =20
> +/**
> + * axienet_1g_stats_update - Refresh 1G MAC hardware statistics
> + * @lp:		Pointer to the axienet_local structure
> + */
> +static void axienet_1g_stats_update(struct axienet_local *lp)
> +{
> +	axienet_stats_update(lp, false);
> +}
> +
>  static void axienet_refresh_stats(struct work_struct *work)
>  {
>  	struct axienet_local *lp =3D container_of(work, struct axienet_local,
>  						stats_work.work);
> =20
> -	mutex_lock(&lp->stats_lock);
> -	axienet_stats_update(lp, false);
> -	mutex_unlock(&lp->stats_lock);
> +	if (lp->axienet_config->stats_update) {
> +		mutex_lock(&lp->stats_lock);
> +		lp->axienet_config->stats_update(lp);
> +		mutex_unlock(&lp->stats_lock);
> +	}
> =20
>  	/* Just less than 2^32 bytes at 2.5 GBit/s */
>  	schedule_delayed_work(&lp->stats_work, 13 * HZ);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Medium]
Is it necessary to reschedule the periodic stats refresh work if the
configured MAC type does not implement stats_update?

Since schedule_delayed_work() is called unconditionally, it seems this might
wake up a CPU every 13 seconds while the interface is up, performing no
actual work if lp->axienet_config->stats_update is NULL.

[ ... ]
> @@ -709,19 +743,23 @@ static int axienet_device_reset(struct net_device *=
ndev)
>  {
> -	u32 axienet_status;
>  	struct axienet_local *lp =3D netdev_priv(ndev);
>  	int ret;
> =20
> +	if (lp->axienet_config->gt_reset)
> +		lp->axienet_config->gt_reset(lp);
> +
>  	lp->max_frm_size =3D XAE_MAX_VLAN_FRAME_SIZE;

[Severity: High]
This is a pre-existing issue, but since axienet_device_reset() can fail and
propagate error codes, is its return value properly checked in all callers?

Looking at axienet_open(), the return value of axienet_device_reset() is
stored in 'ret' but is immediately overwritten:

axienet_open() {
	...
	ret =3D axienet_device_reset(ndev);
	axienet_unlock_mii(lp);

	ret =3D phylink_of_phy_connect(lp->phylink, lp->dev->of_node, 0);
	...
}

Could this lead to the network interface being brought up in an incomplete
state if hardware initialization or descriptor allocation fails?

[ ... ]
> @@ -1742,8 +1781,8 @@ static int axienet_stop(struct net_device *ndev)
>  	phylink_stop(lp->phylink);
>  	phylink_disconnect_phy(lp->phylink);
> =20
> -	axienet_setoptions(ndev, lp->options &
> -			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
> +	lp->axienet_config->setoptions(ndev, lp->options &
> +				       ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
> =20
>  	if (!lp->use_dmaengine) {
>  		axienet_dma_stop(lp);

[Severity: High]
This isn't a bug introduced by this patch, but does the dmaengine teardown
path in axienet_stop() leak SKB buffers?

In the dmaengine branch of axienet_stop():

axienet_stop() {
	...
	} else {
		...
		for (i =3D 0; i < TX_BD_NUM_MAX; i++)
			kfree(lp->tx_skb_ring[i]);
		kfree(lp->tx_skb_ring);
		...
	}

It appears the skbuf_dma wrapper structures are freed, but there is no call
to unmap the DMA addresses or free the enclosed skb pointers themselves.
Could this lead to memory leaks and orphaned DMA mappings when the interface
is brought down?

[ ... ]
> @@ -2698,7 +2760,6 @@ static const struct phylink_mac_ops axienet_phylink=
_ops =3D {
>  static void axienet_dma_err_handler(struct work_struct *work)
>  {
>  	u32 i;
> -	u32 axienet_status;
>  	struct axidma_bd *cur_p;
>  	struct axienet_local *lp =3D container_of(work, struct axienet_local,
>  						dma_err_task);
> @@ -2711,8 +2772,8 @@ static void axienet_dma_err_handler(struct work_str=
uct *work)
>  	napi_disable(&lp->napi_tx);
>  	napi_disable(&lp->napi_rx);
> =20
> -	axienet_setoptions(ndev, lp->options &
> -			   ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
> +	lp->axienet_config->setoptions(ndev, lp->options &
> +				       ~(XAE_OPTION_TXEN | XAE_OPTION_RXEN));
> =20
>  	axienet_dma_stop(lp);

[Severity: High]
This is a pre-existing issue, but does the DMA error handler safely stop the
TX queue before manipulating the rings?

Looking at axienet_dma_err_handler(), it loops over the TX ring and lockles=
sly
frees the SKBs:

axienet_dma_err_handler() {
	...
	for (i =3D 0; i < lp->tx_bd_num; i++) {
		...
		if (cur_p->skb)
			dev_kfree_skb_irq(cur_p->skb);
	...
}

Since netif_tx_disable() is not called, could axienet_start_xmit() be
concurrently invoked by the networking stack and write new SKBs to this same
ring, leading to data races, double-frees, or memory corruption?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260806181153.1213=
996-1-suraj.gupta2@amd.com?part=3D2
