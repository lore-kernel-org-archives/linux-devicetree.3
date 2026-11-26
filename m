Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795726470;
	b=llLphSLb1Zrmq+F5hiAGWMCOls9F/xvlbBcnbVCX446YEpshWz1qdMUgNxz980qH89GU
	 S7HlyveVAm73arAOWfp3Q3ZaxLDd4tmaLvvyEetfT6uitcaSxiEQE1qC+vx2eBl5Vi6nF
	 0fi+s27rEkoCdLl9/UYbbxUuRhDA0v0vdI0g0FSrpbJZxkAmSabxYxz1007mLEQ7+Vjer
	 NVAZV4WW9+l1viO3kie2EKDppQ8NNMCox7pI+XFe6nxRmBwI8LRwK7FbG7FofUkBQRN6v
	 QNaJUvw6fGN5vn/R5wFMpFzeJfu3AOyn/P+O60nrkLmtlKB7gdz+EvWeDMPzaIDF/sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795726470;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gX3l0gq+4XZt+BH3wm80UPOIleQoKusRv0yhS6iwdUI=;
	b=0rxQvydRsYItwjjpjslyoOY4fQMXEtEW26IxlubTIm7NdNeI4Iyre/sP9XhETWI7aBhd
	 fKQUJVm1cYHQZlHh8hAVdwNHdAeUsduq36xRXX9i12Jlx585+gyClvqKx+FF4Wf5ZK/FA
	 4s07R0fooGGWNVvHPzBRPZLbjtraQrbkROpT8ul0pejoA+XRai69K93xhu48yPBoMlr8p
	 iu61rQ9VIpr4MzqkxFvLARZmBQlBgh8DeDl7J1S0+Wd+ImK7k88/SUMY9kz9cw3ybeo2T
	 oxyw39iswm9QWy0MetrZRwfjZiB4hIXfzlLackAjHcW1WDs4R2b8Vk5aRf4/4U6tBsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diYGX8DQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F67606A31C
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 20:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=diYGX8DQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABA101F00893;
	Thu, 26 Nov 2026 20:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795726469;
	bh=gX3l0gq+4XZt+BH3wm80UPOIleQoKusRv0yhS6iwdUI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=diYGX8DQuuZikVl0i8tOdPuVE+SyosaJxSqHNSK5NjrzMY+S4ROgW1pBp9qvAV43n
	 KPT7psdV1Scz1547UX+BTunlLQXLQu8ir+m3OXpDCQ88e0IRze8HmpB93zR5UcbdAn
	 UDfcgItNos7QBfUJ+dDH4j1OT0jyfDGHlpO0o3W0xARwEJl6Di2/KH6OFMMYGtNZpO
	 k6XXVVk6WEy286EGx2H4/3BYZHobpP+PpYovvammZT1VeGs4JpaOMYZCh93Cddz/ui
	 XxPH0PCLWQunBMZLjNlSsrqv77o/pa9Rtqt2gjXue7BOjPYu6FyZ1aYAb9QBBSNgcz
	 npQBIKy3wB6/w==
Message-ID: <sashiko-outbox-236173@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC net-next 4/7] net: cortina: add a serialized CS7542
 forwarding engine owner
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261125-almondplus-offload-rfc-v1-4-703175c6340c@gmail.com>
References: <20261125-almondplus-offload-rfc-v1-0-703175c6340c@gmail.com>
 <20261125-almondplus-offload-rfc-v1-4-703175c6340c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 20:54:29 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 11 potential
issues to consider:
- [High] net: cortina: missing cs_fe_backend.c breaks build when hot
  backend disabled
- [High] net: cortina: vmlinux link failure in cs_native_port() when
  CONFIG_NET_DSA=3Dm
- [High] net: cortina: missing qca8k_persistent_status() definition
  breaks build
- [Medium] net: cortina: cs_be_replace() fast path ignores io->selector
  MAC changes
- [Medium] net: cortina: hot_claim() mutates hardware MTU range before
  affinity check
- [Medium] net: cortina: release_store() blocks concurrent teardown
  before idle check
- [Medium] net: cortina: cs_be_overlap() rejects disjoint flows with
  matching L4 ports
- [Medium] net: cortina: cs_native_device() returns NOTIFY_STOP_MASK on
  unvetoable events
- [Medium] net: cortina: cs_native_replace() rejects offload with
  -EAGAIN under RTNL
- [Medium] net: cortina: cs_native_neigh() revokes all flows on new ARP
  or hash collision
