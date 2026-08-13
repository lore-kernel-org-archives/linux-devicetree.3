Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D462EA754
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 23:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786665181; cv=none; b=I7CNjlO/m9DPVeE+5mC5pP8ozIJxHz3WRUu0q3fvYLQh32Y4x0MjFjCt757SsrTLg5VA2AQdmSCjUPtt3TUvrn3d1W4KQrKxqafRSY5fbTZh2WJ5F9dcomG2nOVQi23Um8VAq1suTq6q0MUD8nKmIyUdiU37OUWfi81zvIxJaYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786665181; c=relaxed/simple;
	bh=E1oYnmrCL1rZYvpjU/cZvCl9iwNS4BpQfDIlulgn6QQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=guKlij2VgVMEG+rxu4RGmmXatXP1EBBJ7D8OylWuN6nzECjd0zBpUpET6HtAsg6uSiS6CKeaxII4fCS48I+FGiHinlNO8OJA5rv7XC3uDl3OHEoKQloSPbmnmybif5oQVIPXt3zu4EeGiQLz2u4v8U6WPBAiPug/f44ZOgg1N3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hSVeNUHS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hSVeNUHS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14D4A1F000E9;
	Thu, 13 Aug 2026 23:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786665179;
	bh=v9YPTvW9BKyKuh4w38EFEgEmYXAHwtOYCY34qaMfOFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hSVeNUHSN0c0n/N8vOEOnFffy3jZ9Fg0OuHARU5ekh/iFs0h8rcj8OXNYZbkSNEf3
	 iinIrU2k6Z+gPKJCQY+dEg/YTohKOmIDyypxXt6mmZZT7QsLnkL2eWSoMaKutxnL3s
	 Hjxa4KAh5H1Y3DBagd+eOvj12A96LyeahIpLA6k+SbQkWjtK/cDNrqA3pB2OQphILi
	 t9+o/Tt8gjrvqhT2i+4MKga3WVlGIEs+/aTqY07yln20blqLpZpSDueW8ZWCb9s62a
	 b6BGi9NhtnxSlRt9ShYJYAa9mpguNE2mug3/ilFg5xGkvR9Gyh11blaE+wwB/qvMny
	 y8aOvOrMuDMRw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 07/12] net: airoha: Move airoha_qdma pointer
 in airoha_gdm_dev struct
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lorenzo Bianconi" <lorenzo@kernel.org>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260406-airoha-eth-multi-serdes-v3-7-ab6ea49d59ff@kernel.org>
References: <20260406-airoha-eth-multi-serdes-v3-7-ab6ea49d59ff@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 23:52:58 +0000
Message-Id: <20260813235259.14D4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Medium] Incomplete state isolation when moving QDMA pointer breaks QDMA =
statistics and QoS

Pre-existing issues:
- [High] Out-of-bounds array access in TX fragment mapping loop
- [High] `dma_map_single()` is incorrectly used to map paged SKB fragments,=
 crashing on highmem platforms
- [High] Deadlock in hardware statistics update due to missing BH disable
- [High] Missing SKB length and linearization checks before Ethernet header=
 and DSA tag access
- [Medium] Hardware counters are permanently lost due to a race condition w=
ith manual MIB clearing
- [Medium] Incorrect 32-bit hardware counter wrap-around handling corrupts =
64-bit stats
--

--- Patch [7]: [PATCH net-next v3 07/12] net: airoha: Move airoha_qdma poin=
ter in airoha_gdm_dev struct ---
commit 4404ad5980e6c77f2e4f802133236eaf61b63376
Author: Lorenzo Bianconi <lorenzo@kernel.org>

net: airoha: Move airoha_qdma pointer in airoha_gdm_dev struct

