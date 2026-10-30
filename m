Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793336061;
	b=nu32Ru+ETza2HYwrY+ctsnbFLYahTRZO4PMtnKINBMCLYZsV/DgsqeuY6qpo9ywXf5lq
	 Qs3FCNB/WzXp+/Rv3SB/Jd2h8VWODR+plyeQn/IFlw6s+S/m3cK9wrgpSSO4cNNexUZvN
	 ad4NDH6/suNfA+xqy3s/v42jM3lTyAxKytoOIDisQQmfDk2uTmMXvO3ll3pTWWS6ViNvI
	 JlMojiQYCaMM33BN9mtTAZ05aybHw3hUEKe0BRmcTQQQS9nlPc4LbHoqmW6Kni3LrpVy0
	 3Ly3zW773WPiUDDBztQGllC2EX1DdtHhohpbkti6CZlyYg/JPbiVgqmzEA1WCyUlyag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793336061;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=B1M3JiX8+u6+IcSTv3oOn5wztYPfM/QprG0tjx2NdNI=;
	b=DvYta3x7/BrEH3tAfpEQVZTdMhtCsup6oTLNkdHzGwAClBljvlV3ofhgoUDpJ5Xo0FU7
	 NxZKHYcYMi9kzyCZKwLEi4cXaNCZDJbz5D4pq4mWvhsSE3u0Sm/7IA1LarY7fNHq4y9Sn
	 cw0c7HapiHuKuZoJOSg3bZ+OwBAtqQxSzlB2ayYwmVSG7PZmZ++FYbOk+u5LGAh3X28Nz
	 zm5pij+rHOBSUGIODNob6EDHqsLTlI13lZKxTXWUoSoK8Dhh3tMejz3xOAuOwFoEzorCN
	 3cho3yy/+YXCR4YoFPotxTPlXFooGgYqtX5GPkjiheE9zAJc+kczAXEXlEfJCH5H7Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqyAqPM8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E85F606A320
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 04:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FqyAqPM8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FDD41F000C1;
	Fri, 30 Oct 2026 04:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793336061;
	bh=B1M3JiX8+u6+IcSTv3oOn5wztYPfM/QprG0tjx2NdNI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqyAqPM8qik7Ca8NXg5GudVs3bLznOSDPPWGmPVP83SoOtU0njifQSecZ8g1ZPkKY
	 IuhA179BITCcxeQ12fjZNjN0OsEWUGGVv68Adg3wpblz5Jmpam/qFuZ4JzD5Ra+Wov
	 SuMzMCoMK4PVeV5xkElG8dc4lYt62vPh5qMXGKquPQMSQjarta7BBy5Lq3hih3d38Y
	 iJLsJ6/jnJuwOs0wrUOMV+YjCxsrRk0GFO/bxibiWx2ITH4I5OxjCx222IFKA6jRsR
	 MDjTYwgx7UB3Pd8XQ7gNa8z3eynfHByRmZ8c8UDfhdY37XPHEZrkD0M/0+m35gr1LB
	 Xqpf0qV8aWHVw==
Message-ID: <sashiko-outbox-190434@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 03/12] net: airoha: Introduce airoha_gdm_dev
 struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511-airoha-eth-multi-serdes-v6-3-c899462c4f75@kernel.org>
References: <20260511-airoha-eth-multi-serdes-v6-3-c899462c4f75@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 04:54:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free (UAF) of Device Tree Node
- [High] Incorrect `real_num_tx_queues` bounds accounting in HTB offload co=
mpletely breaks QoS
- [High] Missing linear packet bounds check in `airoha_get_dsa_tag()` leads=
 to out-of-bounds memory accesses and kernel panics
- [High] Off-by-one Error in HTB Queue Rate Limit Teardown leaves rate limi=
t active
--

commit f41fe0c0ac52b8a3d4e79ff54502343df0bc05cd
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Introduce airoha_gdm_dev struct

EN7581 and AN7583 SoCs support connecting multiple external SerDes to GDM3
or GDM4 ports via a hw arbiter that manages the traffic in a TDM manner.
As a result multiple net_devices can connect to the same GDM{3,4} port
and there is a theoretical "1:n" relation between GDM port and
net_devices.
Introduce airoha_gdm_dev struct to collect net_device related info (e.g.
net_device and external phy pointer). Please note this is just a
preliminary patch and we are still supporting a single net_device for
each GDM port. Subsequent patches will add support for multiple net_devices
connected to the same GDM port.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 3fe2561c85f17..18a89de4d58ab 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -2009,7 +2022,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  	u8 fport;
> =20
>  	qid =3D airoha_qdma_get_txq(qdma, skb_get_queue_mapping(skb));
> -	tag =3D airoha_get_dsa_tag(skb, dev);
> +	tag =3D airoha_get_dsa_tag(skb, netdev);

This problem wasn't introduced by this patch, but does this function call l=
ead
to out-of-bounds memory accesses?

In airoha_get_dsa_tag(), the code blindly executes
memmove(skb->data + MTK_HDR_LEN, skb->data, 2 * ETH_ALEN) and
__skb_pull(skb, MTK_HDR_LEN) under the assumption that the linear area
contains at least 16 bytes.

