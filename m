Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794954839;
	b=nFhItDPP5wvOD7OElTozA+hq7OjTRG/TTuRZsdj8KQvZ4HkSRIs6E4lzfCE3SGcgRU0T
	 tyaQz2ZHlFxQy+GeuFwfS5sE9onMSCo2PpagUPlda+HIJOZ0QOSdnnsEV6ho2wnx8EuS8
	 gskHKHKGpnFOX0aVxGU7C7Sbtpcg5T1XDiQCdab8xvahYeChoLpWGVwQ3wN2uF9TPxe77
	 NtmBQ/Jhvn0qg3WO9tfF08+h7GERww43vPNPmg7B6RwNx1RSdsN6uUR2TZUqM8DCHdFOG
	 4OH0E2d9afdOe/1KZ45TJVrDKAW54RI/LXIylItWpTG0ENjt2zcsI5VEEK4pXeMulkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794954839;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=pd5OU8MtIIEHELp3ofCqxw5iN07xcxDeoTFH+BVVwUg=;
	b=xC2gj5UXG+SHZnJb4EShlCvUoIvuwEPCuSzvA31BRDdLKQ2Fe2pvfuewATGCeHx/xLPM
	 D2cLzvWBjaQuCUcy7sdAjKf2Tp6NuEpVnkPzR2DvjntCMe5AwFatERjxi2y4X5oS6jRRM
	 G8TqlX/ZQjgm24LdH8ywIDZb7bcDQfX40UWJOHdF1y2tHyExNID/BcTZ6yHFKPe2LbmZn
	 QbkFnU71CdYyrRq789vPgs7D1AjJ/S9uDUnf0dltwzp8Hi9DTLcsGL3No/VWcFvrJYgsU
	 dJFemkvLNk/9jjWCe6QEaaHng1ecPd1GRh6gYGleibxNPco5SJhgBsmyHLVjM1oNwqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="BQWsq/R4";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA22C606A880
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 22:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BQWsq/R4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 711101F000C5;
	Tue, 17 Nov 2026 22:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794954839;
	bh=pd5OU8MtIIEHELp3ofCqxw5iN07xcxDeoTFH+BVVwUg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BQWsq/R4Q0lUscpCYyZUuqh6mVgzFAPLYRI4kbczkclP+3SV8MaqHk4/a7rDhGNCe
	 hKTYqKpupbzwHF0TgkLsHlJYNd3AkrUp3FWitXy8qm4zVkLIH+2jM5MXLql4NVrVVr
	 a9yZMrG7SzcL4f+NwEWRUQ2exlBh1+eJ6O88VRNqm/gQLNhsSUEmmwaleiRUZJBiEP
	 j2sBfOhCsP3a7JdUV8/Q6Zv/f//RVbeBmrXoZ00//DQ/o7HMzsJyEzzC640D4fzib2
	 FmInwbkCrpNszyvsjugrXNh/gxCOuBbanQPZ3h32m4g9DccjBahVdes0i0yJiZF/N6
	 aFmbtmZj7MDDA==
Message-ID: <sashiko-outbox-219753@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 5/9] net: dsa: add Broadcom FA metadata and
 IPv4 exception paths
Reply-To: sashiko-reviews@lists.linux.dev
To: "Florian Fainelli" <florian.fainelli@broadcom.com>
Cc: =?utf-8?b?b3BlbiBsaXN0Ok9QRU4gRklSTVdBUkUgQU5EIEZMQVRURU5FRCBERVZJ?=
 =?utf-8?b?Q0UgVFJFRSBCSU5ESU5HUw==?= <devicetree@vger.kernel.org>, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116222519.1416501-6-florian.fainelli@broadcom.com>
References: <20261116222519.1416501-1-florian.fainelli@broadcom.com>
 <20261116222519.1416501-6-florian.fainelli@broadcom.com>
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

Thank you for your contribution! Sashiko AI review found 7 potential
issues to consider:
- [Medium] net: dsa: b53: broken guard error handling in
  b53_fa_netdev_event()
- [Medium] net: dsa: b53: unrecorded standalone port on b53_fa_port()
  failure
- [Medium] net: dsa: b53: missing CPU port 5 in non-default VLANs in
  b53_vlan_add()
