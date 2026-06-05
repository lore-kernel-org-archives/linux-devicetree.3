Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96743AEF47
	for <devicetree@vger.kernel.org>; Fri,  5 Jun 2026 08:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780647413; cv=none; b=YQqtxwABnhjIY3oLyA2JWU0Q4UK6IdJhzyLRx5bsMjZEMf5omXlJBXHYk1cpjoseDpz0Xi1FfKhnjPz7r8K2FhfpgqD0LF/zwX4LEVgUN19jg91OI+0ICrb1vmikP4NiupfExz16c3ay/8+J0ZV7rj8zRLG63ZeTD/EGJyGF2fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780647413; c=relaxed/simple;
	bh=OtWIY4Ddc2HLVEWUG/mQdWkk76EX9VLGt0hSYOSMLeQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X1kbIJuU9iSksi7WMIlEOrGw1KlWFplODu2htgBH4fSUZmLQZIG9k0YelPLmlkpGhVM+xb5Kctl6lBGDfGlCqTs6PKVmb6BWdKJE+wMfxus5UIzuac2uNnRr5sgRS57VFRMbK85/P3eQelmT9dIcNs+v4EYDKJNnpDw4ClB66og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCVCUyiL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCVCUyiL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA0D1F00899;
	Fri,  5 Jun 2026 08:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780647411;
	bh=0WJiKK0Z6BMLEiifpMMJ7ex2vHhj89OhIIg2ixzpvYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HCVCUyiLYswTtwKvPvOVuZzY6zmjtmznnT1AFUCevjdIrm2vAVdJonR9dRwgojLoH
	 rsiuXCB2B7Jgus2cvdk/HPcn//VYwaNkOrRgpXUr26XncElzVdiseAmnvnbR9u+YJi
	 6Tn4tQij+Dby1sCq1Y4pvCxquThsfxkp5FOo3rp6XXoU32+5a4R7oEXAuPhTy7JdIj
	 D2Ce5ukG6yQaEe9r8Gu4a/iyeuU4xHKyB8n/B+cBEZhO7glGaWxHIC16eidS9oK0+l
	 bVwm5rDWjh9xMRo/KYrekbKFaqBhpn30Y0tdDf4RhmUEGaVcZRW9ZxcxUI+f4Km18C
	 l3M7XMR2rwmjQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v5 4/5] net: dsa: microchip: Support Microchip
 KSZ8995XA / KS8995XA
Reply-To: sashiko-reviews@lists.linux.dev
To: "Linus Walleij" <linusw@kernel.org>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260604-ks8995-to-ksz8-v5-4-98baeb45e665@kernel.org>
References: <20260604-ks8995-to-ksz8-v5-4-98baeb45e665@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 05 Jun 2026 08:16:50 +0000
Message-Id: <20260605081651.3DA0D1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] The switch reset sequence for KSZ8995XA writes to a read-only st=
atus register and an undefined CPU port register instead of performing a PH=
Y reset.
- [Medium] The driver assigns `port_mirror_add` and `port_mirror_del` for K=
SZ8995XA, which lacks mirroring support, leading to reserved bit corruption.
- [Low] The `supports_mii` array incorrectly advertises MII support for int=
ernal PHY ports on the KSZ8995XA.
--

commit 6b2a4a6f73e02d485d9019f443f2944affb0ec9e
Author: Linus Walleij <linusw@kernel.org>

net: dsa: microchip: Support Microchip KSZ8995XA / KS8995XA

This adds support for the Microchip KSZ8995XA also known as the
Micrel KS8995XA switch to the KSZ driver.

> diff --git a/drivers/net/dsa/microchip/ksz8.c b/drivers/net/dsa/microchip=
/ksz8.c
> index 0f84b2e7d25d8..0b02588e22fc1 100644
> --- a/drivers/net/dsa/microchip/ksz8.c
> +++ b/drivers/net/dsa/microchip/ksz8.c

[ ... ]

