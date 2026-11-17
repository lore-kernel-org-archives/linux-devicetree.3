Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794940507;
	b=LS/aR3/Cyilh7xPoQAalLXn6N4MNwjZLAxR3n2cHP1mzhRn4PAHFfBWBmio5x6gnZPlz
	 AZmp6d/Xc/WhpVgWU4e3b8FXiZc6tbwnztryx4mxzVDn9zu1iTQhkHAoiiij15iRJppwD
	 GkpjLfavF1YmqiWJmvRLT9bqg7F+7etugxXJU3ilgApk68QtEl4PRkVUhhLNEaxBZv2sH
	 Hs0EhUvhcJFap+5JxQgK+kCELzk6w+q7+aCWW+F/EuBhDY/L8cMQXrbIJLduEWJ8+Wy0X
	 Y9sYRlcZRNqbDNnK6JWsl+XjrXiqzjmwPXdhP/pX9pGEKvIvN+98VplG2ygm5aTM+ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794940507;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S6N5S1SD/EsRUlL2l6icC51rgt60sromksLSeqzWr8E=;
	b=cXRo2FEzWFgB7DNOuMB4s3o6r3tDWYrIVITeKzHWD2B+PeHdwCx0Y+K0CcPhq2z339S2
	 cQsoU9LntEV6X+cbwi4NhnE4VUSoizixA82GR/wW0QzlH5omm8KPXN357rZ2GdwZKpGFx
	 AoweUmoN7sTPXJaERPUcqys/c7D8J9SpUoD5UyF8YBHjzuuPUCHacFrP7WJIg/s44MgUu
	 SIf7ZKrkYztShBr4k7sftnUAtbEvwcrXq4xq/AeG4WT+I7ACvLbJ9Th9R4TKrQCXXmwZV
	 ZrZKceCCu9GxsHkuxntU6Sp1zEFNtfHm1cPsEcNuhcJtWa0g5RbJ0wUhcqBpMgjZwVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C49ZzfDd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90E0606A337
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 18:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=C49ZzfDd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E061F000CA;
	Tue, 17 Nov 2026 18:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794940506;
	bh=S6N5S1SD/EsRUlL2l6icC51rgt60sromksLSeqzWr8E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C49ZzfDdRQ8WCFbtyW+4uPoltWmf0slnJyw1JeXy7DJimRbgYPhxlbYbBvDHdDBdV
	 c0RSaNutR/J1nYUQqrYflyj+Y2gxSftqxMsqPlq2WqV2GQBLnx15bHhrelQLKrAAX1
	 uiA973hAgiVbxZ09m77hPdAMVPdT3rMpX3Bk3wZjRfm8e72iydo3W1C6o3qXE1qDRy
	 TNIDh+jLr0RX/meV0cLGAv2iIJs33E5axkR0EHcolKWt/Wz+CsvDP5DKsv8MzhJfBH
	 9tigQOEP16b9Kol3fv8HMtsJh2UobSCPIFoXM98dLCunNRh2F7XZpCPsCX5haLaB9H
	 BtwrtonWPqLKw==
Message-ID: <sashiko-outbox-219352@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [net-next v5 3/7] net: dsa: mediatek: add support for
 passthrough mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261116183332.168858-4-cjd@cjdns.fr>
References: <20261116183332.168858-1-cjd@cjdns.fr>
 <20261116183332.168858-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 18:35:06 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [Medium] net: dsa: mt7530: wrong upstream port in
  mt753x_conduit_state_change()
- [Medium] net: dsa: mt7530: broken CPU port fallback in
  mt753x_upstream_port_index()
- [Medium] net: dsa: mt7530: NULL dp->user dereference in
  mt7531_mac_config() on DSA port
- [Medium] net: dsa: mt7530: unchecked MT753X_MTRAP write in
  mt753x_cpu_port_enable()
- [Low] net: dsa: mt7530: dead no-op callbacks in
  mt7530_passthrough_switch_ops
--

commit c217d406c794dac728f46979f906b1ad1d787a4d
Author: Caleb James DeLisle <cjd@cjdns.fr>

net: dsa: mediatek: add support for passthrough mode

This commit adds passthrough mode support to the mt7530 DSA driver so an
upstream MediaTek switch can forward traffic unaltered to and from a
downstream MediaTek switch.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 3bfe29b3b93e2..09b7e9d2d0253 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -1286,13 +1297,81 @@ mt753x_trap_frames(struct mt7530_priv *priv)
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

[Severity: Medium]
Should this MT753X_MTRAP write be guarded by a priv->id check?

mt753x_cpu_port_enable() runs from both mt7530_setup() and
mt7531_setup_common(), and MT753X_MTRAP (0x7804) has a different bit layout
on MT7531-family switches (where other MT7530_* trap accesses in
mt7530_port_enable() and mt7530_port_disable() check priv->id first).  Also,
on ID_EN7528 (an MT7530 core initialized via mt7988_setup()),
MT7530_CHG_TRAP is never set before modifying MT753X_MTRAP.

