Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6533F0746
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 09:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783588760; cv=none; b=g3wvLGenoOlGPLxhF8wbXbBQ/Asi1lCchSLdh2m44AbQ+f/08ZXiuurtEa3L/UvGfGvcm3pv1NslWd/6J8tesXXtfzCliztRBTMazWfCbTTPrP2MHW20KYecD4Rzq4N+ODRysVADtS2I+rJp2qSroMBGpvgeRRCtnNl8Kt0H3go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783588760; c=relaxed/simple;
	bh=8J9G/6CpqIeI3h5lGB9jyfD9vKPQEMT2sxxH31SWgeo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S6ymY2qAeDybFSWOqohBymM2JBLlJuUcPp0Bcb48VENPErblBLzL1qHi6Wi50NCNxyoMRT/GdcOPi1wVd0c1scol0ZPhPUGds2e2sagJQPgg2dK6HgBHgiBRBNYuAT/RSTbc5EoD3OMifiJLK7IubDSMp+2T/WZ+yJpbb7RBnmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B/SK/3Tn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B/SK/3Tn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1AD01F000E9;
	Thu,  9 Jul 2026 09:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783588758;
	bh=PJcW/6iJnTIXDSyNQkQPDt4fKQ3JZOJUTGWTOYpCKR0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B/SK/3TnZfzbSlQzcqbn5ucyn29bq7d3Z0/4+YaC35Y2Hevc4/PPP3lpVormL4/ni
	 LmyD8LaMgOyd2kcQg+4O3xpIzAhgWEZoHLUq0HTYWKozfWHyMm4hIz9h3RtlOJLGqI
	 VapwPWSCgKJwG63UMOuZOIhrbOeJ9e5tJat3ta/1quukEgT0FZJOifqfRIkTubSmeX
	 CXtMWxt6eXTOKDZ5AF3+c5NCNacEsFz6PSOQ8ZkGUY1pSflQ05sksZ4049mJ++omMp
	 0cfeQci+FDzOpyFcXRxboI6MCnTTMYVLv5obUPvc7H1hfU9dexNRPGNQCMCDWJ2M56
	 AUwvOWBQckv2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v9 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260708-dsa_lan9645x_switch_driver_base-v9-4-0d1512a326d7@microchip.com>
References: <20260708-dsa_lan9645x_switch_driver_base-v9-0-0d1512a326d7@microchip.com>
 <20260708-dsa_lan9645x_switch_driver_base-v9-4-0d1512a326d7@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 09:19:18 +0000
Message-Id: <20260709091918.A1AD01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Source PGID mask drops all data-plane traffic to and from the CPU.
- [Low] Trailing backslash on the last line of a Makefile variable assignme=
nt.
- [Low] Redundant register write to QS_INJ_CTRL_GAP_SIZE.
--

--- Patch [4]: [PATCH net-next v9 4/9] net: dsa: lan9645x: add basic dsa dr=
iver for LAN9645X ---
commit 3edb62282650bb2eeb57a08ce4dcd00f00d76a54
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>

net: dsa: lan9645x: add basic dsa driver for LAN9645X

Add the LAN9645X basic DSA driver with initialization, parent regmap
requests, port module initialization for NPI, CPU ports and front ports,
and phylink integration for MAC side configuration.

> diff --git a/drivers/net/dsa/microchip/lan9645x/Makefile b/drivers/net/ds=
a/microchip/lan9645x/Makefile
> new file mode 100644
> index 0000000000000..7cc0ae0ada402
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/Makefile
> @@ -0,0 +1,8 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_NET_DSA_MICROCHIP_LAN9645X) +=3D mchp-lan9645x.o
> +
> +mchp-lan9645x-objs :=3D \
> +	lan9645x_main.o \
> +	lan9645x_npi.o \
> +	lan9645x_phylink.o \
> +	lan9645x_port.o \

[Severity: Low]
This isn't a bug, but should the trailing backslash on the last line be
removed? Leaving it could cause the build system to escape the EOF or
absorb appended lines into the variable in future patches.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> new file mode 100644
> index 0000000000000..b253813518c20
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c

[ ... ]

> @@ -0,0 +1,447 @@
> +static int lan9645x_setup(struct dsa_switch *ds)
> +{

[ ... ]

> +	/* Allow VLAN table to control whether cpu copy from the pgid table is
> +	 * enabled. Index PGID_ENTRIES is CPU src pgid, so we skip it as the
> +	 * configuration makes little sense here.
> +	 */
> +	for (int i =3D 0; i < PGID_ENTRIES; ++i)
> +		lan_wr(ANA_PGID_CFG_OBEY_VLAN_SET(1),
> +		       lan9645x, ANA_PGID_CFG(i));
> +
> +	/* Disable bridging by default */
> +	for (int p =3D 0; p < lan9645x->num_phys_ports; p++) {
> +		lan_wr(0, lan9645x, ANA_PGID(PGID_SRC + p));

[Severity: High]
Will this source PGID mask drop all data-plane traffic to and from the CPU?

By setting this to 0 for all ports in lan9645x_setup() and later in
lan9645x_update_fwd_mask(), it appears the user ports lack the CPU port
module bit.

Additionally, because the NPI port isn't part of any bridge, won't its mask
also be set to 0, causing frames injected by the CPU to be dropped by source
filtering before reaching the user ports?

> +
> +		/* Do not forward BPDU frames to the front ports and copy them
> +		 * to CPU
> +		 */
> +		lan_wr(ANA_CPU_FWD_BPDU_CFG_BPDU_REDIR_ENA,
> +		       lan9645x, ANA_CPU_FWD_BPDU_CFG(p));
> +	}

[ ... ]

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_port.c
> new file mode 100644
> index 0000000000000..0642b59419c25
> --- /dev/null
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c

[ ... ]

> @@ -0,0 +1,214 @@
> +void lan9645x_port_cpu_init(struct lan9645x *lan9645x)
> +{
> +	/* Map the 8 CPU extraction queues to the CPU port module (datasheet is
> +	 * wrong)
> +	 */
> +	lan_wr(0, lan9645x, QSYS_CPU_GROUP_MAP);
> +
> +	/* Set min-spacing of EOF to SOF on injected frames to 0, on cpu device
> +	 * 1. This is required when injecting with IFH.
> +	 * Default values emulates delay of std preamble/IFG setting on a front
> +	 * port.
> +	 */
> +	lan_rmw(QS_INJ_CTRL_GAP_SIZE_SET(0),
> +		QS_INJ_CTRL_GAP_SIZE,
> +		lan9645x, QS_INJ_CTRL(1));
> +
> +	/* Injection: Mode: manual injection | Byte_swap */
> +	lan_wr(QS_INJ_GRP_CFG_MODE_SET(1) |
> +	       QS_INJ_GRP_CFG_BYTE_SWAP_SET(1),
> +	       lan9645x, QS_INJ_GRP_CFG(1));
> +
> +	lan_rmw(QS_INJ_CTRL_GAP_SIZE_SET(0),
> +		QS_INJ_CTRL_GAP_SIZE,
> +		lan9645x, QS_INJ_CTRL(1));

[Severity: Low]
This isn't a bug, but is this second write to QS_INJ_CTRL_GAP_SIZE
intentional? It looks like it writes the exact same value as the register
modification a few lines above.

> +
> +	lan_wr(SYS_PORT_MODE_INCL_INJ_HDR_SET(1),
> +	       lan9645x, SYS_PORT_MODE(lan9645x->num_phys_ports + 1));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260708-dsa_lan964=
5x_switch_driver_base-v9-0-0d1512a326d7@microchip.com?part=3D4