> @@ -137,7 +138,18 @@ static int ksz8_pme_pwrite8(struct ksz_device *dev, =
int port, int offset, u8 dat
> =20
>  static int ksz8_reset_switch(struct ksz_device *dev)
>  {
> -	if (ksz_is_ksz88x3(dev)) {
> +	if (ksz_is_ksz8995xa(dev)) {
> +		unsigned int port;
> +
> +		/* KSZ8995XA is "reset" by stopping the switch and starting it */
> +		ksz_cfg(dev, REG_SW_ID_1, SW_START_SWITCH, false);
> +		usleep_range(10, 100);
> +		ksz_cfg(dev, REG_SW_ID_1, SW_START_SWITCH, true);
> +
> +		/* Often boot loaders have fun with ports, so reset them */
> +		for (port =3D 0; port < dev->info->port_cnt; port++)
> +			ksz_port_cfg(dev, port, 0x0f, BIT(4), true);

[Severity: Medium]
Does this sequence correctly perform a PHY reset for the KSZ8995XA?

On this chip, offset 0x0F resolves to 0x1F for Port 0 (Port Status 1),
which is a read-only register, making this write ineffective. Furthermore,
for the CPU port (port 4), this writes to 0x5F, which falls into the
undocumented/reserved register space.

Could this use a different offset for the soft reset?

[ ... ]

> @@ -2416,6 +2507,34 @@ const struct ksz_dev_ops ksz88xx_dev_ops =3D {
>  	.pme_pwrite8 =3D ksz8_pme_pwrite8,
>  };
> =20
> +/*
> + * Restricted operations for KSZ8995XA, so many things are not supported
> + * by this old switch that we need diet DSA operations.
> + */
> +const struct dsa_switch_ops ksz8995xa_switch_ops =3D {
> +	.get_tag_protocol	=3D ksz8995xa_get_tag_protocol,

[ ... ]

> +	.port_fast_age		=3D ksz8_flush_dyn_mac_table,
> +	.port_mirror_add	=3D ksz8_port_mirror_add,
> +	.port_mirror_del	=3D ksz8_port_mirror_del,

[Severity: Medium]
Since the KSZ8995XA hardware does not support port mirroring, could
advertising these mirror operations lead to unintended side effects?

When called, ksz8_port_mirror_add() and ksz8_port_mirror_del() write
to bits 7, 6, and 5 of P_MIRROR_CTRL (0x01). On the KSZ8995XA, these
bits are reserved, as only the lower 5 bits are used for VLAN membership.

> +	.port_change_mtu	=3D ksz8_change_mtu,
> +	.port_max_mtu		=3D ksz_max_mtu,
> +	/* TODO: add .port_get/set_apptrust() when we implement priority */
> +};

[ ... ]

> diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/mic=
rochip/ksz_common.c
> index 57c8abfe0147d..ac27beb3054bd 100644
> --- a/drivers/net/dsa/microchip/ksz_common.c
> +++ b/drivers/net/dsa/microchip/ksz_common.c

[ ... ]

> @@ -1485,6 +1499,21 @@ const struct ksz_chip_data ksz_switch_chips[] =3D {
>  		.internal_phy =3D {true, true, true, true, false},
>  	},
> =20
> +	[KSZ8995XA] =3D {
> +		.chip_id =3D KSZ8995XA_CHIP_ID, /* Also known as KS8995XA */
> +		.dev_name =3D "KSZ8995XA",
> +		.cpu_ports =3D 0x10,	/* can be configured as cpu port */
> +		.port_cnt =3D 5,		/* total cpu and user ports */
> +		.num_tx_queues =3D 4,
> +		.num_ipms =3D 4,
> +		.ops =3D &ksz8995xa_dev_ops,
> +		.switch_ops =3D &ksz8995xa_switch_ops,
> +		.phylink_mac_ops =3D &ksz88x3_phylink_mac_ops,
> +		.regs =3D ksz8995xa_regs,
> +		.supports_mii =3D {true, true, true, true, true},

[Severity: Low]
Is it intentional to advertise MII support for all ports here?

Since ports 0-3 are internal PHYs and do not expose an external MII
interface (unlike the CPU port 4), this sets PHY_INTERFACE_MODE_MII in
config->supported_interfaces for these ports via ksz_phylink_get_caps().

Other similar chips like the KSZ8895 use {false, false, false, false, true}
to reflect that only the CPU port uses an external MII.

> +		.internal_phy =3D {true, true, true, true, false},
> +	},
> +

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260604-ks8995-to-=
ksz8-v5-0-98baeb45e665@kernel.org?part=3D4
