Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B68037CD39
	for <devicetree@vger.kernel.org>; Thu,  4 Jun 2026 07:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780558005; cv=none; b=lojItc0j2yUkzdUPnp/ryUM0NZIIIhoQwa2K0g7eHoSdSlHTVJKlc9jxUCzbixKqkjKQpHDiQ1XcmQasMt9oVkPHMw7YLqEt+zzt8EqvN4lQj/C7RZbRWHPbMFpx4Cc8F1BjTJiUTEU037RR3VLqPOKkWStrv28zu3L/qxErw2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780558005; c=relaxed/simple;
	bh=5ExNH29h+asFnb38lGvT/GATWLMIthuZEP7qnahuvA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GybPjH4/Ph3Yw4G9I07FmjXI2SpVbmCySgRps96VbqeU0mp6AMT2AQrWD6L2I5/R7vCd7r+oXGz7ziaHsj5tiz1dLrtTAHIn/GKAO/V50OTQxcvLShpHpfHoYuZ7FS7gi2vgXKLbdbjyXIlF7n6hVF0a2yQnB0UskLs/mIh16N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NoNZ1FZS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NoNZ1FZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C97D1F00898;
	Thu,  4 Jun 2026 07:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780558004;
	bh=01OSrq2815zNJfKK4ZpntZoeB1mmzjehgWyID7+rSSw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NoNZ1FZS6GTyO8Zz1XdL0VwcBdAclScr1PM75jw5zoqVs7ip0XcRIpxtyp3WI2qgv
	 wJwczHofwvMHz+QLbmQIlmGG+AgFoKxlUkLYsqgJJGQqKe99LY8sGBPsx3Xibaq5cY
	 eWzZxowsskhcGRWdouhsnSf++H9pLcHOhUMc7wF2mRllJJ1rJDL70X6rsrlwWr31R/
	 LptQuD0iAFccCYguyNvbOG0BFA1UQjIlhifyawqbimIp9ZJrRNKUCbcM2xRQbyUNfG
	 dGrSXny/zdtLuQHO47CUx4Vfnw8RQl77fIUuWUXG1tqELGXPutZE8I7b6U5KyrQWeZ
	 LYZMn9AS7WlRQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 4/9] net: dsa: lan9645x: add basic dsa
 driver for LAN9645X
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?SmVucyBFbWlsIFNjaHVseiDDmHN0ZXJnYWFyZA==?= <jensemil.schulzostergaard@microchip.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260603-dsa_lan9645x_switch_driver_base-v7-4-b2f90e676707@microchip.com>
References: <20260603-dsa_lan9645x_switch_driver_base-v7-4-b2f90e676707@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 04 Jun 2026 07:26:43 +0000
Message-Id: <20260604072644.0C97D1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Standalone switch ports drop all normal data frames because the so=
urce port masks (`PGID_SRC`) and flooding masks exclude the CPU port, preve=
nting dataplane forwarding to the host.
- [High] SYS_ATOP tail-drop watermark for the internal CPU port is left uni=
nitialized.
- [High] Time-of-check to time-of-use (TOCTOU) race condition in RGMII mult=
iplexing configuration when configuring port 4 and port 7 concurrently.
- [Low] Incompatible pointer type when passing `val` to `regmap_read_poll_t=
imeout()`.
--

commit 7a97b19f69d0bee64d5c7f69c93d9ef188b6bd5e
Author: Jens Emil Schulz =C3=98stergaard <jensemil.schulzostergaard@microch=
ip.com>
net: dsa: lan9645x: add basic dsa driver for LAN9645X

