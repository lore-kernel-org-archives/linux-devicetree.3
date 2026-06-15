Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D6F27A462
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781499489; cv=none; b=G71EDXgT/+tuYrZ+uJSazlk4q1dQ13KBBWUcBbipwKqyulNCRf6Q+Iw5y4UQFjqPKzcMMRaff3uFnFPHoY5RXAPls/TrZLmP2vzHPYTgmOBKk0usWYR1tHTEMrcSq17AwJmj4VL1czqyfUTZWVLOxGKx+0WgI4tQ0wFW+ViXdeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781499489; c=relaxed/simple;
	bh=a9j37ZJADBSPSq0TcTg2i782LDj1msI32R9zibYd+eM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=h0/HBIUvQVAKbUwZ8OSS9i5tK3rVUGeTi5gDSZb6Uyth8r/tVk5APrfBRHKLZanIKJnFUKME0lkRSZTU0V8pwtGC+46fLUU8k0mT//st2yh7L5n7B36Yzpr5zZtOiRbvZ2bR1tZWXpa7jsVTGetSKuapSs79a9IWgm7BxOxgwPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LsU4CvZ4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LsU4CvZ4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 447761F00A3A;
	Mon, 15 Jun 2026 04:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781499488;
	bh=OrSfPoCYN8i8wkh/Qn0Vf2CURNKZ4N3kifNzxKt6Yy8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LsU4CvZ4ZTNUJtEMD3gj/76bqtPzZzQLsrLbxwXnZ4PvuZBgi7EfMy7V2NmVIMJt8
	 p8LnnRo7NYtgBY/4Q4eCVNqQ5ECjgR4W2fJaoEBhlPWwK6WkjEKFwoOgmAZ/k/O+Ca
	 E1BtKuPKaco64LodouJZ//qqsFeAVALMuaobvDzrQjZvkVW1em3CiUN1uEo42zyMXU
	 Yl898ACZr0mpHtlfplLhBI8MpURkQTEla0Wk8j0oE/21VlVSN7C4HXcfSp9jHgNmp1
	 q+akDcIc9aMzp+VFs1ezN54HNtOUwgosEbB2NsOZ95/u7sFHhbGmr+rN53sj/6t1Sl
	 iDF8b5bzUqO2w==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 7/7] net: airoha: add SOE XFRM packet
 offload support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614040032.1567994-8-hurryman2212@gmail.com>
References: <20260614040032.1567994-8-hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 04:58:07 +0000
Message-Id: <20260615045808.447761F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 11 potential issue=
(s) to consider:
- [Critical] Asynchronous XFRM state GC causes a Use-After-Free of the cond=
uit network device private data when an SA is offloaded via a DSA user port.
- [Critical] Forcefully clearing `sa->inflight` during SA teardown prematur=
ely signals completion, causing packet misrouting and context UAF.
- [High] DSA proxy scan hardcodes `init_net`, causing `xfrmdev_ops` to leak=
 on interfaces moved to other network namespaces.
- [High] Hardware-decrypted packets are injected into an Ethernet device vi=
a `netif_rx()` without a valid MAC header.
- [High] Out-of-place TX offload loses critical SKB metadata, breaking QoS =
and netfilter marks.
- [High] Cleared Security Associations remain active in hardware because `A=
IROHA_SOE_SA_CMD_VLD` is unconditionally set.
- [High] The `xdo_dev_state_free` callback performs sleeping operations, ca=
using a kernel BUG when the XFRM state is released in softirq context.
- [High] RX offload is unconditionally broken for DSA user ports due to a s=
trict `x->xso.dev !=3D rx_dev` check and lack of DSA tag parsing.
- [High] Unverified RX packets have their protocol unconditionally overwrit=
ten and are irrevocably truncated, corrupting non-IPv4 traffic.
- [High] TX offload expects `skb->data` to point to the IP header, but it p=
oints to the MAC header, causing TX offload failure.
- [Medium] Inefficient DSA proxy scanning causes redundant O(N^2) netdev fe=
ature updates system-wide.
--

