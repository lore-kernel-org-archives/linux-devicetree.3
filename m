Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2E552AD3C
	for <devicetree@vger.kernel.org>; Thu, 24 Sep 2026 10:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790246409; cv=none; b=fvAI7AWudo7PS0J+j04l3jlejINPu8nA6NDp8wzRmWiFDtF1xgPMKbUwa6WZHZalatTVMsk6pXrMQetEwjyfCU7ogCHJ6u9whBL+LU44Y98SquIfjjK2OonASiNAW6ocvgMPr+n45w8uxJOb8OnvbJdfbt8uaNCA5m2mgAIXj20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790246409; c=relaxed/simple;
	bh=j4ZrHA0DRp9S/vk5W8pzwdtSfyeKC0mJFqYu18AehSU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HmKS9RjOVV+Wf2x0pNzv1BbQiFMXWd501C3GsVKf5c3AS9nGJ+ipbv9AlMxCt0m1BDitiE4fiQd3WPS1HTmlebtysoVhEbU2fmWE9G+W+fqRPz1TkJdlVW6ssMTZlgpg4rCcBSjEmZyNYc6ri1ZA6MJxAoazAuYb3w0eyfQmc9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VGsLXW4y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VGsLXW4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 597041F00898;
	Thu, 24 Sep 2026 10:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790246405;
	bh=we7JYup0dbrdfpD0O3DEisI4P9Y4aorD+ZegTG938Hc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VGsLXW4yVX66T/sVEsPbHoXrMkbrqg0HAkCCGh0l7X1BmKmpfD5LJwEKiO1AZHsrT
	 2D7/5eFcL3pVBcM+LcRm3biVqzI6wQPbpmi8f0ALoIYXdHfzIwQPuyPDJd2+pv8jrI
	 yk45T1SGKDsE21jb1E8GcNd9k9RNOnciW5og0wTDY4OxuDSe3Dx1P514raHlrJcqt+
	 dlHTgARWixVqdV7gUUNgld7rlwA8rfdN8bgpydk+tPOzG8VKueSWEzAbmPEndwQGWH
	 tY1VlzuX8iM7fXAnZDg00Kye3zDzCpeZ9fUXHNaIqtMNCfLeDzVuHhtmC48Jm3UNtI
	 9aHe2DtTZZkGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v3 7/8] net: dsa: soce: Add VLAN offload
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vasilij Strassheim" <v.strassheim@linutronix.de>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260923-devel-vstrassheim-soce-dsa-ml-v3-7-ddebafcb9ba7@linutronix.de>
References: <20260923-devel-vstrassheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de>
 <20260923-devel-vstrassheim-soce-dsa-ml-v3-7-ddebafcb9ba7@linutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 10:40:04 +0000
Message-Id: <20260924104005.597041F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] net: dsa: soce: needs_standalone_vlan_filtering drops standalone t=
raffic after bridge leave
- [High] net: dsa: soce: VLAN isolation bypass due to missing hardware roll=
back on write failure
- [Medium] net: dsa: soce: -EOPNOTSUPP fails to reject unsupported VLAN con=
figurations
--

commit b9f4e8ae119f137ae188040da4ddc3fbc9794221
Author: Vasilij Strassheim <v.strassheim@linutronix.de>

net: dsa: soce: Add VLAN offload support
   =20
Add VLAN filtering and membership offload for switch configurations that
implement the Port VLAN synthesis option.

> diff --git a/drivers/net/dsa/soce/soce_dsa_core.c b/drivers/net/dsa/soce/=
soce_dsa_core.c
> index d391b11b94ad6..f93ce9da8400c 100644
> --- a/drivers/net/dsa/soce/soce_dsa_core.c
> +++ b/drivers/net/dsa/soce/soce_dsa_core.c

[ ... ]

> @@ -162,6 +200,178 @@ static void soce_sw_disable_tagging(struct soce_dsa=
_local *local)

[ ... ]

> +static int soce_vlan_write_entry(struct soce_priv *priv, u16 vid)
> +{
> +	struct soce_dsa_local *local =3D &priv->local;
> +	void __iomem *base =3D local->base_addr;
> +	u32 cpu_ports;
> +	u32 untagged;
> +	u32 members;
> +	int ret;
> +
> +	/* The CPU port must be a tagged member of every active VLAN so
> +	 * tagged frames can reach the conduit.
> +	 */
> +	cpu_ports =3D dsa_cpu_ports(&priv->ds);
> +	members =3D priv->vlan_members[vid];
> +	if (members)
> +		members |=3D cpu_ports;
> +	untagged =3D priv->vlan_untagged[vid] & ~cpu_ports;
> +
> +	soce_vlan_select_vid(local, vid);
> +	writel(members, base + SOCE_VLAN_MEMBER_PORTS_OFFSET);
> +	writel(SOCE_VLAN_MEMBER_CTRL_WRITE,
> +	       base + SOCE_VLAN_MEMBER_CTRL_OFFSET);
> +	ret =3D soce_vlan_wait_for_write(local, SOCE_VLAN_MEMBER_CTRL_OFFSET,
> +				       SOCE_VLAN_MEMBER_CTRL_WRITE);
> +	if (ret)
> +		return ret;
> +
> +	writel(untagged, base + SOCE_VLAN_UNTAG_PORTS_OFFSET);
> +	writel(SOCE_VLAN_UNTAG_CTRL_WRITE,
> +	       base + SOCE_VLAN_UNTAG_CTRL_OFFSET);
> +
> +	return soce_vlan_wait_for_write(local, SOCE_VLAN_UNTAG_CTRL_OFFSET,
> +					SOCE_VLAN_UNTAG_CTRL_WRITE);
> +}

