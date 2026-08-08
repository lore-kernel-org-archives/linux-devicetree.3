Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6AE618B0F
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186008; cv=none; b=iIn9V9m0ncx1jAHZHIBlQFhY1sJmBzEsuuMbI/YbptbMud9tpFycJcMszz0rltOz0GWAlKRart32+vDyFzS2OUqtSkjAWP0wg4275ngcVnsEfgEgTO01q62JMI1zU+e1LJWkqCguBkMl4sma5cEaA2VgQIK7e6/itYVOt0MrLNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186008; c=relaxed/simple;
	bh=yOSJ/6KdZmitj2U4nCIxA/8z+7csabMQzBNyYUnqEHM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B8nNpyIf/MEupjuqsnPJNKZdscnehxaJtbZJsEaEFxouhfyQevtf86WiJe9k8VSJw5Oc/biQSjdX2uUGGvd1FLRg4FhH1XYc8Dj4TaUYYRRyDveVgs7805oVqwM36EUiVIgGm3TXvcAnTe7WcjNlomkll6xpKNq7jgmtCwFOBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CCs/1Gnx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CCs/1Gnx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40BE91F00A3A;
	Sat,  8 Aug 2026 10:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186007;
	bh=sETPbr7EdJh+k1CEL9qVrQgqivEKi6Vbwwab+NxFfkY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CCs/1GnxaQ96smjD5l6iHO/V7+OsjeUEJu0jH9JEXzopqdJReMoh3D5ycm/x6nRi5
	 xu3/ijfw0ay892rKU3TxPx3UpcV4gTQDqX4CEPje+S/Duuk4gmr6xsuSmq/CVBPQta
	 zZa7gH7lzY083cGmcLBLnrVlzueithXLiBM7ql1esBj9uTss5JUYljzh3/6dFrk2KW
	 kvVpc2vrIp7GGezvxzpD9g8E0EJZp3buBh5sC0ABXydbnjyYWsmAsxlyN0iqHYOrA6
	 ppzWPgQeBSVzMMLttNWmPp3iVlfo6pBcwjHPUtWNpH4+PKljgk07INOamuqDNcIx1D
	 ZD3VovCKNgWbQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/20] net: xilinx: tsn: add the endpoint TX data path
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260807104431.157230-8-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-8-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:46 +0000
Message-Id: <20260808104647.40BE91F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] Time-of-check to time-of-use (TOCTOU) race condition during TX=
 ring slot allocation allows concurrent transmissions to overwrite the same=
 descriptor slot.
- [Critical] Un-serialized submission to the DMA engine allows thread preem=
ption to invert submission order, leading to premature DMA unmapping (Use-A=
fter-Free).
- [High] The TX completion callback wakes only the specific logical queue o=
f the completed packet, permanently starving other logical queues mapped to=
 the same physical channel.
- [High] Pending TX and posted RX SKBs are not freed when the interface is =
stopped, causing a memory leak.
--

--- Patch [7]: [PATCH 07/20] net: xilinx: tsn: add the endpoint TX data pat=
h ---
commit 74572301861a89d8c7ecbf1624d4c45457a33266
Author: Srinivas Neeli <srinivas.neeli@amd.com>

net: xilinx: tsn: add the endpoint TX data path

Add the transmit path so the endpoint can send frames. Look up the physical
DMA channel for the frame's queue through the map built at probe, map the
frame and submit it to that channel. Stop the queue when the ring runs out
of space, and wake it from the completion callback once a slot frees up.

> diff --git a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c b/drivers/ne=
t/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> index 207ca3242a123..7615d27f3b360 100644
> --- a/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c
> +++ b/drivers/net/ethernet/xilinx/tsn/xilinx_tsn_ep.c

[ ... ]

> @@ -268,8 +273,145 @@ static void ep_dma_rx_cb(void *data, const struct d=
maengine_result *result)
>  	dma_async_issue_pending(xchan->chan);
>  }
> =20
> +static void ep_dma_tx_cb(void *data, const struct dmaengine_result *resu=
lt)
> +{

[ ... ]

> +	ndev =3D skb->dev;
> +	txq =3D netdev_get_tx_queue(ndev, skb_get_queue_mapping(skb));
> +	len =3D skb->len;
> +
> +	if (unlikely(result->result !=3D DMA_TRANS_NOERROR)) {
> +		DEV_STATS_INC(ndev, tx_errors);
> +	} else {
> +		DEV_STATS_INC(ndev, tx_packets);
> +		DEV_STATS_ADD(ndev, tx_bytes, len);
> +	}
> +
> +	dev_consume_skb_any(skb);
> +	netif_txq_completed_wake(txq, 1, len,
> +				 CIRC_SPACE(READ_ONCE(xchan->ring_head),
> +					    READ_ONCE(xchan->ring_tail),
> +					    TX_BD_NUM_DEFAULT), 2);
> +}

