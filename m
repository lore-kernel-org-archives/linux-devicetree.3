Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B0E492196
	for <devicetree@vger.kernel.org>; Fri, 14 Aug 2026 19:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734274; cv=none; b=q+1jkwTQgisBgVyaoVPzYTjd3dnBscc+JhuV+TDD49+vPrh7zH9IxpkY+6iy2zop9QU1hXaNvcnXX7rqMd0nRFqCRGkMZLD/8konfXYVzcFo0hUP+DzJ3DlxQr9x3M8hDS6JPuv9rL4KQR1ITF8+X3rAFrvRoKkZP+sk/Reb8qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734274; c=relaxed/simple;
	bh=1yueDIRcNmp0i/VOmEhCTZMB+CwGilUMHPQ0pkxUdZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IRUiECh8Z73F9eGsMlCg1rBMVrssJpQ4CWzD17EncLU397z/EQ3gqxIVhhlHLnEHO7+R8Q1XUE8KbtLNjqWoHS0gIb2Ql5LT7FyauKfSim6nDJXT8n3NCjR9atgQDBA4EnMX7iD0SigWDnWBzOo0KLjlwEZ3OV0VMIOMZyuTMCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aaaoq9TF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aaaoq9TF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96E361F000E9;
	Fri, 14 Aug 2026 19:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786734272;
	bh=H0ZezNgI+a4fphSbUlYN13tI5NbNK13WIj++AfDxNE0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Aaaoq9TFFA1UevdpvOSgVn7TyFpY9c8ZoCIG7IqT3GlXwYI/hAheLZkzzIxLGrmG1
	 upWggAhMjliJLiL3aMqiBS60gfPe6MLUdlmwiBtB30dYTKhsfiKhZg4ct9eG9qQnQy
	 x7UYovivqPUql36GIb2s9GuQKw5fSSYv+LitXvAKrdKu+x3TVe9uCe2CyyJBIZSbsc
	 eShP54/Pj5KA77vTOxZplMB5RA1CCrUEoA5l1QcH6WcQ6Td6S/sMAy2Bk3s54MvXHl
	 f4dOYYxK1ZZgHhyu/MS+g4yvTYwX+v5qtJzDPm4BwcSG+28tFEPi8GHAzkfOFzW9VT
	 MvRaK+b1WUnqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v7 4/4] net: dsa: initial support for MT7628
 embedded switch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joris Vaisvila" <joey@tinyisr.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260813190241.789323-5-joey@tinyisr.com>
References: <20260813190241.789323-1-joey@tinyisr.com>
 <20260813190241.789323-5-joey@tinyisr.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 19:04:32 +0000
Message-Id: <20260814190432.96E361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Using `devm_mdiobus_alloc()` and `devm_mdiobus_register()` in the =
DSA `.setup()` callback leads to resource leaks and sysfs collisions on re-=
bind.
- [High] The VLAN Untag Bitmap (VUB) register stride is incorrectly set to =
7 instead of 8, which will write to the wrong hardware bits for VLANs 1, 2,=
 and 3 within a register block.
--

--- Patch [4]: [PATCH net-next v7 4/4] net: dsa: initial support for MT7628=
 embedded switch ---
commit 94f2355ae398ce31cce3f01105a3f2af1b3c61d6
Author: Joris Vaisvila <joey@tinyisr.com>

net: dsa: initial support for MT7628 embedded switch

Add support for the MT7628 embedded switch.

The switch has 5 built-in 100Mbps user ports (ports 0-4) and one 1Gbps
port that is internally attached to the SoCs CPU MAC and serves as the
CPU port.

> diff --git a/drivers/net/dsa/mt7628.c b/drivers/net/dsa/mt7628.c
> new file mode 100644
> index 0000000000000..fb63f6f644b9e
> --- /dev/null
> +++ b/drivers/net/dsa/mt7628.c

[ ... ]

> +#define MT7628_ESW_VMSC_PREP(vlan, vmsc) \
> +	(((vmsc) & MT7628_ESW_VMSC_M) << MT7628_ESW_VMSC_SHIFT(vlan))
> +
> +#define MT7628_ESW_VUB_S 7
> +#define MT7628_ESW_VUB_M GENMASK(6, 0)
> +#define MT7628_ESW_VUB_SHIFT(vlan) \
> +	(MT7628_ESW_VUB_S * ((vlan) % 4))
> +#define MT7628_ESW_VUB_MASK(vlan) \

[Severity: High]
Is the register stride for the VLAN Untag Bitmap (VUB) incorrectly set to 7
instead of 8?

The MT7628 switch packs 4 VLAN configurations per 32-bit register. Using a
7-bit stride means the shift offsets will be 7, 14, and 21 for the upper
VLANs in the register block, rather than the standard byte-aligned 8, 16,
and 24.

Could this write the untagged port mask into the wrong hardware bits and
corrupt the VLAN configuration?

[ ... ]

> +static int mt7628_setup_internal_mdio(struct dsa_switch *ds)
> +{
> +	struct mt7628_esw *esw =3D ds->priv;
> +	struct device *dev =3D ds->dev;
> +	struct mii_bus *bus;
> +
> +	bus =3D devm_mdiobus_alloc(dev);

[Severity: High]
Does allocating a devm-managed MDIO bus inside a DSA setup callback
cause resource leaks or sysfs collisions on re-bind?

The mt7628_setup_internal_mdio() function is called from the main
mt7628_setup() callback. This setup callback runs every time the master
conduit device binds. If the conduit interface is unbound and bound again,
the setup callback is invoked a second time.

Because the bus lifecycle is tied to the switch platform device via devm_,
the old bus is not freed when the conduit unbinds. Will the second
devm_mdiobus_register() attempt fail with a sysfs name collision (-EEXIST),
preventing the switch from initializing?

> +	if (!bus)
> +		return -ENOMEM;
> +
> +	bus->name =3D "MT7628 internal MDIO bus";

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813190241.7893=
23-1-joey@tinyisr.com?part=3D4
