Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC4633D4E4
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186021; cv=none; b=K8xSyzEqTtTcNqJdclGl8P6RX0U7cMES773u76iPsUx+4LkTh/q62hHSJcJjrHCMqofBCQbrBAJhlWddg5sSz5PmmmKTnCsNbp6/eystFMnUSAEp1rS0Jmrymmaa1EJyB2QFXK+En6H0r3g5PKQX7Zn9eUM4gfbHUivt9fQvOTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186021; c=relaxed/simple;
	bh=0qXsUNtaVlooP4Fgi9Se42eIAUou4EiIKQYNzv4BPxg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W2hTySQmyogagbF4UU/eG+8IDIYx2YJNVGBlFVD0/X8VzMLGNDycWU1GyfKA+O08aTVAyajNCcdX/TXuqXuo6scw4UvF5djVM8EPXKvQ8ELsG37pdQXohRfcvm0xvctDn5kxgMQQb8nHPC3FTBfENTtNtPvDcz3YWl91YteZDP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eJq3dGTt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eJq3dGTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 040681F00A3D;
	Sat,  8 Aug 2026 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186020;
	bh=78aUraiAIqydceknWE6P5VGtq8DSAbF4HUPpuabM2PU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eJq3dGTttaVRaSQnYugVMuLpHhYgzSJnKz9k3fryjdZD7HNjBp2fSTSUFd8/Ss9py
	 0Iz8RK320KQ7WJO8DIE+jic6fFi0hdw0tiIjln3KzwiB5gy5Q006H9hh941toCeExZ
	 uPO4vNq83qfT2il0FWg5FqXcGFY3kb1SZC7sjrZ1zTYcTZE7rYgF7HDB6v/g/9kFne
	 ic4RTlMweiWto/nbj3O45D5hjSNtR5+PL9qXqNHh9wpCdLs4sdfoQw77JuLKyDy+7i
	 ykSRYIMDsMnSsE+hGGTGaAid+XoIrgm82GaL72aoyihc9YCLq7+LNugu7k7Jfyz0Uy
	 paq9wVI1mhXDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 19/20] net: dsa: xilinx: offload bridge VLAN filtering
 to the switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-20-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-20-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:59 +0000
Message-Id: <20260808104700.040681F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Leaking internal default VLAN tags to wire ports when VLAN filteri=
ng is disabled.
- [Medium] Mixing goto-based error handling with scope-based cleanup helper=
s (`guard()`, `scoped_guard()`) in the same function.
- [Medium] Missing rollback of driver software state and hardware registers=
 on error paths in VLAN configuration.
- [Medium] Silent egress tagging policy violation when replacing a port's P=
VID.
--

--- Patch [19]: [PATCH 19/20] net: dsa: xilinx: offload bridge VLAN filteri=
ng to the switch ---
commit ce3068da25a97ee2632521887db3b91540fc81d6
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: offload bridge VLAN filtering to the switch

The switch always keys the L2 forwarding lookup on {DMAC, VID}. A
per-VID port-membership table controls which ports each VLAN spans.
The ingress parser assigns untagged frames the native VID of the
receiving port before lookup, so tagged and untagged traffic share
the same {DMAC, VID} key throughout.

Wire bridge VLAN filtering to the port-membership table and
native-VID registers so bridge VLAN commands take effect in
hardware. Program the native-VID register on PVID changes so
untagged ingress lands in the right VLAN.

Filtering is switch-wide, so declare it global. The per-MAC
VLAN-enable bit adjusts the MAC's maximum frame length to
account for the 4-byte tag.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> index 57558b0e2613b..7e5cf77cfa66a 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> +/* Write a port's native VID and egress-untag setting to hardware.
> + * While VLAN filtering is off, every port uses the reset-default
> + * native VID and stays tagged, so committed VLANs have no effect
> + * until the bridge goes VLAN-aware. Caller holds indirect_lock.
> + */
> +static void xlnx_tsn_apply_pvid(struct xlnx_tsn *sw, int port)
> +{
> +	u16 vid =3D sw->vlan_aware ? sw->pvid[port] : TSN_SW_DEFAULT_VID;
> +	bool untag =3D sw->vlan_aware && sw->pvid_untagged[port];

[Severity: High]
Does this leak the internal default VLAN tag to the wire when VLAN filtering
is disabled?

When the bridge operates in the default VLAN-unaware mode, the untag boolean
evaluates to false because of the sw->vlan_aware check. This causes egress
untagging to be disabled. Since ingress frames are assigned VID 1, would
they egress with the internal tag and break L2 connectivity for standard
untagged hosts?

> +
> +	xlnx_tsn_set_native_vid(sw, port, vid);
> +	xlnx_tsn_set_native_untag(sw, port, untag);
> +}

[ ... ]

