Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793236459;
	b=UDNJiLraSUu+8cxnuW6hRrHu3xt58g0zuAUsaNXYbTtPpYYuvSenGHUGg0K3eRhAF2jh
	 zr0n19y/VDxGp8qOczqqOVPzI7Bci1ECjjDWRx6jMaZvHWTc9PCSpb7flxkY0Yaphjjt5
	 FYie0oCt5rT1VhJhxHzR55jF+lzL3NIMJZLn8+ZFV0P70ckJC5lr8O0vKkdTXLChjPysq
	 U90ttAS2aC74vtfxCSbPlpDgRfg3bWV/JBLhUBL85IWjWHRxtBjeXHZWKncLi5dVq+S3o
	 1ZzszFOaEVrWR3nStXRNEQjDNIo63TnE7CEJMuTEYbeHbHbJho9q6xzbk8KQeIkFCVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793236459;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=vRSKTyZ3flGN1mnjt8JArv99w4RUdD/2KEQL6p3SG+E=;
	b=opgdMTa8g6VvGYbVs32bD93qJ6vnBvZ7s0gHK7cnwnJSBUfBt7OvGPBUhock3lQcWetO
	 hPyAvXnsgn/gkJwJihcP82jm5ngPUoRpx/A7rD+lIYp/Zrv5ALRz9H5hB4g5PkzbLArS0
	 bG6tcL6ZQwqmJhW4YY/Sqwe91Tnq2X0tk/8n9ItoBc9sWkYksRRJKZpl+CKB8DG8sneZr
	 v17LHZW6VVXlwt40mD/yqdTEjpBPOGI2BRkzNUYKrvylr8IXSnPm2PXUUCJwdgkaoGnSO
	 MLgoDoYB4eGYjuf4uPmviD5hKhas8k4JbB6yUd92rqc8jp8tMBVkb0IB/KjSU3lEbmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGJucpGI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A7606A31A
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 01:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGJucpGI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 191761F01825;
	Thu, 29 Oct 2026 01:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793236458;
	bh=vRSKTyZ3flGN1mnjt8JArv99w4RUdD/2KEQL6p3SG+E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DGJucpGIWQENw0EJDUgUcRxBsISYcAQrn8HWTkZ3qUEo1QPj6rJ6gJ04hipTsciRL
	 dSvlxHsFq5TIYjE9ZxFMJe299N7enyFcqJlJrt8tmrqWQplRVMxFu4297Sk7QTIWXj
	 2kbvprVGPbALCfrDJF1HeNQOVezNYi5NmIeo7Ib1IOW+qGkEg7MbTILIGJQSZ3j3WK
	 KVqpOs2PlwRjQxiOYx2V7O+ha9bnY2AQVclNXgFoc0zWidg4A47eO3ldErMDbymgbi
	 S0OQQnEAsYvEnR5N9OKjRC177Bnyeg7LNEwULkm3IT8XKbnq+fRVLcLP7H+5ZHmdO1
	 PQnPHHmwbfnVA==
Message-ID: <sashiko-outbox-188585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/7] net: dsa: mediatek: add support for passthrough
 mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261028011317.1557238-4-cjd@cjdns.fr>
References: <20261028011317.1557238-1-cjd@cjdns.fr>
 <20261028011317.1557238-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 29 Oct 2026 01:14:17 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] net: dsa: mt7530: mt753x_check_passthrough() fails on dual-CPU-por=
t switches
- [High] net: dsa: mt7530: mt7530_port_change_mtu() is a no-op in passthrou=
gh mode
- [High] net: dsa: mt7530: wrong upstream port and VLAN handling on downstr=
eam switch
- [High] net: dsa: mt7530: mt753x_trap_frames() drops egress link-local fra=
mes in passthrough mode
- [High] net: dsa: mt7530: NULL pointer dereference in mt7531_mac_config() =
on DSA port
- [Medium] net: dsa: mt7530: setup overwrites PVC_EG_TAG on passthrough ups=
tream port
--

commit cb9a82b0090067bf9bb939c7fda22a9fd5e2d64d
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: add support for passthrough mode

