Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B3375F9E
	for <devicetree@vger.kernel.org>; Sat,  8 Aug 2026 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786186016; cv=none; b=qDt+Go5/srgsHvb4Kz2KUdJjZ4n0p4NToJ4SwsD5AgytLQCwRQmIuMwW6dMUaEW4LIpT3KN8n6rD0FG/o6MCYBD/8y+HdJpQj/2+3ewA7MVh1m+Kr+0yYwU5ep2gv1nOhnE13A6CJD+7benN6/RyP/lmwBXbJxNIGc7y7xNKHzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786186016; c=relaxed/simple;
	bh=plFKQhD3iQq72fIiK77/YCxhfb6VVoDfPp1AnNI8HFA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ttv2d/V7ERgF1kpKYycw2U8WKhejligQyctnK96KOw0Je6W+QeXVfCaUDDDduSOwcX0dItEOG2hQ8wwYcvdfrcMowR001Z3vsXgAm0XmoQiH4lk6DpkG/57wmbg+CFCR7usMvjVkOXy8LwAX+2QALtyIljP+dmZOiGJcOZbyUQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDqAHSn7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDqAHSn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A451F000E9;
	Sat,  8 Aug 2026 10:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786186014;
	bh=bcXN0q2rJSlytyYYnVTLXA1hyZPddTAFg4/Tpmsp94Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GDqAHSn7M9RKz+DMzJdSZ+Vk1X6fs9Hk51bv5sBC/EcMXEEf1pmfY3Bp+3Vwu6/UD
	 VUHn+ie1tpuaxHHFcMuwfsRvVlF4R47EKnNIvhUPQi2HDXaHLP37tq861Xm9E6l5QZ
	 BDamfBTvsr0vV4M/IQH2CMfA45j898UZLKDXHAiTi4/Cixh1TL7ut/0Xj6gpMeuxjR
	 AVdPL4ObF50OHWpjU5+J0Jzoni6nY4jIPjyhpNjG4LZPL0z2M65Uz8i/sxqWF5l74Y
	 XKVk1UnZIDLEy3uKMKYjGW0T/jP5XvOZnci/FWEWgpfzCOBRlk4dgiX3E8ieDPYL13
	 jgBXnheFBbYFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 14/20] net: dsa: xilinx: program MAC frame filter and
 per-port nibbles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nagadheeraj Rottela" <nagadheeraj.rottela@amd.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260807104431.157230-15-nagadheeraj.rottela@amd.com>
References: <20260807104431.157230-1-nagadheeraj.rottela@amd.com>
 <20260807104431.157230-15-nagadheeraj.rottela@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 08 Aug 2026 10:46:53 +0000
Message-Id: <20260808104654.86A451F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Use-After-Free and API violation when broadcasting NETDEV_CHANGEAD=
DR on unregistered user ports.
- [High] Silent mutation of MAC address during NETDEV_REGISTER causes state=
 divergence across subsystems.
- [High] Bypassing DSA MAC management leaks resources and drops packets aft=
er a conduit MAC change.
- [Medium] Missing collision check during initial probe allows duplicate MA=
C nibbles to break switch routing.
--

--- Patch [14]: [PATCH 14/20] net: dsa: xilinx: program MAC frame filter an=
d per-port nibbles ---
commit a960829c1e4fd1b836fd23be3fc9bec389a6b123
Author: Nagadheeraj Rottela <nagadheeraj.rottela@amd.com>

net: dsa: xilinx: program MAC frame filter and per-port nibbles

This commit programs the switch fabric MAC frame filter using a 44-bit
prefix from the conduit interface and configures a unique 4-bit nibble for
each port. It adds a netdev notifier to track conduit and user port MAC
changes to keep the hardware synchronized.

> diff --git a/drivers/net/dsa/xilinx/xilinx_tsn.c b/drivers/net/dsa/xilinx=
/xilinx_tsn.c
> index 86aba2e8b6e94..9826f006b0789 100644
> --- a/drivers/net/dsa/xilinx/xilinx_tsn.c
> +++ b/drivers/net/dsa/xilinx/xilinx_tsn.c

[ ... ]

