Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793388141;
	b=Kb6jRfyfGExQ3YplxiuAHWAxNsFIIYV1MyjwxhIpWUHBiJE6yFu9UTiflvd8Zi0HslEL
	 YTTl7wyCXbilJ5a3hUGD44V1dF+arSIX3KCr9+LEP59dinGaUTmmX35E9bKrIQ9Y+Azr6
	 OAwF47GUv/YyH02XS4cERud4UgyxGMXjlyzThIGA2v4yFfQ/KRVk2pZcYHDg8ZP+UA6TX
	 0UcsDLKc6CElMCQWcvE7B+BfoQ8aE1Dh2lt3y2/ffi06sw79bB1E30lS8xsOmzT+231QT
	 o6YzEn//s+nzOT/6sOPylUENdEdNBxBhLlAwT6GaGRi67w4vR2RzIb2qq+55SpRXefQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793388141;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=JRuPRUMmowJm9n80nShe6UCmyUTqs28l2ufQBNwg89A=;
	b=yCmraZijYae5o1ODm+BMChwYCNspnz603ybLNWYAwwZmrwi6cr/moQEKtnMadnZJksgt
	 AQx5FWTlWjQaZA3y8/ncWEKVT7vNgIPtE+/Tt63emMd8JvecOsLxouKWSXq8TvLeJHuF3
	 dTQ/wzbNUeW8GvDRbvUApIYJCkZ0Jw/nTU2B4ulMZnQ//tFinHivuSDrckqxOWQKHR/LF
	 6IAah5XOFnXfxHEL07ho0PZxJJCYAEZM5a/2qg6K1tX4FDcwZBz/DcbhDAqsmhzpIgbgL
	 06JXkHDWa0/1lD4cwiAzQkZO/3lmLGNdT0v0Kpt+pwQWv464xqoorvXS1FH8/PySMbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRoDqvRY;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C19B606A31A
	for <devicetree@vger.kernel.org>; Fri, 30 Oct 2026 19:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MRoDqvRY
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94F611F000C1;
	Fri, 30 Oct 2026 19:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793388140;
	bh=JRuPRUMmowJm9n80nShe6UCmyUTqs28l2ufQBNwg89A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MRoDqvRYTHzAb64/SS6sa+EdnjlkubxWBVOWqOMBRHwMV12hRi2oVfcYHkSdilKBi
	 +C2UM7LwtJQxRsWZxMcGYIgK2/hHCkmP2l3ehHP/GFuEOJB5ukddjRp4V3SqjLT1BD
	 t13EK8M0y5ia13Wi5V7BeOGAIIfE0x6lkKHToXby3qKlROc9HhWFdkHVxHb6MUVLH8
	 ziVIKbbBGlZTpzZuZVBkL/2VKJ5oedZKq33KsDiEXI0tmAxHO0mBAUqygIkfM3RW1d
	 Jt44MuBMef+sOdA3jXNe6P5dDCfAcLKYipmKveTMcG0bRCdqHn6NfWjHCHr/ijGysM
	 +Gxofz3/b0kVA==
Message-ID: <sashiko-outbox-191438@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/7] net: dsa: mediatek: add support for passthrough
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261029184202.1859843-4-cjd@cjdns.fr>
References: <20261029184202.1859843-1-cjd@cjdns.fr>
 <20261029184202.1859843-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 19:22:20 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: mt753x_check_passthrough() breaks dual-CPU-port =
boards
- [High] net: dsa: mt7530: mt753x_trap_frames() blocks CPU control frames i=
n passthrough
- [High] net: dsa: mt7530: downstream switch callbacks assume local CPU port
- [Medium] net: dsa: mt7530: setup overwrites PVC_EG_TAG on passthrough CPU=
 port
- [Medium] net: dsa: mt7530: mt7530_port_enable() ignores per-port CPU cond=
uit
--

commit 89ff16dda9d512576bf6153ac6b119283ed62bea
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: add support for passthrough mode

This commit adds passthrough mode support for MT7530 switches so that an
upstream SoC-integrated switch can pass traffic to and from a downstream
MT7530 switch without altering the MediaTek DSA tag.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d10194488bdee..c5b3b00acb956 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -1286,13 +1297,81 @@ mt753x_trap_frames(struct mt7530_priv *priv)
>  				   TO_CPU_FW_CPU_ONLY);
>  }

