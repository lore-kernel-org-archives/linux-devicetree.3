Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4A32E414
	for <devicetree@vger.kernel.org>; Sun, 17 May 2026 05:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778997493; cv=none; b=koL77l1c5/ILI36KNFX8GBsYdOjeEyoTQFgUQma10Zn+7mWiM8yIDt+lBGXL2OCP098Ix1sS/i7RM3Jdq6cpvmPNwzb1qRe33Q7WdHZ6Xc8wRtDMdyXfYi8dCMQCVfixGeTj+VavXv7ZZx/ahymVp4l9+TtadIfcBTDqHtu2ft0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778997493; c=relaxed/simple;
	bh=7gAUi8FVjagQYymkXNoNXbR03Wmfkp6d3fjy73V9EvA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TrgPOMWMM3WMrRxVdlVWKY0RScZuKxZHehc1HX4hPtS4vFU1T297izXkQRNtixW6QxxXS+m6i0WOnLWxocsyUXyIjX0XhjFBF2y+vcewfzsluzrNNaiwMkJjx8n97USIKyVLmza4VpV051RVGAdrlz1TCrtPdCvwfMVl+A2vD8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R18dX0Dr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R18dX0Dr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC33C2BCB0;
	Sun, 17 May 2026 05:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778997493;
	bh=7gAUi8FVjagQYymkXNoNXbR03Wmfkp6d3fjy73V9EvA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=R18dX0Drn6mmXEFzHTOz557pfVO7rSVtUYyRqLMwpGAzHd5H09EmReL5t2zBQtKVb
	 UkHaaKj38gHQAS7deGuNxv3CR8+E8Woi1GtENIL7g6oE7iD4hdCm/ZuDVn1AImAau2
	 o7nkAegJrqUEAqcBJHCJN2GMN0aWzVnNX1koLwHGrVLZYRBydiPKYAs4Qzd5Mr44dd
	 EuMaZRCuDNOFDLrgWxZSlQF2TA+mnfoLmDHQ0aBgAAYj9QTsCKSJIV3+Q5j759bNrD
	 nmJWuOSiJE2Rk8XmyJO4bp7E9AnzoK6yrRO7hRV3M45bQubh/mwIYAR9vYrAjEWMtX
	 vkv+8jmRDwOFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 02/10] net: airoha: Introduce airoha_gdm_dev
 struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260516-airoha-eth-multi-serdes-v7-2-99e0093303e2@kernel.org>
References: <20260516-airoha-eth-multi-serdes-v7-2-99e0093303e2@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 17 May 2026 05:58:12 +0000
Message-Id: <20260517055812.CEC33C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch introduces a race condition exposing a partially initial=
ized port, leading to a NULL pointer dereference in NAPI polling handlers.
- [High] The `airoha_get_dsa_tag` function lacks packet length validation b=
efore stripping the MTK DSA tag, leading to an out-of-bounds memory access =
and `skb->len` integer underflow.
--

commit 3474bcc37d20c84839dc4e74bab44197a0507f51
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Introduce airoha_gdm_dev struct

This commit introduces the airoha_gdm_dev structure to collect net_device
related info, preparing the driver for a 1:n relationship between GDM ports
and net_devices.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 5a027cc7ffcb1..3ca0dbd19275a 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c

[ ... ]

> @@ -2007,7 +2020,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  	u8 fport;
> =20
>  	qid =3D airoha_qdma_get_txq(qdma, skb_get_queue_mapping(skb));
> -	tag =3D airoha_get_dsa_tag(skb, dev);
> +	tag =3D airoha_get_dsa_tag(skb, netdev);

While looking at this patch, I noticed an issue in airoha_get_dsa_tag() that
pre-exists in the code. Does this function lack packet length validation
before pulling the MTK DSA tag?

airoha_get_dsa_tag() unconditionally performs memmove() and __skb_pull():

        memmove(skb->data + MTK_HDR_LEN, skb->data, 2 * ETH_ALEN);
        __skb_pull(skb, MTK_HDR_LEN);

If an unprivileged user sends an undersized packet via a raw socket
(AF_PACKET), could this result in an out-of-bounds memory access and cause
skb->len to integer-underflow?

This could lead to dma_map_single() attempting to map a massive amount of
memory, potentially causing an IOMMU fault and a local denial-of-service.

[ ... ]

> @@ -2975,53 +3060,22 @@ static int airoha_alloc_gdm_port(struct airoha_et=
h *eth,
>  		return -EINVAL;
>  	}
> =20
> -	dev =3D devm_alloc_etherdev_mqs(eth->dev, sizeof(*port),
> -				      AIROHA_NUM_NETDEV_TX_RINGS,
> -				      AIROHA_NUM_RX_RING);
> -	if (!dev) {
> -		dev_err(eth->dev, "alloc_etherdev failed\n");
> +	port =3D devm_kzalloc(eth->dev, sizeof(*port), GFP_KERNEL);
> +	if (!port)
>  		return -ENOMEM;

[ ... ]

> -	port =3D netdev_priv(dev);
>  	u64_stats_init(&port->stats.syncp);
>  	spin_lock_init(&port->stats.lock);
> -	port->eth =3D eth;
> -	port->dev =3D dev;
>  	port->id =3D id;
>  	/* XXX: Read nbq from DTS */
>  	port->nbq =3D id =3D=3D AIROHA_GDM3_IDX && airoha_is_7581(eth) ? 4 : 0;
>  	eth->ports[p] =3D port;
> =20
> -	return airoha_metadata_dst_alloc(port);
> +	err =3D airoha_metadata_dst_alloc(port);
> +	if (err)
> +		return err;
> +
> +	return airoha_alloc_gdm_device(eth, port, np);
>  }

Could an interrupt cause a NULL pointer dereference in the NAPI handlers?

Since NAPI is enabled earlier in airoha_probe() via airoha_qdma_start_napi(=
),
and eth->ports[p] is assigned here before airoha_alloc_gdm_device() populat=
es
port->dev, NAPI handlers like airoha_qdma_rx_process() could see a NULL
port->dev:

airoha_qdma_rx_process()
        ...
        port =3D eth->ports[p];
        netdev =3D port->dev->dev;

I note that this issue is fixed later in the series by commit 68e8fa8fe0224
("net: airoha: Support multiple net_devices for a single FE GDM port"), whi=
ch
changes port->dev to an array and adds proper NULL checks.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260516-airoha-eth=
-multi-serdes-v7-0-99e0093303e2@kernel.org?part=3D2
