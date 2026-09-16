Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85D503D9537
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 17:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580873; cv=none; b=ORajE802/oJxl5wzTUGRxgl2FP6bTWjc1dZIAOLvHX+8YbDEGLUHascc3T2B4OuDB6RysUZd65Y2KGjMw3LvECaHQX8L1gaIhji6TfTpICkstOlymYhzSqITQ+G7hSzuBpddse11L3hATyrP+2FXWg2aCMLn1mzfl+DuhE/tvaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580873; c=relaxed/simple;
	bh=LjD2xGZ9sLhdqC2OL0+sS3JN5eiSZSsBqEgXT3KOBoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Nl212GJV9PVZN9SqZ9EU4rQRxRGxU/0IyQ7/NT/k1ZMwPbx5v9MotBN7LWskQMVsXTVmBZt0ACjB0Pcc+lA3t7jSmU0Q9LY7/czKNICwH7fmYCwvtp35frCbyyRXFX89F3HyHSKnTLeZy0lJ1Ma5qUW6D0i/KlXttTEBmYgh/TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aIfKDsaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aIfKDsaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 895C61F00898;
	Wed, 16 Sep 2026 17:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789580867;
	bh=Q5Svf0h5pwbAU2xdIY6Sfl2zup3Eva1qG82zWTg7hVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aIfKDsaEjp/zbeuxs6pSuNVFYNb7UG/qo+TuirL9stUBARrvDtnPQsZ23YBVkA/rV
	 NmxM0XA6fNAXXcS4kWTCSb0LLhwlfDTQenhAvsuXK4yLT6Y9xuzWDZq+tUtao1aBr9
	 SmIe0ngw+x+Y7ZyGBAnGlOeKd/usQq2z9h8dBMsHuSYs2050BG+p7Ywm0aLiOfD+QG
	 /Qpn4w5lwVhSfsFaYu1wu+XAKkRTPHWQiogeIYPwn7z0xjGr8GkFwZj7j0SSmtdIVj
	 bkCorxI9YvNxTTlc3DVsI8JbjJB9ZIacPio2ThRUXMo/EgwcoSS0chcclwcIDItNVM
	 t4UykERqQ7CzQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 3/7] net: dsa: mediatek: add support for
 passthrough mode
Reply-To: sashiko-reviews@lists.linux.dev
To: "Caleb James DeLisle" <cjd@cjdns.fr>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260915174643.253660-4-cjd@cjdns.fr>
References: <20260915174643.253660-1-cjd@cjdns.fr>
 <20260915174643.253660-4-cjd@cjdns.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 17:47:47 +0000
Message-Id: <20260916174747.895C61F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:
- [High] net: dsa: mt753x_check_passthrough aborts probe for valid cascaded=
/multi-CPU setups
- [High] net: dsa: mt7530_port_enable applies passthrough config to standar=
d cascades and breaks routing
- [High] net: dsa: mt7530_port_enable clobbers upstream CPU port's VLAN and=
 configuration settings
- [High] net: dsa: mt753x_conduit_state_change never invoked for DSA links,=
 breaking downstream traps
- [High] net: dsa: mt7530_setup immediately overwrites passthrough PVC_EG_T=
AG configuration
- [High] net: dsa: passthrough switch unintentionally traps link-local fram=
es, breaking transparency
- [High] net: dsa: enabling upstream DSA port on downstream switch clears i=
ts forwarding matrix
--

commit b07f43f65271691db2175591ca2f74d557c362e4
Author: Caleb James DeLisle <cjd@cjdns.fr>
Subject: net: dsa: mediatek: add support for passthrough mode

This commit introduces a passthrough mode to support dual-switch hierarchies
without altering the MediaTek DSA tag.

> diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
> index 54d931002bc14..b2344808457cb 100644
> --- a/drivers/net/dsa/mt7530.c
> +++ b/drivers/net/dsa/mt7530.c

[ ... ]

