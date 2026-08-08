Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91622375F9E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186020; cv=none; b=XheutnOyTzCvDgv9FEPTmcpJto2x5bUaWH0409BGBH5Q9J2cLJ7NOjHAPkWTG/zHTA0DVIbXx+dx1W0xe1tNvPtZh0HwmYhQT5ThqrbT0EZnvCbpUjCXIJCEm33Hq3WyYtO//mg4TFkl4XMQrQ0MoZpLFFCXZgd60h6OwVHCMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186020; c=relaxed/simple;
	bh=Zdl01dmMyJmu0nRUAztvOnCy/q66OZ3sVN8ZhxW+ggQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Gigr19+2bO4kfQFy71ntsEy+8Vdj5Xt/CBCLJfYnej3l0N57OZ59QDrY/tDr4hhx7bZWhRELAQ8Vpz6AG1NmB/KvFEOPSGte/eTWl1VaCdC+fwNS6UwegS8ij7nyKVDotyhFouQRgSf8ZAZr9rG6OyGukmKbQGQzv4GLmTwRTQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bCqAHErF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bCqAHErF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A3E51F000E9;
	Sat,  8 Aug 2026 10:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186019;
	bh=7FJd69ckeic60C2UO2XHl5n+cJLe8VRck+qgdR/YugY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bCqAHErFYnWAC/f3iY7SdodyQ6CLZxbk7Ie6HPchUPirDCGYnjE5sLnRO6V1Y41mz
	 yLv8T8jW/8XfWhAi7g/nfXUp2/2ro/ecsl8KKd6wg7cKE7ceVtY+sYbgQKYtVoOUIt
	 1rXKmfwgrlTvKzT/WK1/0DTZHuE47vyTXgHU8t7IhHqJI7GjEwgnwcjWfaS8t/HAc1
	 4IF3S9D1hwkpdlgoz6Siyy79KEwf9IN+3kJpo7Qp8yCKS4C7gSF8p+ekkEklFvPISD
	 XIpXqiZa5JQx9/iYNQ5beX52iPsiPgt6w6djOKvIzRNSnGTNDznuNrEdK7l+Mk/mqr
	 VII6/hD8JQsww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 18/20] net: dsa: xilinx: offload the bridge FDB to the
 switch CAM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-19-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-19-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:58 +0000
Message-Id: <20260808104659.3A3E51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Missing port forwarding matrix configuration breaks standalone por=
t isolation when hardware bridging is enabled.
- [Medium] port_fdb_dump fails to verify port lists, causing missing or inc=
orrectly attributed FDB entries.
- [Medium] Moving a static unicast FDB entry causes traffic duplication and=
 information leak due to bitwise-ORing the port list.
--

--- Patch [18]: [PATCH 18/20] net: dsa: xilinx: offload the bridge FDB to t=
he switch CAM ---
commit f82d05023d1b6a6153d5fd4fda5ef042b99bb5ce
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: offload the bridge FDB to the switch CAM

