Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4941736BCE8
	for <devicetree@vger.kernel.org>; Sun,  5 Jul 2026 19:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783280413; cv=none; b=CVjcGhXJWPzsqpL9yzbGfAXHG4SfBy3q1+TUPNX1Lll7Dor/JzTrzIR+Uu+NU5F4KewjsKAU7BbYNQ6eF1CfrXb0qWcPxuykhh1aPfZO2hK31T2IkanJGN3iYdzr7WKAlaq/s8XYEx1U9GQpNcnIEh8EuCm0wxJ/Nfp0ChvjDzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783280413; c=relaxed/simple;
	bh=Tw9UCbnAkeM71yp5HkNOr20BRA8WYpO3Avuf1EMPB08=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lemhnGZI+82fdPWBeIsQxNK9uPkFPSII8Ligp7qnFBlt8VjQxEMGOMLo6RZf2bRDN3aB1vqluDKTKe6h1IxDQqxLtQsXtsqp/MO4k3nBFP6TSWztp/cQHKXuVUpBMWJwiic0P6HaPMn/swtm4i2RZyk68Yz59Im0FS58JtPWDXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDg2C3GT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDg2C3GT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7D31F00A3A;
	Sun,  5 Jul 2026 19:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783280411;
	bh=yOEylEmbaKFUX1hkNpSViBIgyEoEJGKRhCUJ98QSDeE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JDg2C3GTqeUKg4ivxwMSVFVXJwbc+O//7Ce0E/3ipTEBzfUmlfZCfDos4e4nAONuA
	 2ggCZTmRsNoEnPYsfZjMCFa7t/L6tDXEkAz8GNgs1hdoRkLsrxRAWJ1Zk8MIt5lEoV
	 YOtxtTeUbgHy/8oj5QSgXuor7lDTj+UYBicMtwJiuLMEs4TKFYPuy86BLiKNcxB+RX
	 CzDEFegYVeCBT7XZxjnJFx/h5S4ff9til6fBsiMSiCkQ7uFMSGVcOtgjy3FxnZrRUM
	 mNwh1AgTCS/YqwKqXIDtnCS5lUUYg3KcosVv2z0u7E7TKEu1O/0qgLJ/DLBnTs/rho
	 VUh2rd9YzoXYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260704-ks8995-to-ksz8-v7-4-2af0eaa545a8@kernel.org>
References: <20260704-ks8995-to-ksz8-v7-0-2af0eaa545a8@kernel.org>
 <20260704-ks8995-to-ksz8-v7-4-2af0eaa545a8@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 05 Jul 2026 19:40:10 +0000
Message-Id: <20260705194011.AC7D31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

New issues:
- [Critical] Uninitialized Stack Variables Corrupt Hardware Registers
- [Critical] MAC Header Corruption on Receive via Misuse of skb_vlan_untag
- [High] Incorrect Register Polarity for MTU Configuration on KSZ8995XA
- [High] Loss of VLAN Tags and Broken 802.1AD Routing on Egress
- [High] Hardware PVID Leaks into Host Network Stack for Untagged Packets
- [High] Invalid PHY Soft Reset on CPU Port Targets Reserved/MAC Registers

Pre-existing issues:
- [High] SPI Device Tree Flags Discarded by Unconditional Mode Overwrite
--

commit 0676ac96adf5e00a23c99f1617beebb88d95ead0
Author: Linus Walleij <linusw@kernel.org>
Subject: net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This adds support for the Microchip KSZ8995XA also known as the Micrel
KS8995XA switch to the KSZ driver. It includes specific register
definitions, switch operations, and compatibility configurations.

> diff --git a/drivers/net/dsa/microchip/Kconfig b/drivers/net/dsa/microchi=
p/Kconfig
> index c71d3fd5dfeb8..75c9b2114afd3 100644
> --- a/drivers/net/dsa/microchip/Kconfig
> +++ b/drivers/net/dsa/microchip/Kconfig
> @@ -2,6 +2,7 @@
>  menuconfig NET_DSA_MICROCHIP_KSZ_COMMON
>  	tristate "Microchip KSZ8XXX/KSZ9XXX/LAN937X series switch support"
>  	depends on NET_DSA
> +	select NET_DSA_TAG_KS8995

[Severity: Critical]
Looking at ks8995_rcv() in net/dsa/tag_ks8995.c which this config enables,
it calls skb_vlan_untag(skb). At this point, the DSA core has pulled the
Ethernet MAC header, so skb->data points to the MAC destination address,
not the VLAN header.

Does this unconditionally read the MAC destination address as a VLAN header,
extract a garbage TCI, and pull 4 bytes, stripping half the MAC address?

[Severity: High]
Also looking at ks8995_xmit() in net/dsa/tag_ks8995.c, if the packet has an
802.1Q payload tag, the driver overwrites its TPID with the DSA routing tag
via hdr->h_vlan_proto =3D KS8995M_STPID(portmask).

Since the switch is configured with PORT_REMOVE_TAG on external ports, will
this cause it to strip this single tag on egress and transmit the packet
untagged, resulting in a loss of 802.1Q VLAN tags?

