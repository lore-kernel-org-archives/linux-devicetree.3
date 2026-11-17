Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954840;
	b=fqF1vkg8XCCHhSbqgkkoCz0GG8eKjz+vSRVqHs9g986zm3Oj+DzN671zrBbC4VHxaaid
	 Zcw1GRdcBjIMAsxZYjB4kiYrgBTURTgvtdCbukPnBzv5nVV3kt1+aj2dQJIxn0ECBDeGS
	 kTIzhq1rnevqllyzRq+SIgvp5WWUPX4jcw3Nx9DrFPTM0LVqKvir+szyiZblfGR65W9th
	 QSSwUeG0wfvmkbrSG2FEuejSTK2SZxTe1fpYVpaVMBn7+F6uCDuEuaqo1arfLii15wkmo
	 u6T7XYvSjwn/GRAO5QIwLOIQM9+BN+0AtwivlXztnYSighjpC0L6uc3bMLS7IdlrJXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954840;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nwH48nvIt5i61HmtY5d4AcsRP/TnhxHNApmoNIHUnW8=;
	b=QrztRIWxI6aUJ0bcMPGSD6TV7rZJ88qC98dC0HC9vxpvAnjaHW6xqRWiPfHL8AeBcWK4
	 b9U27kxIczkZuegzln1hqLY7HzIhlvrs9VJy6E0HOM0LYICMBsoDI5Px76V15kjGaxtYq
	 aZcvC7QKgMFjOouUqI/Ko9vB55mOz9YZkgB06i5764sQPHCPmojMasYXWzfZMtLKCJwPz
	 vhsrChGnHb+ZGG3OI6pNNPSfJlPf3T73yFPAcEuCJF2MDLABsFTnY8FEiAFGqrk8SWU/A
	 CE7rJ/gdw9b/cQGH4nVfDPrE3zDgrXneI7kg13VLYZeahxO8nSxexbmp3raAwMH9S1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAJ2oy2s;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B03B7606A886
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QAJ2oy2s
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 550951F000CE;
	Tue, 17 Nov 2026 22:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954840;
	bh=nwH48nvIt5i61HmtY5d4AcsRP/TnhxHNApmoNIHUnW8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QAJ2oy2s3UMxsIP2nbZOQXfrTqX0bhTmOU2bqqy3Dd9pbFv/EDYP6EpZbIXyZ5f+/
	 pI5NRVMX9W/OY7jrlZw1gxewUDc53LsYY2G+E0GhcAkxdngLr09bhxSh9vo9gGUHGO
	 gQj2nVNIIN+txcVAKLnmDFgMwHv6UCfCAKPCuqaBzQ0aNbK9nWHsdQOtOLeDuBj4/t
	 v2wSNUEKRR1/fioNKjVoj41r/70yZgT5ejsNse4NLoaUd3N5cszmFyn5jeduFL/oLU
	 jNeT+mscEMQiyldI+ETwJxja8cSjrILzlvv+789IQZiWFVhrgNZBi7zdxp4kIcsjXZ
	 gQ5P3bLbUPblw==
Message-ID: <sashiko-outbox-219755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 7/9] net: bgmac: add Northstar IPv4 TCP/UDP NAT
 flowtable offload
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116222519.1416501-8-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-8-florian.fainelli@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 22:33:59 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 4 potential
issues to consider:
- [High] net: bgmac: incomplete TCP flow retirement in fa_insert() and
  fa_control_match()
- [Medium] net: bgmac: unlocked block_list access and missing netns
  check in bcm_ns_fa_setup_tc()
- [Medium] net: bgmac: untracked neighbours in fa_route_check() and
  eviction in fa_netevent()
- [Low] net: bgmac: unlocked list_del_rcu() on fa_write() error path in
  fa_insert()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] net: bgmac: fixed PHY resource leak on probe error and remove
  paths [1]
--

commit 90c733393e363fb5e285d7f2e6d82b71424dc058
Author: Florian Fainelli <florian.fainelli@broadcom.com>