This patch adds a basic DSA driver for the LAN9645X switch. It implements
initialization, NPI port setup, MAC phylink configuration, and basic port
modules.

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_main.c
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_main.c
> @@ -95,9 +95,9 @@ static int lan9645x_reset_switch(struct lan9645x *lan96=
45x)
>  {
>  	int val =3D 0;
>  	int err;
> =20
>  	lan_wr(SYS_RESET_CFG_CORE_ENA_SET(0), lan9645x, SYS_RESET_CFG);
>  	lan_wr(SYS_RAM_INIT_RAM_INIT_SET(1), lan9645x, SYS_RAM_INIT);
>  	err =3D lan9645x_rd_poll_timeout(lan9645x, SYS_RAM_INIT, val,
>  				       SYS_RAM_INIT_RAM_INIT_GET(val) =3D=3D 0);

[Severity: Low]
Does passing an int variable to a macro that expects an unsigned int pointer
cause an incompatible pointer type regression?

The variable val is declared as an int, but it is passed to
lan9645x_rd_poll_timeout() which expands to regmap_read_poll_timeout().
Since regmap_read() expects an unsigned int pointer, this violates pointer
compatibility rules. Should val be declared as u32 instead?

[ ... ]

> @@ -211,7 +211,6 @@ static int lan9645x_setup(struct dsa_switch *ds)
>  		lan_wr(ANA_PGID_CFG_OBEY_VLAN_SET(1),
>  		       lan9645x, ANA_PGID_CFG(i));
> =20
>  	/* Disable bridging by default */
>  	for (int p =3D 0; p < lan9645x->num_phys_ports; p++) {
>  		lan_wr(0, lan9645x, ANA_PGID(PGID_SRC + p));

[Severity: High]
Does hardcoding the source port mask to 0 permanently block dataplane
forwarding for standalone ports?

For standalone ports that are not part of a bridge, DSA expects data frames
to be forwarded exclusively to the CPU port. Because the source mask is set
to 0 here, it appears all forwarding from these ports will be dropped at
the destination analysis stage.

Even known unicast frames destined for the host might be dropped because
BIT(CPU_PORT) masked with 0 is 0. Does this prevent standalone ports from
communicating with the network stack?

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c b/driv=
ers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_phylink.c
> @@ -120,9 +120,7 @@ static int lan9645x_phylink_mac_prepare(struct phylin=
k_config *config,
> =20
>  	if (is_rgmii) {
>  		hw_cfg =3D lan_rd(lan9645x, HSIO_HW_CFG);
>  		gmii_ena =3D HSIO_HW_CFG_GMII_ENA_GET(hw_cfg);
> =20
>  		if (port =3D=3D 4 && (gmii_ena & BIT(7)))
>  			return -EBUSY;
>  		if (port =3D=3D 7 && (gmii_ena & BIT(4)) &&
>  		    HSIO_HW_CFG_RGMII_0_CFG_GET(hw_cfg))
>  			return -EBUSY;
>  	}
> =20
>  	lan_rmw(HSIO_HW_CFG_GMII_ENA_SET(BIT(port)),
>  		HSIO_HW_CFG_GMII_ENA_SET(BIT(port)), lan9645x, HSIO_HW_CFG);

[Severity: High]
Could concurrent configuration of ports 4 and 7 lead to a race condition
when accessing HSIO_HW_CFG?

The lan9645x_phylink_mac_prepare() function is called by phylink, which
serializes operations per-port but does not synchronize across different
ports. If ports 4 and 7 are brought up at the same time, they might both
read HSIO_HW_CFG simultaneously and race to modify it via lan_rmw().

Is a switch-level lock needed to protect accesses to this shared hardware
resource?

> diff --git a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c b/drivers=
/net/dsa/microchip/lan9645x/lan9645x_port.c
> --- a/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
> +++ b/drivers/net/dsa/microchip/lan9645x/lan9645x_port.c
> @@ -85,5 +85,5 @@ void lan9645x_port_set_tail_drop_wm(struct lan9645x *la=
n9645x)
>  	/* The total memory size is divided by number of front ports plus CPU
>  	 * port.
>  	 */
>  	dsa_switch_for_each_available_port(dp, lan9645x->ds)
>  		lan_wr(lan9645x_wm_enc(shared_per_port), lan9645x,
>  		       SYS_ATOP(dp->index));

[Severity: High]
Will the SYS_ATOP watermark for the internal CPU port remain uninitialized
or zero due to this loop?

The dsa_switch_for_each_available_port() macro iterates over DSA user
ports, which correspond to indices 0 to 8, but the internal CPU port has an
index of 9.

Since the CPU port is skipped, it seems its tail-drop watermark is never
written. Could this cause frames injected by the CPU to be immediately
tail-dropped upon ingress into the queue system?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260603-dsa_lan964=
5x_switch_driver_base-v7-0-b2f90e676707@microchip.com?part=3D4
