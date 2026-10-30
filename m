Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336063;
	b=SxSUyjr+FRk/uefEvuTX59SgaAEFybDTyibtwdkhPUDRw/vRPlR+fSEQtTDYL8nM0Vyp
	 vWo9YXHC4md5d4553rJiTMNqbhMYkBBLeU1y3fKyTlB+URCiKUQ1lrinBjKBK4WWNjjCq
	 c03FpWeMk8baM1jwXZ//QN1CynG33IqVC5ZtxdiQQmDADCMcuBjcFWsSrKfw6JEZUzrXL
	 9kOD3nYcacBuQrFP/73HRiEe7VwlsXWS5qCltfr91TBB+ZBxOvMNPE8j7IQ1k0eDQfABM
	 PlvfP2VfCqM3w/a/hP+ep5Y2D5x9spxCO9/a0UfAfU5kMWpg8fEVmQx5QjPadBabt/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336063;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=3R+UKfY7ybRtS/CC40nQd9kjaOrNkYHCRL+oLNKUunA=;
	b=QJQ+zCaaDLBJfE2Y66FuGWMfii33T1HdsIpXY8QNlIiZMiCm2/r+c08XFfomF5sFN/mR
	 pYTEdcXxcyjwud6GyYqReFwaEiQYriasAyD2i3K0uYvVWBGja12EZqlzAEViN2WEioFVp
	 Kf80kCnEE+c6NYdVa4ERB7+i5MkXx7juG08yQLIyFiYYJpDL9QCkEPtyFuXQ1oAGhA2th
	 uujz+KeW/CoTrzkorS+40U1pC6bW8J2gXS2JcnWT0EKrHeXlzA27Fo0mSd07Ix6XxHFnx
	 RJqWmlj2aRKAU3UDeYGVtWHWkGehv975dMk8sL5AbtOYWGwbgiqwaIFC8D8eZvKtJxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DI9WWFOp;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3DEB606A329
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DI9WWFOp
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4250A1F00A02;
	Fri, 30 Oct 2026 04:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336062;
	bh=3R+UKfY7ybRtS/CC40nQd9kjaOrNkYHCRL+oLNKUunA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DI9WWFOp41Vhk8t1UkmxJaLyid0ScNcZhxZVxJFrr3NAL6YY2bclbFTYtdHPqT6Tq
	 CfWW7zF4pEpG3sa3b5Hrf40ickuwCJxWVKSrjRyZnKmV9mywdOalmqwN3hGL+pKkhx
	 cAc9RGtSwxVKAZNc7vNX3GFWiQOY/guP3rh2V8/sxhEQtd6B5kvQq0NjbJoBIy70do
	 jqBaZOc0TCx6vYyrVZhR+S/Ji3KBsDdafoHXOK8RRhkyUmE8y7ABu56sUg0RT6ow69
	 JsSa+RV7mH/goePC83ho0vc/Teyf59CZfv4qeyLWHNnpEZ8AC5AJywIyjrZWvpS/Ay
	 c8pN1lWU0pRFw==
Message-ID: <sashiko-outbox-190437@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 06/12] net: airoha: Move qos_sq_bmap in
 airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-6-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-6-c899462c4f75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:21 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] airoha_tc_remove_htb_queue clears the hardware rate limit of the a=
djacent channel (queue + 1), causing cross-device hardware state corruption.
- [High] Sharing the QDMA channel map across multiple net_devices causes ou=
t-of-bounds hardware queue mapping, breaking QoS offload for shared interfa=
ces.
--

commit a62c80a3809597019ce054166de6b12dd6418295
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct

This commit moves the qos_sq_bmap field to airoha_gdm_dev and adds a shared
qos_channel_map bitmap to airoha_qdma to prevent multiple net_devices from
overwriting the QDMA configuration of shared ports.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -2599,44 +2599,61 @@ static int airoha_qdma_set_tx_rate_limit(struct n=
et_device *netdev,
[ ... ]
> +static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
> +					  struct tc_htb_qopt_offload *opt)
> +{
> +	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
> +	int err, num_tx_queues =3D netdev->real_num_tx_queues;
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct airoha_qdma *qdma =3D dev->qdma;
> +
> +	/* Here we need to check the requested QDMA channel is not already
> +	 * in use by another net_device running on the same QDMA block.
> +	 */
> +	if (test_and_set_bit(channel, qdma->qos_channel_map)) {
[ ... ]
>  	err =3D netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
>  	if (err) {
>  		airoha_qdma_set_tx_rate_limit(netdev, channel, 0,
>  					      opt->quantum);
>  		NL_SET_ERR_MSG_MOD(opt->extack,
>  				   "failed setting real_num_tx_queues");
> -		return err;
> +		goto error;
>  	}
> =20
> -	set_bit(channel, port->qos_sq_bmap);
> +	set_bit(channel, dev->qos_sq_bmap);
>  	opt->qid =3D AIROHA_NUM_TX_RING + channel;

If qos_channel_map is shared across multiple net_devices, a secondary device
might be forced to use a non-zero channel index (e.g., channel 1) for its
first allocated QoS queue.

Because the device's real_num_tx_queues is only incremented by 1, will the
assigned qid end up being greater than or equal to real_num_tx_queues?

If qid >=3D real_num_tx_queues, will the kernel's netdev_cap_txqueue()
intercept the out-of-bounds queue index and redirect the traffic to queue 0,
breaking hardware QoS routing for the secondary device?

> =20
>  	return 0;
[ ... ]
> @@ -2817,11 +2834,13 @@ static int airoha_dev_setup_tc_block(struct net_d=
evice *dev,
>  static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> =20
>  	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
>  	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);

In airoha_tc_remove_htb_queue(), the hardware rate limit is cleared using
queue + 1 instead of the actual queue index.

With the new shared QDMA model introduced in this patch, if a device frees
its channel (e.g., channel 0), will this leave channel 0 active while
erroneously clearing the rate limit of channel 1?

Could this corrupt the QoS configuration of adjacent channels that are
actively owned by other devices sharing the same QDMA block?

> -	clear_bit(queue, port->qos_sq_bmap);
> +
> +	clear_bit(queue, qdma->qos_channel_map);
> +	clear_bit(queue, dev->qos_sq_bmap);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-airoha-eth=
-multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D6
