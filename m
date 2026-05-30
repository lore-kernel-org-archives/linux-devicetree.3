Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AC02DF13A
	for <devicetree@vger.kernel.org>; Sat, 30 May 2026 00:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102214; cv=none; b=PG3RklleWeyYZjBnJgk9zzkzlGoY4pCWvsQ6F3ppGHwxQ/tI4x8NwNNjNIrXzU6WPh6j/VwwCHkJUDF0p1HU39q5AwgWRiMf1nYaSQ4d9bzQRuI5+UdNeE9nY3A8ihhWi/vBdA9dUyiDAM7M9N4UwCvtuxGmropRFR5zVpNWHkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102214; c=relaxed/simple;
	bh=CWbGZ06so3UwxbbbJlj4DRP+WBHDaWF2szksiL2y9fY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RnBspncdodVcF3jioiTyErR9U2ZC2wJ0n7AGoFidUwCZYhL0V6Ly7xgtsFiJeefH91Q/21Ja+HHPezEucZTQ6rtgjw/0t2uPeQr/Uo+MjQY2toYH6HH8FPcPScrVpip7iB0NWqEZo2Y9cdoReFYxQ33s1DL/75BfmZtOnAghnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iZ6WrBOt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iZ6WrBOt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02381F00898;
	Sat, 30 May 2026 00:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102213;
	bh=5G3J1+nuXe98/1p23+DK2hLNArApK0ZUNWARZ2wPgLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iZ6WrBOt+mt/CRS/tavRP4qBcsxCofZHSBR76Sqlgs4IMZN8a8MysCsE2V6h2E3T9
	 XZ+izYJMSYvR2WvhQo2CoDCziLFVDzsLMbGoOl6MFGvCPNEUI+VPisaDn1w/bg7n4Q
	 AOL5XTFCLfU0NP1tDUVNfhybv8lhmNc0ZtDFzs80+hUKPs0tgt9MgqAodI+ZGQ49cM
	 HzTMuT86of9Z8OFtnkfXC7DAmPySma8ujICJVPae3mlqA1lZC2cquIajMCIx+ehYeJ
	 WJteieGoB3rsyFIH0cIXtHAkA80rjKgheaqwkj8fl5LbO9iP6qpmjSFlih8nXVPUH3
	 FGMsZPcpVH8CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v6 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260527-dsa_lan9645x_switch_driver_base-v6-4-4d409ae64f3c@microchip.com>
References: <20260527-dsa_lan9645x_switch_driver_base-v6-4-4d409ae64f3c@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:12 +0000
Message-Id: <20260530005012.E02381F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The CPU port is excluded from multicast flooding groups, breaking =
IPv6 Neighbor Discovery.
- [Medium] The ingress tail drop watermark (SYS_ATOP) for the internal CPU =
port is left uninitialized, causing CPU-injected frames to be dropped.
- [Medium] A Time-of-Check to Time-of-Use (TOCTOU) race condition in RGMII =
collision handling allows mutually exclusive ports to be enabled simultaneo=
usly.
--

commit 663f05e1c5287dac7978b55faa5152a3c2ee95f8
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add basic dsa driver for LAN9645X

This commit adds the LAN9645X basic DSA driver with initialization, parent
regmap requests, port module initialization, and phylink integration.

> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
[ ... ]
> @@ -112,6 +112,323 @@ static int lan9645x_setup(struct dsa_switch *ds)
> +	lan9645x_port_cpu_init(lan9645x);
> +
> +	/* Multicast to all front ports */
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MC));
> +
> +	/* IP multicast to all front ports */
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MCIPV4));
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_MCIPV6));

[Severity: High]
Will this configuration exclude the CPU port from multicast flooding groups?

Since front_ports only contains the user ports, BIT(CPU_PORT) is omitted
from the PGID_MC, PGID_MCIPV4, and PGID_MCIPV6 masks. Failing to flood IPv6
multicast traffic to the CPU could break IPv6 Neighbor Discovery (Router and
Neighbor Solicitations).