This commit adds passthrough mode support to the mt7530 DSA driver so an
upstream MediaTek switch can forward traffic unmodified to and from a
downstream switch connected via a DSA link port. It also updates switch
setup and port configuration to support operating as the downstream switch
whose upstream port is a DSA link port rather than a CPU port.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index d10194488bdee..3eb2e11d69856 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -1286,13 +1292,41 @@ mt753x_trap_frames(struct mt7530_priv *priv)
>  				   TO_CPU_FW_CPU_ONLY);
>  }
> =20
> +static int
> +mt7530_port_change_mtu(struct dsa_switch *ds, int port, int new_mtu);
> +
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

[Severity: High]
When priv->is_passthrough is true, mt753x_cpu_port_enable() leaves
PORT_SPEC_TAG unset on the upstream CPU port so frames from the CPU are
forwarded via the port matrix rather than by parsing the destination port in
the MediaTek special tag.

However, mt7530_setup() and mt7531_setup_common() still unconditionally call
mt753x_trap_frames(), which programs MT753X_BPC, MT753X_RGAC1, and
MT753X_RGAC2 with TO_CPU_FW_CPU_ONLY for 01:80:C2:00:00:{00,01,02,03,0E}
frames:

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

Without PORT_SPEC_TAG enabled on the passthrough switch's ingress CPU port =
to
override the destination port from the special tag, won't link-local control
frames (STP BPDUs, 802.1X PAE, LACP, LLDP) transmitted by the CPU towards t=
he
downstream switch get trapped back to the passthrough switch's own CPU port
and dropped instead of being forwarded out the downstream DSA link port?

> +
> +		/* The port is not configured to parse DSA tags, so they are
> +		 * liable to be confused for length fields, so length check is
> +		 * disabled.
> +		 */
> +		regmap_clear_bits(priv->regmap, MT753X_AGC, AGC_L2LEN_CHK);
> +
> +		/* In passthrough mode, MTU is only enforced downstream */
> +		mt7530_port_change_mtu(ds, port, MT7530_MAX_MTU);

[ ... ]

> @@ -1386,11 +1446,14 @@ mt7530_port_change_mtu(struct dsa_switch *ds, int=
 port, int new_mtu)
>  	int length;
>  	u32 val;
> =20
> +	if (priv->is_passthrough)
> +		return 0;

[Severity: High]
In mt7530_probe_common(), priv->is_passthrough is set before the switch is
registered. When mt753x_cpu_port_enable() later calls
mt7530_port_change_mtu(ds, port, MT7530_MAX_MTU) under if
(priv->is_passthrough), won't this early return cause mt7530_port_change_mt=
u()
to return 0 immediately without writing MT7530_GMACCR, leaving the hardware=
 at
its 1522-byte default RX length limit?

[ ... ]

