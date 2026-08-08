Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BF1375F9E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186022; cv=none; b=B+7B70tN666r0HmMh9gacYC645EFOJ9YqHaEc0EJ3vO+0soKHG085UaBokuAzwtyJbBq1AX0D2PtlNqTLqtZui+gZD6riQQbjoVcv4SWS5Jwe7gd84HHRl/z1AFVz+GNruThlLM0fnMyd7ObC7PKqhl4LyGNrja7MASgxUdSz5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186022; c=relaxed/simple;
	bh=Danti0zRb9dUtN5JQa95MWWZRVvk/BEMzfpGzHptY2A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQv0FvaNl4BEku8+O5ljOa/uIFPQ7UGn6/zfv0QwCOACH5aHoslMC4fPOOwI4fxA8rGiG6ajLunEbOf56By5NndVLqk2aYmExxD6QxdgVlUNiU2/RUhJtc/ElC48TWjtsubf3PiX3K5p41bZr33Ts92cO1py+3ekTP20r2U/NSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VdBBLqHj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VdBBLqHj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4FD51F00A3A;
	Sat,  8 Aug 2026 10:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186021;
	bh=4V99Tp98G1E9gb5OPhumbxA1HSvJ///eXLpzikAS2GU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VdBBLqHjvw+OPd+YvTE1QwPpebPLWrYlp8Gb8j1iQBLFF/lZMKhJ4rQ30YkbNlq+o
	 F2nVYqUMMDyCs7/LdQsURMRwTlFguVyIXnvu2L4KHGq89dOhxpsAfJUUglFR0Zuw7t
	 ojBVQZk4Y9ok543Wp3p2BFkVDShWFEnYKVQ0oKQ3vHSj80VD9rLJ+MopSy0P2rnsPC
	 xTMKWuLxzQUZlIDU1pSawsCvlFeJVmBbKH3McqLQUNZCDMzQs+IQ76eMnFdebbfdSZ
	 ufHE+bpojtmWmIem4ftSWZLbkTCzN0zq7vsxqkC6+NwJ4A/hViHox7FmVRxazY1SiA
	 RQd4ngd6xKLdw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 20/20] net: dsa: xilinx: trap link-local control frames
 to the CPU port
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260807104431.157230-21-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-21-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:47:00 +0000
Message-Id: <20260808104700.E4FD51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Mixing goto-based error handling with scoped guard cleanups in t=
he same function.
- [Medium] Incomplete hardware state rollback on error in VLAN configuratio=
n functions.
- [Medium] Error path in xlnx_tsn_setup bypasses trap removal, leaking hard=
ware state.
- [Medium] FDB additions and deletions for control MACs are silently ignore=
d, deceiving the software bridge.
--

--- Patch [20]: [PATCH 20/20] net: dsa: xilinx: trap link-local control fra=
mes to the CPU port ---
commit 56b303f76151a63e86634cce7c4b44f8de4578a9
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: trap link-local control frames to the CPU port