Calling skb_cow_head(skb, 0) only ensures headroom, it does not linearize
the packet. A local attacker using a raw socket can inject heavily fragment=
ed
packets where the linear region is extremely small. In such cases, the memm=
ove
will overwrite and corrupt adjacent kernel memory, and __skb_pull() will
trigger a bug because it drops skb->len below skb->data_len.

Could a pskb_may_pull() check be added before accessing or modifying the
headers?

[ ... ]
> @@ -2605,9 +2627,10 @@ static int airoha_tc_htb_alloc_leaf_queue(struct n=
et_device *dev,
>  	if (opt->command =3D=3D TC_HTB_NODE_MODIFY)
>  		return 0;
> =20
> -	err =3D netif_set_real_num_tx_queues(dev, num_tx_queues + 1);
> +	err =3D netif_set_real_num_tx_queues(netdev, num_tx_queues + 1);

This problem wasn't introduced by this patch, but does this incorrect bounds
accounting in HTB offload break QoS?

The mapped queue index is calculated as channel =3D TC_H_MIN(opt->classid) %
AIROHA_NUM_QOS_CHANNELS, and opt->qid is set to AIROHA_NUM_TX_RING + channel
(which can be up to 11).

However, the driver tracks active queues by simply incrementing the limit b=
y 1
via netif_set_real_num_tx_queues(netdev, num_tx_queues + 1). If a user
specifies a non-sequential or sparse class ID that resolves to a high chann=
el
index, the generated qid will exceed real_num_tx_queues.

When traffic hits this class, the core networking stack detects an
out-of-bounds queue mapping, emits a warning, and forces the traffic to que=
ue
0, thereby completely breaking the hardware QoS offload.

[ ... ]
> @@ -2794,47 +2819,51 @@ static int airoha_dev_setup_tc_block(struct net_d=
evice *dev,
>  	}
>  }
> =20
> -static void airoha_tc_remove_htb_queue(struct net_device *dev, int queue)
> +static void airoha_tc_remove_htb_queue(struct net_device *netdev, int qu=
eue)
>  {
> -	struct airoha_gdm_port *port =3D netdev_priv(dev);
> +	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> +	struct airoha_gdm_port *port =3D dev->port;
> =20
> -	netif_set_real_num_tx_queues(dev, dev->real_num_tx_queues - 1);
> -	airoha_qdma_set_tx_rate_limit(dev, queue + 1, 0, 0);
> +	netif_set_real_num_tx_queues(netdev, netdev->real_num_tx_queues - 1);
> +	airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);

This problem wasn't introduced by this patch, but does this leave the rate
limit active due to an off-by-one error?

The driver attempts to clear the hardware rate limit for a removed QoS queu=
e by
calling airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0). However,
during creation in airoha_tc_htb_alloc_leaf_queue(), the rate limit was
properly configured on channel (which has the exact same value as queue).

Clearing queue + 1 instead of queue appears to leave the deleted queue's ra=
te
limit fully active while silently breaking the rate limit of the adjacent
queue.

[ ... ]
> +static int airoha_alloc_gdm_device(struct airoha_eth *eth,
> +				   struct airoha_gdm_port *port,
> +				   struct device_node *np)
> +{
> +	struct airoha_gdm_dev *dev;
> +	struct net_device *netdev;
> +	int err;
> +
> +	netdev =3D devm_alloc_etherdev_mqs(eth->dev, sizeof(*dev),
> +					 AIROHA_NUM_NETDEV_TX_RINGS,
> +					 AIROHA_NUM_RX_RING);
> +	if (!netdev) {
> +		dev_err(eth->dev, "alloc_etherdev failed\n");
> +		return -ENOMEM;
> +	}
> +
> +	netdev->netdev_ops =3D &airoha_netdev_ops;
> +	netdev->ethtool_ops =3D &airoha_ethtool_ops;
> +	netdev->max_mtu =3D AIROHA_MAX_MTU;
> +	netdev->watchdog_timeo =3D 5 * HZ;
> +	netdev->hw_features =3D NETIF_F_IP_CSUM | NETIF_F_RXCSUM | NETIF_F_TSO6=
 |
> +			      NETIF_F_IPV6_CSUM | NETIF_F_SG | NETIF_F_TSO |
> +			      NETIF_F_HW_TC;
> +	netdev->features |=3D netdev->hw_features;
> +	netdev->vlan_features =3D netdev->hw_features;
> +	netdev->dev.of_node =3D np;

This problem wasn't introduced by this patch, but does this lead to a
use-after-free of the device tree node?

In airoha_probe(), the code iterates over child nodes using the
for_each_child_of_node() macro, which automatically acquires and releases
reference counts on the child nodes during iteration:

airoha_probe()
    for_each_child_of_node(pdev->dev.of_node, np)
        ...
        airoha_alloc_gdm_port(eth, np)
            airoha_alloc_gdm_device(eth, port, np)

Inside airoha_alloc_gdm_device(), np is directly assigned to
netdev->dev.of_node without calling of_node_get(np).

Once the loop advances or terminates, the reference to the node is implicit=
ly
dropped. If device tree overlays are dynamically removed, netdev->dev.of_no=
de
becomes a dangling pointer.

Could of_node_get() be called before assignment to ensure the reference
is held?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-airoha-eth=
-multi-serdes-v6-0-c899462c4f75@kernel.org?part=3D3
