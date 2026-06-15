Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E42C3033DE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 04:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781499489; cv=none; b=OcjD98lo1T5MSF1NjZ4nReh7kC5bkr2u6FqmtxvZ8X5Tb0woGSPdcKyKSetL0aoI9E18atPP79nMMBTT3OZ+VSO87dWyotDpEs/oCzLw2NAWApoxRY+XGujHD3UDAngHqs6uCoAgxOqqSsMsfQwHw4IzGrn/2ktQV5mKP/1wCgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781499489; c=relaxed/simple;
	bh=BweCUDg+TZ9HK132M2hBWt8h3uMvlIQP1RsW49On0gQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Swwk96wPe6Z5sXVLYg6qeqBWWOKW2I4OM3ta16WTZ9fhRJdX4xiuD85WCCShSxDUt5AYrqZA+TmA+snVMt13C34+u7OUmUX6c5Bz/D4RjndCgHOUnHFRYZan6XE3CwfiHhxWJoXnUEN9o81FoZtbTcJkQG1EqOYl0Whan/IgYr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bv3CPsBY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bv3CPsBY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8021F000E9;
	Mon, 15 Jun 2026 04:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781499487;
	bh=JuknTsB60LJ+rSJ+QMDyrWyHKsDMDwJQy2Ic8IyjL14=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bv3CPsBYCTubCE1lvLil1OsPpJzmwnjzobB24HLwcwJ4KKKgHx25RY4rqTuL0vHDz
	 s+Q4gNHkBxKT7VQMPxjeRFznSPbh3Ismsd20Btv9f9rdJUqRGeFsM/zQt8iESNw7AG
	 2YmnJu8aFD+ZCc1XdkGzcN24jY7eQhvDaiJBJlWgUc9LBCM0wImwcWFURROI+1CPEp
	 SbH/DEPWIufx6heaz47LeAYAJ7TmE7xcHzfJ9Yo9N9j8iT6QyPGaA8uhj/Z8EfbQ6f
	 +zo5SQC844eqyyipEk+6iTKEdzfo+OLvkoG1ktRpM1xJViEqiuuSe21mYJC5y+jGp1
	 aRqUFuGV7U4JQ==
From: sashiko-bot@kernel.org
Subject: Re: [RFC PATCH net-next 6/7] net: airoha: add PPE support for SOE
 flows
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jihong Min" <hurryman2212@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260614040032.1567994-7-hurryman2212@gmail.com>
References: <20260614040032.1567994-7-hurryman2212@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 04:58:07 +0000
Message-Id: <20260615045807.AD8021F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 8 potential issue(=
s) to consider:

New issues:
- [Critical] Type confusion from blindly casting `f->cookie` allows unprivi=
leged users to crash the kernel via TC flower.
- [High] The driver destructively overwrites `skb->mark` with private hardw=
are metadata, breaking user-defined firewall marks.
- [High] Lack of IPv4 fragment validation in `airoha_ppe_soe_fill_inner_ipv=
4_data` leads to garbage L4 port extraction.
- [High] Lockless updates of the `soe_meta` array cause data races and torn=
 reads, corrupting IPsec state.
- [High] Overlapping identical memory pointers are passed to `memcpy`, trig=
gering undefined behavior.
- [High] Hardware polling on 16K+ table entries inside a spinlock triggers =
CPU soft lockups.
- [Medium] Massive contiguous memory allocations via `devm_kzalloc` risk pe=
rsistent driver initialization failures.

Pre-existing issues:
- [High] A shadowed error variable in `airoha_ppe_flush_entries` silently m=
asks hardware initialization failures.
--

commit 00c38592fc258c1ad98cdbaaadb9925cf653ba43
Author: Jihong Min <hurryman2212@gmail.com>

net: airoha: add PPE support for SOE flows
   =20
Add PPE metadata handling for SOE flows so decrypted packets can carry
their original FOE/SA context until the normal egress path is known, and
so XFRM flowtable entries can be programmed with SOE SA and hop
information.

> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ether=
net/airoha/airoha_ppe.c
> index 91bcc55a6ac67..faa5f04d4c7b3 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
> @@ -578,6 +604,57 @@ static int airoha_ppe_foe_entry_set_ipv6_tuple(struc=
t airoha_foe_entry *hwe,
> +static int airoha_ppe_soe_fill_inner_ipv4_data(struct sk_buff *skb,
> +					       struct airoha_flow_data *data,
> +					       int *type, int *l4proto)
> +{
> +	unsigned int ip_offset =3D ETH_HLEN;
> +	union {
> +		struct tcphdr tcp;
> +		struct udphdr udp;
> +	} ports;
> +	struct iphdr iph_buf, *iph;
> +	unsigned int l4_offset;
> +	struct udphdr *udp;
> +	struct tcphdr *tcp;
> +
> +	if (skb_headlen(skb) < ETH_HLEN)
> +		return -EINVAL;
> +
> +	memcpy(&data->eth, skb->data, ETH_HLEN);
> +	if (data->eth.h_proto !=3D htons(ETH_P_IP))
> +		return -EAFNOSUPPORT;
> +
> +	iph =3D skb_header_pointer(skb, ip_offset, sizeof(iph_buf), &iph_buf);
> +	if (!iph || iph->ihl < 5 || iph->version !=3D 4)
> +		return -EINVAL;
> +
> +	l4_offset =3D ip_offset + iph->ihl * 4;

[Severity: High]
Does this code handle IPv4 fragments safely?

If iph->frag_off indicates a trailing fragment, the L4 header is not presen=
t.

Because there is no ip_is_fragment(iph) check before calculating l4_offset,
the function will read arbitrary payload data, misinterpret it as ports,
and program incorrect tuples into the hardware offload tables, leading to
corrupted flows and dropped fragments.

[ ... ]

> @@ -868,16 +1096,129 @@ airoha_ppe_foe_commit_subflow_entry(struct airoha=
_ppe *ppe,
> +static void airoha_ppe_soe_meta_store(struct airoha_ppe_soe_meta *meta,
> +				      u32 key_hash, u16 foe_hash, u8 sa_index,
> +				      u8 hop)
>  {
> +	u8 seen =3D 1;
> +
> +	if (READ_ONCE(meta->valid) &&
> +	    READ_ONCE(meta->key_hash) =3D=3D key_hash &&
> +	    READ_ONCE(meta->foe_hash) =3D=3D foe_hash &&
> +	    READ_ONCE(meta->sa_index) =3D=3D sa_index &&
> +	    READ_ONCE(meta->hop) =3D=3D hop &&
> +	    time_before_eq(jiffies, READ_ONCE(meta->expires)))
> +		seen =3D min_t(u8, READ_ONCE(meta->seen) + 1, U8_MAX);
> +
> +	WRITE_ONCE(meta->key_hash, key_hash);
> +	WRITE_ONCE(meta->foe_hash, foe_hash);
> +	WRITE_ONCE(meta->sa_index, sa_index);
> +	WRITE_ONCE(meta->hop, hop);
> +	WRITE_ONCE(meta->seen, seen);
> +	WRITE_ONCE(meta->expires,
> +		   jiffies + msecs_to_jiffies(AIROHA_PPE_SOE_META_TIMEOUT_MS));
> +	WRITE_ONCE(meta->valid, 1);

[Severity: High]
Can these lockless updates cause torn reads or data races?

Because there are no CPU memory barriers (like smp_store_release) and no
locks to prevent concurrent hash bucket collisions, writes are performed
sequentially.

Does this mean valid =3D 1 could be reordered before the data is visible to
other CPUs?

> +}
> +
> +void airoha_ppe_soe_mark_skb(struct airoha_ppe_dev *dev, struct sk_buff =
*skb,
> +			     u16 hash, u8 sa_index, u8 hop)
> +{
> +	struct airoha_ppe *ppe;
> +	u32 ppe_hash_mask;
> +
> +	if (!dev || !skb)
> +		return;
> +
> +	ppe =3D dev->priv;
> +	if (!ppe || !ppe->soe_meta)
> +		return;
> +
> +	ppe_hash_mask =3D airoha_ppe_get_total_num_entries(ppe) - 1;
> +	if (hash > ppe_hash_mask)
> +		return;
> +
> +	/* SOE decrypt completion is CPU-visible before normal routing has
> +	 * selected the plaintext egress netdev. Keep the original encrypted FOE
> +	 * hash and SA hop briefly on the skb so airoha_dev_xmit() can finish
> +	 * the PPE entry once the final egress descriptor is known.
> +	 */
> +	airoha_ppe_soe_meta_store(&ppe->soe_meta[hash], hash, hash, sa_index,
> +				  hop);
> +	ppe->foe_check_time[hash] =3D 0;
> +
> +	skb->mark &=3D ~(AIROHA_PPE_SOE_MARK_MAGIC_MASK |
> +		       AIROHA_PPE_SOE_MARK_HASH_MASK);
> +	skb->mark |=3D AIROHA_PPE_SOE_MARK_MAGIC |
> +		     FIELD_PREP(AIROHA_PPE_SOE_MARK_HASH_MASK, hash);

[Severity: High]
Does this destructively overwrite the user-space visible skb->mark?

Network drivers are forbidden from repurposing the global UAPI skb->mark
field for internal cross-stack state tracking.

Could this destroy any existing fwmark applied by userspace
(via iptables, nftables, or tc), breaking policy routing and firewall rules?

> +}
> +
> +bool airoha_ppe_soe_skb_marked(struct sk_buff *skb)
> +{
> +	return skb && ((skb->mark & AIROHA_PPE_SOE_MARK_MAGIC_MASK) =3D=3D
> +		       AIROHA_PPE_SOE_MARK_MAGIC);
> +}
> +
> +void airoha_ppe_soe_xmit_skb(struct airoha_ppe_dev *dev, struct sk_buff =
*skb,
> +			     struct net_device *netdev)
> +{
> +	struct airoha_foe_entry entry, tmpl, *hwe;
> +	struct airoha_flow_data data =3D {};
> +	struct airoha_ppe_soe_meta *meta;
> +	u32 ppe_hash_mask, key_hash;
> +	struct airoha_gdm_dev *gdm;
> +	struct airoha_ppe *ppe;
> +	unsigned long expires;
> +	u16 hash;
> +	int err, l4proto, type;
> +	u8 sa_index, hop;
> +	u8 seen;
> +
> +	if (!dev || !skb || !netdev)
> +		return;
> +
> +	if ((skb->mark & AIROHA_PPE_SOE_MARK_MAGIC_MASK) !=3D
> +	    AIROHA_PPE_SOE_MARK_MAGIC)
> +		return;
> +
> +	ppe =3D dev->priv;
> +	if (!ppe || !ppe->soe_meta)
> +		goto clear_mark;
> +
> +	ppe_hash_mask =3D airoha_ppe_get_total_num_entries(ppe) - 1;
> +	key_hash =3D FIELD_GET(AIROHA_PPE_SOE_MARK_HASH_MASK, skb->mark);
> +	if (key_hash > ppe_hash_mask)
> +		goto clear_mark;
> +
> +	meta =3D &ppe->soe_meta[key_hash];
> +	if (!READ_ONCE(meta->valid))
> +		goto clear_mark;

[Severity: High]
Are these reads gated by valid without acquire barriers?

Without smp_load_acquire, a reading CPU can observe valid =3D=3D 1 while re=
ading
torn, mixed data from two racing packets. This programs the hardware with an
incorrect SA index, breaking IPsec tunnel isolation.

[ ... ]

> +clear_mark:
> +	skb->mark &=3D ~(AIROHA_PPE_SOE_MARK_MAGIC_MASK |
> +		       AIROHA_PPE_SOE_MARK_HASH_MASK);

[Severity: High]
Is the hijacked mark consumed and zeroed out on the transmit path here?
This finalizes the loss of the original fwmark.

> +}
> +
> +void airoha_ppe_soe_flush_sa(struct airoha_ppe *ppe, u8 sa_index)
> +{
> +	u32 num_entries, hash;
> +
> +	if (!ppe)
> +		return;
> +
> +	num_entries =3D airoha_ppe_get_total_num_entries(ppe);
> +
> +	spin_lock_bh(&ppe_lock);

[Severity: High]
Is it safe to hold this spinlock continuously across a massive loop that
interacts with hardware?

When flushing IPsec state, this loops over every PPE table entry (up to
24,576 entries) while continuously holding a single spin_lock_bh(&ppe_lock).

During the iteration of SRAM entries, airoha_ppe_foe_get_entry_locked()
issues MMIO reads via read_poll_timeout_atomic(), which can delay up to
100us per entry.

Multiplying this delay by thousands of loop iterations can block the CPU for
tens to hundreds of milliseconds. Can this trigger watchdog soft lockup
warnings and drop unrelated network traffic?

> +	for (hash =3D 0; hash < num_entries; hash++) {
> +		struct airoha_foe_entry *hwe;
> +		u32 state, type;
> +
> +		hwe =3D airoha_ppe_foe_get_entry_locked(ppe, hash);
> +		if (!hwe)
> +			continue;
> +
> +		state =3D FIELD_GET(AIROHA_FOE_IB1_BIND_STATE, hwe->ib1);
> +		if (state !=3D AIROHA_FOE_STATE_BIND)
> +			continue;
> +
> +		type =3D FIELD_GET(AIROHA_FOE_IB1_BIND_PACKET_TYPE, hwe->ib1);
> +		if (type !=3D PPE_PKT_TYPE_IPV4_HNAPT &&
> +		    type !=3D PPE_PKT_TYPE_IPV4_ROUTE)
> +			continue;
> +
> +		if (!(hwe->ipv4.data & AIROHA_FOE_TUNNEL))
> +			continue;
> +
> +		if (FIELD_GET(AIROHA_FOE_ACTDP, hwe->ipv4.data) !=3D sa_index)
> +			continue;
> +
> +		/* NAT-T data and IKE control both use UDP/4500. A stale SOE
> +		 * bound entry can otherwise keep sending later IKE_AUTH packets
> +		 * to the SOE path after the SA has been deleted.
> +		 */
> +		hwe->ib1 &=3D ~AIROHA_FOE_IB1_BIND_STATE;
> +		hwe->ib1 |=3D FIELD_PREP(AIROHA_FOE_IB1_BIND_STATE,
> +				       AIROHA_FOE_STATE_INVALID);
> +		airoha_ppe_foe_commit_entry(ppe, hwe, hash, false);

[Severity: High]
Does this pass overlapping identical memory pointers to memcpy(), triggering
undefined behavior?

The pointer returned by airoha_ppe_foe_get_entry_locked() points directly to
the ppe->foe array.

This exact pointer is then passed as hwe into airoha_ppe_foe_commit_entry(),
which recalculates the destination pointing to the exact same address:

    struct airoha_foe_entry *hwe =3D ppe->foe + hash * sizeof(*hwe);
    ...
    memcpy(&hwe->d, &e->d, sizeof(*hwe) - sizeof(hwe->ib1));

The C standard forbids overlapping pointers in memcpy(), which can trigger
fortify source panics or silent data corruption.

> +	}
> +	spin_unlock_bh(&ppe_lock);
> +}

[ ... ]

> @@ -1057,6 +1551,7 @@ static int airoha_ppe_entry_idle_time(struct airoha=
_ppe *ppe,
>  static int airoha_ppe_flow_offload_replace(struct airoha_eth *eth,
>  					   struct flow_cls_offload *f)
>  {
> +	const struct flow_offload_tuple *tuple =3D (const void *)f->cookie;

[Severity: Critical]
Could this lead to a kernel panic from a type confusion if the rule was
added via TC flower?

The driver accepts generic FLOW_CLS_REPLACE commands, which can come from t=
he
Netfilter flowtable or TC flower. This blindly casts f->cookie to
struct flow_offload_tuple *.

However, if the rule was added via TC flower, cookie actually points to a
struct cls_fl_filter.

The driver then passes this invalid pointer to
airoha_ppe_foe_entry_set_soe_info(), which reads a garbage xmit_type.

If it coincidentally matches FLOW_OFFLOAD_XMIT_XFRM, the code calls
airoha_soe_xfrm_ppe_info(tuple->dst_cache), dereferencing a random garbage
pointer. This allows any user capable of configuring TC flower rules to
trigger an oops.

>  	struct flow_rule *rule =3D flow_cls_offload_flow_rule(f);
>  	struct airoha_flow_table_entry *e;

[ ... ]

> @@ -1350,16 +1851,26 @@ static int airoha_ppe_flow_offload_cmd(struct air=
oha_eth *eth,
>  	return -EOPNOTSUPP;
>  }
> =20
> -static int airoha_ppe_flush_sram_entries(struct airoha_ppe *ppe)
> +static int airoha_ppe_flush_entries(struct airoha_ppe *ppe)
>  {
> +	u32 ppe_num_entries =3D airoha_ppe_get_total_num_entries(ppe);
>  	u32 sram_num_entries =3D airoha_ppe_get_total_sram_num_entries(ppe);
>  	struct airoha_foe_entry *hwe =3D ppe->foe;
>  	int i, err =3D 0;
> =20
> +	memset(hwe, 0, ppe_num_entries * sizeof(*hwe));
> +	if (ppe->foe_stats) {
> +		u32 ppe_num_stats_entries =3D
> +			airoha_ppe_get_total_num_stats_entries(ppe);
> +
> +		memset(ppe->foe_stats, 0,
> +		       ppe_num_stats_entries * sizeof(*ppe->foe_stats));
> +	}
> +	dma_wmb();
> +
>  	for (i =3D 0; i < sram_num_entries; i++) {
>  		int err;
> =20
> -		memset(&hwe[i], 0, sizeof(*hwe));
>  		err =3D airoha_ppe_foe_commit_sram_entry(ppe, i);
>  		if (err)
>  			break;
>  	}
> =20
>  	return err;

[Severity: High]
This is a pre-existing issue, but does this shadowed error variable silently
mask hardware initialization failures?

Inside this initialization loop, a block-scoped int err; shadows the
function-scoped err =3D 0;.

If airoha_ppe_foe_commit_sram_entry() fails (e.g., due to a hardware poll
timeout), the loop breaks, but the function returns the outer err which
remains 0.

Does this silently ignore hardware initialization errors, leaving the PPE
table in an inconsistent state?

>  }

[ ... ]

> @@ -1601,12 +2143,20 @@ int airoha_ppe_init(struct airoha_eth *eth)
>  			return -ENOMEM;
>  	}
> =20
> -	ppe->foe_check_time =3D devm_kzalloc(eth->dev, ppe_num_entries,
> -					   GFP_KERNEL);
> +	ppe->foe_check_time =3D
> +		devm_kzalloc(eth->dev,
> +			     ppe_num_entries * sizeof(*ppe->foe_check_time),
> +			     GFP_KERNEL);
>  	if (!ppe->foe_check_time)
>  		return -ENOMEM;
> =20
> -	err =3D airoha_ppe_flush_sram_entries(ppe);
> +	ppe->soe_meta =3D devm_kzalloc(eth->dev,
> +				     ppe_num_entries * sizeof(*ppe->soe_meta),
> +				     GFP_KERNEL);

[Severity: Medium]
Could this fail on systems with fragmented memory or high uptime?

Allocating nearly 600 KB (an order-8 contiguous allocation) without a
fallback is extremely prone to failure and will prevent the network interfa=
ce
from probing. Could this use devm_kvzalloc() to allow virtual memory
fallbacks?

> +	if (!ppe->soe_meta)
> +		return -ENOMEM;
> +
> +	err =3D airoha_ppe_flush_entries(ppe);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260614040032.1567=
994-1-hurryman2212@gmail.com?part=3D6
