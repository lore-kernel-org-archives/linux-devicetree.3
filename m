Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C133327A462
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781499487; cv=none; b=EwHWzBLct9NjhexwulxRLqLI4P1DZj8WuCGoADZurOFOi4FzKCOuN/KFK8/1za1a3U8YTNl2BJJBUJP8Ib1U8JwQxAGxv4rmjFyYmZg4BMdCCnYLX/1gd8HM9dDMrYKwFoHivkdF+TfG0cRCqJeZMDrJvBvg2ud3kZu5tPdvOHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781499487; c=relaxed/simple;
	bh=VXMJODRMP3IP3WJ22xMmD+icA/NMdYoxi34PxZ59JdY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qLhkuhUxhm8/3R/YMhqqM4bDBVpVzklt7yF6tVMVnX1LRr+wmnZvy787UZeA3xSCnfpvZ6GY4IuKhsqC/nxIw3YTzCOx5/F/hINYu3++KkTw5hwPqyggLP5fZS8aabEVuTc0BSc/IvyQD8yoTHHOcH8JXcLWG3i0hciswsloMyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jgaciCH1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jgaciCH1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7616B1F00A3D;
	Mon, 15 Jun 2026 04:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781499486;
	bh=fdHyBnKlEWt+PnxJ564TN1vNfynDR0RfyT3xAQ6KwOg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jgaciCH1uzVuVRCNogG4wnz/dV5LNg8nQcgjd87/0jbChib9K6a41JWsvzHtN8T0R
	 j4SG/N17FOx0DCwNlNfdC0817Fbl5ZJyNXMESTtI2nl8pEW1gsDUlN7FfK0EfXrwpu
	 CBrtbX04BNqL35sOlnfCETcq1bwJnxG4bihLIEAC7IlyekiqOogxATgiEcCKQdVaip
	 0qvH8OyxKByzwwg4TiYpZpVYtqe8U6koi5LO8aJ57WSlNTWql3bpGXOjK1h5G2dD7n
	 CRXbVa/twSYN68t4TR/8GiXSkRJRs9oRZKf2FSnUwrdDlaLDgt5Bh9zsNFJHBFZY+8
	 CKw+r2xF9SCmA==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 5/7] net: airoha: add QDMA support for SOE
 packets
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614040032.1567994-6-hurryman2212@gmail.com>
References: <20260614040032.1567994-6-hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 04:58:06 +0000
Message-Id: <20260615045806.7616B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Accessing `skb` after handing it off to the QDMA hardware TX ring =
causes a Use-After-Free vulnerability.

Pre-existing issues:
- [High] Using `dma_map_single()` with `skb_frag_address()` instead of `skb=
_frag_dma_map()` causes mapping failures or kernel panics on systems with h=
igh memory.
- [High] Unnecessarily re-evaluating `dev` and `netdev` from scattered RX d=
escriptors causes invalid metadata extraction, resulting in misrouted or dr=
opped packets.
--

commit a3fa3b0477739d5fa5e7176d3210e1a5b7b0f8df
Author: Jihong Min <hurryman2212@gmail.com>

net: airoha: add QDMA support for SOE packets

Add QDMA RX/TX plumbing for SOE packets, including the SOE RX ring,
coherent RX slots, SOE completion decoding, and the private QDMA submit
helper used by the SOE provider. Wire the Ethernet netdev feature and
lifetime hooks through the SOE stubs.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -822,92 +822,210 @@ static int airoha_qdma_rx_process(struct airoha_qu=
eue *q, int budget)
[ ... ]
>  		len =3D FIELD_GET(QDMA_DESC_LEN_MASK, desc_ctrl);
> -		data_len =3D q->skb ? AIROHA_RX_LEN(q->buf_size) : e->dma_len;
> +		data_len =3D q->skb && !q->rx_coherent ?
> +				   AIROHA_RX_LEN(q->buf_size) :
> +				   e->dma_len;
>  		if (!len || data_len < len)
>  			goto free_frag;
> =20
> -		dev =3D airoha_qdma_get_gdm_dev(eth, desc);
> -		if (IS_ERR(dev))
> -			goto free_frag;
> +		msg0 =3D le32_to_cpu(READ_ONCE(desc->msg0));
> +		msg1 =3D le32_to_cpu(READ_ONCE(desc->msg1));
> +		msg2 =3D le32_to_cpu(READ_ONCE(desc->msg2));
> +#if IS_REACHABLE(CONFIG_NET_AIROHA_SOE)
> +		soe_pkt =3D partial_soe || airoha_qdma_rx_is_soe(msg0);
> +#endif
> +		if (!soe_pkt) {
> +			dev =3D airoha_qdma_get_gdm_dev(eth, desc);
> +			if (IS_ERR(dev))
> +				goto free_frag;
> +			netdev =3D netdev_from_priv(dev);
> +			rx_dev =3D netdev;
> +		}