- [Medium] net: cortina: unconditional pre-routing hook and global ICMP
  flow revocation
--

commit ee381284de66b5508f0942818876f1cf7474c977
Author: Fil Dunsky <filipp.dunsky@gmail.com>

net: cortina: add a serialized CS7542 forwarding engine owner

This commit adds a forwarding engine owner for the Cortina CS7542 Ethernet
driver, attaching hardware flowtable offload requests via the indirect
conduit block API and providing table encoding, exception guards, and a
replaceable placement backend.

> diff --git a/drivers/net/ethernet/cortina/Makefile b/drivers/net/ethernet=
/cortina/Makefile
> index e998ffcc889c4..2bd0572d0c170 100644
> --- a/drivers/net/ethernet/cortina/Makefile
> +++ b/drivers/net/ethernet/cortina/Makefile
> @@ -2,6 +2,17 @@
>  # Makefile for the Cortina Gemini network device drivers.
> =20
>  obj-$(CONFIG_GEMINI_ETHERNET) +=3D gemini.o
> -
>  obj-$(CONFIG_CS7542_ETHERNET) +=3D cs7542-eth.o
>  cs7542-eth-y :=3D cs752x_ne.o cs752x_fe.o cs752x_sch_tm.o
> +
> +obj-$(CONFIG_CS7542_FT_LIVE_BRIDGE) +=3D cs7542_ft_live.o
> +cs7542-eth-$(CONFIG_CS7542_FE_LIVE_OWNER) +=3D cs7542_fe_live.o cs_fe_en=
code.o cs_fe_acl_guard.o cs_fe_acl_encode.o cs_fe_hot.o
> +
> +ifeq ($(CONFIG_CS7542_FE_HOT_BACKEND),y)
> +cs7542-eth-y +=3D cs_fe_backend_dispatch.o cs_fe_hot_tables.o cs_fe_hot_=
access.o cs_fe_hot_lineage.o
> +else
> +cs7542-eth-$(CONFIG_CS7542_FE_LIVE_OWNER) +=3D cs_fe_backend.o
> +endif

[Severity: High]
Does enabling CONFIG_CS7542_FE_LIVE_OWNER=3Dy with
CONFIG_CS7542_FE_HOT_BACKEND=3Dn fail to build because cs_fe_backend.c is
missing from the tree?  CONFIG_CS7542_FE_HOT_BACKEND is a separate optional
symbol that defaults to n.

[ ... ]

> diff --git a/drivers/net/ethernet/cortina/cs7542_fe_live.c b/drivers/net/=
ethernet/cortina/cs7542_fe_live.c
> new file mode 100644
> index 0000000000000..a2de2206178f9
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs7542_fe_live.c
> @@ -0,0 +1,735 @@

[ ... ]

> +#define CS_FE_NATIVE_AVAILABLE                                          =
  \
> +	(IS_ENABLED(CONFIG_CS7542_FE_HOT_BACKEND) &&                      \
> +	 IS_BUILTIN(CONFIG_BRIDGE) && IS_ENABLED(CONFIG_NET_SWITCHDEV) && \
> +	 IS_BUILTIN(CONFIG_INET) && IS_BUILTIN(CONFIG_NETFILTER))

[Severity: High]
Can linking vmlinux fail with an undefined reference to
dsa_port_from_netdev() when CONFIG_NET_DSA=3Dm?

CS7542_FT_LIVE_BRIDGE depends on CS7542_ETHERNET=3Dy && NET_DSA, which allo=
ws
tristate NET_DSA to be built as a module while cs7542_fe_live.o is built-in.
When CS_FE_NATIVE_AVAILABLE is true, cs7542_fe_live.c includes
cs_fe_native.inc and cs_native_port() calls dsa_port_from_netdev().  Either
CS7542_FT_LIVE_BRIDGE should depend on NET_DSA=3Dy or CS_FE_NATIVE_AVAILABLE
should also check IS_BUILTIN(CONFIG_NET_DSA).

[ ... ]

> diff --git a/drivers/net/ethernet/cortina/cs_fe_backend_algorithm.c b/dri=
vers/net/ethernet/cortina/cs_fe_backend_algorithm.c
> new file mode 100644
> index 0000000000000..5df71154005e9
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs_fe_backend_algorithm.c
> @@ -0,0 +1,976 @@

[ ... ]