[ ... ]

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 586916570a841..03a5981a6315c 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c
> @@ -137,7 +138,17 @@ static int ksz8_pme_pwrite8(struct ksz_device *dev, =
int port, int offset, u8 dat
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port;
> +
> +		/* The KSZ8995XA switch itself cannot be reset by software, but
> +		 * often boot loaders have fun with ports, so reset them. This
> +		 * reset bit is self-clearing.
> +		 */
> +		for (port =3D 0; port < dev->info->port_cnt; port++)
> +			ksz_port_cfg(dev, port, REG_PORT_STATUS_3,
> +				     PORT_PHY_SOFT_RESET, true);

[Severity: High]
This loop in ksz8_reset_switch() iterates over all ports, including the
CPU port which lacks an internal PHY. Could writing PORT_PHY_SOFT_RESET to
REG_PORT_STATUS_3 (0x0F) on the CPU port target reserved or MAC control
registers and cause hardware initialization failures?

> +	} else if (ksz_is_ksz88x3(dev)) {
>  		/* reset switch */
>  		ksz_cfg(dev, KSZ8863_REG_SW_RESET,
>  			KSZ8863_GLOBAL_SOFTWARE_RESET | KSZ8863_PCS_RESET, true);

[ ... ]

> @@ -161,8 +172,14 @@ static int ksz8_reset_switch(struct ksz_device *dev)
>  static int ksz8863_change_mtu(struct ksz_device *dev, int frame_size)
>  {
>  	u8 ctrl2 =3D 0;
> +	unsigned int legalsz;
> +
> +	if (ksz_is_ksz8995xa(dev))
> +		legalsz =3D KSZ8995XA_LEGAL_PACKET_SIZE;
> +	else
> +		legalsz =3D KSZ8_LEGAL_PACKET_SIZE;
> =20
> -	if (frame_size <=3D KSZ8_LEGAL_PACKET_SIZE)
> +	if (frame_size <=3D legalsz)
>  		ctrl2 |=3D KSZ8863_LEGAL_PACKET_ENABLE;

[Severity: High]
Does ksz8863_change_mtu() apply inverted BIT(1) logic for MTU limits on the
KSZ8995XA?

For small MTUs 1522 bytes or less, the driver sets BIT(1) of REG_SW_CTRL_2.
On the KSZ8863 this enables the size limit, but on KSZ8995XA, BIT(1)
represents SW_LEGAL_PACKET_DISABLE and disables the limit. Could this cause
valid packets to be dropped while huge packets bypass the size limit?

[ ... ]

> @@ -242,6 +260,10 @@ static int ksz8_port_queue_split(struct ksz_device *=
dev, int port, int queues)
>  		mask_2q =3D KSZ8873_PORT_2QUEUE_SPLIT_EN;
>  		reg_4q =3D P1CR1;
>  		reg_2q =3D P1CR1 + 1;
> +	} else if (ksz_is_ksz8995xa(dev)) {
> +		/* This switch has no 4way split support */
> +		mask_2q =3D KSZ8795_PORT_2QUEUE_SPLIT_EN;
> +		reg_2q =3D REG_PORT_CTRL_0;
>  	} else {
>  		mask_4q =3D KSZ8795_PORT_4QUEUE_SPLIT_EN;
>  		mask_2q =3D KSZ8795_PORT_2QUEUE_SPLIT_EN;

[Severity: Critical]
When ksz_is_ksz8995xa(dev) is true in ksz8_port_queue_split(), do we use
uninitialized reg_4q and mask_4q variables?

The function unconditionally passes them to ksz_prmw8() later on. Could this
perform a read-modify-write on a garbage I/O register address using a
garbage mask?

[ ... ]

> @@ -2061,13 +2126,17 @@ static int ksz8_setup(struct dsa_switch *ds)
>  	struct ksz_port *p;
>  	const u16 *regs;
>  	int i, ret;
> +	u8 val;
> =20
>  	regs =3D dev->info->regs;
> =20
> -	dev->vlan_cache =3D devm_kcalloc(dev->dev, sizeof(struct vlan_table),
> -				       dev->info->num_vlans, GFP_KERNEL);
> -	if (!dev->vlan_cache)
> -		return -ENOMEM;
> +	/* KSZ8995XA has no SW controlled VLAN handling */
> +	if (!ksz_is_ksz8995xa(dev)) {
> +		dev->vlan_cache =3D devm_kcalloc(dev->dev, sizeof(struct vlan_table),
> +					       dev->info->num_vlans, GFP_KERNEL);
> +		if (!dev->vlan_cache)
> +			return -ENOMEM;
> +	}

[Severity: High]
By skipping VLAN initialization here in ksz8_setup(), the hardware PVID is
never cleared to 0.

In net/dsa/tag_ks8995.c, ks8995_rcv() uses a check for !skb->vlan_tci to
identify originally untagged packets. Does this mean the switch will insert
its non-zero hardware default PVID into untagged packets, causing them to be
erroneously presented to the network stack as 802.1Q VLAN tagged packets?

[ ... ]

> diff --git a/drivers/net/dsa/microchip/ksz_spi.c b/drivers/net/dsa/microc=
hip/ksz_spi.c
> index 77aecac324667..2c55014246e5f 100644
> --- a/drivers/net/dsa/microchip/ksz_spi.c
> +++ b/drivers/net/dsa/microchip/ksz_spi.c
> @@ -185,7 +186,10 @@ static int ksz_spi_probe(struct spi_device *spi)
>  		dev->pdata =3D spi->dev.platform_data;
> =20
>  	/* setup spi */
> -	spi->mode =3D SPI_MODE_3;
> +	if (chip->chip_id =3D=3D KSZ8995XA_CHIP_ID)
> +		spi->mode =3D SPI_MODE_0;
> +	else
> +		spi->mode =3D SPI_MODE_3;
>  	ret =3D spi_setup(spi);
>  	if (ret)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but by unconditionally assigning spi->mode
here in ksz_spi_probe(), does it discard all SPI bus flags configured by
the SPI subsystem based on Device Tree properties (such as spi-cs-high
or spi-3wire)?

This could break SPI communication on boards requiring non-default
polarities or phases.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260704-ks8995-to-=
ksz8-v7-0-2af0eaa545a8@kernel.org?part=3D4