[Severity: High]
This is a pre-existing issue, but does re-evaluating dev and netdev on every
descriptor in a scattered chain overwrite the valid metadata from the first
descriptor?

If the hardware only writes msg0 and msg1 to the first descriptor and
zeroes them out in subsequent ones, re-evaluating here might corrupt DSA
routing and flow hashing by using zeroed data.

[ ... ]
> @@ -2176,6 +2552,110 @@ int airoha_get_fe_port(struct airoha_gdm_dev *dev)
[ ... ]
> +int airoha_qdma_xmit_skb(struct airoha_gdm_dev *dev, struct sk_buff *skb,
> +			 u32 msg0, u32 msg1, u32 msg2)
> +{
[ ... ]
> +	while (true) {
> +		struct airoha_qdma_desc *desc =3D &q->desc[index];
> +		skb_frag_t *frag =3D &skb_shinfo(skb)->frags[i];
> +		dma_addr_t addr;
> +		u32 val;
> +
> +		addr =3D dma_map_single(netdev->dev.parent, data, len,
> +				      DMA_TO_DEVICE);

[Severity: High]
This is a pre-existing issue copied into this new function (and also present
in airoha_dev_xmit), but does using dma_map_single() with skb_frag_address()
risk mapping failures or kernel panics on systems with high memory?

On architectures with HIGHMEM, page_address() returns NULL for pages not
mapped into the kernel's virtual address space. Calling dma_map_single() on
a NULL address could map garbage or trigger a kernel oops. Should this use
skb_frag_dma_map() instead?

[ ... ]
> @@ -2293,13 +2779,24 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff=
 *skb,
>  		q->txq_stopped =3D true;
>  	}
> =20
> -	if (netif_xmit_stopped(txq) || !netdev_xmit_more())
> +	if (netif_xmit_stopped(txq) || !netdev_xmit_more() ||
> +	    soe_decrypt_skb)
>  		airoha_qdma_rmw(qdma, REG_TX_CPU_IDX(qid),
>  				TX_RING_CPU_IDX_MASK,
>  				FIELD_PREP(TX_RING_CPU_IDX_MASK, index));
> =20
>  	spin_unlock_bh(&q->lock);
> =20
> +	/* SOE decrypt flow binding needs the final egress netdev and QDMA
> +	 * descriptor context. The SOE RX path marks only candidate packets; bi=
nd
> +	 * only after the current plaintext packet has been queued and kicked so
> +	 * the newly bound decrypt entry cannot race the CPU-transmitted packet.
> +	 */
> +#if IS_REACHABLE(CONFIG_NET_AIROHA_SOE)
> +	if (soe_decrypt_skb)
> +		airoha_ppe_soe_xmit_skb(&dev->eth->ppe->dev, skb, netdev);
> +#endif
> +
>  	return NETDEV_TX_OK;

[Severity: High]
Could this cause a use-after-free by accessing the skb after it has been
handed off to the hardware?

Once the transmission queue spinlock is released and the hardware doorbell
is kicked via airoha_qdma_rmw(), the skb ownership is fully transferred.
The transmission could complete concurrently on another CPU, which would
invoke dev_kfree_skb_any(skb) in the TX completion handler before
airoha_ppe_soe_xmit_skb() is able to safely access skb->mark.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614040032.1567=
994-1-hurryman2212@gmail.com?part=3D5