> +static bool cs_be_overlap(const struct cs_fe_rule *a,
> +			  const struct cs_fe_rule *b)
> +{
> +	/* Codec CLASS is coarse: distinct IPs do NOT make these selectors disj=
oint. */
> +	return a->ingress.gmac =3D=3D b->ingress.gmac &&
> +	       a->ingress.tag_mode =3D=3D b->ingress.tag_mode &&
> +	       (a->ingress.rx_qca_meta & 0xefff) =3D=3D
> +		       (b->ingress.rx_qca_meta & 0xefff) &&
> +	       a->original.sport =3D=3D b->original.sport &&
> +	       a->original.dport =3D=3D b->original.dport;
> +}

[Severity: Medium]
Does cs_be_overlap() reject disjoint flows that share L4 ports on the same
ingress switch port?

build_class() always matches FE_CLASS_IP_PROT exactly, and for scope_exact
flows cs_fe_exact_class_ipv4() also programs exact 32-bit IPv4 source and
destination addresses and MAC addresses into the CLASS entry.  Because
cs_be_overlap() ignores the L4 protocol and exact IPv4/MAC selectors, a
TCP/443 flow and a UDP/443 flow (or flows to different IPv4 hosts using the
same L4 port pair) on the same port are rejected with -EOPNOTSUPP in
cs_be_replace(), cs_be_try_rearm(), and cs_be_try_rekey().

[ ... ]