This commit installs CAM entries to trap link-local control frames (STP and
LLDP) to the CPU port. It keeps these traps in sync with native VIDs during
VLAN configuration changes and updates FDB operations to handle these
control MACs.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> index 7e5cf77cfa66a..e35dbcdfcbda2 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c
[ ... ]
> @@ -712,6 +742,9 @@ static int xlnx_tsn_port_fdb_add(struct dsa_switch *d=
s, int port,
>  	u8 portlist;
>  	int ret;
> =20
> +	if (xlnx_tsn_addr_is_ctrl_trap(addr))
> +		return 0;
> +
>  	if (!vid)
>  		vid =3D TSN_SW_DEFAULT_VID;

[Severity: Medium]
If the hardware cannot apply the requested FDB offloads for control MACs,
should this return an error like -EOPNOTSUPP instead of 0?

Returning 0 here could deceive the software bridge and userspace into
believing the rules were successfully applied to the hardware when they
were actually ignored.

> @@ -733,6 +766,9 @@ static int xlnx_tsn_port_fdb_del(struct dsa_switch *d=
s, int port,
>  	u8 portlist;
>  	int ret;
> =20
> +	if (xlnx_tsn_addr_is_ctrl_trap(addr))
> +		return 0;
> +
>  	if (!vid)
>  		vid =3D TSN_SW_DEFAULT_VID;

[Severity: Medium]
Similarly, should xlnx_tsn_port_fdb_del() return an error instead of 0 to=20
accurately reflect that the hardware FDB wasn't modified?

[ ... ]
> @@ -1004,15 +1123,23 @@ static int xlnx_tsn_port_vlan_filtering(struct ds=
a_switch *ds, int port,
>  		ret =3D xlnx_tsn_port_state_cycle(sw, dp->index,
>  						TSN_PORT_STATE_BLOCKING);
>  		if (ret)
> -			return ret;
> +			goto restore;
> =20
>  		ret =3D xlnx_tsn_port_state_cycle(sw, dp->index,
>  						TSN_PORT_STATE_FLUSH);
>  		if (ret)
> -			return ret;
> +			goto restore;
>  	}
> =20
> +	ret =3D xlnx_tsn_sync_ctrl_traps(sw);
> +	if (ret)
> +		goto restore;
> +
>  	return 0;
> +
> +restore:
> +	sw->vlan_aware =3D old_vlan_aware;
> +	return ret;
>  }

[Severity: Medium]
Does xlnx_tsn_port_vlan_filtering() now mix goto-based error handling with=
=20
guard() declarations?

The function begins with:

	guard(mutex)(&sw->indirect_lock);

According to include/linux/cleanup.h, functions should either use scope-bas=
ed=20
cleanup for all resources or convert none of them. Mixing goto labels and=20
guard() in the same function can lead to complex ownership issues.

Additionally, if we hit the goto restore path, are the previously executed=
=20
hardware register changes (like PVID, learning control, or CAM entries) lef=
t=20
unreverted? This seems like it could leave the hardware and software views=
=20
desynchronized on error.

> @@ -1061,6 +1188,7 @@ static int xlnx_tsn_port_vlan_add(struct dsa_switch=
 *ds, int port,
>  		sw->pvid[port] =3D vlan->vid;
>  		sw->pvid_untagged[port] =3D untagged;
>  		xlnx_tsn_apply_pvid(sw, port);
> +		return xlnx_tsn_sync_ctrl_traps(sw);
>  	}

[Severity: Medium]
If xlnx_tsn_sync_ctrl_traps() fails, will the hardware and internal PVID st=
ate=20
be left out of sync with the bridge's view?=20

The error is returned directly to the caller, but the hardware changes just=
=20
made by xlnx_tsn_apply_pvid() are not rolled back.

> @@ -1101,6 +1229,7 @@ static int xlnx_tsn_port_vlan_del(struct dsa_switch=
 *ds, int port,
>  		sw->pvid[port] =3D TSN_SW_DEFAULT_VID;
>  		sw->pvid_untagged[port] =3D false;
>  		xlnx_tsn_apply_pvid(sw, port);
> +		return xlnx_tsn_sync_ctrl_traps(sw);
>  	}
> =20
>  	return 0;

[Severity: Medium]
Similar to the addition path, if xlnx_tsn_sync_ctrl_traps() fails here, is =
the=20
removed PVID state left unreverted while an error is returned?

[ ... ]
> @@ -1276,9 +1420,19 @@ static int xlnx_tsn_setup(struct dsa_switch *ds)
>  			return ret;
>  	}
> =20
> +	/* Trap link-local control frames (STP, LLDP) to the CPU port.
> +	 * Without this, a frame arriving on one wire port would be
> +	 * flooded out the other instead of reaching the host bridge.
> +	 */
> +	scoped_guard(mutex, &sw->indirect_lock) {
> +		ret =3D xlnx_tsn_sync_ctrl_traps(sw);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret =3D xlnx_tsn_mdio_register_all(sw);
>  	if (ret)
> -		return ret;
> +		goto err_traps;

[Severity: Medium]
Does the failure path inside the scoped_guard bypass the cleanup block?

If xlnx_tsn_sync_ctrl_traps() fails after partially installing traps,=20
returning directly skips the xlnx_tsn_remove_ctrl_traps() cleanup that=20
happens at the err_traps label below. Could this leak hardware CAM entries?

Also, just like in xlnx_tsn_port_vlan_filtering(), this function mixes=20
scoped_guard() with goto labels (err_traps, err_mdio, etc.), which the clea=
nup=20
subsystem guidelines advise against.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D20