> @@ -2511,7 +2609,7 @@ mt7530_setup(struct dsa_switch *ds)
>  		/* Disable learning by default on all ports */
>  		regmap_set_bits(priv->regmap, MT7530_PSC_P(i), SA_DIS);
> =20
> -		if (dsa_is_cpu_port(ds, i)) {
> +		if (dsa_is_upstream_port(ds, i)) {
>  			mt753x_cpu_port_enable(ds, i);
>  		} else {
>  			mt7530_port_disable(ds, i);

[ ... ]

> @@ -2635,7 +2733,7 @@ mt7531_setup_common(struct dsa_switch *ds)
>  		regmap_set_bits(priv->regmap, MT7531_DBG_CNT(i),
>  				MT7531_DIS_CLR);
> =20
> -		if (dsa_is_cpu_port(ds, i)) {
> +		if (dsa_is_upstream_port(ds, i)) {
>  			mt753x_cpu_port_enable(ds, i);
>  		} else {
>  			mt7530_port_disable(ds, i);

[Severity: Medium]
In both mt7530_setup() and mt7531_setup_common(), right after the
if (dsa_is_upstream_port(ds, i)) block calls mt753x_cpu_port_enable(ds, i),
the per-port loop runs:

		/* Enable consistent egress tag */
		regmap_update_bits(priv->regmap, MT7530_PVC_P(i),
				   PVC_EG_TAG_MASK,
				   PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));

When priv->is_passthrough is true, mt753x_cpu_port_enable() configures
MT7530_PVC_P(port) with PVC_EG_TAG(MT7530_VLAN_EG_DISABLED), and unlike the
downstream DSA link port, the upstream port is skipped in
mt7530_port_enable(). Doesn't this regmap_update_bits() call overwrite
PVC_EG_TAG on the passthrough switch's upstream port back to
MT7530_VLAN_EG_CONSISTENT?

[Severity: High]
Also in mt7531_setup_common() and mt7530_port_enable(), enabling support for
DSA_PORT_TYPE_DSA link ports allows port 5 on an MT7531 switch to be
configured as an upstream or downstream DSA link port. When phylink configu=
res
an RGMII mode on MT7531 port 5 via mt753x_phylink_mac_config() ->
mt7531_mac_config():

drivers/net/dsa/mt7530.c:mt7531_mac_config() {
	if (phy_interface_mode_is_rgmii(interface)) {
		dp =3D dsa_to_port(ds, port);
		phydev =3D dp->user->phydev;
		mt7531_rgmii_setup(priv, interface, phydev);
	}
}

Since dp->user is only populated for DSA_PORT_TYPE_USER ports and is NULL f=
or
DSA_PORT_TYPE_DSA ports, can dereferencing dp->user->phydev cause a NULL
pointer dereference when port 5 is used as an RGMII DSA link port?

[ ... ]

> @@ -3304,7 +3405,7 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
> =20
>  	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>  	 * forwarded to the numerically smallest CPU port whose conduit
> -	 * interface is up.
> +	 * interface is up. NOTE: "CPU port" can also mean an upstream DSA link.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
>  	    priv->id !=3D ID_EN7528)

[Severity: High]
When a switch is downstream of a passthrough switch, its local upstream port
has type DSA_PORT_TYPE_DSA (so dsa_port_is_cpu(dp) is false and
dsa_is_upstream_port(ds, port) is true), while dp->cpu_dp and
conduit->dsa_ptr point to the DSA_PORT_TYPE_CPU port on the upstream switch.

In mt753x_conduit_state_change(), mt7530_update_port_member(), and
mt7530_port_vlan_filtering(), the code uses cpu_dp->index:

drivers/net/dsa/mt7530.c:mt753x_conduit_state_change() {
	struct dsa_port *cpu_dp =3D conduit->dsa_ptr;
	...
	mask =3D BIT(cpu_dp->index);
}

drivers/net/dsa/mt7530.c:mt7530_update_port_member() {
	struct dsa_port *cpu_dp =3D dp->cpu_dp;
	u32 port_bitmap =3D BIT(cpu_dp->index);
}

drivers/net/dsa/mt7530.c:mt7530_port_vlan_filtering() {
	struct dsa_port *dp =3D dsa_to_port(ds, port);
	struct dsa_port *cpu_dp =3D dp->cpu_dp;
	...
	if (vlan_filtering) {
		mt7530_port_set_vlan_aware(ds, port);
		mt7530_port_set_vlan_aware(ds, cpu_dp->index);
	}
}

And when a VLAN is added on the downstream switch, dsa_switch_vlan_add() al=
so
targets the downstream switch's upstream DSA_PORT_TYPE_DSA port, where
mt7530_hw_vlan_add() checks dsa_port_is_cpu(dp):

drivers/net/dsa/mt7530.c:mt7530_hw_vlan_add() {
	if (dsa_port_is_cpu(dp))
		val =3D MT7530_VLAN_EGRESS_STACK;
	else if (entry->untagged)
		val =3D MT7530_VLAN_EGRESS_UNTAG;
	else
		val =3D MT7530_VLAN_EGRESS_TAG;
}

On a downstream switch, won't cpu_dp->index refer to the port number on the
upstream switch rather than the local upstream DSA port on ds (when the two
switches use different port indices), and won't mt7530_hw_vlan_add() program
MT7530_VLAN_EGRESS_UNTAG or MT7530_VLAN_EGRESS_TAG instead of
MT7530_VLAN_EGRESS_STACK on the local upstream DSA port?

[ ... ]

> @@ -3399,6 +3505,55 @@ static int mt7988_setup(struct dsa_switch *ds)
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
In mt753x_check_passthrough(), passthrough_ports is incremented for any
available port that has either an "ethernet" phandle (CPU port) or a "link"
phandle (DSA cascade port), without requiring a "link" phandle to be presen=
t.

On boards with a single switch that uses two CPU ports (both port@5 and
port@6 having "ethernet" phandles) along with enabled user ports,
passthrough_ports will be 2 while enabled_ports is greater than 2. Won't
mt753x_check_passthrough() return -EINVAL in that case and cause
mt7530_probe_common() to fail probing the switch?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028011317.1557=
238-1-cjd@cjdns.fr?part=3D3