- [Medium] net: dsa: b53: active fa_netdev_nb during teardown and
  b53_switch_shutdown()
- [Medium] net: dsa: tag_brcm: brcm_tag_rcv_ll() reads prepended tag as
  MAC DA
- [Low] net: dsa: b53: duplicate CFP rule programming in b53_fa_setup()
- [Low] net: dsa: b53: unlocked fa_guards_ready access in
  b53_switch_register()
--

commit 5efa0c79a851eb8221145c59826df5a46728bb31
Author: Florian Fainelli <florian.fainelli@broadcom.com>

net: dsa: add Broadcom FA metadata and IPv4 exception paths

This commit adds a brcm-fa DSA tag driver for the Broadcom Northstar flow
accelerator on port 8 and configures B53 CFP rules to redirect IPv4
exception traffic and router-MAC guard misses to auxiliary CPU port 5.

> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_c=
ommon.c
> index b7aff5e238e85..3e8c9679836d3 100644
> --- a/drivers/net/dsa/b53/b53_common.c
> +++ b/drivers/net/dsa/b53/b53_common.c
[ ... ]
> +static int b53_fa_rule(struct b53_device *dev, unsigned int index,
> +		       const u32 data[8], const u32 mask[8], bool trap)
> +{
> +	unsigned int i;
> +	int err;
> +
> +	for (i =3D 0; i < 8; i++) {
> +		err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_DATA(i), data[i]);
> +		if (!err)
> +			err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_MASK(i), mask[i]);
> +		if (err)
> +			return err;
> +	}
> +	err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_ACTION(0),
> +			  trap ? CFP_ACT0_FWD_MAP_REPLACE | CFP_ACT0_DST_PORT5 |
> +				CFP_ACT0_REASON_TERMINATION : 0);
> +	if (!err)
> +		err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_ACTION(1),
> +				  trap ? CFP_ACT1_CLASS_ID(1) | CFP_ACT1_FWD_MAP_REPLACE |
> +				  CFP_ACT1_DST_PORT5 : 0);
> +	if (!err)
> +		err =3D b53_fa_cfp_write(dev, index, CFP_ACC_ACTION);
> +	if (!err)
> +		err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_METER, 0);
> +	if (!err)
> +		err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_METER + 4, 0);
> +	if (!err)
> +		err =3D b53_fa_cfp_write(dev, index, CFP_ACC_METER);
> +	return err ?: b53_fa_cfp_write(dev, index, CFP_ACC_TCAM);
> +}
[ ... ]
> +static int b53_fa_setup(struct b53_device *dev)
> +{
[ ... ]
> +	for (rule =3D 0; rule < 3; rule++) {
> +		memset(data, 0, sizeof(data));
> +		memset(mask, 0, sizeof(mask));
> +		data[0] =3D CFP_TCAM0_VALID | CFP_TCAM0_SLICE1 | CFP_TCAM0_UDF0_FLAG(r=
ule);
> +		/* Slice 1; FIN, SYN or RST. */
> +		mask[0] =3D CFP_TCAM0_VALID | CFP_TCAM0_SLICE_MASK | CFP_TCAM0_UDF0_FL=
AG(rule);
> +		data[5] =3D CFP_TCAM5_UDF_VALID(0); /* UDF A0 valid. */
> +		mask[5] =3D CFP_TCAM5_UDF_VALID(0);
> +		data[6] =3D FIELD_PREP(CFP_TCAM6_IP_PROTOCOL, IPPROTO_TCP);
> +		mask[6] =3D CFP_TCAM6_L3_FRAMING | CFP_TCAM6_IP_PROTOCOL | CFP_TCAM6_I=
P_FRAGMENT;
> +		for (i =3D 0; i < ARRAY_SIZE(data); i++) {
> +			err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_DATA(i), data[i]);
> +			if (!err)
> +				err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_MASK(i), mask[i]=
);
> +			if (err)
> +				return err;
> +		}
> +		/* Both meter outcomes redirect to IMP5, with class 1 and a
> +		 * termination reason. Preserve VLAN, EAP and STP filtering.
> +		 */
> +		err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_ACTION(0),
> +				  CFP_ACT0_FWD_MAP_REPLACE | CFP_ACT0_DST_PORT5 |
> +				CFP_ACT0_REASON_TERMINATION);
> +		if (!err)
> +			err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_ACTION(1),
> +					  CFP_ACT1_CLASS_ID(1) | CFP_ACT1_FWD_MAP_REPLACE |
> +					  CFP_ACT1_DST_PORT5);
> +		if (!err)
> +			err =3D b53_fa_cfp_write(dev, rule, CFP_ACC_ACTION);
> +		if (!err)
> +			err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_METER, 0);
> +		if (!err)
> +			err =3D b53_write32(dev, B53_CFP_TCAM_PAGE, B53_CFP_METER + 4, 0);
> +		if (!err)
> +			err =3D b53_fa_cfp_write(dev, rule, CFP_ACC_METER);
> +		if (!err)
> +			err =3D b53_fa_cfp_write(dev, rule, CFP_ACC_TCAM);
> +		if (err)
> +			return err;
> +	}

