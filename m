Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F1F31D75E
	for <devicetree@vger.kernel.org>; Wed, 20 May 2026 08:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779267570; cv=none; b=hb+6EFi4+H4oxtpOQLb0AxOmtHu5yD9FL3cMsdjtsMZ21ca/C3bxP9l/MK4nsmohHDBLmCLoMMil2P8hnBFrafh9fC/IrBCfRcxOlbYxcaD5LLkYYn08bvCbVckpo2vvakTgxwN6zoWzUzOmnPuT3NUj77VF4N3KqkKc6Yzaiyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779267570; c=relaxed/simple;
	bh=NCBwtpJSdDR/tycjVeNQ1lyLRXRC3zmzbOXt28qtAm0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PrSF9zyYxGvv8r0ruUjBTwSHLi0euSU4oKZtci7+veE4cAE+Fsnox4eg13c3Xpnx0JrcqKNjk2ia1kzx6DklHrBJl1Eiu2V9zSsDmzOYdA/rQNgYz0hzUm4c4RdtzHipFf9DzdwRSnNe7xgaZKAGkG9uAzXJzIAfe/CE9CRhHYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=liqjLrEz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="liqjLrEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97A481F000E9;
	Wed, 20 May 2026 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779267566;
	bh=VvJusjImul0ubTizG8oOgENdLD9MicVrQefw085mnI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=liqjLrEz1oR5rXBhRPn/osjw5TdRuuIPC8uHfYzb9BDURAXrXs+AzZyXNRPTj9/1N
	 fF7k7ANGD942iHiG3ubf0PLDEJVN8Ltx7hz93QREmaV+xGPzl9IRIP+V3+lRuOWUaw
	 rxns4F6yA7NF5PkwF2FQullY0tSM4j5ymvW2Y68d/vvCpiVzIPmnL/piKIVtFiXm76
	 qKduXV3ryaLrCymYss9fX9+E+qAXRt+eiP2OSWyIXM9Uy7HLXOpYj5xHdYit7TTIBa
	 VHgRtviflhzLM20knjAIoM5yikaGGM4PdRz1rPJM59MsZcGivWIK5zI9I8Zi5FCamI
	 4cDrbcRkMWVZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v8 05/10] net: airoha: Move qos_sq_bmap in
 airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260519-airoha-eth-multi-serdes-v8-5-6bd70e329df6@kernel.org>
References: <20260519-airoha-eth-multi-serdes-v8-5-6bd70e329df6@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 08:59:25 +0000
Message-Id: <20260520085926.97A481F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Off-by-one in airoha_tc_remove_htb_queue() clears the hardware rat=
e limit of the wrong QDMA channel, corrupting cross-device shared state.
- [High] Dynamic real_num_tx_queues accounting causes out-of-bounds queue i=
ndices and bypasses hardware QoS entirely.
--

commit cfd982e85e1dc0ffc8dc017589e1128ecce7248e
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move qos_sq_bmap in airoha_gdm_dev struct

This commit moves the qos_sq_bmap field from airoha_gdm_port to
airoha_gdm_dev to prevent overwriting configurations from multiple
net_devices sharing the same GDM port. It also introduces
qos_channel_map in airoha_qdma to track shared QDMA channel usage.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 847f432b0a2b0..594fbebcb12ce 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> +static int airoha_tc_htb_alloc_leaf_queue(struct net_device *netdev,
> +					  struct tc_htb_qopt_offload *opt)
> +{
> +	u32 channel =3D TC_H_MIN(opt->classid) % AIROHA_NUM_QOS_CHANNELS;
> +	int err, num_tx_queues =3D netdev->real_num_tx_queues;
[ ... ]
>  	err =3D netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);
>  	if (err) {
[ ... ]
> -	set_bit(channel, port->qos_sq_bmap);
> +	set_bit(channel, dev->qos_sq_bmap);
>  	opt->qid =3D AIROHA_NUM_TX_RING + channel;

Can this dynamic real_num_tx_queues accounting cause out-of-bounds queue
indices?

The driver tracks allocated QoS leaf queues by incrementing
dev->real_num_tx_queues by 1. However, the assigned hardware queue index is
derived from a sparse hash of the user-provided classid.

If a user allocates a non-sequential classid that hashes to a higher channel
number while having only a few queues active, won't opt->qid exceed the
incremented dev->real_num_tx_queues?

During transmission, would netdev_core_pick_tx() then detect this
out-of-bounds queue mapping, reset the queue index, and route the traffic to
the default ring 0, silently bypassing the hardware HTB rate limits?

[ ... ]
>  static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_qdma *qdma =3D dev->qdma;
> =20
>  	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
>  	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);

Is there an off-by-one error when clearing the hardware rate limit here?

The queue + 1 offset causes it to clear the configuration of the adjacent
channel instead of the one actually being deleted, as the allocation path
uses channel without the offset.

Since this patch enables multiple net_devices to share the same QDMA block,
could clearing queue + 1 silently destroy the active hardware QoS
configuration belonging to a completely different net_device?

Does this also leave the rate limit for the actual deleted queue active,
and potentially cause an out-of-bounds register write if the deleted queue =
is
the maximum channel index (15)?

> -	clear_bit(queue, port->qos_sq_bmap);
> +
> +	clear_bit(queue, qdma->qos_channel_map);
> +	clear_bit(queue, dev->qos_sq_bmap);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-airoha-eth=
-multi-serdes-v8-0-6bd70e329df6@kernel.org?part=3D5
