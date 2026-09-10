Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE8835200F
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 21:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789075473; cv=none; b=ehoCW299ru7TgEMs/7nZFw4n09I1DA4/gQ3pvM3jIFn70rMwF08h1I/NvbW7q0xU0oVWBNQii3X9NWoQDJAVm2jpni9DEvScz07yOA0xxJUMalvFR4gbJX29KWyLnmqXJf2DJQ+g8a4LsAl4urUO+o85hki9XLkj9cVJFn+GnQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789075473; c=relaxed/simple;
	bh=7yGZV59MTRuUKaSkSky2bFx1cI/3vCx27NLlj2aLczY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uGff5t39/t+tSp2ymAur3oir/zesCb30vif3Pv/yYLEwT6Vv9ppVfHRcj3gb4QX71etYWc7DvIi8ZxD0+7h74w/nr07XnE6D2j7KmpYbtRohtahWAnditO0mHxv1l5fxgaAuAeTufqap/UwViNgySt3yzMdpylyADyvmzBhqPfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K2HSwM4C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K2HSwM4C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC3461F00893;
	Thu, 10 Sep 2026 21:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789075471;
	bh=3sdCQbFoVDoRDeazxlGvq0alGrA6p9obU4bCwis6GBY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=K2HSwM4CFuXg9+Us5r2zidIKZNWgnIwmoyi2oyK3HCLhJ0pjpWAU8qyhYohh0VSb/
	 6J54FETvVN9KbyMV2IwfcrshRtJLCZzZ52ScB9g6voKigd4cXT7X0Jc5h8rqBXpM8n
	 7C3e2tAR62y2+mUP3iKM+Fz1KUW3uy58+LSZvEstWZ5JxQVB8AKpNHPRjhMCx92W7P
	 FbQp8kpYSy7+BzQAuMR7nI4/Z3TDmbwmTbX1cZlxv1QTq92uFZBlOgcQV/gdAF92c9
	 KSMBt1hBUAf0dm3go1Pq6dij2PEys5PpoJkIMKGveyQCI37oz2JJdObEUaNZv8vAFK
	 Dhmz7+xRHje3A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/2] net: econet: add EcoNet EN751221 ethernet
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260909212146.3184077-3-cjd@cjdns.fr>
References: <20260909212146.3184077-1-cjd@cjdns.fr>
 <20260909212146.3184077-3-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 21:24:30 +0000
Message-Id: <20260910212430.DC3461F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 22 potential issue=
(s) to consider:
- [High] Use-after-free when `ndo_start_xmit` returns `NETDEV_TX_BUSY` afte=
r having already freed the SKB.
- [High] Potential spinlock deadlock due to missing `_bh` protection on har=
dware stats synchronization.
- [High] Silent SKB memory leak when DMA mapping fails due to incorrect err=
or code propagation.
- [High] Copy-paste error assigns port 0 hardware registers to port 1, brea=
king the WAN port.
- [High] Dereferencing a potentially NULL port pointer in the RX path.
- [High] Hardware interrupts for TX chain 1 are permanently masked after fi=
ring once.
- [High] RX SKBs are built with zero headroom, causing panics during header=
 pushes.
- [High] Sleeping function called while holding a spinlock in en75_dev_open.
- [High] Unchecked return value from of_reserved_mem_lookup causes NULL poi=
nter dereference.
- [High] Hardware Forwarding Engine (HWF) is never stopped during teardown.
- [High] Unmasked hardware interrupts cause UAF against destroyed NAPI stru=
cts.
- [High] Calling netif_napi_del on uninitialized structs causes a panic.
- [High] virt_to_head_page(NULL) causes a panic during RX teardown.
- [High] napi_enable is called after hardware DMA is enabled, risking perma=
nent queue stalls.
- [High] ERR_PTR dereference in debugfs teardown.
- [High] Configured MTU exceeds the size of the buffer provided to the RX D=
MA, causing packet corruption or drops.
- [High] Using physical memory addresses directly as DMA addresses breaks o=
n systems with IOMMUs or DMA offsets.
- [Medium] Hardware statistics are cleared after reading, destroying concur=
rent increments (TOCTOU race).
- [Medium] Shared IRQ handler unconditionally returns IRQ_HANDLED.
- [Medium] Software TX drop statistics are silently overwritten and lost.
- [Medium] Driver ignores -EPROBE_DEFER for reset controls.
- [Medium] A `WARN_ON_ONCE` triggers spuriously during ring teardown if a p=
revious out-of-memory condition occurred.
--