commit c8afd29ed4385ffd75d9f77b7cea01b7c16511f3
Author: Jihong Min <hurryman2212@gmail.com>
Subject: net: airoha: add SOE XFRM packet offload support

Add the EN7581 Secure Offload Engine provider. The provider programs ESP
SAs, exposes NETIF_F_HW_ESP through xfrmdev_ops, submits encrypt and
decrypt packets through the QDMA SOE path, and handles SOE completion
delivery.

> diff --git a/drivers/net/ethernet/airoha/airoha_soe.c b/drivers/net/ether=
net/airoha/airoha_soe.c
> new file mode 100644
> index 0000000000000..3a240ed44d7fc
> --- /dev/null
> +++ b/drivers/net/ethernet/airoha/airoha_soe.c
[ ... ]
> +static int airoha_soe_program_sa_locked(struct airoha_soe *soe,
> +					unsigned int index,
> +					const struct airoha_soe_sa_cfg *cfg)
> +{
> +	void __iomem *base =3D soe->base;
> +
> +	writel(cfg->cmd | AIROHA_SOE_SA_CMD_VLD, base + AIROHA_SOE_SA_CMD);

[Severity: High]
Does the unconditional use of AIROHA_SOE_SA_CMD_VLD defeat the teardown
zeroing?

When an XFRM state is destroyed, airoha_soe_clear_sa_locked() attempts to
invalidate the slot by passing a zero-initialized airoha_soe_sa_cfg, but
this unconditionally applies the VLD bit before writing to the hardware
command register.

Could this leave the hardware SA slot active with an SPI of 0, allowing a
malicious packet carrying SPI 0 to match this slot and bypass security
checks?

[ ... ]
> +static void airoha_soe_abort_sa(struct airoha_soe_sa *sa)
> +{
> +	LIST_HEAD(rx_queue);
> +	LIST_HEAD(tx_queue);
> +
> +	if (!sa)
> +		return;
> +
> +	spin_lock_bh(&sa->lock);
> +	sa->dead =3D true;
> +	airoha_soe_forget_rx_ctx_list(sa);
> +	list_splice_init(&sa->tx_queue, &tx_queue);
> +	list_splice_init(&sa->rx_queue, &rx_queue);
> +	sa->inflight =3D 0;
> +	complete(&sa->idle);
> +	spin_unlock_bh(&sa->lock);

[Severity: Critical]
Does forcefully zeroing sa->inflight and signaling sa->idle destroy the
synchronization accounting while packets are still in hardware?

During XFRM state deletion, airoha_soe_abort_sa() breaks the synchronization
in airoha_soe_free_sa(), causing the wait timeout to return instantly. The
SA index is then reallocated to a new XFRM state while old packets are
still in flight.

When the hardware delivers the completion, airoha_soe_rx_skb() pops a
tracking context from the new SA's queue based solely on the reused index,
which applies incorrect XFRM states and corrupts context accounting.

[ ... ]
> +static void airoha_soe_free_sa(struct airoha_soe_sa *sa)
> +{
> +	LIST_HEAD(rx_queue);
> +	LIST_HEAD(tx_queue);
> +	struct airoha_soe *soe;
> +
> +	if (!sa)
> +		return;
> +
> +	soe =3D sa->soe;
> +	airoha_soe_mark_sa_dead(sa);
> +	if (!wait_for_completion_timeout(&sa->idle, AIROHA_SOE_SA_FREE_TIMEOUT))
> +		dev_warn(soe->dev,

[Severity: High]
Is it safe to perform sleeping operations during XFRM state destruction?

The xdo_dev_state_free callback is executed synchronously from
__xfrm_state_destroy, which can be invoked in atomic or softirq context
when the last reference is dropped. This often happens when a packet is
dropped in the RX path and the network stack releases its routing entry.

Since airoha_soe_free_sa() waits for a completion and calls
synchronize_rcu(), executing these in softirq context would cause a
scheduling while atomic BUG.

[ ... ]
> +static int airoha_soe_prepare_ip_headers(struct sk_buff *skb)
> +{
> +	unsigned int hdr_len;
> +
> +	if (!pskb_may_pull(skb, 1))
> +		return -EINVAL;
> +
> +	switch (skb->data[0] & 0xf0) {
> +	case 0x40:
> +		hdr_len =3D sizeof(struct iphdr);

[Severity: High]
Will this incorrectly read the first byte of the MAC header instead of the
IP version field?

The airoha_soe_xmit() function serves as the xdo_dev_packet_xmit callback,
which is invoked by the core network stack immediately before handing the
packet to the driver's transmit routine. At this stage, the MAC header has
been added and the data pointer points to the Ethernet MAC header.

Reading the first byte checks the destination MAC address instead, causing
offload to randomly fail and drop packets unless the destination MAC
happens to start with 0x4 or 0x6.

[ ... ]
> +static bool airoha_soe_rx_parse_ipv4(struct sk_buff *skb,
> +				     struct airoha_soe_rx_info *info)
> +{
[ ... ]
> +	if (skb->protocol !=3D htons(ETH_P_IP)) {
> +		if (!pskb_may_pull(skb, 1) || (skb->data[0] >> 4) !=3D 4)
> +			return false;
> +
> +		skb->protocol =3D htons(ETH_P_IP);
> +	}
[ ... ]
> +bool airoha_soe_rx_plain_skb(struct airoha_gdm_dev *dev, struct sk_buff =
*skb,
> +			     struct net_device *rx_dev, u16 foe_hash,
> +			     u32 foe_reason, bool foe_valid)
> +{
[ ... ]
> +	skb_reset_network_header(skb);
> +	if (!airoha_soe_rx_parse_ipv4(skb, &info))
> +		return false;
> +
> +	if (skb->len !=3D info.packet_len && pskb_trim(skb, info.packet_len))
> +		return false;

[Severity: High]
Can this corrupt non-IPv4 traffic by irrevocably truncating the packet?

In airoha_soe_rx_plain_skb(), the protocol is overwritten and the packet is
truncated via pskb_trim() before verifying that the packet belongs to an
offloaded ESP SA.

If a non-IPv4 packet has 0x4 in the upper nibble of its first byte,
airoha_soe_rx_parse_ipv4() treats it as IPv4, modifies the protocol, and
truncates it. If xfrm_input_state_lookup() later fails, the corrupted
packet is returned to the network stack, leading to stack confusion.

[ ... ]
> +	daddr.a4 =3D ip_hdr(skb)->daddr;
> +	x =3D xfrm_input_state_lookup(dev_net(rx_dev), skb->mark, &daddr,
> +				    info.spi, IPPROTO_ESP, AF_INET);
> +	if (!x)
> +		return false;
> +
> +	if (x->xso.dir !=3D XFRM_DEV_OFFLOAD_IN)
> +		goto put_state;
> +	if (x->xso.type !=3D XFRM_DEV_OFFLOAD_PACKET)
> +		goto put_state;
> +	if (x->xso.dev !=3D rx_dev)
> +		goto put_state;

[Severity: High]
Will this strict check reject offloaded ESP packets for DSA user ports?

For DSA SAs, the offload device is the DSA user port. However, inbound ESP
packets are intercepted at the physical conduit device before DSA unpacks
the tags, meaning the received device is the conduit. The packet is ignored
for hardware decrypt offload because the conduit does not match the user
port.

Furthermore, intercepting right after eth_type_trans() means the data
points to the DSA tag rather than the IP header, which would cause IPv4
parsing to fail.

[ ... ]
> +static bool airoha_soe_complete_out(struct sk_buff *skb,
> +				    struct airoha_soe_ctx *ctx)
> +{
> +	struct dst_entry *dst =3D ctx->dst;
> +	struct net *net;
> +	int err;
> +
> +	ctx->dst =3D NULL;
[ ... ]
> +	skb->protocol =3D htons(ETH_P_IP);
> +	skb_dst_drop(skb);
> +	skb_dst_set(skb, dst);
> +	skb->ignore_df =3D 1;
> +	net =3D dev_net(dst->dev);
> +	kfree(ctx);
> +	dst_output(net, NULL, skb);

[Severity: High]
Does this reinjection drop critical SKB metadata?

It looks like only the routing entry is restored before calling
dst_output(), failing to carry over metadata like the packet mark,
priority, socket association, and VLAN TCI from the original SKB.

Could this cause the transmitted outer IPsec packet to lose its QoS
classifications and socket accounting contexts?

[ ... ]
> +static bool airoha_soe_complete_in(struct sk_buff *skb,
> +				   struct airoha_soe_ctx *ctx)
> +{
[ ... ]
> +	skb->dev =3D rx_dev;
> +	skb->mark =3D ctx->rx.mark;
> +	skb->ip_summed =3D CHECKSUM_NONE;
> +	skb_reset_mac_header(skb);
> +	skb_reset_mac_len(skb);
> +	skb->pkt_type =3D PACKET_HOST;
> +	skb->encapsulation =3D 0;
> +	skb_dst_drop(skb);
[ ... ]
> +	kfree(ctx);
> +	netif_rx(skb);

[Severity: High]
Will injecting a MAC-less L3 packet via netif_rx() cause issues in the
network stack?

The function strips the dummy L2 header but sets the MAC header to point
directly to the IP header. Since the network stack expects packets arriving
on physical Ethernet devices to possess a valid MAC header, reading the IP
header as an Ethernet header breaks protocol semantics.

Could this poison the bridge FDB with garbage MAC addresses derived from
IP fields?

[ ... ]
> +static int airoha_soe_xfrm_state_add(struct net_device *dev,
> +				     struct xfrm_state *x,
> +				     struct netlink_ext_ack *extack)
> +{
[ ... ]
> +	state->dev =3D gdm_dev;
> +	state->soe =3D soe;

[Severity: Critical]
Could this lead to a Use-After-Free of the conduit network device private
data?

When an XFRM state is added to a DSA user port, the private data is
assigned a pointer to the conduit device without taking a reference on the
conduit netdev via dev_hold().

If the conduit device is unregistered, the DSA user ports are destroyed,
triggering an asynchronous XFRM state garbage collection. The background GC
could then dereference the dangling state pointer in
airoha_soe_xfrm_state_free() if the conduit device was fully freed.

[ ... ]
> +static void airoha_soe_dsa_proxy_enable(struct net_device *dev)
> +{
> +	struct net_device *conduit;
> +
> +	conduit =3D airoha_soe_dsa_conduit_get(dev);
> +	if (!conduit)
> +		return;
> +
> +	if (dev->xfrmdev_ops && dev->xfrmdev_ops !=3D &airoha_soe_dsa_xfrmdev_o=
ps)
> +		goto out;

[Severity: Medium]
Does this condition fail to exit early if the ops are already set?

Since airoha_soe_netdev_event() calls airoha_soe_dsa_proxy_scan(true) on
every NETDEV_REGISTER event, the lack of an early return when the ops
pointer is already equal to airoha_soe_dsa_xfrmdev_ops causes it to proceed
and call netdev_update_features() redundantly.

This means adding any unrelated interface to the system triggers feature
recalculations on all existing DSA ports.

[ ... ]
> +static void airoha_soe_dsa_proxy_scan(bool enable)
> +{
> +	struct net_device *dev;
> +
> +	for_each_netdev(&init_net, dev) {
> +		if (enable)
> +			airoha_soe_dsa_proxy_enable(dev);
> +		else
> +			airoha_soe_dsa_proxy_clear(dev);
> +	}
> +}

[Severity: High]
Is it intentional to restrict this loop to init_net?

If a DSA user interface is moved to a different network namespace, it
appears this loop will permanently skip it. During module unload,
airoha_soe_deinit() calls this scan to clear the hook pointers, but failing
to reach interfaces outside init_net leaves dangling pointers to
airoha_soe_dsa_xfrmdev_ops.

Could this result in a Use-After-Free and kernel panic upon a subsequent
network namespace cleanup or XFRM operation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614040032.1567=
994-1-hurryman2212@gmail.com?part=3D7