> @@ -1322,6 +1350,7 @@ static int
>  mt7530_port_enable(struct dsa_switch *ds, int port,
>  		   struct phy_device *phy)
>  {
> +	int upstream_pt =3D dsa_switch_upstream_port(ds);
>  	struct dsa_port *dp =3D dsa_to_port(ds, port);
>  	struct mt7530_priv *priv =3D ds->priv;
> =20
> @@ -1332,13 +1361,38 @@ mt7530_port_enable(struct dsa_switch *ds, int por=
t,
>  	 * bridge.
>  	 */
>  	if (dsa_port_is_user(dp)) {
> -		struct dsa_port *cpu_dp =3D dp->cpu_dp;
> +		priv->ports[port].pm |=3D PCR_MATRIX(BIT(upstream_pt));
> +
> +	} else if (dsa_port_is_dsa(dp) && dp->index !=3D upstream_pt) {
> +		priv->ports[port].pm |=3D PCR_MATRIX(BIT(upstream_pt));
> +
> +		/* Should not happen */
> +		WARN_ON_ONCE(!priv->is_passthrough);

[Severity: High]
Does this missing return statement allow passthrough-specific logic to run =
on
standard cascaded hardware?

When enabling a downstream DSA link on a non-passthrough cascaded switch,
this branch is taken and WARN_ON_ONCE is triggered, but execution continues,
blindly applying passthrough-specific register writes below.

> +
> +		/* We are passing through to a downstream switch so we set both
> +		 * CPU and downstream link to pass traffic untouched so that
> +		 * the STAG from the downstream switch will pass to the upstream.
> +		 */
> +		regmap_write(priv->regmap, MT7530_PVC_P(port),
> +			     VLAN_ATTR(MT7530_VLAN_TRANSPARENT) |
> +			     PVC_EG_TAG(MT7530_VLAN_EG_DISABLED));
> +
> +		/* We let the downstream switch flood */
> +		regmap_set_bits(priv->regmap, MT753X_MFC, BC_FFP(BIT(port)) |
> +				UNM_FFP(BIT(port)) | UNU_FFP(BIT(port)));
> =20
> -		priv->ports[port].pm |=3D PCR_MATRIX(BIT(cpu_dp->index));
> +		/* Make the upstream port able to connect to the DSA port.
> +		 * This must be explicit because PORT_SPEC_TAG is unset.
> +		 */
> +		regmap_write(priv->regmap, MT7530_PCR_P(upstream_pt),
> +			     PCR_MATRIX(BIT(port)));

[Severity: High]
Will this unconditional write wipe out all previous user port matrix mappin=
gs
on the upstream CPU port?

Using regmap_write() here instead of regmap_update_bits() deletes all other
register states in MT7530_PCR_P(upstream_pt). This clobbers the CPU port's
fallback mode (PCR_PORT_VLAN_MASK) and all other configurations set earlier=
 in
mt753x_cpu_port_enable().

>  	}
>  	priv->ports[port].enable =3D true;
> -	regmap_update_bits(priv->regmap, MT7530_PCR_P(port), PCR_MATRIX_MASK,
> -			   priv->ports[port].pm);
> +
> +	/* In passthrough mode, CPU port mask is set above. */
> +	if (!(priv->is_passthrough && dp->index =3D=3D upstream_pt))
> +		regmap_update_bits(priv->regmap, MT7530_PCR_P(port),
> +				   PCR_MATRIX_MASK, priv->ports[port].pm);

[Severity: High]
Could this logic erroneously clear the routing matrix for the upstream link
on cascaded downstream switches?

When the DSA core enables the upstream DSA port of the downstream switch,
priv->ports[port].pm is zero since it was skipped above. For downstream
cascaded switches (where priv->is_passthrough is false), this update writes
zero to MT7530_PCR_P, wiping the valid ingress forwarding matrix set
previously. This will cause inbound traffic arriving at the downstream swit=
ch
to be entirely dropped.

> =20
>  	mutex_unlock(&priv->reg_mutex);
> =20

[ ... ]

> @@ -2517,7 +2566,7 @@ mt7530_setup(struct dsa_switch *ds)
>  		/* Disable learning by default on all ports */
>  		regmap_set_bits(priv->regmap, MT7530_PSC_P(i), SA_DIS);
> =20
> -		if (dsa_is_cpu_port(ds, i)) {
> +		if (dsa_is_upstream_port(ds, i)) {
>  			mt753x_cpu_port_enable(ds, i);

[Severity: High]
Will the passthrough switch unintentionally trap link-local frames and break
transparency?

mt7530_setup() calls mt753x_trap_frames() unconditionally before this port
loop. Global MAC-based trapping remains active on the passthrough switch,
which intercepts protocol frames (like BPDUs) meant for the downstream swit=
ch
and potentially loops them back to the CPU instead of forwarding them
transparently.

[Severity: High]
Is it expected that the remainder of the port setup loop undoes the
passthrough configuration?

mt753x_cpu_port_enable() explicitly configures the passthrough CPU port's
MT7530_PVC_P to MT7530_VLAN_EG_DISABLED. However, immediately after this
if/else block, mt7530_setup() calls:

    regmap_update_bits(priv->regmap, MT7530_PVC_P(i),
                       PVC_EG_TAG_MASK,
                       PVC_EG_TAG(MT7530_VLAN_EG_CONSISTENT));

This unconditional update actively undoes the passthrough egress tag
configuration applied moments prior.

>  		} else {
>  			mt7530_port_disable(ds, i);

[ ... ]

> @@ -3310,7 +3359,7 @@ mt753x_conduit_state_change(struct dsa_switch *ds,
> =20
>  	/* Set the CPU port to trap frames to for MT7530. Trapped frames will be
>  	 * forwarded to the numerically smallest CPU port whose conduit
> -	 * interface is up.
> +	 * interface is up. NOTE: "CPU port" can also mean an upstream DSA link.
>  	 */
>  	if (priv->id !=3D ID_MT7530 && priv->id !=3D ID_MT7621 &&
>  	    priv->id !=3D ID_EN7528)

[Severity: High]
Is mt753x_conduit_state_change() ever invoked for upstream DSA links?

The new comment notes that "CPU port" can also mean an upstream DSA link.
However, the DSA core only calls .conduit_state_change for true CPU ports,
never for switch-to-switch DSA links. Because of this, the downstream switc=
h's
active_cpu_ports will remain 0, and its global trap destination (MT7530_CPU=
_PORT)
will remain unset, dropping trapped protocol frames.

Furthermore, even if it were called, mask =3D BIT(cpu_dp->index) uses the u=
pstream
switch's port index, which does not map correctly to the local hardware mat=
rix
of the downstream switch.

[ ... ]

> @@ -3405,6 +3454,76 @@ static int mt7988_setup(struct dsa_switch *ds)
>  	return mt7531_setup_common(ds);
>  }
> =20
> +/* 1 if passthrough, negative if error. */
> +static int mt753x_check_passthrough(struct device *dev)
> +{
> +	struct device_node *ports, *port;

[ ... ]

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

[Severity: High]
Does this validation abort the probe for valid multi-CPU or standard cascad=
ed
setups?

If a regular non-passthrough switch has two CPU ports (e.g., for redundancy)
or one CPU port and one cascade link, passthrough_ports equals 2. If this
switch also has active user ports, enabled_ports will be > 2. The check
(passthrough_ports =3D=3D 2 && enabled_ports !=3D 2) evaluates to true, tri=
ggering an
early return and causing valid hardware configurations to fail initializati=
on.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915174643.2536=
60-1-cjd@cjdns.fr?part=3D3