commit 98f885a3a05d744a2bc4c54348f8262c61f73dbd
Author: Caleb James DeLisle <cjd@cjdns.fr>
Date:   Wed Sep 9 21:21:46 2026 +0000

    net: econet: add EcoNet EN751221 ethernet driver
   =20
    The EcoNet ethernet driver is somewhat similar to both the Airoha
    and the MediaTek drivers, but still unique enough that attempts at
    code reuse did not prove fruitful.

> diff --git a/drivers/net/ethernet/econet/econet_eth.c b/drivers/net/ether=
net/econet/econet_eth.c
> --- a/drivers/net/ethernet/econet/econet_eth.c
> +++ b/drivers/net/ethernet/econet/econet_eth.c
[ ... ]
> @@ -109,8 +109,8 @@ int en75_rx_before_recv(struct en75_eth *eth, struct =
sk_buff *skb,
>  {
>  	struct en75_eth_pvt *ep =3D (struct en75_eth_pvt *)eth;
>  	struct net_device *port;
> =20
>  	port =3D en75_get_sport_dev(ep, sport);
> =20
>  	skb->dev =3D port;
>  	skb->protocol =3D eth_type_trans(skb, port);

[Severity: High]
Can port be NULL here? If en75_get_sport_dev() returns an uninitialized
port from the eth->ports[] array, would this result in a NULL pointer
dereference when port is passed to eth_type_trans()?

[ ... ]
> @@ -153,8 +153,8 @@ static int en75_init_port(struct en75_eth_pvt *eth, s=
truct device_node *np)
>  	if (id =3D=3D 1)
>  		dev =3D en75_alloc_gdm_port(&eth->pub, np,
>  					  &eth->regs->port0.regs,
>  					  eth->qdma[0],
>  					  ETX_FPORT_GDM1,
>  					  false);
>  	else if (id =3D=3D 2)
>  		dev =3D en75_alloc_gdm_port(&eth->pub, np,
>  					  &eth->regs->port0.regs,
>  					  eth->qdma[1],
>  					  ETX_FPORT_GDM2,
>  					  true);

[Severity: High]
Is it intentional to pass &eth->regs->port0.regs for the second port
(id =3D=3D 2) instead of &eth->regs->port1.regs? This appears to assign the=
 same
hardware registers to both the LAN and WAN ports, which could break the
WAN port functionality.

[ ... ]
> @@ -218,5 +218,5 @@ static int en75_probe(struct platform_device *pdev)
>  	eth->reset =3D devm_reset_control_array_get_exclusive(&pdev->dev);
>  	if (IS_ERR(eth->reset)) {
>  		dev_warn(&pdev->dev, "failed to get resets %pe\n", eth->reset);
>  	} else {

[Severity: Medium]
If devm_reset_control_array_get_exclusive() returns -EPROBE_DEFER, does it
make sense to print a warning and continue the probe sequence? Should the
error be propagated so the driver can properly defer its probe?

[ ... ]
> @@ -269,3 +269,3 @@ static int en75_probe(struct platform_device *pdev)
>  	eth->debug =3D en75_debugfs_init(&debug_conf);
> =20
>  	return 0;

[Severity: High]
en75_debugfs_init() can return ERR_PTR(-ENOMEM) on failure. Does
eth->debug need to be checked with IS_ERR() to prevent storing an error
pointer in the device structure?

> diff --git a/drivers/net/ethernet/econet/econet_eth_debug.c b/drivers/net=
/ethernet/econet/econet_eth_debug.c
> --- a/drivers/net/ethernet/econet/econet_eth_debug.c
> +++ b/drivers/net/ethernet/econet/econet_eth_debug.c
[ ... ]
> @@ -612,4 +612,4 @@ void en75_debugfs_exit(struct en75_debug *debug)
>  {
>  	if (!debug)
>  		return;
>  	debugfs_remove_recursive(debug->dir);
>  	kfree(debug);
>  }

[Severity: High]
If debug contains an ERR_PTR from the failed initialization mentioned
above, would calling debugfs_remove_recursive(debug->dir) cause a kernel
panic due to an invalid pointer dereference?

> diff --git a/drivers/net/ethernet/econet/econet_port.c b/drivers/net/ethe=
rnet/econet/econet_port.c
> --- a/drivers/net/ethernet/econet/econet_port.c
> +++ b/drivers/net/ethernet/econet/econet_port.c
[ ... ]
> @@ -139,4 +139,4 @@ static int en75_dev_open(struct net_device *dev)
>  	guard(spinlock)(&port->reg_lock);
>  	rlt =3D en75_rreg(&port->regs->rx_len_threshold);
>  	set_gdm_len_th_runt_len(&rlt, 60);
>  	set_gdm_len_th_oversize_len(&rlt, ETH_HLEN + dev->mtu + ETH_FCS_LEN);
>  	en75_wreg(rlt, &port->regs->rx_len_threshold);
> =20
>  	return en75_qdma_use(port->qdma);
>  }

[Severity: High]
Does en75_dev_open() hold port->reg_lock (via guard(spinlock)) while
calling en75_qdma_use()? Since en75_qdma_use() acquires a mutex, could
this lead to a sleep-in-atomic deadlock?

[ ... ]
> @@ -178,4 +178,4 @@ static netdev_tx_t en75_dev_xmit(struct sk_buff *skb,=
 struct net_device *dev)
>  	ret =3D en75_qdma_xmit(port->qdma, skb, &msg, 0);
> =20
>  	if (ret < 0) {
>  		netdev_tx_completed_queue(txq, 1, len);
>  		goto error;
>  	}

[Severity: High]
If en75_qdma_xmit() propagates the positive return value (1) from
dma_mapping_error(), would this ret < 0 check bypass the error handling,
returning NETDEV_TX_OK and silently leaking the SKB?

[ ... ]
> @@ -189,4 +189,4 @@ error:
>  	dev_kfree_skb_any(skb);
>  	dev->stats.tx_dropped++;
> =20
>  	if (ret =3D=3D -EBUSY) {
>  		netif_tx_stop_queue(txq);
>  		return NETDEV_TX_BUSY;
>  	}

[Severity: High]
If ret is -EBUSY, does this error path free the SKB before returning
NETDEV_TX_BUSY? Would the networking stack then attempt to re-queue and
re-transmit the already freed SKB, leading to a use-after-free?

[ ... ]
> @@ -199,4 +199,4 @@ static void en75_update_hw_stats(struct en75_gdm_port=
 *port)
>  	struct clear_counters cc =3D {0};
>  	u32 i =3D 0;
> =20
>  	guard(spinlock)(&port->stats.lock);
>  	u64_stats_update_begin(&port->stats.syncp);

[Severity: High]
Does the use of guard(spinlock) in en75_update_hw_stats() lack softirq
protection? If ndo_get_stats64 executes in softirq context while this lock
is held by process context on the same CPU, could it cause a deadlock? Would
guard(spinlock_bh) be more appropriate?

[ ... ]
> @@ -269,4 +269,4 @@ static void en75_update_hw_stats(struct en75_gdm_port=
 *port)
>  	set_gdm_cl_cnt_rx(&cc, true);
>  	set_gdm_cl_cnt_tx(&cc, true);
>  	en75_wreg(cc, &port->regs->clear_counters);
> =20
>  	u64_stats_update_end(&port->stats.syncp);
>  }

[Severity: Medium]
By explicitly clearing the hardware counters with clear_counters, is there a
race condition? Could any packets processed by the hardware between the MMIO
reads and the clear command be permanently lost from the statistics?

[ ... ]
> @@ -285,4 +285,4 @@ static void en75_dev_get_stats64(struct net_device *d=
ev,
>  		storage->rx_errors =3D port->stats.rx_errors;
>  		storage->rx_dropped =3D port->stats.rx_drops;
>  		storage->tx_dropped =3D port->stats.tx_drops;
>  		storage->rx_over_errors =3D port->stats.rx_over_errors;

[Severity: Medium]
Does overwriting storage->tx_dropped with the hardware drops unconditionally
discard any software-initiated drops (like DMA mapping failures) that were
recorded in dev->stats.tx_dropped?

[ ... ]
> @@ -401,3 +401,3 @@ struct net_device *en75_alloc_gdm_port(struct en75_et=
h *eth,
>  	ndev->ethtool_ops =3D &en75_ethtool_ops;
>  	ndev->max_mtu =3D EN75_MAX_PACKET_SIZE;

[Severity: High]
If max_mtu is set to EN75_MAX_PACKET_SIZE (2048), would an incoming
2048-byte payload exceed the available buffer space since
en75_fill_rx_queue() in econet_qdma.c allocates only
SKB_WITH_OVERHEAD(2048) for the DMA? Could this cause hardware truncation or
overflow?

> diff --git a/drivers/net/ethernet/econet/econet_qdma.c b/drivers/net/ethe=
rnet/econet/econet_qdma.c
> --- a/drivers/net/ethernet/econet/econet_qdma.c
> +++ b/drivers/net/ethernet/econet/econet_qdma.c
[ ... ]
> @@ -188,4 +188,4 @@ static void en75_qdma_rx_process_one(struct en75_q_rx=
 *q, u32 cpu_i,
>  	skb =3D napi_build_skb(e->buf, q->buf_size);
>  	if (!skb)
>  		goto return_page;
> =20
>  	__skb_put(skb, len);

[Severity: High]
Does napi_build_skb create an SKB with zero headroom? Since the code pushes
the payload using __skb_put without reserving any headroom via
skb_reserve(), would any later header insertion in the networking stack
cause an skb_under_panic?

[ ... ]
> @@ -353,4 +353,4 @@ static irqreturn_t en75_irq_handler(int irq_num, void=
 *dev_instance)
>  		irq->irqmask[i] &=3D ~disable_int;
>  		en75_wreg(irq->irqmask[i], irq->mask_reg[i]);
>  	}
> =20
>  	return IRQ_HANDLED;
>  }

[Severity: Medium]
Since this interrupt is registered with IRQF_SHARED, does unconditionally
returning IRQ_HANDLED (even if no events were processed) break the kernel's
spurious interrupt detection?

[ ... ]
> @@ -418,4 +418,4 @@ static int en75_poll_tx_complete(struct napi_struct *=
napi, int budget)
>  	if (done < budget && napi_complete(napi)) {
>  		union en75_irq_purpose purpose =3D IRQ_PURPOSE(DONE, TX, id);
>  		union irq_bit b =3D en751221_irq_bit(purpose);
> =20
>  		en75_qdma_set_irqmask(qdma, b, true);
>  	}

[Severity: High]
Since id is derived from the base of the q_tx_done array, and
QDMA_NUM_TX_DONE is 1, id will always be 0. Doesn't this mean that
en75_poll_tx_complete will always re-enable the interrupt for TX chain 0?
Could this leave the interrupt for TX chain 1 permanently masked after it
fires once?

[ ... ]
> @@ -401,3 +401,3 @@ int en75_qdma_xmit(struct en75_qdma *qdma, struct sk_=
buff *skb,
>  	addr =3D dma_map_single(qdma->dev, skb->data, len, DMA_TO_DEVICE);
>  	ret =3D dma_mapping_error(qdma->dev, addr);
>  	if (unlikely(ret))
>  		return ret;

[Severity: High]
dma_mapping_error() returns a positive boolean value on failure. Since this
function propagates the return value directly, does this cause the caller
en75_dev_xmit() to miss the error check?

[ ... ]
> @@ -643,5 +643,5 @@ static int en75_init_hw_fwd(struct en75_qdma *qdma)
>  		rmem =3D of_reserved_mem_lookup(np);
>  		of_node_put(np);
>  		dma_addr =3D rmem->base;
>  		/* Compute the number of hw descriptors according to the
>  		 * reserved memory size and the payload buffer size
>  		 */

[Severity: High]
If of_reserved_mem_lookup(np) returns NULL, does rmem->base cause a NULL
pointer dereference panic?

[Severity: High]
rmem->base is a physical address (phys_addr_t), but it is being assigned
to dma_addr and written to the hardware. Would this break DMA operations on
systems where the physical address is not the same as the DMA address (e.g.,
due to an IOMMU or DMA offset)?

[ ... ]
> @@ -666,4 +666,4 @@ static int en75_init_hw_fwd(struct en75_qdma *qdma)
>  	set_qregs_hwf_cfg1_start(&cfg1, true);
>  	en75_wreg(cfg1, &qdma->regs->hwf_cfg1);
> =20
>  	ret =3D read_poll_timeout(en75_rreg, cfg1,

[Severity: High]
The hardware forwarding engine is explicitly started here, but it doesn't s=
eem
to be stopped during driver teardown in en75_qdma_destroy_locked(). Could
the hardware continue to write to freed DMA memory after the driver is
unloaded, causing memory corruption?

[ ... ]
> @@ -714,5 +714,5 @@ static void en75_qdma_destroy_rxq_locked(struct en75_=
q_rx *q)
>  	for (i =3D 0; i < q->ndesc; i++) {
>  		struct en75_q_rx_ent *e =3D &q->entry[i];
>  		struct page *page =3D virt_to_head_page(e->buf);
> =20
>  		if (WARN_ON_ONCE(!e->dma_addr))
>  			continue;

[Severity: High]
If an initialization failure caused some descriptors to remain uninitialized
(where e->buf is NULL), would evaluating virt_to_head_page(e->buf)
before the !e->dma_addr safety check result in a kernel panic?

[Severity: Medium]
If an allocation failure does occur during ring initialization, leaving
remaining descriptors with e->dma_addr =3D=3D 0, wouldn't this WARN_ON_ONCE
trigger spuriously during the subsequent cleanup, creating noisy logs for a
safely-handled out-of-memory condition?

[ ... ]
> @@ -732,4 +732,4 @@ static int en75_qdma_destroy_locked(struct en75_qdma =
*qdma)
>  	for (i =3D 0; i < ARRAY_SIZE(qdma->q_rx); i++) {
>  		struct en75_q_rx *q =3D &qdma->q_rx[i];
> =20
>  		en75_qdma_destroy_rxq_locked(q);
>  		netif_napi_del(&q->napi);
>  	}

[Severity: High]
If en75_init_rx_queue fails before calling netif_napi_add, does calling
netif_napi_del(&q->napi) on an uninitialized NAPI struct cause a panic due
to operating on zeroed list pointers?

[Severity: High]
Hardware interrupts do not appear to be globally masked during this teardown
sequence. If a late interrupt fires while the NAPI structures are being
deleted, could the active IRQ handler attempt to schedule the destroyed NAPI
struct, leading to a use-after-free and softnet corruption?

[ ... ]
> @@ -769,4 +769,4 @@ int en75_qdma_use(struct en75_qdma *qdma)
>  	en75_wreg(qcfg, &qdma->regs->qdma_cfg);
> =20
>  	for (i =3D 0; i < ARRAY_SIZE(qdma->q_rx); i++)
>  		napi_enable(&qdma->q_rx[i].napi);

[Severity: High]
Is there a risk of permanently stalling the queues by enabling the hardware
DMA bits before enabling the software NAPI pollers? If an interrupt fires
between the DMA enable and napi_enable, it seems the NAPI scheduling would
be ignored and the interrupt left masked indefinitely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909212146.3184=
077-1-cjd@cjdns.fr?part=3D2
