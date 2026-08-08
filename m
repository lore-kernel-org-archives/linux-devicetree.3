Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C38F3D76
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186008; cv=none; b=tQUpoJe0GjddZqwV/pGWI/U0nU97j1SSLjv3xoTaidKyJCwCjVk4jROgIDcEGuJxya/SXaL/+/WPkJ2LPzcGUl8XWNDxt2FUxnow5j1QQOQdfsbxMEz4Y/dMIOJ3BcWyrmrEDd6ghsctSOEXoR6sckQeKzquMMS7ezvVV4C1OCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186008; c=relaxed/simple;
	bh=bAG+OpqaFKD6OoaIupWSGgzKFJ3s5tidlAwYZcqrz9w=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IsCgOOc9Z+tkKtbuUmYWEbXAPZgp5mNln9ld6e+wt6maS38UJTmVBQK/TeSuEJ7iCi00iSXf7pA1g1NiVfRdSLe61G+V/KMpNZw7Y86lPIOI94lW5BD+MbKHt3UNMntP7m85uMTeysi0xHiYyuhVyPmJ/ylW7IrEXps7CtwyRn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bt3JuwfF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bt3JuwfF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590E71F000E9;
	Sat,  8 Aug 2026 10:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186006;
	bh=Qd326HA1Ea/cu8xEWMJ8Jh7vuw2WJNPEvLKCC7Ov1uw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Bt3JuwfFljMI4KrTiQYnv2V1StQh8jNBk0TTXDkd6sJJTv8RJ+IP1AyzlsHgxfBX2
	 b98CSOXtHTSR/bnh9YKTpyVe/B9Z4C/RsRTSzz8rJjXqFOCYLR0D7IrvNTw2JVSpmb
	 ksm5vzBbIPFKX4Xu9cxzeI6+3R61HMC23OFcbQqUPrjfSx+IFoWDc16EA0Osw6/lpg
	 tS7MoBriPNvc8d5h74d0CEzDmAcL76Ol6lPFS8LurV+cLQYkcVElQpMi/j9vnMLvT/
	 opKAFoNU6Yf8Q2Jp3Jez7nC39fO+aeEQQLKuQ6nkL+Eesp52uurW4hj400hf/veJRa
	 H0ouo/Ct8sA1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/20] net: xilinx: tsn: bring up the endpoint MCDMA
 channels
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807104431.157230-6-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-6-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:45 +0000
Message-Id: <20260808104646.590E71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Requesting DMA channels in ndo_open() breaks probe deferral and ex=
poses internal error codes.
- [High] Race condition in TX descriptor allocation corrupts the DMA ring.
- [High] RX DMA rings are permanently disabled due to missing initializatio=
n.
- [High] Using skb_dst_set_noref() before __netif_rx() causes Use-After-Fre=
e of metadata dst.
- [Medium] Manual scatterlist construction risks NULL pointer dereferences =
in DMA backend.
--

--- Patch [5]: [PATCH 05/20] net: xilinx: tsn: bring up the endpoint MCDMA =
channels ---
commit 083d653fd2c94a113e47e527d00ee7dae164f904
Author: Srinivas Neeli <srinivas.neeli@amd.com>

net: xilinx: tsn: bring up the endpoint MCDMA channels

Before the endpoint can move frames, each MCDMA channel needs a ring of
buffers and a live dmaengine channel.

Request every TX and RX channel named in the device tree when the
interface opens, and give each one a ring of preallocated SKB
descriptor slots. Reset the controller through tx_chan0 on open, and
release the channels on stop. Add the XILINX_DMA dependency for the
dmaengine and Xilinx DMA APIs.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/ne=
t/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 062cb94c21533..fa21d59ade165 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
[ ... ]
> @@ -59,8 +122,27 @@ static netdev_tx_t ep_start_xmit(struct sk_buff *skb,=
 struct net_device *ndev)