net: bgmac: add Northstar IPv4 TCP/UDP NAT flowtable offload

This commit adds IPv4 TCP/UDP NAT flowtable hardware offload support for
the Broadcom Northstar BCM4708/BCM5301X inline flow accelerator on GMAC2.

> diff --git a/drivers/net/ethernet/broadcom/bcm-ns-fa.c b/drivers/net/ethe=
rnet/broadcom/bcm-ns-fa.c
> new file mode 100644
> index 0000000000000..8665ba94cbab6
> --- /dev/null
> +++ b/drivers/net/ethernet/broadcom/bcm-ns-fa.c
[ ... ]
> +static bool fa_control_match(const struct fa_flow *entry,
> +			     const struct fa_tuple *tuple, unsigned int port,
> +			     bool ports_valid)
> +{
> +	size_t len =3D ports_valid ? sizeof(*tuple) : offsetof(struct fa_tuple,=
 sport);
> +
> +	return entry->l4proto =3D=3D IPPROTO_TCP && entry->in_port =3D=3D port =
&&
> +	       !memcmp(&entry->tuple, tuple, len);
> +}

[ ... ]

> +static int fa_netevent(struct notifier_block *nb, unsigned long event, v=
oid *ptr)
> +{
> +	struct bcm_ns_fa *fa =3D container_of(nb, struct bcm_ns_fa, netevent_nb=
);
> +	struct fa_neighbour *cached =3D NULL;
> +	struct neighbour *neighbour =3D ptr;
> +	bool invalidate =3D false;
> +	unsigned int i;
> +	char mac[ETH_ALEN];
> +	__be32 address;
> +	u8 state;
> +
> +	if (event =3D=3D NETEVENT_IPV4_MPATH_HASH_UPDATE ||
> +	    event =3D=3D NETEVENT_IPV4_FWD_UPDATE_PRIORITY_UPDATE) {
> +		if (ptr =3D=3D &init_net)
> +			fa_invalidate(fa);
> +		return NOTIFY_DONE;
> +	}
> +	if (event =3D=3D NETEVENT_REDIRECT) {
> +		struct netevent_redirect *redirect =3D ptr;
> +
> +		if (net_eq(dev_net(redirect->new->dev), &init_net))
> +			fa_invalidate(fa);
> +		return NOTIFY_DONE;
> +	}
> +	if (event !=3D NETEVENT_NEIGH_UPDATE || neighbour->tbl->family !=3D AF_=
INET ||
> +	    !fa_port(fa, neighbour->dev))
> +		return NOTIFY_DONE;
> +	state =3D READ_ONCE(neighbour->nud_state);
> +	address =3D get_unaligned((__be32 *)neighbour->primary_key);
> +	neigh_ha_snapshot(mac, neighbour, neighbour->dev);
> +	spin_lock_bh(&fa->learn_lock);
> +	for (i =3D 0; i < ARRAY_SIZE(fa->neighbours); i++) {
> +		struct fa_neighbour *candidate =3D &fa->neighbours[i];
> +
> +		if (candidate->valid && candidate->ifindex =3D=3D neighbour->dev->ifin=
dex &&
> +		    candidate->address =3D=3D address) {
> +			cached =3D candidate;
> +			invalidate =3D !(state & NUD_VALID) || memcmp(candidate->mac, mac, ET=
H_ALEN);
> +			break;
> +		}
> +	}
> +	if (!cached) {
> +		cached =3D &fa->neighbours[fa->neighbour_next++ % FA_NEXTHOPS];
> +		invalidate =3D cached->valid || !(state & NUD_VALID) || !list_empty(&f=
a->entries);
> +	}
> +	*cached =3D (struct fa_neighbour) {
> +		.address =3D address, .ifindex =3D neighbour->dev->ifindex,
> +		.state =3D state, .valid =3D true,
> +	};
> +	memcpy(cached->mac, mac, ETH_ALEN);
> +	spin_unlock_bh(&fa->learn_lock);
> +	if (invalidate)
> +		fa_invalidate(fa);
> +	return NOTIFY_DONE;
> +}