This commit moves the airoha_qdma pointer from the airoha_gdm_port struct
to the airoha_gdm_dev struct. This is a preliminary change to support
multiple net_devices connected to the same GDM port via an external
hardware arbiter.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index c2fc4967c3400..716b73f0dff45 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
[ ... ]
> @@ -1497,9 +1498,10 @@ static void airoha_qdma_stop_napi(struct airoha_qd=
ma *qdma)
>  	}
>  }
> =20
> -static void airoha_update_hw_stats(struct airoha_gdm_port *port)
> +static void airoha_update_hw_stats(struct airoha_gdm_dev *dev)
>  {
> -	struct airoha_eth *eth =3D port->qdma->eth;
> +	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_eth *eth =3D dev->eth;
>  	u32 val, i =3D 0;
> =20
>  	spin_lock(&port->stats.lock);

[Severity: High]
This is a pre-existing issue, but can this lead to a deadlock on a single C=
PU?

airoha_update_hw_stats() acquires port->stats.lock using spin_lock(). While
this disables preemption, it leaves softirqs (BH) enabled. The function is
called from process context (e.g., via ethtool get_mac_stats).

If a softirq triggers on the same CPU while the lock is held, and the
softirq path attempts to read stats (e.g., via ndo_get_stats64), it will
try to acquire the same spin_lock, deadlocking the CPU.

Should spin_lock_bh() be used to protect stats shared with or accessible
from softirq context?

[Severity: Medium]
This is a pre-existing issue, but does this cause hardware counters to be
permanently lost?

In airoha_update_hw_stats(), the driver reads a long sequence of hardware
counters and then issues a manual register write (REG_FE_GDM_MIB_CLEAR) to
clear all of them.

Any packets processed by the hardware during the time window between
reading a specific counter and the clear command taking effect will
increment the hardware counter, but will be permanently lost when the
counters are zeroed.

Should the driver accumulate absolute counter values in software and handle
wraparounds rather than clearing hardware counters?

[ ... ]
> @@ -1800,9 +1802,9 @@ static int airoha_dev_init(struct net_device *netde=
v)
>  	int i;
> =20
>  	/* QDMA0 is used for lan ports while QDMA1 is used for WAN ports */
> -	port->qdma =3D &eth->qdma[!airoha_is_lan_gdm_port(port)];
> -	dev->dev->irq =3D port->qdma->irq_banks[0].irq;
> -	airoha_set_macaddr(port, netdev->dev_addr);
> +	dev->qdma =3D &eth->qdma[!airoha_is_lan_gdm_port(port)];
> +	dev->dev->irq =3D dev->qdma->irq_banks[0].irq;
> +	airoha_set_macaddr(dev, netdev->dev_addr);

[Severity: Medium]
When moving the qdma pointer to struct airoha_gdm_dev to support multiple
devices on the same physical port, are there incomplete state isolations
that could corrupt hardware statistics and QoS?

In airoha_dev_init(), the qdma pointer is still set based on the shared
port configuration (!airoha_is_lan_gdm_port(port)), which seems to contradi=
ct
the commit message's claim that the QDMA block depends on the net_device
configuration.

Additionally, QDMA state variables like cpu_tx_packets and fwd_tx_packets
used for ETS baselines were left in the shared struct airoha_gdm_port.
When multiple devices share a port, they will read their distinct QDMA
hardware counters but subtract from and overwrite the same shared
port->cpu_tx_packets baseline.

[ ... ]
> @@ -1929,10 +1930,10 @@ static u32 airoha_get_dsa_tag(struct sk_buff *skb=
, struct net_device *dev)
>  #endif
>  }
> =20
> -int airoha_get_fe_port(struct airoha_gdm_port *port)
> +int airoha_get_fe_port(struct airoha_gdm_dev *dev)
>  {

[Severity: High]
This is a pre-existing issue, but is it possible to trigger out-of-bounds
memory accesses or a kernel panic here?

In airoha_get_dsa_tag() just above this change, the code casts skb->data to
an ethhdr and uses memmove() to copy 2 * ETH_ALEN bytes. While
skb_cow_head(skb, 0) ensures the header is writable, it does not verify the
available linear length or pull paged fragments.

If a maliciously crafted short packet is injected (e.g., via AF_PACKET), or
if the header spans paged fragments, the memmove reads and writes out of
bounds. Furthermore, __skb_pull(skb, MTK_HDR_LEN) lacks a bounds check and
will underflow skb->len to a huge value if the packet is smaller than
MTK_HDR_LEN.

Should this use pskb_may_pull() or check skb_headlen() before accessing
headers?

> -	struct airoha_qdma *qdma =3D port->qdma;
> -	struct airoha_eth *eth =3D qdma->eth;
> +	struct airoha_gdm_port *port =3D dev->port;
> +	struct airoha_eth *eth =3D dev->eth;
> =20
>  	switch (eth->soc->version) {
>  	case 0x7583:
[ ... ]
> @@ -1949,8 +1950,7 @@ static netdev_tx_t airoha_dev_xmit(struct sk_buff *=
skb,
>  				   struct net_device *netdev)
>  {
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
> -	struct airoha_gdm_port *port =3D dev->port;
> -	struct airoha_qdma *qdma =3D port->qdma;
> +	struct airoha_qdma *qdma =3D dev->qdma;
>  	u32 nr_frags, tag, msg0, msg1, len;
>  	struct airoha_queue_entry *e;
>  	struct netdev_queue *txq;

[Severity: High]
This is a pre-existing issue, but can this out-of-bounds read lead to
memory corruption or a kernel panic?

In airoha_dev_xmit(), the loop iterates nr_frags times, where
nr_frags =3D 1 + skb_shinfo(skb)->nr_frags. During the final iteration (when
i =3D=3D skb_shinfo(skb)->nr_frags), it accesses &skb_shinfo(skb)->frags[i]=
 and
dereferences it via skb_frag_address().

Since the frags array contains exactly skb_shinfo(skb)->nr_frags initialized
elements, this accesses one element past the end of the array. If the SKB
has exactly MAX_SKB_FRAGS fragments, it reads beyond the skb_shared_info
struct, which can cause a kernel panic if it crosses an unmapped page
boundary.

[Severity: High]
This is also a pre-existing issue, but does this code crash on 32-bit
platforms with HIGHMEM enabled?

In airoha_dev_xmit(), the driver loops through all fragments and maps them
using dma_map_single(..., data, ...) where data is obtained via
skb_frag_address(frag).

However, skb_frag_address() internally calls page_address(), which returns
NULL for pages located in high memory. Passing a NULL pointer to
dma_map_single() can result in a crash or map physical address 0.

Should this use skb_frag_dma_map() or dma_map_page() to map paged fragments?

[ ... ]
> @@ -2253,9 +2250,9 @@ static int airoha_qdma_get_tx_ets_stats(struct net_=
device *netdev, int channel,
>  	struct airoha_gdm_dev *dev =3D netdev_priv(netdev);
>  	struct airoha_gdm_port *port =3D dev->port;
> =20
> -	u64 cpu_tx_packets =3D airoha_qdma_rr(port->qdma,
> +	u64 cpu_tx_packets =3D airoha_qdma_rr(dev->qdma,
>  					    REG_CNTR_VAL(channel << 1));
> -	u64 fwd_tx_packets =3D airoha_qdma_rr(port->qdma,
> +	u64 fwd_tx_packets =3D airoha_qdma_rr(dev->qdma,
>  					    REG_CNTR_VAL((channel << 1) + 1));

[Severity: Medium]
This is a pre-existing issue, but does this improperly handle 32-bit
hardware counter wrap-arounds, leading to corrupted 64-bit stats?

In airoha_qdma_get_tx_ets_stats(), the 32-bit hardware counters read via
airoha_qdma_rr are implicitly cast to u64 before subtracting the previously
saved u64 baseline (port->cpu_tx_packets).

When the 32-bit hardware counter wraps around (e.g., from 0xFFFFFFFF to
0x00000000), the new value is numerically smaller. In 64-bit arithmetic,
this subtraction does not wrap properly; it underflows, adding a massive
value (e.g., 0xFFFFFFFF00000000) to the software stats.

Should the difference be calculated as a u32 before being added to the u64
total?

>  	u64 tx_packets =3D (cpu_tx_packets - port->cpu_tx_packets) +
>  			 (fwd_tx_packets - port->fwd_tx_packets);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260406-airoha-eth=
-multi-serdes-v3-0-ab6ea49d59ff@kernel.org?part=3D7