>  	return NETDEV_TX_OK;
>  }
> =20
> +static int ep_reset_dma_controller(struct xlnx_tsn_ep *ep);
> +static int ep_init_dmaengine(struct xlnx_tsn_ep *ep);
> +static void ep_exit_dmaengine(struct xlnx_tsn_ep *ep);
> +
> +static int ep_open(struct net_device *ndev)
> +{
> +	struct xlnx_tsn_ep *ep =3D netdev_priv(ndev);
> +	int ret;
> +
> +	WRITE_ONCE(ep->closing, false);
> +
> +	ret =3D ep_reset_dma_controller(ep);
> +	if (ret)
> +		return ret;
> +
> +	ret =3D ep_init_dmaengine(ep);
> +	if (ret) {
> +		netdev_err(ndev, "failed to initialize DMA engine\n");
> +		return ret;
> +	}
> +
[Severity: High]
Does this sequence need to prime the RX rings by calling ep_rx_submit_desc()
before starting the queues?  It appears the rings are permanently disabled
because the dmaengine has no initial memory targets for receive interrupts.

> +	netif_tx_start_all_queues(ndev);
> +
> +	return 0;
> +}
[ ... ]
> +static int ep_reset_dma_controller(struct xlnx_tsn_ep *ep)
> +{
> +	struct xilinx_vdma_config cfg =3D { .reset =3D 1 };
> +	struct dma_chan *tx_chan0;
> +	int ret;
> +
> +	tx_chan0 =3D dma_request_chan(ep->dev, "tx_chan0");
> +	if (IS_ERR(tx_chan0))
> +		return dev_err_probe(ep->dev, PTR_ERR(tx_chan0),
> +				     "failed to request tx_chan0 for reset\n");
[Severity: High]
Since this is the ndo_open() path rather than the driver probe() path, will
using dma_request_chan() and dev_err_probe() here break probe deferral?

If the DMA controller is not ready, this will return -EPROBE_DEFER to
userspace when the interface is brought up instead of deferring the driver
probe.

> +
> +	ret =3D xilinx_vdma_channel_set_config(tx_chan0, &cfg);
> +	dma_release_channel(tx_chan0);
> +	if (ret < 0)
> +		return dev_err_probe(ep->dev, ret,
> +				     "failed to reset DMA controller\n");
> +
> +	return 0;
> +}

Additionally, I noticed a few other issues in this file:

In ep_start_xmit():

	spin_lock_bh(&ep->tx_lock);
	if (CIRC_SPACE(xchan->ring_head, READ_ONCE(xchan->ring_tail),
		       TX_BD_NUM_DEFAULT) <=3D 1) {
		...
	skbuf_dma =3D ep_get_desc(xchan, xchan->ring_head & (TX_BD_NUM_DEFAULT - 1=
));
	if (!skbuf_dma) {
		spin_unlock_bh(&ep->tx_lock);
		goto err_drop_skb;
	}
	spin_unlock_bh(&ep->tx_lock);

	sg_init_table(skbuf_dma->sgl, sg_len);
	...
	spin_lock_bh(&ep->tx_lock);
	xchan->ring_head++;

[Severity: High]
Does dropping ep->tx_lock while preparing the descriptor expose the slot to
concurrent modification? If multiple threads transmit on logical queues
mapping to the same physical channel, could they grab the same descriptor s=
lot
and overwrite it before the producer index is incremented?

In ep_dma_rx_cb():

	skb_put(skb, rx_len);
	skb_dst_set_noref(skb, &ep->port_md[port_id]->dst);
	skb->dev =3D ndev;
	skb->protocol =3D eth_type_trans(skb, ndev);
	skb->ip_summed =3D CHECKSUM_NONE;
	__netif_rx(skb);

[Severity: High]
Can using skb_dst_set_noref() here cause a use-after-free? __netif_rx() def=
ers
execution to the CPU backlog, which crosses softirq and RCU boundaries. If
the driver is unloaded, the metadata destination could be freed while defer=
red
SKBs still reference it.

In ep_rx_submit_desc():

	sg_init_table(skbuf_dma->sgl, 1);
	addr =3D dma_map_single(xchan->dma_dev, skb->data, ep->max_frm_size,
			      DMA_FROM_DEVICE);
	...
	sg_dma_address(skbuf_dma->sgl) =3D addr;
	sg_dma_len(skbuf_dma->sgl) =3D ep->max_frm_size;
	dma_rx_desc =3D dmaengine_prep_slave_sg(xchan->chan, skbuf_dma->sgl,
					      1, DMA_DEV_TO_MEM,
					      DMA_PREP_INTERRUPT);

[Severity: Medium]
Is it safe to construct the scatterlist manually like this? This bypasses
sg_init_one() and dma_map_sg(), which risks NULL pointer dereferences in the
DMA backend since fields like page_link might remain uninitialized.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D5