[Severity: Medium]
Can an admitted flow's next-hop neighbour be missing from fa->neighbours[],
preventing fa_neighbour_activity() from sending reachability probes?

fa->neighbours[] is only populated on NETEVENT_NEIGH_UPDATE while
fa_port(fa, neighbour->dev) is true; neither fa_route_check() nor
fa_insert() records the neighbour of an admitted flow.  A neighbour
resolved before fa_port() became true (such as before carrier-up or via a
static entry) is never added, and an existing entry can also be evicted by
128 failed ARP updates because fa_netevent() unconditionally writes
non-NUD_VALID updates into the ring with valid =3D true.

In addition, when !cached is true, invalidate is false if cached->valid is
false, state is NUD_VALID, and list_empty(&fa->entries) is true.  If the
first flow has already passed fa_route_check() and fa_learn_lookup() and is
sleeping in fa_mac_get() before being added to fa->entries, a
NETEVENT_NEIGH_UPDATE changing that uncached neighbour to a new NUD_VALID
MAC skips fa_invalidate() and lets fa_insert() commit the stale MAC to
hardware.

> +
> +static void fa_control_work(struct work_struct *work)
> +{
> +	struct bcm_ns_fa *fa =3D container_of(work, struct bcm_ns_fa, control_w=
ork);
> +	unsigned long generation;
> +	unsigned int i;
> +
> +	mutex_lock(&fa->lock);
> +	for (;;) {
> +		spin_lock_bh(&fa->learn_lock);
> +		generation =3D fa->pending_generation;
> +		spin_unlock_bh(&fa->learn_lock);
> +		for (i =3D 0; i < FA_SLOTS; i++) {
> +			struct fa_flow *entry =3D fa->flows[i];
> +
> +			if (entry && test_bit(FA_FLOW_CLOSING, &entry->flags) && entry->rever=
se)
> +				set_bit(FA_FLOW_CLOSING, &entry->reverse->flags);
> +		}
> +		for (i =3D 0; i < FA_SLOTS; i++)
> +			if (fa->flows[i] && test_bit(FA_FLOW_CLOSING, &fa->flows[i]->flags))
> +				fa_uninstall(fa, i);

[ ... ]

> +	list_add_rcu(&entry->list, &fa->entries);
> +	spin_unlock_bh(&fa->learn_lock);
> +	fa_encode(&rule, po, nh, entry->out_port, data);
> +	/* Publish to NAPI before committing: a concurrent control trap must
> +	 * stop lookups even if it arrives while this entry is being written.
> +	 */
> +	fa_control_update(fa, 0, FA_CTL_NO_DA_CHECK);
> +	err =3D fa_write(fa, FA_FLOW_TABLE, slot, data);
> +	if (err) {
> +		fa_fail(fa);
> +		list_del_rcu(&entry->list);
> +		netdev_put(entry->in, &entry->in_tracker);
> +		netdev_put(entry->out, &entry->out_tracker);
> +		kfree_rcu(entry, rcu);
> +		return err;
> +	}

[Severity: Low]
Should list_del_rcu(&entry->list) on the fa_write() error path hold
spin_lock_bh(&fa->learn_lock)?

fa_insert() adds entry to fa->entries under fa->learn_lock and fa_destroy()
holds fa->learn_lock around list_del_rcu(), whereas fa_fail() releases
fa->learn_lock before list_del_rcu() runs here, racing with readers under
fa->learn_lock such as list_empty(&fa->entries) in fa_netevent().

> +	entry->installed =3D true;
> +	if (rule.l4proto =3D=3D IPPROTO_TCP) {
> +		struct fa_flow *other;
> +
> +		list_for_each_entry(other, &fa->entries, list) {
> +			if (other =3D=3D entry || other->l4proto !=3D IPPROTO_TCP || other->r=
everse ||
> +			    test_bit(FA_FLOW_CLOSING, &other->flags) ||
> +			    other->in_port !=3D entry->out_port ||
> +			    other->out_port !=3D entry->in_port ||
> +			    memcmp(&other->tuple, &entry->reply, sizeof(other->tuple)) ||
> +			    memcmp(&other->reply, &entry->tuple, sizeof(other->reply)))
> +				continue;
> +			entry->reverse =3D other;
> +			other->reverse =3D entry;
> +			break;
> +		}
> +	}
> +	entry->lastused =3D jiffies;
> +	fa->flows[slot] =3D entry;
> +	fa->nr_flows++;
> +	return 0;

[Severity: High]
Can a TCP direction remain active in the hardware flow table after a TCP
FIN, RST, or SYN control packet arrives in the opposite direction?

When flow_offload_rule_add() installs a bidirectional TCP flow, it calls
FLOW_CLS_REPLACE for the original direction (other) and then the reply
direction (entry).  In fa_insert(), entry is added to fa->entries before
fa_write() sleeps in fa_table_begin(), while entry->reverse and
other->reverse are only linked after fa_write() returns:

CPU0 (workqueue)                  CPU1 (GMAC0 NAPI)
fa_insert() [reply: entry]
  spin_lock_bh(&fa->learn_lock)
  list_add_rcu(&entry->list, ...)
  spin_unlock_bh(&fa->learn_lock)
  fa_write()
    fa_table_begin()
      fsleep(20)
                                  fa_control_receive()
                                    fa_tcp_control() [original tuple]
                                      /* matches other, not entry */
                                      set_bit(FA_FLOW_CLOSING,
                                              &other->flags)
                                      queue_work(..., &fa->control_work)
  list_for_each_entry(other, ...)
    if (... || test_bit(FA_FLOW_CLOSING, &other->flags))
      continue;  <-- skips other, reverse not linked
  fa->flows[slot] =3D entry;
mutex_unlock(&fa->lock)

fa_control_work()
  /* other->reverse is NULL */
  fa_uninstall(other)
  fa->control_pending =3D false
  fa_lookup_update(fa)  <-- re-enables lookup with entry still installed

The same happens if other was already retired by fa_control_work() (while
still in fa->entries with FA_FLOW_CLOSING set awaiting FLOW_CLS_DESTROY)
before fa_insert() runs for entry.

Also, if only one direction of a TCP flow was offloaded (for example, when
only one direction's miss hash was learned on GMAC2 or the reply bucket was
full), entry->reverse is NULL and fa_control_match() only checks
entry->in_port and entry->tuple, ignoring entry->out_port and entry->reply.
Any FIN, RST, or SYN arriving in the reply direction will not match in
fa_tcp_control() and will leave the offloaded direction in hardware.

[ ... ]

> +int bcm_ns_fa_setup_tc(struct bcm_ns_fa *fa, enum tc_setup_type type, vo=
id *data)
> +{
> +	struct flow_block_offload *block =3D data;
> +	struct flow_block_cb *cb;
> +
> +	if (!fa || type !=3D TC_SETUP_FT ||
> +	    block->binder_type !=3D FLOW_BLOCK_BINDER_TYPE_CLSACT_INGRESS)
> +		return -EOPNOTSUPP;
> +	block->driver_block_list =3D &fa->block_list;
> +	/* DSA forwards each user-port bind to the same conduit. Keep one
> +	 * callback per flowtable, with a reference for each bound user port.
> +	 */
> +	switch (block->command) {
> +	case FLOW_BLOCK_BIND:
> +		cb =3D flow_block_cb_lookup(block->block, fa_block_cb, fa);
> +		if (cb) {
> +			flow_block_cb_incref(cb);
> +			return 0;
> +		}
> +		/* Different flowtables have independent cookies and policy. The
> +		 * hardware cannot partition tables by ingress port or netns.
> +		 */
> +		if (!list_empty(&fa->block_list))
> +			return -EBUSY;
> +		cb =3D flow_block_cb_alloc(fa_block_cb, fa, fa, NULL);
> +		if (IS_ERR(cb))
> +			return PTR_ERR(cb);
> +		flow_block_cb_incref(cb);
> +		flow_block_cb_add(cb, block);
> +		list_add_tail(&cb->driver_list, &fa->block_list);
> +		return 0;
> +	case FLOW_BLOCK_UNBIND:
> +		cb =3D flow_block_cb_lookup(block->block, fa_block_cb, fa);
> +		if (!cb)
> +			return -ENOENT;
> +		bcm_ns_fa_flush(fa);
> +		if (!flow_block_cb_decref(cb)) {
> +			flow_block_cb_remove(cb, block);
> +			list_del(&cb->driver_list);
> +		}
> +		return 0;
> +	default:
> +		return -EOPNOTSUPP;
> +	}
> +}

[Severity: Medium]
Does bcm_ns_fa_setup_tc() need to hold fa->lock and reject binds outside
init_net?

nf_tables calls ndo_setup_tc(TC_SETUP_FT) under the per-netns commit_mutex
and per-flowtable flow_block_lock without holding rtnl_lock() or fa->lock.
If a DSA user port is moved to another network namespace, flowtable bind
and unbind operations in that namespace can race with init_net on
fa->block_list without synchronization, and binding a flowtable in a
non-initial namespace occupies fa->block_list (even though fa_port()
rejects rules outside init_net), blocking init_net with -EBUSY and flushing
hardware flows on unbind.

> diff --git a/drivers/net/ethernet/broadcom/bgmac.c b/drivers/net/ethernet=
/broadcom/bgmac.c
> index 1c502bd64d7df..527f9842eb833 100644
> --- a/drivers/net/ethernet/broadcom/bgmac.c
> +++ b/drivers/net/ethernet/broadcom/bgmac.c
[ ... ]
> @@ -1560,6 +1579,17 @@ int bgmac_enet_probe(struct bgmac *bgmac)
>  	net_dev->hw_features =3D net_dev->features;
>  	net_dev->vlan_features =3D net_dev->features;
> =20
> +	bgmac->fa =3D bcm_ns_fa_init(net_dev);
> +	if (IS_ERR(bgmac->fa)) {
> +		err =3D PTR_ERR(bgmac->fa);
> +		bgmac->fa =3D NULL;
> +		goto err_phy_disconnect;
> +	}

[Severity: Medium]
This problem wasn't introduced by this patch, but jumping to
err_phy_disconnect (as well as the existing register_netdev() error path
and bgmac_enet_remove()) only calls phy_disconnect() without unregistering
the fixed PHY [1]:

drivers/net/ethernet/broadcom/bgmac.c:bgmac_phy_connect_direct() {
    ...
	phy_dev =3D fixed_phy_register(&fphy_status, NULL);
	if (IS_ERR(phy_dev)) {
		dev_err(bgmac->dev, "Failed to register fixed PHY device\n");
		return PTR_ERR(phy_dev);
	}

	err =3D phy_connect_direct(bgmac->net_dev, phy_dev, bgmac_adjust_link,
				 PHY_INTERFACE_MODE_MII);
	if (err) {
		dev_err(bgmac->dev, "Connecting PHY failed\n");
		return err;
	}
    ...
}

When a fixed PHY was registered via bgmac_phy_connect_direct() or
of_phy_get_and_connect() with a fixed-link DT node, failing to call
fixed_phy_unregister() (or of_phy_deregister_fixed_link()) leaks the
phy_device and one of the 8 global fixed_phy_ids slots.

[1] https://sashiko.dev/#/bug/linux-e2734269-f662-4a85-ac81-0eead2b697c2

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222519.1416=
501-1-florian.fainelli@broadcom.com?part=3D7