> +
> +	/* Unicast to all front ports */
> +	lan_wr(front_ports, lan9645x, ANA_PGID(PGID_UC));
> +
> +	/* Broadcast to cpu and all front ports */
> +	lan_wr(BIT(CPU_PORT) | front_ports, lan9645x, ANA_PGID(PGID_BC));
> +

> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
[ ... ]
> @@ -103,6 +103,50 @@ static int lan9645x_phylink_mac_prepare(struct phyli=
nk_config *config,
> +					unsigned int mode,
> +					phy_interface_t iface)
> +{
[ ... ]
> +	/* RGMII_0 is a 2:1 mux shared between port 4 and port 7. Reject
> +	 * collisions by looking at current hardware state: the driver
> +	 * maintains the invariant that RGMII_0_CFG=3D1 iff port 4 owns
> +	 * RGMII_0, and for port 7 when GMII_ENA bit 7 is set this implies port
> +	 * 7 owns RGMII_0.
> +	 */
> +	if (is_rgmii) {
> +		hw_cfg =3D lan_rd(lan9645x, HSIO_HW_CFG);
> +		gmii_ena =3D HSIO_HW_CFG_GMII_ENA_GET(hw_cfg);
> +
> +		if (port =3D=3D 4 && (gmii_ena & BIT(7)))
> +			return -EBUSY;
> +		if (port =3D=3D 7 && (gmii_ena & BIT(4)) &&
> +		    HSIO_HW_CFG_RGMII_0_CFG_GET(hw_cfg))
> +			return -EBUSY;
> +	}
> +
> +	lan_rmw(HSIO_HW_CFG_GMII_ENA_SET(BIT(port)),
> +		HSIO_HW_CFG_GMII_ENA_SET(BIT(port)), lan9645x, HSIO_HW_CFG);

[Severity: Medium]
Is there a race condition between reading and writing the HSIO_HW_CFG regis=
ter?

Phylink mac_prepare callbacks can be invoked concurrently from per-port
workqueues. If ports 4 and 7 negotiate link simultaneously, both could pass=
 the
busy check before either writes its GMII_ENA bit, leading to conflicting
hardware states on the shared RGMII_0 mux. Does this read-modify-write sequ=
ence
need switch-level locking?

> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
[ ... ]
> @@ -77,6 +77,20 @@ void lan9645x_port_set_tail_drop_wm(struct lan9645x *l=
an9645x)
> +{
> +	int shared_per_port;
> +	struct dsa_port *dp;
> +
> +	/* Configure tail dropping watermark */
> +	shared_per_port =3D
> +		lan9645x->shared_queue_sz / (lan9645x->num_phys_ports + 1);
> +
> +	/* The total memory size is divided by number of front ports plus CPU
> +	 * port.
> +	 */
> +	dsa_switch_for_each_available_port(dp, lan9645x->ds)
> +		lan_wr(lan9645x_wm_enc(shared_per_port), lan9645x,
> +		       SYS_ATOP(dp->index));

[Severity: Medium]
Will this leave the tail drop watermark uninitialized for the CPU port?

The memory size calculation correctly accounts for lan9645x->num_phys_ports=
 + 1
to include the CPU port (index 9). However, dsa_switch_for_each_available_p=
ort
only iterates over DSA-known ports (indices 0 to 8). Since SYS_ATOP(9) is
skipped, its watermark remains 0. Could this cause CPU-injected jumbo frame=
s to
be dropped on ingress?

> +
> +	/* Tail dropping active based only on per port ATOP wm */
> +	lan_wr(lan9645x_wm_enc(lan9645x->shared_queue_sz), lan9645x,
> +	       SYS_ATOP_TOT_CFG);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527-dsa_lan964=
5x_switch_driver_base-v6-0-4d409ae64f3c@microchip.com?part=3D4