[ ... ]

> +static int soce_vlan_setup(struct dsa_switch *ds)
> +{
> +	struct soce_priv *priv =3D ds->priv;
> +	struct soce_dsa_local *local;
> +	struct dsa_port *dp;
> +	int ret;
> +
> +	local =3D &priv->local;
> +
> +	if (!priv->features.port_vlan)
> +		return 0;
> +
> +	ret =3D soce_vlan_reset(local);
> +	if (ret) {
> +		dev_err(ds->dev, "failed to reset VLAN configuration: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
> +	/* Default every port to PVID 1, unfiltered, so standalone
> +	 * forwarding keeps working before any bridge VLAN is configured.
> +	 */
> +	scoped_guard(mutex, &priv->vlan_lock) {
> +		dsa_switch_for_each_available_port(dp, ds) {
> +			priv->port_pvid[dp->index] =3D 1;
> +			soce_vlan_config_port(priv, dp->index, false);
> +		}
> +		soce_vlan_set_enabled(local, true);
> +	}
> +
> +	return 0;
> +}

[ ... ]

> @@ -224,6 +443,130 @@ static enum dsa_tag_protocol soce_get_tag_protocol(=
struct dsa_switch *ds,

[ ... ]

> +static int soce_port_vlan_add(struct dsa_switch *ds, int port,
> +			      const struct switchdev_obj_port_vlan *vlan,
> +			      struct netlink_ext_ack *extack)
> +{
> +	struct dsa_port *dp =3D dsa_to_port(ds, port);
> +	struct soce_priv *priv =3D ds->priv;
> +	u32 port_mask =3D BIT(port);
> +	u32 *untagged_ports;
> +	u32 old_untagged;
> +	u32 old_members;
> +	bool untagged;
> +	u32 *members;
> +	int ret;
> +
> +	untagged_ports =3D priv->vlan_untagged;
> +	members =3D priv->vlan_members;
> +
> +	if (!priv->features.port_vlan) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Port VLAN support is not implemented in the switch core");
> +		return -EOPNOTSUPP;
> +	}

[Severity: Medium]
Since -EOPNOTSUPP is explicitly masked by the switchdev and DSA cores, will
this return value be ignored instead of rejecting the configuration? It
looks like this would allow the operation to succeed in the network stack,
causing hardware to silently strip VLAN tags on CPU ingress without
including them in the DSA tag, which could break the network configuration.

> +
> +	if (!vlan->vid)
> +		return 0;
> +
> +	untagged =3D vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
> +
> +	scoped_guard(mutex, &priv->vlan_lock) {
> +		old_members =3D members[vlan->vid];
> +		old_untagged =3D untagged_ports[vlan->vid];
> +
> +		members[vlan->vid] |=3D port_mask;
> +		if (untagged)
> +			untagged_ports[vlan->vid] |=3D port_mask;
> +		else
> +			untagged_ports[vlan->vid] &=3D ~port_mask;
> +
> +		ret =3D soce_vlan_write_entry(priv, vlan->vid);
> +		if (ret) {
> +			NL_SET_ERR_MSG_MOD(extack,
> +					   "failed to update VLAN hardware tables");
> +			dev_err(ds->dev,
> +				"failed to add VLAN %u on port %d: %d\n",
> +				vlan->vid, port, ret);
> +			members[vlan->vid] =3D old_members;
> +			untagged_ports[vlan->vid] =3D old_untagged;
> +			return ret;
> +		}

[Severity: High]
If the second write for the untagged mask in soce_vlan_write_entry() fails
and returns an error, the first write for the member mask has already been
committed to the hardware.=20

Is it safe to only rollback the software state here? By leaving the hardware
member mask modified, the switch might forward frames for this VLAN to the
port, leading to a VLAN isolation bypass while the OS believes the port is
isolated.

[ ... ]

> +static int soce_port_vlan_filtering(struct dsa_switch *ds, int port,
> +				    bool vlan_filtering,
> +				    struct netlink_ext_ack *extack)
> +{
> +	struct soce_priv *priv =3D ds->priv;
> +
> +	if (!priv->features.port_vlan) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "Port VLAN support is not implemented in the switch core");
> +		return -EOPNOTSUPP;
> +	}

[Severity: Medium]
Similarly to soce_port_vlan_add(), will returning -EOPNOTSUPP here fail to
reject unsupported VLAN configurations since it gets masked by the DSA core?

[ ... ]

> @@ -278,8 +623,35 @@ static int soce_sw_probe(struct platform_device *pde=
v)

[ ... ]

> +	/* Force VLAN uppers always through the callbacks, so cores without
> +	 * Port VLAN feature can reject them instead of silently dropping
> +	 * VLAN frames.
> +	 */
> +	ds->needs_standalone_vlan_filtering =3D true;

[Severity: High]
Does enabling needs_standalone_vlan_filtering cause complete loss of standa=
lone
network traffic when a port leaves a bridge?

When a port is removed from a VLAN-unaware bridge, the DSA core will call
dsa_port_vlan_filtering(dp, true), forcing the hardware into ingress filter=
ing
mode.

Since the bridge flushes VLANs on leave, the port is removed from the hardw=
are
member mask for VLAN 1. However, earlier in soce_vlan_setup(), the driver
assigns PVID 1 but never adds the port to the hardware member mask for VLAN=
 1.
Will all subsequent untagged standalone traffic be classified to PVID 1 and
dropped by the ingress filter because the port is no longer a member?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260923-devel-vstr=
assheim-soce-dsa-ml-v3-0-ddebafcb9ba7@linutronix.de?part=3D7