[ ... ]

> @@ -1318,12 +1397,36 @@ mt753x_cpu_port_enable(struct dsa_switch *ds, int=
 port)
>  			   PCR_PORT_VLAN_MASK, MT7530_PORT_FALLBACK_MODE);
>  }
> =20
> +/**
> + * mt753x_upstream_port_index - get the index of the upstream port.
> + *
> + * If the CPU port is local then this is the upstream port, but in the c=
ase of
> + * hierarchy the CPU port may be on another switch and the upstream port=
 is
> + * then the DSA port pointing toward that CPU port. Note that
> + * dsa_switch_upstream_port() is not reliable because the conduit for a =
given
> + * port can be customized.
> + */
> +static int
> +mt753x_upstream_port_index(struct dsa_port *dp)
> +{
> +	struct dsa_port *cpu_dp =3D dp->cpu_dp;
> +
> +	/* Early port_enable on CPU port happens before cpu_dp is set. */
> +	if (!cpu_dp)
> +		return dsa_switch_upstream_port(dp->ds);
> +
> +	return dsa_towards_port(dp->ds, cpu_dp->ds->index, cpu_dp->index);
> +}

[Severity: Medium]
Does mt753x_upstream_port_index() return the wrong port when called on a
non-default CPU port?

In DSA, dp->cpu_dp is only populated on user and DSA ports and remains NULL
on CPU ports.  On a switch with multiple CPU ports (such as MT7531 with
ports 5 and 6), calling mt753x_upstream_port_index() on CPU port 5 hits the
!cpu_dp branch and returns dsa_switch_upstream_port(dp->ds) (port 6).  In
mt7530_hw_vlan_add(), the check:

	if (dp->index =3D=3D mt753x_upstream_port_index(dp))
		val =3D MT7530_VLAN_EGRESS_STACK;

then evaluates to false for CPU port 5, configuring it as untagged or
tagged instead of MT7530_VLAN_EGRESS_STACK.