[Severity: Low]
This isn't a bug, but this loop open-codes b53_fa_rule(dev, rule, data,
mask, true).

[ ... ]

> +static int b53_fa_port(struct b53_device *dev, int port, bool standalone)
> +{
> +	struct dsa_port *control =3D dsa_to_port(dev->ds, 5);
> +	bool ready;
> +	u16 ports;
> +	int err;
> +
> +	if (!dev->fa_cfp_enabled)
> +		return 0;
> +	ports =3D dev->fa_cfp_ports & ~BIT(port);
> +	if (standalone)
> +		ports |=3D BIT(port);
> +	ready =3D b53_fa_ready(dev, dsa_port_conduit_is_operational(control));
> +	err =3D b53_write16(dev, B53_CFP_PAGE, B53_CFP_CTRL,
> +			  ready ? ports : 0);
> +	if (!err)
> +		dev->fa_cfp_ports =3D ports;
> +	return err;
> +}
[ ... ]
> +static int b53_fa_netdev_event(struct notifier_block *nb, unsigned long =
event, void *ptr)
> +{
> +	struct b53_device *dev =3D container_of(nb, struct b53_device, fa_netde=
v_nb);
> +	struct net_device *netdev =3D netdev_notifier_info_to_dev(ptr);
> +	struct dsa_port *dp, *control, *data_cpu;
> +	u32 data[8] =3D {}, mask[8] =3D {};
> +	unsigned int i;
> +	int err;
> +
> +	if (dev->fa_stopping || !dsa_user_dev_check(netdev) ||
> +	    (event !=3D NETDEV_REGISTER && event !=3D NETDEV_UP &&
> +	     event !=3D NETDEV_PRE_CHANGEADDR && event !=3D NETDEV_CHANGEADDR))
> +		return NOTIFY_DONE;
> +	dp =3D dsa_port_from_netdev(netdev);
> +	if (dp->ds !=3D dev->ds || dp->index >=3D 8)
> +		return NOTIFY_DONE;
> +	control =3D dsa_to_port(dev->ds, 5);
> +	data_cpu =3D dsa_to_port(dev->ds, 8);
> +	brcm_fa_control_set_ready(data_cpu->conduit, false);
> +	if (event !=3D NETDEV_PRE_CHANGEADDR) {
> +		data[0] =3D CFP_TCAM0_VALID | CFP_TCAM0_SLICE1;
> +		mask[0] =3D CFP_TCAM0_VALID | CFP_TCAM0_SLICE_MASK;
> +		mask[6] =3D CFP_TCAM6_L3_FRAMING;
> +		data[7] =3D BIT(dp->index);
> +		mask[7] =3D CFP_TCAM7_SOURCE_PORTS;
> +		for (i =3D 0; i < 3; i++)
> +			b53_fa_udf(data, mask, 3 + i, get_unaligned_be16(netdev->dev_addr + 2=
 * i),
> +				   0xffff);
> +	}
> +	err =3D b53_fa_rule(dev, B53_FA_ALLOW_BASE + dp->index, data, mask, fal=
se);
> +	if (err) {
> +		dev->fa_guards_failed =3D true;
> +		dev_err(dev->dev, "failed to update FA ingress guard: %d\n", err);
> +	} else if (event !=3D NETDEV_PRE_CHANGEADDR) {
> +		b53_fa_conduit_state_change(dev->ds, control->conduit,
> +					    dsa_port_conduit_is_operational(control));
> +	}
> +	return NOTIFY_DONE;
> +}