> +	if (entry) {
> +		entry->version =3D version;
> +		if (entry->active && rule && policy && !encoding &&
> +		    backend->lease[entry->lease].marker =3D=3D marker &&
> +		    backend->lease[entry->lease].guarded =3D=3D guarded &&
> +		    backend->lease[entry->lease].scoped =3D=3D !!scope_grant &&
> +		    backend->lease[entry->lease].scope_exact =3D=3D scope_exact &&
> +		    backend->lease[entry->lease].scope_grant =3D=3D scope_grant &&
> +		    cs_be_equal(&backend->lease[entry->lease], rule, policy))
> +			return 0;

[Severity: Medium]
When an active scope_exact entry is replaced in place with a different
io->selector.source (ingress_smac) or io->selector.destination, does this
fast path return 0 without updating the hardware CLASS entry?

cs_be_equal() only compares rule and policy, whereas scope_exact flows
encode io->selector into plan.class_invalid and plan.class_valid via
cs_fe_exact_class_ipv4() (as checked in cs_be_try_rearm()).  Returning 0
here leaves the old ingress MAC selector programmed in hardware while
cs_native_replace() overwrites slot->path.ingress_smac with the new MAC.

[ ... ]

> diff --git a/drivers/net/ethernet/cortina/cs_fe_backend_dispatch.c b/driv=
ers/net/ethernet/cortina/cs_fe_backend_dispatch.c
> new file mode 100644
> index 0000000000000..4ffd929a9599d
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs_fe_backend_dispatch.c
> @@ -0,0 +1,433 @@

[ ... ]

> +static ssize_t release_store(struct kobject *kobj, struct kobj_attribute=
 *attr,
> +			     const char *buffer, size_t count)
> +{
> +	const struct cs7542_fe_backend_ops *ops;
> +	unsigned int contexts =3D 0, leases =3D 0;
> +	int error;
> +
> +	if (!sysfs_streq(buffer, "release"))
> +		return -EINVAL;
> +	mutex_lock(&provider_control);
> +	down_write(
> +		&provider_calls); /* Drain every synchronous algorithm call. */
> +	ops =3D provider;
> +	if (!ops) {
> +		up_write(&provider_calls);
> +		mutex_unlock(&provider_control);
> +		return count;
> +	}
> +	if (ops->owner->state !=3D MODULE_STATE_LIVE ||
> +	    module_refcount(ops->owner) !=3D 1) {
> +		up_write(&provider_calls);
> +		mutex_unlock(&provider_control);
> +		return -EBUSY;
> +	}
> +	provider_blocked =3D true;
> +	up_write(&provider_calls);
> +	/* No provider rwsem held while taking owner locks or reading table cut=
s. */
> +	error =3D cs_fe_live_hot_idle(&contexts, &leases, true);
> +	down_write(&provider_calls);
> +	if (!error && module_refcount(ops->owner) !=3D 1)
> +		error =3D -EBUSY;
> +	if (!error) {
> +		provider =3D NULL;
> +		if (provider_epoch !=3D U64_MAX)
> +			provider_epoch++;
> +		module_put(
> +			ops->owner); /* Safe builtin caller; data/text no longer reachable. */
> +	}
> +	provider_blocked =3D
> +		false; /* On failure keep the provider usable for cleanup. */
> +	up_write(&provider_calls);
> +	mutex_unlock(&provider_control);
> +	return error ? error : count;
> +}

[Severity: Medium]
Can setting provider_blocked =3D true before cs_fe_live_hot_idle() cause
concurrent flow teardown or block close operations to fail with
-EOPNOTSUPP?

CPU0                                  CPU1
release_store()
  down_write(&provider_calls)
  provider_blocked =3D true
  up_write(&provider_calls)
                                      binding_release()
                                        binding_close()
                                          ...
                                            cs_hot_dispatch(CS_HOT_UNBIND)
                                              down_read(&provider_calls)
                                              if (provider_blocked)
                                                return -EOPNOTSUPP
                                        provider_closed =3D true  <-- wedged
  cs_fe_live_hot_idle() -> -EBUSY
  down_write(&provider_calls)
  provider_blocked =3D false
  up_write(&provider_calls)

Because cs_hot_dispatch() only pins ops->owner for the duration of
ops->run(), module_refcount(ops->owner) is 1 even while blocks and offloaded
flows are active.  During the window where provider_blocked is true and
provider_calls is dropped, any concurrent teardown call (such as
binding_release() or cs_native_drain()) fails in cs_hot_dispatch() with
-EOPNOTSUPP, permanently setting provider_closed =3D true in cs7542_ft_live=
.c
and leaking binding, or leaving unrevoked flows in hardware.

[ ... ]

> diff --git a/drivers/net/ethernet/cortina/cs_fe_hot_tables.c b/drivers/ne=
t/ethernet/cortina/cs_fe_hot_tables.c
> new file mode 100644
> index 0000000000000..ab60e09b51cb0
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs_fe_hot_tables.c
> @@ -0,0 +1,920 @@

[ ... ]

> +	/* Collision refusal precedes any change to the permanent journal. */
> +	for (other =3D 0; other < CS_FE_HOT_SLOTS; other++)
> +		if (other !=3D index && state->ledger.slots[other].claimed &&
> +		    state->ledger.slots[other].plan.key.bucket =3D=3D
> +			    canonical.key.bucket)
> +			return -EOPNOTSUPP;
> +	error =3D hot_native_range(session, true, session->native.limit_us);
> +	if (error)
> +		return error;
> +	slot =3D &state->ledger.slots[index];
> +	if (slot->claimed)
> +		return cs_be_rows_equal(&slot->rows, &issued) &&
> +				       cs_be_plan_equal(&slot->plan,
> +							&canonical) ?
> +			       0 :
> +			       -ESTALE;
> +	graph =3D &state->ledger.actions[issued.voq - 5U];
> +	if (shared) {
> +		unsigned long long end =3D
> +			session->native.now_us(session->native.context) +
> +			CS_FE_BACKEND_US;
> +
> +		if (session->native.limit_us && session->native.limit_us < end)
> +			end =3D session->native.limit_us;
> +		error =3D hot_empty_selector(session, &issued, &canonical, end);
> +		if (!error)
> +			error =3D hot_verify_output(session, &issued, &canonical,
> +						  end);
> +		if (error)
> +			return error;
> +	} else if (graph->anchor_plus_one || graph->members || graph->visible) {
> +		return -EUCLEAN;
> +	}
> +	error =3D cs_fe_hot_affinity_claim(&state->lineage, index,
> +					 canonical.key.bucket);
> +	if (error)
> +		return error;

[Severity: Medium]
Does calling hot_native_range() before hot_empty_selector(),
hot_verify_output(), and cs_fe_hot_affinity_claim() mutate hardware state on
a rejected claim?

cs_be_replace() documents that io->claim() is all-or-nothing and rejections
have no hardware or ledger effect.  However, when a slot has been rebound to
a new bucket in hot_rebind(), state->ledger.slots[other].plan.key.bucket
holds the new bucket while state->lineage.bucket_owner[] still owns the old
bucket.  A new claim hashing to that old bucket passes the loop above,
programs the MTU range registers in hot_native_range() (setting
range->touched =3D true and range->owned =3D true, which causes cs_fe_live_=
pin()
to take owner->quarantine_ref), and then fails in cs_fe_hot_affinity_claim()
with -EADDRINUSE.

[ ... ]

> diff --git a/drivers/net/ethernet/cortina/cs_fe_native.inc b/drivers/net/=
ethernet/cortina/cs_fe_native.inc
> new file mode 100644
> index 0000000000000..77d37280b5e78
> --- /dev/null
> +++ b/drivers/net/ethernet/cortina/cs_fe_native.inc
> @@ -0,0 +1,668 @@

[ ... ]

> +	cs_fe_native_prune(owner);
> +	io =3D cs_fe_live_io(owner);
> +	if (!err &&
> +	    (owner->ports[1] !=3D conduit || !READ_ONCE(cs_native_watching) ||
> +	     gen !=3D atomic64_read(&cs_native_scanned)))
> +		err =3D -EAGAIN;

[Severity: Medium]
Can cs_native_replace() permanently fail with -EAGAIN whenever
cs_native_scanned lags behind cs_native_generation?

cs_native_replace() holds RTNL, which prevents cs_native_worker() from
acquiring rtnl_lock() to run cs_native_drain() and advance
cs_native_scanned, so any asynchronous notifier event that increments
cs_native_generation before or during cs_native_replace() causes it to
reject the flow version with -EAGAIN.  Furthermore, if cs_native_drain()
returns an error and existing flows are later destroyed or pruned so
cs_native_live drops to 0, cs_native_changed() stops scheduling
cs_native_work while cs_native_scanned < cs_native_generation, wedging all
subsequent cs_native_replace() calls with -EAGAIN.

[ ... ]

> +static int cs_native_device(struct notifier_block *nb, unsigned long eve=
nt,
> +			    void *info)
> +{
> +	struct net_device *dev =3D netdev_notifier_info_to_dev(info);
> +
> +	if (!net_eq(dev_net(dev), &init_net))
> +		return NOTIFY_DONE;
> +	switch (event) {
> +	case NETDEV_PRECHANGEUPPER:
> +	case NETDEV_PRE_CHANGEADDR:
> +	case NETDEV_PRECHANGEMTU:
> +	case NETDEV_GOING_DOWN:
> +	case NETDEV_UNREGISTER:
> +		return cs_native_changed(CS_NATIVE_REVOKE, true);

[Severity: Medium]
Does returning notifier_from_errno(cs_native_drain()) on NETDEV_GOING_DOWN
and NETDEV_UNREGISTER set NOTIFY_STOP_MASK on non-vetoable events?

If cs_native_drain() returns a negative error (for example when the backend
is poisoned, blocked, or closing during cs_ne_port_cleanup()),
notifier_from_errno() sets NOTIFY_STOP_MASK.  Because NETDEV_GOING_DOWN and
NETDEV_UNREGISTER cannot be vetoed, the device continues to close or
unregister while raw_notifier_call_chain() stops early, preventing later
notifiers on netdev_chain from receiving the teardown event; and because
cs_native_device() does not filter by device, a failed drain also blocks
NETDEV_PRECHANGEUPPER, NETDEV_PRE_CHANGEADDR, and NETDEV_PRECHANGEMTU on
unrelated interfaces in init_net.

[ ... ]

> +static int cs_native_neigh(struct notifier_block *nb, unsigned long even=
t,
> +			   void *info)
> +{
> +	if (event =3D=3D NETEVENT_NEIGH_UPDATE) {
> +		const struct neighbour *neigh =3D info;
> +
> +		if (neigh->tbl !=3D arp_table(dev_net(neigh->dev)) ||
> +		    neigh->dev->addr_len !=3D ETH_ALEN ||
> +		    !net_eq(dev_net(neigh->dev), &init_net) ||
> +		    !cs_native_arp_changed(neigh))
> +			return NOTIFY_DONE;
> +	} else if (event !=3D NETEVENT_REDIRECT &&
> +		   event !=3D NETEVENT_IPV4_MPATH_HASH_UPDATE)
> +		return NOTIFY_DONE;
> +	return cs_native_changed(CS_NATIVE_REVOKE, false);
> +}

[Severity: Medium]
Does passing CS_NATIVE_REVOKE here tear down all offloaded flows on every
new ARP entry or 128-entry hash collision?

The comment above cs_native_arp_state notes that collisions in
cs_native_arp[128] only require an extra recheck without expiring flows on
ordinary ARP confirmations.  However, cs_native_neigh() passes
CS_NATIVE_REVOKE, which sets revoke_all =3D true in cs_native_scan() and
unconditionally cuts every offloaded flow whenever a new neighbour is
resolved in init_net or two active neighbours collide in cs_native_arp[128]
during routine NUD refreshes.  In addition, cs_native_arp_changed() acquires
cs_native_arp_lock on every IPv4 neighbour update even when cs_native_live
and cs_native_programming are zero.

[ ... ]

> +static unsigned int cs_native_icmp(void *priv, struct sk_buff *skb,
> +				   const struct nf_hook_state *state)
> +{
> +	struct icmphdr copy;
> +	const struct icmphdr *icmp;
> +	const struct iphdr *ip;
> +
> +	if (!atomic_read(&cs_native_live) &&
> +	    !atomic_read(&cs_native_programming))
> +		return NF_ACCEPT;
> +	ip =3D ip_hdr(skb);
> +	if (ip->protocol =3D=3D IPPROTO_ICMP && !ip_is_fragment(ip)) {
> +		icmp =3D skb_header_pointer(skb,
> +					  skb_network_offset(skb) + ip->ihl * 4,
> +					  sizeof(copy), &copy);
> +		if (icmp && icmp->type =3D=3D ICMP_DEST_UNREACH &&
> +		    icmp->code =3D=3D ICMP_FRAG_NEEDED)
> +			cs_native_changed(CS_NATIVE_REVOKE, false);
> +	}
> +	return NF_ACCEPT;
> +}
> +
> +static struct notifier_block cs_native_dev_nb =3D { .notifier_call =3D
> +							  cs_native_device };
> +static struct notifier_block cs_native_fdb_nb =3D { .notifier_call =3D
> +							  cs_native_fdb };
> +static struct notifier_block cs_native_neigh_nb =3D { .notifier_call =3D
> +							    cs_native_neigh };
> +static struct notifier_block cs_native_fib_nb =3D { .notifier_call =3D
> +							  cs_native_fib };
> +static const struct nf_hook_ops cs_native_pmtu_hook =3D {
> +	.hook =3D cs_native_icmp,
> +	.pf =3D NFPROTO_IPV4,
> +	.hooknum =3D NF_INET_PRE_ROUTING,
> +	.priority =3D NF_IP_PRI_FIRST,
> +};
> +
> +static int __init cs_native_notifiers(void)
> +{
> +	int err;
> +
> +	err =3D register_netdevice_notifier(&cs_native_dev_nb);
> +	if (err)
> +		return err;
> +	err =3D register_switchdev_notifier(&cs_native_fdb_nb);
> +	if (err)
> +		goto dev;
> +	err =3D register_netevent_notifier(&cs_native_neigh_nb);
> +	if (err)
> +		goto fdb;
> +	err =3D register_fib_notifier(&init_net, &cs_native_fib_nb, NULL, NULL);
> +	if (err)
> +		goto neigh;
> +	err =3D nf_register_net_hook(&init_net, &cs_native_pmtu_hook);

[Severity: Medium]
Should cs_native_pmtu_hook be registered only while a CS7542 device or
offloaded flow is active, and should cs_native_icmp() match the embedded
packet against offloaded flows?

Registering cs_native_pmtu_hook unconditionally at late_initcall adds a
pre-routing hook call to every IPv4 packet in init_net even on systems
without a CS7542 device, and triggering CS_NATIVE_REVOKE without checking
the incoming interface or inner IPv4/L4 headers allows any single unrelated
or spoofed ICMP_FRAG_NEEDED packet to tear down all offloaded flows.

[ ... ]

> diff --git a/include/linux/dsa/qca8k_persistent.h b/include/linux/dsa/qca=
8k_persistent.h
> new file mode 100644
> index 0000000000000..5363f7ad0561e
> --- /dev/null
> +++ b/include/linux/dsa/qca8k_persistent.h
> @@ -0,0 +1,45 @@

[ ... ]

> +#if IS_ENABLED(CONFIG_NET_DSA_QCA8K_4B_MODE)
> +int qca8k_persistent_status(struct net_device *conduit,
> +			    struct qca8k_persistent_status *status);
> +#else
> +static inline int
> +qca8k_persistent_status(struct net_device *conduit,
> +			struct qca8k_persistent_status *status)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +#endif

[Severity: High]
Does this break the build at this commit when CONFIG_CS7542_FE_HOT_BACKEND=
=3Dy
and CONFIG_NET_DSA_QCA8K_4B_MODE=3Dy are both enabled?

cs_native_format() in cs_fe_native.inc calls qca8k_persistent_status(), but
qca8k_persistent_status() is not defined until a later patch in the series
(commit "net: dsa: qca8k: select the four-byte format before port
activation"), causing a vmlinux link failure and breaking git bisect.
Keeping the inline -EOPNOTSUPP stub here until the patch that defines
qca8k_persistent_status() would keep the series bisectable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-almondplus=
-offload-rfc-v1-0-703175c6340c@gmail.com?part=3D4