dsa_upstream_port(ds, port) and dsa_is_upstream_port(ds, port) in
include/net/dsa.h already handle both per-port dp->cpu_dp routing and
returning port directly when dp->cpu_dp is NULL, so using those helpers
avoids this regression.  Also, the /** kernel-doc comment on
mt753x_upstream_port_index() omits @dp, which triggers a W=3D1 kernel-doc
warning.

[ ... ]

> @@ -2635,7 +2818,7 @@ mt7531_setup_common(struct dsa_switch *ds)
>  		regmap_set_bits(priv->regmap, MT7531_DBG_CNT(i),
>  				MT7531_DIS_CLR);
> =20
> -		if (dsa_is_cpu_port(ds, i)) {
> +		if (dsa_is_upstream_port(ds, i)) {
>  			mt753x_cpu_port_enable(ds, i);
>  		} else {
>  			mt7530_port_disable(ds, i);

[Severity: Medium]
Can enabling a DSA cascade port on MT7531 cause a NULL pointer dereference
in mt7531_mac_config()?

When port 5 on an MT7531 switch is configured in RGMII mode as an upstream
or downstream DSA link port (DSA_PORT_TYPE_DSA), dp->user is NULL, but
mt7531_mac_config() unconditionally dereferences it during phylink startup:

drivers/net/dsa/mt7530.c:mt7531_mac_config() {
	...
	if (phy_interface_mode_is_rgmii(interface)) {
		dp =3D dsa_to_port(ds, port);
		phydev =3D dp->user->phydev;
		mt7531_rgmii_setup(priv, interface, phydev);
	}
	...
}

[ ... ]

> @@ -3402,6 +3600,96 @@ static int mt7988_setup(struct dsa_switch *ds)
> +/* No manipulation of forwarding rules allowed in passthrough mode */
> +static const struct dsa_switch_ops mt7530_passthrough_switch_ops =3D {
> +	.get_tag_protocol       =3D mtk_get_tag_protocol,
> +	.setup                  =3D mt753x_setup,
> +	.teardown               =3D mt753x_teardown,
> +	.preferred_default_local_cpu_port =3D mt753x_preferred_default_local_cp=
u_port,
> +	.port_change_conduit	=3D mt753x_passthrough_port_change_conduit,
> +	.get_strings            =3D mt7530_get_strings,
> +	.get_ethtool_stats      =3D mt7530_get_ethtool_stats,
> +	.get_sset_count         =3D mt7530_get_sset_count,
> +	.get_eth_mac_stats      =3D mt7530_get_eth_mac_stats,
> +	.get_rmon_stats         =3D mt7530_get_rmon_stats,
> +	.get_eth_ctrl_stats     =3D mt7530_get_eth_ctrl_stats,
> +	.get_stats64            =3D mt7530_get_stats64,
> +	.set_ageing_time	=3D mt7530_passthrough_set_ageing_time,
> +	.port_enable            =3D mt7530_port_enable,
> +	.port_disable           =3D mt7530_port_disable,
> +	.port_change_mtu	=3D mt7530_passthrough_port_change_mtu,
> +	.port_max_mtu		=3D mt7530_port_max_mtu,
> +	.port_stp_state_set	=3D mt7530_passthrough_stp_state_set,
> +	.port_pre_bridge_flags	=3D mt7530_port_pre_bridge_flags,
> +	.port_bridge_flags	=3D mt7530_passthrough_port_bridge_flags,
> +	.port_bridge_join	=3D mt7530_passthrough_port_bridge_join,
> +	.port_bridge_leave	=3D mt7530_passthrough_port_bridge_leave,
> +	.port_fast_age		=3D mt7530_passthrough_port_fast_age,
> +	.port_fdb_add		=3D mt7530_passthrough_port_fdb_add,
> +	.port_fdb_del		=3D mt7530_passthrough_port_fdb_del,
> +	.port_fdb_dump		=3D mt7530_port_fdb_dump,
> +	.port_mdb_add		=3D mt7530_passthrough_port_mdb_add,
> +	.port_mdb_del		=3D mt7530_passthrough_port_mdb_del,
> +	.port_vlan_filtering	=3D mt7530_passthrough_port_vlan_filtering,
> +	.port_vlan_add		=3D mt7530_passthrough_port_vlan_add,
> +	.port_vlan_del		=3D mt7530_passthrough_port_vlan_del,
> +	.port_mirror_add	=3D mt753x_passthrough_port_mirror_add,
> +	.port_mirror_del	=3D mt753x_passthrough_port_mirror_del,
> +	.phylink_get_caps       =3D mt753x_phylink_get_caps,
> +	.support_eee            =3D dsa_supports_eee,
> +	.set_mac_eee            =3D mt753x_set_mac_eee,

[Severity: Low]
This isn't a bug, but most of the new no-op callbacks in
mt7530_passthrough_switch_ops appear unnecessary.  Because
mt753x_check_passthrough() requires the switch to have only one CPU port
and one DSA link port (and no user ports), only the tree-wide notifier
callbacks (.port_change_mtu, .port_fdb_add, .port_fdb_del, .port_mdb_add,
.port_mdb_del, .port_vlan_add, and .port_vlan_del) need no-op stubs to
avoid returning -EOPNOTSUPP.

.set_ageing_time, .port_stp_state_set, and .port_fast_age already default
to no-ops in the DSA core when left NULL, while .port_bridge_join,
.port_bridge_leave, .port_bridge_flags, .port_vlan_filtering,
.port_mirror_add, .port_mirror_del, .port_change_conduit, and
.port_setup_tc (along with user-port-only callbacks like
.port_pre_bridge_flags, .port_fdb_dump, .port_max_mtu, .support_eee,
.set_mac_eee, .port_hsr_join, and .port_hsr_leave) are never called on a
switch with no user ports.

> +	.conduit_state_change   =3D mt753x_conduit_state_change,

[Severity: Medium]
Does mt753x_conduit_state_change() program the wrong CPU port on a
downstream switch?

DSA broadcasts DSA_NOTIFIER_CONDUIT_STATE_CHANGE to every switch in the
tree, with cpu_dp =3D conduit->dsa_ptr pointing to the CPU port on the
upstream switch:

drivers/net/dsa/mt7530.c:mt753x_conduit_state_change() {
	...
	mask =3D BIT(cpu_dp->index);

	if (operational)
		priv->active_cpu_ports |=3D mask;
	else
		priv->active_cpu_ports &=3D ~mask;

	if (priv->active_cpu_ports) {
		val =3D MT7530_CPU_EN |
		      MT7530_CPU_PORT(__ffs(priv->active_cpu_ports));
	}

	regmap_update_bits(priv->regmap, MT753X_MFC,
			   MT7530_CPU_EN | MT7530_CPU_PORT_MASK, val);
	...
}

When a downstream switch's local upstream DSA port index differs from the
upstream switch's CPU port index (for example, upstream CPU port 6 wired to
downstream port 5), MT7530_CPU_PORT is set to cpu_dp->index instead of
dsa_towards_port(ds, cpu_dp->ds->index, cpu_dp->index), sending trapped
control frames (BPDUs, PAE, LLDP, LACP) to the wrong port on the downstream
switch.  In addition, wiring mt753x_conduit_state_change() in
mt7530_passthrough_switch_ops sets MT7530_CPU_EN on the passthrough switch
even though trapping is disabled in passthrough mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116183332.1688=
58-1-cjd@cjdns.fr?part=3D3