This commit adds support for offloading the bridge forwarding database (FDB)
to the switch's stream-destination lookup CAM. It enables MAC address learn=
ing
globally when ports join a bridge, implements hardware-level FDB management
functions, and serializes indirect CAM register accesses.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> index 9a4d4a2fb8925..57558b0e2613b 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> @@ -539,6 +603,217 @@ static void xlnx_tsn_port_stp_state_set(struct dsa_=
switch *ds, int port,
> +static int xlnx_tsn_port_fdb_add(struct dsa_switch *ds, int port,
> +				 const unsigned char *addr, u16 vid,
> +				 struct dsa_db db)
> +{
> +	struct xlnx_tsn *sw =3D ds->priv;
> +	u8 portlist;
> +	int ret;
> +
> +	if (!vid)
> +		vid =3D TSN_SW_DEFAULT_VID;
> +
> +	guard(mutex)(&sw->indirect_lock);
> +	ret =3D xlnx_tsn_cam_read_portlist(sw, addr, vid, &portlist);
> +	if (!ret) {
> +		portlist |=3D TSN_PORT_BIT(port);
> +		ret =3D xlnx_tsn_cam_write(sw, addr, vid, portlist, true);
> +	}

[Severity: Medium]
Will this bitwise-OR cause traffic duplication when a static unicast FDB en=
try
is moved?

When an entry moves to a new port (such as during roaming or a bridge fdb
replace), the bridge can send a SWITCHDEV_FDB_ADD_TO_DEVICE event for the n=
ew
port before sending a delete for the old port.

By bitwise-ORing the new port into the mask here, the entry will forward
unicast traffic to both the old and new ports simultaneously, instead of
replacing the old port.

> +
> +	return ret;
> +}

[ ... ]

> +static int xlnx_tsn_port_fdb_dump(struct dsa_switch *ds, int port,
> +				  dsa_fdb_dump_cb_t *cb, void *data)
> +{
> +	struct xlnx_tsn *sw =3D ds->priv;
> +	unsigned char addr[ETH_ALEN];
> +	u32 base, ctrl, key1, key2;
> +	int ret =3D 0;
> +	u16 vid;
> +	u32 i;
> +
> +	/* Learnt entries live in a per-MAC-port read-key region. The CPU
> +	 * port has no such region.
> +	 */
> +	if (port =3D=3D XLNX_TSN_CPU_PORT)
> +		return 0;
> +
> +	guard(mutex)(&sw->indirect_lock);
> +
> +	if (port =3D=3D XLNX_TSN_PORT_MAC2)
> +		base =3D TSN_CAM_MAC2_READ_KEY_BASE;
> +	else
> +		base =3D 0;
> +
> +	/* Learnt entries occupy non-consecutive slots, so scan the whole
> +	 * region and report each slot marked found.
> +	 */
> +	for (i =3D 0; i < TSN_CAM_READ_KEY_COUNT; i++) {
> +		ret =3D xlnx_tsn_cam_wait_ready(sw);
> +		if (ret)
> +			return ret;
> +
> +		sw_iow(sw, TSN_CAM_CTRL_OFFSET,
> +		       FIELD_PREP(TSN_CAM_READ_KEY_ADDR, base + i) |
> +		       FIELD_PREP(TSN_CAM_OP_MASK, TSN_CAM_OP_READ_KEY) |
> +		       TSN_CAM_OP_ENABLE);
> +
> +		ret =3D xlnx_tsn_cam_wait_done(sw);
> +		if (ret)
> +			return ret;
> +
> +		ctrl =3D sw_ior(sw, TSN_CAM_CTRL_OFFSET);
> +		if (!(ctrl & TSN_CAM_FOUND))
> +			continue;
> +
> +		key1 =3D sw_ior(sw, TSN_CAM_KEY1_OFFSET);
> +		key2 =3D sw_ior(sw, TSN_CAM_KEY2_OFFSET);

[Severity: Medium]
Does this FDB dump implementation report FDB entries incorrectly if their
port list has been modified?

The dump loop checks if a slot is physically occupied but doesn't read the
TSN_CAM_PORT_ACT_OFFSET register to verify if the queried port is actually
present in the entry's port list.

If an entry's port list was later modified via xlnx_tsn_port_fdb_add() or
xlnx_tsn_port_fdb_del() to point to a different port without changing its
physical slot, xlnx_tsn_port_fdb_dump() will still report the entry as
belonging to the original port.

> +		addr[0] =3D key1 >> 24;
> +		addr[1] =3D key1 >> 16;
> +		addr[2] =3D key1 >> 8;
> +		addr[3] =3D key1;
> +		addr[4] =3D key2 >> 8;
> +		addr[5] =3D key2;

[ ... ]

> @@ -643,7 +918,7 @@ static int xlnx_tsn_setup(struct dsa_switch *ds)
>  	struct dsa_port *cpu_dp =3D dsa_to_port(ds, XLNX_TSN_CPU_PORT);
>  	struct xlnx_tsn *sw =3D ds->priv;
>  	struct dsa_port *dp;
> -	u32 mgmt;
> +	u32 mgmt, reg;
>  	int ret;
> =20
>  	if (!dsa_is_user_port(ds, XLNX_TSN_PORT_MAC1) ||
> @@ -656,6 +931,22 @@ static int xlnx_tsn_setup(struct dsa_switch *ds)
> =20
>  	sw->conduit =3D cpu_dp->conduit;
> =20
> +	/* Pre-arm the learning sub-qualifiers for when a port joins a bridge:
> +	 * learn untagged frames under their ingress native VID, and allow
> +	 * learning on VIDs with no membership entry while the bridge is
> +	 * VLAN-unaware. Both bits are inert while global learning is disabled.
> +	 */
> +	reg =3D sw_ior(sw, TSN_SW_ADDR_LEARN_OFFSET);
> +	reg |=3D TSN_SW_ADDR_LEARN_DISABLE | TSN_SW_ADDR_LEARN_UNTAGGED_EN |
> +	       TSN_SW_ADDR_LEARN_NO_VLAN_EN;
> +	sw_iow(sw, TSN_SW_ADDR_LEARN_OFFSET, reg);
> +
> +	/* On a CAM miss flood unknown tagged unicast frames to all ports. */
> +	reg =3D sw_ior(sw, TSN_SW_CTRL_OFFSET);
> +	reg &=3D ~TSN_SW_CTRL_UCAST_MISS_MASK;
> +	reg |=3D FIELD_PREP(TSN_SW_CTRL_UCAST_MISS_MASK, TSN_SW_CTRL_UCAST_MISS=
_FLOOD);
> +	sw_iow(sw, TSN_SW_CTRL_OFFSET, reg);

[Severity: High]
Does this global flooding configuration break network isolation between
standalone ports?

Since standalone ports share the same default PVID and have VLAN filtering
disabled by default, enabling TSN_SW_CTRL_UCAST_MISS_FLOOD globally here
(and similarly in xlnx_tsn_port_vlan_filtering()) without configuring a port
forwarding matrix means an unknown unicast frame entering one standalone po=
rt
could be flooded directly to all other standalone ports, bypassing the CPU
network stack entirely.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D18