[Severity: Medium]
What restores the port's allow rule at B53_FA_ALLOW_BASE + dp->index if
netif_set_mac_address() fails after NETDEV_PRE_CHANGEADDR?

netif_set_mac_address() emits NETDEV_PRE_CHANGEADDR before calling
ops->ndo_set_mac_address().  If a subsequent notifier or
dsa_user_set_mac_address() rejects the address (for example when
!is_valid_ether_addr()), NETDEV_CHANGEADDR is never sent.  The port's
hardware allow rule remains zeroed out and all IPv4 traffic on that port
hits B53_FA_DEFAULT_RULE and traps to CPU port 5, even after another port
event re-enables FA via b53_fa_conduit_state_change().

Also, when b53_fa_rule() fails here, dev->fa_guards_failed is set to true,
but skipping b53_fa_conduit_state_change() leaves B53_CFP_CTRL enabled in
hardware.

[ ... ]

> @@ -2439,6 +2775,10 @@ void b53_br_leave(struct dsa_switch *ds, int port,=
 struct dsa_bridge bridge)
>  		vl->members |=3D BIT(port);
>  		b53_set_vlan_entry(dev, pvid, vl);
>  	}
> +	if (b53_fa_port(dev, port, true)) {
> +		dev_err(ds->dev, "failed to restore FA classification on port %d\n", p=
ort);
> +		b53_disable_port(ds, port);
> +	}
>  }

[Severity: Medium]
If b53_fa_port(dev, port, true) fails in b53_br_leave(), can a subsequent
ndo_open re-enable the standalone port without CFP classification?

When b53_write16() fails in b53_fa_port(), BIT(port) is not recorded in
dev->fa_cfp_ports and dev->fa_guards_failed is not set.  Bringing the port
up later via dsa_user_open() -> b53_enable_port() re-enables Rx/Tx without
setting BIT(5) in B53_PVLAN_PORT_MASK(port), and the following NETDEV_UP
event in b53_fa_netdev_event() writes dev->fa_cfp_ports (still missing
BIT(port)) to B53_CFP_CTRL and re-enables FA admission.

[ ... ]

> +static struct dsa_port *b53_preferred_cpu_port(struct dsa_switch *ds)
> +{
> +	struct b53_device *dev =3D ds->priv;
> +
> +	if (is5301x(dev) && dsa_is_cpu_port(ds, B53_CPU_PORT) && b53_uses_fa_ta=
g(ds, B53_CPU_PORT))
> +		return dsa_to_port(ds, B53_CPU_PORT);
> +	return NULL;
> +}

[Severity: Medium]
When dev->vlan_filtering is enabled, will hardware VLAN filtering drop
VLAN-tagged IPv4 frames that CFP redirects to CPU port 5?

CFP trap rules redirect frames to port 5 without bypassing VLAN filtering,
and on B53 ds->vlan_filtering_is_global is true, so enabling VLAN filtering
on any bridge enforces VLAN table membership across all ports.  Because
b53_preferred_cpu_port() assigns port 8 as dp->cpu_dp for all user ports,
DSA host VLAN programming only calls b53_vlan_add() for the user port and
port 8, leaving BIT(5) unset in dev->vlans[vid].members for any non-default
VID.

[ ... ]

> @@ -3385,7 +3773,32 @@ int b53_switch_register(struct b53_device *dev)
>  	dev_info(dev->dev, "found switch: %s, rev %i\n",
>  		 dev->name, dev->core_rev);
> =20
> -	return dsa_register_switch(dev->ds);
> +	ret =3D dsa_register_switch(dev->ds);
> +	if (ret || !dev->fa_cfp_enabled)
> +		return ret;
> +	/* Registration replays existing user devices, after their MACs and
> +	 * DSA private data are initialized. Keep lookup gated until it finishe=
s.
> +	 */
> +	dev->fa_netdev_nb.notifier_call =3D b53_fa_netdev_event;
> +	ret =3D register_netdevice_notifier(&dev->fa_netdev_nb);
> +	if (ret)
> +		goto unregister_switch;
> +	ret =3D devm_add_action_or_reset(dev->dev, b53_fa_unregister_notifier, =
dev);
> +	if (ret)
> +		goto unregister_switch;