> +static int xlnx_tsn_port_vlan_filtering(struct dsa_switch *ds, int port,
> +					bool vlan_filtering,
> +					struct netlink_ext_ack *extack)
> +{
> +	struct xlnx_tsn *sw =3D ds->priv;
> +	struct dsa_port *dp;
> +	unsigned long bit;
> +	u32 reg, data;
> +	int ret;
> +
> +	guard(mutex)(&sw->indirect_lock);
> +
> +	/* Flip Port-List-Valid on every configured VID: set it to enforce
> +	 * membership, clear it so VLANs added while filtering was off stay
> +	 * inert.
> +	 */
> +	for_each_set_bit(bit, sw->cfg_vids, VLAN_N_VID) {
> +		ret =3D xlnx_tsn_vlan_read(sw, bit, &data);
> +		if (ret)
> +			return ret;
> +
> +		if (vlan_filtering)
> +			data |=3D TSN_VLAN_PORT_LIST_VALID;
> +		else
> +			data &=3D ~TSN_VLAN_PORT_LIST_VALID;
> +
> +		ret =3D xlnx_tsn_vlan_write(sw, bit, data);
> +		if (ret)
> +			return ret;

[Severity: Medium]
If xlnx_tsn_vlan_write() fails here, does this return early without
rolling back the VLAN entries that were already modified in earlier
iterations of this loop?

This could leave the switch hardware and driver state permanently
desynchronized from the Linux bridge core's view if hardware communication
fails partway through.

> +	}
> +
> +	sw->vlan_aware =3D vlan_filtering;

[ ... ]

> +static int xlnx_tsn_port_vlan_add(struct dsa_switch *ds, int port,
> +				  const struct switchdev_obj_port_vlan *vlan,
> +				  struct netlink_ext_ack *extack)
> +{
> +	bool untagged =3D vlan->flags & BRIDGE_VLAN_INFO_UNTAGGED;
> +	bool pvid =3D vlan->flags & BRIDGE_VLAN_INFO_PVID;
> +	struct xlnx_tsn *sw =3D ds->priv;
> +	u32 data;
> +	int ret;
> +
> +	guard(mutex)(&sw->indirect_lock);
> +
> +	/* The hardware strips the tag on egress only for a wire port's native
> +	 * VLAN. Reject an untagged request for any other VID. The CPU port is
> +	 * exempt as it always trunks tagged toward the host.
> +	 */
> +	if (port !=3D XLNX_TSN_CPU_PORT && untagged && !pvid &&
> +	    vlan->vid !=3D sw->pvid[port]) {
> +		NL_SET_ERR_MSG_MOD(extack,
> +				   "untagged egress is only supported for the port PVID");
> +		return -EINVAL;
> +	}

[Severity: Medium]
Does this logic allow a silent egress tagging policy violation when an
administrator replaces a port's PVID?

If a port already has a VLAN configured as untagged, and a new untagged
PVID is added, the condition (untagged && !pvid) allows this replacement.
However, because the hardware only untags the active PVID, the old VLAN
will silently lose its untagging capability and begin egressing as tagged
instead of rejecting the configuration.

> +
> +	ret =3D xlnx_tsn_vlan_read(sw, vlan->vid, &data);

[ ... ]

> @@ -941,12 +1232,26 @@ static int xlnx_tsn_setup(struct dsa_switch *ds)
>  	       TSN_SW_ADDR_LEARN_NO_VLAN_EN;
>  	sw_iow(sw, TSN_SW_ADDR_LEARN_OFFSET, reg);
> =20
> -	/* On a CAM miss flood unknown tagged unicast frames to all ports. */
> +	/* On a CAM miss flood unknown tagged unicast frames to all ports.
> +	 * Also drop tagged frames whose ingress port is not in the VLAN
> +	 * member list. The membership check only bites once VLANs exist.
> +	 */
>  	reg =3D sw_ior(sw, TSN_SW_CTRL_OFFSET);
> -	reg &=3D ~TSN_SW_CTRL_UCAST_MISS_MASK;
> -	reg |=3D FIELD_PREP(TSN_SW_CTRL_UCAST_MISS_MASK, TSN_SW_CTRL_UCAST_MISS=
_FLOOD);
> +	reg &=3D ~(TSN_SW_CTRL_UCAST_MISS_MASK | TSN_SW_CTRL_MEMBER_VIOL_MASK);
> +	reg |=3D FIELD_PREP(TSN_SW_CTRL_UCAST_MISS_MASK, TSN_SW_CTRL_UCAST_MISS=
_FLOOD) |
> +	       FIELD_PREP(TSN_SW_CTRL_MEMBER_VIOL_MASK, TSN_SW_CTRL_MEMBER_VIOL=
_DISCARD);
>  	sw_iow(sw, TSN_SW_CTRL_OFFSET, reg);
> =20
> +	/* Every port uses the default native VID until VLAN filtering is
> +	 * enabled. Seed the PVID shadow and program the native VID
> +	 * registers to match.
> +	 */
> +	scoped_guard(mutex, &sw->indirect_lock)
> +		for (port =3D XLNX_TSN_CPU_PORT; port < XLNX_TSN_NUM_PORTS; port++) {
> +			sw->pvid[port] =3D TSN_SW_DEFAULT_VID;
> +			xlnx_tsn_apply_pvid(sw, port);
> +		}

[Severity: Medium]
Since xlnx_tsn_setup() uses goto-based error handling on failure paths
(such as goto err_traps, err_mdio, etc. lower in the function), is it safe
to use scoped_guard() here?

The Cleanup and Guard Subsystem guidelines explicitly forbid mixing
goto-based error handling and scope-based cleanup in the same function to
prevent confusing ownership semantics and possible leaks.

> +
>  	/* Route CPU-originated bridge-group control frames (STP, LLDP) to
>  	 * the single wire port whose MAC-nibble field matches the frame's

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D19