[Severity: High]
Since multiple logical queues can share the same physical DMA channel,
will waking only the logical queue associated with this specific SKB
cause other stopped queues mapped to the same channel to starve?

If space frees up in the shared channel, it seems like all stopped
logical queues mapped to this channel would need to be awakened to
prevent transmission stalls.

> +static netdev_tx_t ep_start_xmit(struct sk_buff *skb, struct net_device =
*ndev)
> +{

[ ... ]

> +	spin_lock_bh(&ep->tx_lock);
> +	if (CIRC_SPACE(xchan->ring_head, READ_ONCE(xchan->ring_tail),
> +		       TX_BD_NUM_DEFAULT) <=3D 1) {
> +		netif_txq_try_stop(txq,
> +				   CIRC_SPACE(xchan->ring_head,
> +					      READ_ONCE(xchan->ring_tail),
> +					      TX_BD_NUM_DEFAULT),
> +				   2);
> +		spin_unlock_bh(&ep->tx_lock);
> +		if (net_ratelimit())
> +			netdev_warn(ndev, "TSN TX ring full\n");
> +
> +		return NETDEV_TX_BUSY;
> +	}
> +
> +	skbuf_dma =3D ep_get_desc(xchan, xchan->ring_head & (TX_BD_NUM_DEFAULT =
- 1));
> +	if (!skbuf_dma) {
> +		spin_unlock_bh(&ep->tx_lock);
> +		goto err_drop_skb;
> +	}
> +	spin_unlock_bh(&ep->tx_lock);

[Severity: Critical]
Does dropping ep->tx_lock before incrementing xchan->ring_head allow
concurrent calls to ep_start_xmit() on different queues to allocate the
same ring slot?

Since the descriptor slot is reserved by ring_head, another thread could
enter and overwrite the same skbuf_dma slot before ring_head is
incremented, potentially causing data corruption and leaks.

[ ... ]

> +	spin_lock_bh(&ep->tx_lock);
> +	xchan->ring_head++;
> +	netdev_tx_sent_queue(txq, skb->len);
> +	netif_txq_maybe_stop(txq,
> +			     CIRC_SPACE(xchan->ring_head,
> +					READ_ONCE(xchan->ring_tail),
> +					TX_BD_NUM_DEFAULT),
> +			     2, 2);
> +	spin_unlock_bh(&ep->tx_lock);
> +
> +	dmaengine_submit(dma_tx_desc);
> +	dma_async_issue_pending(xchan->chan);
> +
> +	return NETDEV_TX_OK;

[Severity: Critical]
Because dmaengine_submit() is called after dropping ep->tx_lock, could
thread preemption cause the DMA engine to receive submissions out of
order compared to the logical ring_head order?

Since ep_dma_tx_cb() unmaps and frees descriptors strictly based on
xchan->ring_tail order, an out-of-order execution by the hardware could
cause ep_dma_tx_cb() to unmap a slot that is still actively being
transmitted, leading to a use-after-free.

[ ... ]

> @@ -304,10 +446,13 @@ static int ep_open(struct net_device *ndev)
>  static int ep_stop(struct net_device *ndev)
>  {
>  	struct xlnx_tsn_ep *ep =3D netdev_priv(ndev);
> +	unsigned int i;
> =20
>  	netif_tx_disable(ndev);
>  	WRITE_ONCE(ep->closing, true);
>  	ep_exit_dmaengine(ep);
> +	for (i =3D 0; i < ndev->num_tx_queues; i++)
> +		netdev_tx_reset_subqueue(ndev, i);
> =20
>  	return 0;
>  }

[Severity: High]
Does stopping the DMA engine here leak any SKBs that are currently pending
in the TX or RX rings?

ep_exit_dmaengine() cancels pending transactions without executing their
completion callbacks, but there doesn't appear to be a cleanup loop here
to iterate over the rings and unmap/free the left-over skbuf_dma->skb
pointers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D7