[Severity: Medium]
Can b53_fa_netdev_event() run while the switch is being torn down or after
b53_switch_shutdown()?

Deferring b53_fa_unregister_notifier() to devres keeps dev->fa_netdev_nb
registered with dev->fa_stopping =3D=3D false throughout
dsa_tree_teardown_conduit() and dsa_tree_teardown_ports(), because
b53_teardown() only runs later in dsa_tree_teardown_switches().  During
system shutdown, b53_switch_shutdown() -> dsa_switch_shutdown() drops the
netdev_put() references on each CPU port's conduit without calling
b53_teardown() or running devres actions, so any later user port netdevice
event will dereference the unreferenced control->conduit and
data_cpu->conduit pointers.

> +	dev->fa_guards_ready =3D true;
> +	if (!dev->fa_guards_failed) {
> +		struct dsa_port *control =3D dsa_to_port(dev->ds, 5);
> +
> +		rtnl_lock();
> +		b53_fa_conduit_state_change(dev->ds, control->conduit,
> +					    dsa_port_conduit_is_operational(control));
> +		rtnl_unlock();
> +	}

[Severity: Low]
Should dev->fa_guards_ready and dev->fa_guards_failed be accessed under
rtnl_lock() here?  register_netdevice_notifier() has already dropped
rtnl_lock(), so a concurrent netdevice event can run b53_fa_netdev_event()
or b53_fa_port() on another CPU while these booleans are updated and read.

> diff --git a/net/dsa/tag_brcm.c b/net/dsa/tag_brcm.c
> index b7c49822ca888..8d13a3c7de5e3 100644
> --- a/net/dsa/tag_brcm.c
> +++ b/net/dsa/tag_brcm.c
[ ... ]
> @@ -146,9 +150,10 @@ static struct sk_buff *brcm_tag_xmit_ll(struct sk_bu=
ff *skb,
>   */
>  static struct sk_buff *brcm_tag_rcv_ll(struct sk_buff *skb,
>  				       struct net_device *dev,
> -				       unsigned int offset)
> +				       unsigned int offset, bool fa)
>  {
[ ... ]
> @@ -407,7 +416,100 @@ DSA_TAG_DRIVER(brcm_prepend_netdev_ops);
[ ... ]
> +static struct sk_buff *brcm_fa_tag_rcv(struct sk_buff *skb, struct net_d=
evice *dev)
> +{
> +	struct dsa_port *cpu =3D dev->dsa_ptr;
> +	struct brcm_fa_control *control;
> +	struct dsa_port *data_cpu;
> +	unsigned int port;
> +	u8 reason;
> +
> +	if (cpu->index !=3D 5)
> +		return brcm_tag_rcv_ll(skb, dev, ETH_HLEN, true);

[Severity: Medium]
On the cpu->index !=3D 5 path, does brcm_tag_rcv_ll() inspect the 4-byte
prepended FA tag instead of the destination MAC when checking
is_link_local_ether_addr(eth_hdr(skb)->h_dest)?

net/dsa/tag_brcm.c:brcm_tag_rcv_ll() {
    ...
	/* Remove Broadcom tag and update checksum */
	skb_pull_rcsum(skb, BRCM_TAG_LEN);

	if (likely(!is_link_local_ether_addr(eth_hdr(skb)->h_dest)))
		dsa_default_offload_fwd_mark(skb);
    ...
}

eth_type_trans() on the conduit sets skb->mac_header to the start of the
prepended tag, and skb_pull_rcsum(skb, BRCM_TAG_LEN) only advances
skb->data; skb->mac_header is not updated until dsa_switch_rcv() runs after
cpu_dp->rcv() returns.  Because byte 0 of the prepended tag does not have
bit 0 set, is_link_local_ether_addr() returns false and link-local control
frames (01:80:c2:00:00:xx) on bridged ports get skb->offload_fwd_mark set,
preventing the software bridge from forwarding them when STP is disabled or
group_fwd_mask is configured.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116222519.1416=
501-1-florian.fainelli@broadcom.com?part=3D5