> @@ -287,6 +357,112 @@ static int xlnx_tsn_mdio_register_all(struct xlnx_t=
sn *sw)
>  	return ret;
>  }
> =20
> +/* Build a per-port MAC from the shared prefix. */
> +static void xlnx_tsn_synth_port_mac(struct xlnx_tsn *sw, int port,
> +				    u8 *out)

[ ... ]

> +static int xlnx_tsn_handle_user_register(struct xlnx_tsn *sw,
> +					 struct net_device *dev, int port)
> +{
> +	u8 want[ETH_ALEN];
> +	u8 nibble;
> +
> +	if (!xlnx_tsn_prefix_matches(sw, dev->dev_addr)) {
> +		xlnx_tsn_synth_port_mac(sw, port, want);
> +		dev_warn(sw->dev,
> +			 "port %d: MAC %pM does not match conduit prefix; overriding to %pM\n=
",
> +			 port, dev->dev_addr, want);
> +		dev_addr_mod(dev, 0, want, ETH_ALEN);

[Severity: High]
Does modifying the MAC address directly in the registration notification
chain leave earlier subsystems out of sync?

When xlnx_tsn_handle_user_register() calls dev_addr_mod() during
NETDEV_REGISTER, subsystems like IPv6 that have already run earlier in the
notification chain will observe the old MAC inherited from the conduit,
and no subsequent NETDEV_CHANGEADDR is emitted to correct their state.

> +		nibble =3D want[5] & TSN_SW_MAC_NIBBLE_WILDCARD;
> +	} else if (ether_addr_equal(dev->dev_addr, sw->conduit->dev_addr)) {
> +		/* Either DSA inherited the conduit MAC, or DT gave port@N
> +		 * the same address explicitly. Either way, assign a unique
> +		 * per-port nibble.
> +		 */
> +		xlnx_tsn_synth_port_mac(sw, port, want);
> +		dev_addr_mod(dev, 0, want, ETH_ALEN);
> +		nibble =3D want[5] & TSN_SW_MAC_NIBBLE_WILDCARD;
> +	} else {
> +		nibble =3D dev->dev_addr[5] & TSN_SW_MAC_NIBBLE_WILDCARD;
> +	}
> +
> +	return xlnx_tsn_set_port_mac_nibble(sw, port, nibble);

[Severity: Medium]
Is it possible for the switch hardware to be configured with duplicate port
identifiers here?

Unlike the runtime callback, this initial registration path unconditionally
extracts and programs the nibble without verifying if it collides with the
CPU port or another user port. This could corrupt switch routing if the
device tree configures identical MAC addresses during probe.

> +}
> +
> +static void xlnx_tsn_handle_conduit_changeaddr(struct xlnx_tsn *sw)
> +{
> +	struct dsa_port *dp;
> +
> +	xlnx_tsn_derive_prefix(sw);
> +	xlnx_tsn_program_frame_filter(sw);
> +	xlnx_tsn_set_port_mac_nibble(sw, XLNX_TSN_CPU_PORT,
> +				     sw->conduit->dev_addr[5]);
> +
> +	dsa_switch_for_each_user_port(dp, &sw->ds) {
> +		u8 want[ETH_ALEN];
> +
> +		if (!dp->user)
> +			continue;
> +
> +		xlnx_tsn_synth_port_mac(sw, dp->index, want);
> +		dev_addr_mod(dp->user, 0, want, ETH_ALEN);

[Severity: High]
Does bypassing the DSA core ndo_set_mac_address hook leak resources and
cause packets to be dropped?

By using dev_addr_mod() here, the DSA core dsa_user_set_mac_address() is
never invoked. This means dsa_user_host_uc_install() and
dsa_user_host_uc_uninstall() are not called to synchronize the hardware
unicast filters with the new MAC address, leaving the old user MAC address
leaked in the conduit's filter list.

> +		call_netdevice_notifiers(NETDEV_CHANGEADDR, dp->user);

[Severity: High]
Can this lead to a use-after-free or API violation?

If the conduit MAC address is changed concurrently with a failure in
dsa_user_create(), dp->user might be cleared without holding rtnl_lock,
allowing this code to dereference freed memory.

Also, this unconditionally broadcasts NETDEV_CHANGEADDR for a device that
may not have completed register_netdevice() yet (where reg_state =3D=3D
NETREG_UNINITIALIZED), which could confuse listeners.

> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807104431.1572=
30-1-nagadheeraj.rottela@amd.com?part=3D14
