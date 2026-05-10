Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179E39A07E
	for <devicetree@vger.kernel.org>; Sun, 10 May 2026 14:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778421904; cv=none; b=L85XG8i9GCYenCZN+Mgyy5p30Hey+4N3KXN2RGh8MWdn2ymdAJeCZY0zE5nE3/Ue2DychrLtMB9xt2pYVWb6RO8dq8PYplyhFUSV6u8iL6Mp7/gZB+IUwPq/jhvBDcp6WmyNbyqWGc02Vvkx0xTv5Og2r3MmDFioo1t3asAHeCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778421904; c=relaxed/simple;
	bh=P7cjRv2d8UtYD+iMnNWVeRFz5R0yqx+rADbkuLGPE3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ufCYS/YfmarpP3B1MD1uFFgPFjKeOg9Qo3knbtlZgF6AW8CMmeAnu9/mHMQmmbhmOcEJJXsQUKWsp9wITTmmai4MFdY//TnEjtOkJhOAFal844DPydDNRKUohroLmhP7wxxIRShWZIXGUyrZ7/yT/BkAOJwzbAf+5Wer2bU9bXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lz5ZahK/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lz5ZahK/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5A6C2BCC9;
	Sun, 10 May 2026 14:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778421904;
	bh=P7cjRv2d8UtYD+iMnNWVeRFz5R0yqx+rADbkuLGPE3g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Lz5ZahK/d4WLYA138HAKRkzw6Kiari2rB1wKyXjamIow6BePHqK7Z8Q+mmX7R45so
	 af7boktucrGFTCVTbzCde3auWdPp8hUsAgTUwUjY4JCHbXi55nmGkZ5Nnjx/t+lq8H
	 m75613ymYuWMrxdmidzkA4kXkJJR1hxEHL/J+N4eTCllSxb5Sn97xB37BxackYKi9p
	 yp8Gc5HXxeOw8JqUWQ03ntebW9EdaeQPNmymjD5m4BRVNPB3lPnpkVwebKt89FZhYK
	 jLVOrhia+rDiL5M2GE6iEjBBdH0LJr6IXzja4zT7CvoB5PPtWYKt936USj8cb8RStg
	 KFgMXAIeL6fVg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 06/12] net: airoha: Move qos_sq_bmap in
 airoha_gdm_dev struct
Reply-To: sashiko@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260509-airoha-eth-multi-serdes-v5-6-805e38edc2aa@kernel.org>
References: <20260509-airoha-eth-multi-serdes-v5-6-805e38edc2aa@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 10 May 2026 14:05:03 +0000
Message-Id: <20260510140504.5D5A6C2BCC9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] HTB node modification unconditionally fails with -EBUSY and its er=
ror path can silently corrupt global channel ownership.
- [High] Hardware teardown failures cause a permanent leak of shared QDMA c=
hannels.
--

commit 1b146a034660fa016267e6a142564dd1ddeb17b1
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct

This commit moves the qos_sq_bmap field from airoha_gdm_port to airoha_gdm_=
dev
to prevent configuration overwrites when multiple net_devices share a GDM p=
ort.
It also adds a qos_channel_map bitmap to airoha_qdma to track shared QDMA
channels.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index f9cb49f0529a0..33a0f7b98d52e 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2606,19 +2606,28 @@ static int airoha_tc_htb_alloc_leaf_queue(struct =
net_device *netdev,
>  	u32 rate =3D div_u64(opt->rate, 1000) << 3; /* kbps */
>  	int err, num_tx_queues =3D netdev->real_num_tx_queues;
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> =20
>  	if (opt->parent_classid !=3D TC_HTB_CLASSID_ROOT) {
>  		NL_SET_ERR_MSG_MOD(opt->extack, "invalid parent classid");
>  		return -EINVAL;
>  	}
> =20
> +	/* Here we need to check the requested QDMA channel is not already
> +	 * in use by another net_device running on the same QDMA block.
> +	 */
> +	if (test_and_set_bit(channel, qdma->qos_channel_map)) {
> +		NL_SET_ERR_MSG_MOD(opt->extack,
> +				   "qdma qos channel already in use");
> +		return -EBUSY;
> +	}
> +

Since this function handles both TC_HTB_LEAF_ALLOC_QUEUE and
TC_HTB_NODE_MODIFY, won't the bit already be set in qdma->qos_channel_map
for modify operations?

If so, will modify operations now always fail with -EBUSY here,
breaking HTB rate limit updates?

>  	err =3D airoha_qdma_set_tx_rate_limit(netdev, channel, rate,
>  					    opt->quantum);
>  	if (err) {
>  		NL_SET_ERR_MSG_MOD(opt->extack,
>  				   "failed configuring htb offload");
> -		return err;
> +		goto error;
>  	}
> =20
>  	if (opt->command =3D=3D TC_HTB_NODE_MODIFY)
> @@ -2630,13 +2639,17 @@ static int airoha_tc_htb_alloc_leaf_queue(struct =
net_device *netdev,
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
> =20
>  	return 0;
> +error:
> +	clear_bit(channel, qdma->qos_channel_map);
> +
> +	return err;
>  }

If a modify operation (TC_HTB_NODE_MODIFY) fails at
airoha_qdma_set_tx_rate_limit(), it jumps to the error label.

Won't this unconditionally clear the bit in the shared qdma->qos_channel_ma=
p?

Could this accidentally release ownership of the shared QDMA channel while
the device is still using it, allowing another net_device to claim it?

[ ... ]

> @@ -2814,14 +2827,28 @@ static int airoha_dev_setup_tc_block(struct net_d=
evice *dev,
>  	}
>  }
> =20
> -static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
> +static int airoha_tc_remove_htb_queue(struct net_device *netdev, int que=
ue)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> +	int err;
> =20
> -	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
> -	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
> -	clear_bit(queue, port->qos_sq_bmap);
> +	err =3D netif_set_real_num_tx_queues(netdev,
> +					   netdev->real_num_tx_queues - 1);
> +	if (err)
> +		return err;
> +
> +	err =3D airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
> +	if (err) {
> +		netif_set_real_num_tx_queues(netdev,
> +					     netdev->real_num_tx_queues + 1);
> +		return err;
> +	}
> +
> +	clear_bit(queue, qdma->qos_channel_map);
> +	clear_bit(queue, dev->qos_sq_bmap);
> +
> +	return 0;
>  }

If a hardware teardown failure occurs and airoha_tc_remove_htb_queue()
returns early with an error, the bits in qdma->qos_channel_map and
dev->qos_sq_bmap are never cleared.

>  static int airoha_tc_htb_destroy(struct net_device *netdev)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
>  	int q;
> =20
> -	for_each_set_bit(q, port->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS)
> -		airoha_tc_remove_htb_queue(netdev, q);
> +	for_each_set_bit(q, dev->qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS) {
> +		int err;
> +
> +		err =3D airoha_tc_remove_htb_queue(netdev, q);
> +		if (err)
> +			return err;
> +	}
> =20
>  	return 0;
>  }

In this loop, an error on a single queue immediately aborts the loop, leavi=
ng
any remaining queues unprocessed.

Since the core networking stack (net/sched/sch_htb.c) ignores the return va=
lue
of TC_HTB_DESTROY and fully destroys the software qdisc regardless, will th=
is
permanently leak the limited QDMA hardware channels?

Could these bits remain set forever in the globally shared qdma->qos_channe=
l_map,
preventing other net_devices from using them until the driver is reloaded?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260509-airoha-eth=
-multi-serdes-v5-0-805e38edc2aa@kernel.org?part=3D6