[ ... ]

> +/* If this switch is downstream of another switch that is in passthrough=
 mode,
> + * the "CPU" port is actually a DSA port.
> + */
>  static void
>  mt753x_cpu_port_enable(struct dsa_switch *ds, int port)
>  {
>  	struct mt7530_priv *priv =3D ds->priv;
> =20
> -	/* Enable Mediatek header mode on the cpu port */
> -	regmap_write(priv->regmap, MT7530_PVC_P(port), PORT_SPEC_TAG);
> +	if (priv->is_passthrough) {
> +		/* Disable parsing of the DSA tag, it will be forwarded blindly
> +		 * to the downstream switch.
> +		 */
> +		regmap_write(priv->regmap, MT7530_PVC_P(port),
> +			     VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
> +			     PVC_EG_TAG(MT7530_VLAN_EG_DISABLED));
> +
> +		/* The port is not configured to parse DSA tags, so they are
> +		 * liable to be confused for length fields, so length check is
> +		 * disabled.
> +		 */
> +		regmap_clear_bits(priv->regmap, MT753X_AGC, AGC_L2LEN_CHK);
> +
> +		/* In passthrough mode, MTU is only enforced downstream */
> +		mt7530_port_change_mtu(ds, port, MT7530_MAX_MTU);
> +
> +		/* Loop detection has no value in passthrough mode */
> +		regmap_set_bits(priv->regmap, MT753X_MTRAP,
> +				MT7530_LOOP_DET_DISABLE);
> +	} else {
> +		/* Not passthrough, enable DSA tag handling on CPU port. */
> +		regmap_write(priv->regmap, MT7530_PVC_P(port), PORT_SPEC_TAG);
> +	}
> =20
>  	/* Enable flooding on the CPU port */
>  	regmap_set_bits(priv->regmap, MT753X_MFC,
> @@ -1322,6 +1401,7 @@ static int
>  mt7530_port_enable(struct dsa_switch *ds, int port,
>  		   struct phy_device *phy)
>  {
> +	int upstream_pt =3D dsa_switch_upstream_port(ds);
>  	struct dsa_port *dp =3D dsa_to_port(ds, port);
>  	struct mt7530_priv *priv =3D ds->priv;
> =20
> @@ -1332,13 +1412,38 @@ mt7530_port_enable(struct dsa_switch *ds, int por=
t,
>  	 * bridge.
>  	 */
>  	if (dsa_port_is_user(dp)) {
> -		struct dsa_port *cpu_dp =3D dp->cpu_dp;
> +		priv->ports[port].pm |=3D PCR_MATRIX(BIT(upstream_pt));
> =20
> -		priv->ports[port].pm |=3D PCR_MATRIX(BIT(cpu_dp->index));

[Severity: Medium]
On switches with multiple CPU ports (such as MT7531 where per-port conduit
assignment is supported via mt753x_port_change_conduit()), does replacing
dp->cpu_dp->index with dsa_switch_upstream_port(ds) in mt7530_port_enable()
connect a user port to the wrong CPU port when its assigned conduit differs
from that of the first available port?

dsa_switch_upstream_port(ds) returns dsa_upstream_port(ds, dp->index) for t=
he
first available port on the switch rather than dsa_upstream_port(ds, port)
for the port being enabled. When a user port assigned to the secondary CPU
conduit is brought up via dsa_user_open() -> mt7530_port_enable(), shouldn't
this use dsa_upstream_port(ds, port) instead?

[ ... ]

> @@ -2511,7 +2671,7 @@ mt7530_setup(struct dsa_switch *ds)
>  		/* Disable learning by default on all ports */
>  		regmap_set_bits(priv->regmap, MT7530_PSC_P(i), SA_DIS);
> =20
> -		if (dsa_is_cpu_port(ds, i)) {
> +		if (dsa_is_upstream_port(ds, i)) {
>  			mt753x_cpu_port_enable(ds, i);
>  		} else {
>  			mt7530_port_disable(ds, i);

[Severity: Medium]
In both mt7530_setup() and mt7531_setup_common(), mt753x_cpu_port_enable()
sets MT7530_PVC_P(port) with PVC_EG_TAG(MT7530_VLAN_EG_DISABLED) when
priv->is_passthrough is true, but right after the if/else block in the loop:

drivers/net/dsa/mt7530.c:mt7530_setup() {
    ...
		if (dsa_is_upstream_port(ds, i)) {
			mt753x_cpu_port_enable(ds, i);
		} else {
			mt7530_port_disable(ds, i);

			/* Set default PVID to 0 on all user ports */
			regmap_update_bits(priv->regmap, MT7530_PPBV1_P(i),
					   G0_PORT_VID_MASK, G0_PORT_VID_DEF);
		}
		/* Enable consistent egress tag */
		regmap_update_bits(priv->regmap, MT7530_PVC_P(i),
				   PVC_EG_TAG_MASK,
				   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));
    ...
}

Doesn't this unconditionally overwrite PVC_EG_TAG_MASK on the passthrough
upstream CPU port with MT7530_VLAN_EG_CONSISTENT, since mt7530_port_enable()
only rewrites MT7530_PVC_P(port) for the downstream DSA link port?

[Severity: High]
Also in mt7530_setup() and mt7531_setup_common(), mt753x_trap_frames(priv)
is still called unconditionally even when priv->is_passthrough is true:

drivers/net/dsa/mt7530.c:mt753x_trap_frames() {
	regmap_update_bits(priv->regmap, MT753X_BPC,
			   PAE_BPDU_FR | PAE_EG_TAG_MASK | PAE_PORT_FW_MASK |
				   BPDU_EG_TAG_MASK | BPDU_PORT_FW_MASK,
			   PAE_BPDU_FR | PAE_EG_TAG(MT7530_VLAN_EG_DISABLED) |
				   PAE_PORT_FW(TO_CPU_FW_CPU_ONLY) |
				   BPDU_EG_TAG(MT7530_VLAN_EG_DISABLED) |
				   TO_CPU_FW_CPU_ONLY);
    ...
}

On a normal switch, PORT_SPEC_TAG is enabled on the CPU port so frames sent
by the CPU are directed by the MediaTek special tag. On a passthrough switc=
h,
mt753x_cpu_port_enable() leaves PORT_SPEC_TAG unset on the CPU port so fram=
es
are forwarded via the port matrix.

When the CPU transmits STP BPDUs, 802.1X PAE, LACP, PAUSE, or LLDP frames
(matching 01:80:c2:00:00:00/01/02/03/0e in BPC, RGAC1, and RGAC2) towards a
downstream switch port, won't those frames ingressing the passthrough
switch's CPU port match the trap rules and be restricted to
TO_CPU_FW_CPU_ONLY (the passthrough switch's own CPU port) instead of being
forwarded to the downstream DSA link port?

[ ... ]

> @@ -3304,7 +3472,7 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
> =20
>  	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>  	 * forwarded to the numerically smallest CPU port whose conduit
> -	 * interface is up.
> +	 * interface is up. NOTE: "CPU port" can also mean an upstream DSA link.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
>  	    priv->id !=3D ID_EN7528)

[Severity: High]
On the downstream switch behind a passthrough switch, the upstream port is a
DSA link port (DSA_PORT_TYPE_DSA) rather than a CPU port (DSA_PORT_TYPE_CPU=
),
and dp->cpu_dp / conduit->dsa_ptr point to the CPU port on the upstream
switch. How are the following paths handled on the downstream switch?

First, in mt753x_conduit_state_change(), mt7530_update_port_member(), and
mt7530_port_vlan_filtering(), the code uses cpu_dp->index directly:

drivers/net/dsa/mt7530.c:mt753x_conduit_state_change() {
	struct dsa_port *cpu_dp =3D conduit->dsa_ptr;
    ...
	mask =3D BIT(cpu_dp->index);
}

drivers/net/dsa/mt7530.c:mt7530_update_port_member() {
	struct dsa_port *dp =3D dsa_to_port(priv->ds, port), *other_dp;
	struct mt7530_port *p =3D &priv->ports[port], *other_p;
	struct dsa_port *cpu_dp =3D dp->cpu_dp;
	u32 port_bitmap =3D BIT(cpu_dp->index);
    ...
}

drivers/net/dsa/mt7530.c:mt7530_port_vlan_filtering() {
	struct dsa_port *dp =3D dsa_to_port(ds, port);
	struct dsa_port *cpu_dp =3D dp->cpu_dp;

	if (vlan_filtering) {
		mt7530_port_set_vlan_aware(ds, port);
		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
    ...
}

If the upstream switch's CPU port index differs from the downstream switch's
upstream DSA link port index (for example, port 6 on the upstream switch vs
port 5 on the downstream switch), won't these program the wrong port on the
downstream switch?

Second, when a VLAN is added or deleted on the downstream switch, DSA calls
mt7530_port_vlan_add() and mt7530_port_vlan_del() on the downstream switch's
upstream DSA link port (passing the user port's untagged and pvid flags). In
mt7530_hw_vlan_add():

drivers/net/dsa/mt7530.c:mt7530_hw_vlan_add() {
    ...
	if (dsa_port_is_cpu(dp))
		val =3D MT7530_VLAN_EGRESS_STACK;
	else if (entry->untagged)
		val =3D MT7530_VLAN_EGRESS_UNTAG;
	else
		val =3D MT7530_VLAN_EGRESS_TAG;
	regmap_update_bits(priv->regmap, MT7530_VAWD2,
			   ETAG_CTRL_P_MASK(entry->port),
			   ETAG_CTRL_P(entry->port, val));
}

Because dsa_port_is_cpu(dp) is false for the downstream switch's upstream D=
SA
link port, won't mt7530_hw_vlan_add() fail to set MT7530_VLAN_EGRESS_STACK
and instead set UNTAG or TAG, while mt7530_port_vlan_add() and
mt7530_port_vlan_del() also overwrite PVID and ACC_FRM_MASK on the upstream
port?

[ ... ]

> @@ -3399,6 +3574,99 @@ static int mt7988_setup(struct dsa_switch *ds)
>  	return mt7531_setup_common(ds);
>  }
> =20
> +/* 1 if passthrough, negative if error. */
> +static int mt753x_check_passthrough(struct device *dev)
> +{
> +	struct device_node *ports, *port;
> +	int passthrough_ports =3D 0;
> +	int enabled_ports =3D 0;
> +
> +	ports =3D of_get_child_by_name(dev->of_node, "ports");
> +	if (!ports)
> +		ports =3D of_get_child_by_name(dev->of_node, "ethernet-ports");
> +
> +	if (!ports) {
> +		dev_err(dev, "no ports child node found\n");
> +		return -EINVAL;
> +	}
> +
> +	for_each_available_child_of_node(ports, port) {
> +		struct device_node *link;
> +
> +		enabled_ports++;
> +
> +		link =3D of_parse_phandle(port, "ethernet", 0);
> +		if (!link)
> +			link =3D of_parse_phandle(port, "link", 0);
> +
> +		if (!link)
> +			continue;
> +
> +		of_node_put(link);
> +
> +		passthrough_ports++;
> +	}
> +
> +	of_node_put(ports);
> +
> +	/*
> +	 * A switch is considered passthrough if exactly two available
> +	 * ports have an "ethernet" or "link" phandle.
> +	 */
> +	if (passthrough_ports > 2 ||
> +	    (passthrough_ports =3D=3D 2 && enabled_ports !=3D 2)
> +	) {
> +		dev_err(dev, "Only two ports allowed in passthrough mode\n");
> +		return -EINVAL;
> +	}
> +
> +	return passthrough_ports =3D=3D 2;
> +}

[Severity: High]
What happens in mt7530_probe_common() -> mt753x_check_passthrough() on
standalone dual-CPU-port boards where two ports (such as port@5 and port@6)
both have "ethernet" phandles and no port has a "link" phandle?

Because mt753x_check_passthrough() counts both "ethernet" and "link" phandl=
es
into passthrough_ports without checking whether any "link" phandle is
present, passthrough_ports is 2 whenever two CPU ports are enabled. If any
user ports are also enabled (enabled_ports > 2, as on mt7621, mt7622,
mt7623n, and mt7986 dual-CPU-port boards), doesn't mt753x_check_passthrough=
()
return -EINVAL and abort the switch probe? And if all user ports happen to =
be
disabled (enabled_ports =3D=3D 2), wouldn't it falsely enable passthrough m=
ode on
a switch with two CPU ports and no downstream switch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261029184202.1859=
843-1-cjd@cjdns.fr?part=3D3
