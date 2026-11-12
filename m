Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794484645;
	b=lhYhPCEgH0Io2HKKqNiAOXfpOHAyv0KBytxmL4TzJutERRUkQf4biKiTVxuYIjY9AhCh
	 9gLGcxWM6sijT9bt+3Tn4kdYO+LXfAi8AKZKgeSbZmUfwhOMiZDsMJCNCZPFIJtrltWSC
	 m1aMUmdo4hdztFHSry+NYrPfwAmpkM7HFED78WmJXm3APa76MKNEkmcbRkpl/Z8rguyUU
	 1Mg26pRwl72yk6rPk0i1tXNFBWxM6diNS1l+vqkEOSlA6h+0l4eTX1abgJVciW1vvyIUB
	 CrA1QTK5zBCoHDkj8nqU1XV+MAw91MiARpex/RwGIHvODOrv585nYmHqwiq++ghiMIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794484645;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Hm8XLf8raqGW2MMzUHdE/tZ7cnarvkX09yT2lNnv5wA=;
	b=vbFQVDqkJVxawmy1S/MYVVbWXCeUKA8vvhmsStv8EUU2JmgZSfDhYEQivExUZzBrVj4c
	 TD3kB04BVRFvSBiuqieIx7T0XotI5bhNGdyANvWZQ+Fe06Fyhkr+NgW0LYgBMQXsAr/BQ
	 hVjmuZf+W+Sx+R5q41hlDBy5WeU3bTcGyPGzk6mMAmS9QGBHh+ZnQZGmWtwkydlZzzypu
	 7K/jUBbYNHx031PrvlJWK074PGApkw59asb/ap++efixJ8Up6TYyBBv9gyJJp+ncJ7qI3
	 0PL5lMwZW0ZHiGY6cUnvtQeRuNScL1x56/C2oDhHR35pFdXimuTuLAVr0jsgS+j37WQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJDQudij;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65E54606A32A
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bJDQudij
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 557451F00A06;
	Thu, 12 Nov 2026 11:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794484645;
	bh=Hm8XLf8raqGW2MMzUHdE/tZ7cnarvkX09yT2lNnv5wA=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=bJDQudijQz/zhseTBaZJMN9PULZ9+IkHhKgufMFPxie6zeaCpvVvp5t4Cq5G1mnJe
	 n/Zp9oSxMlTy5ngZA/Fwi6MTUBuRtBEAI5qD0wQDs4G9tHlGeMvbUnYXjgrxRRGqOf
	 LG+1En2XfX7sAdXXF2QKbHRD9eEJA+Z1DKROQu1072xvN5yApcjqLcVDXIdri4GiV5
	 /7H9ioNlmCThyvNHzuSgv0cwSKGQDA+YjjrMSi0FGMA0Sdf4Z40TOtpmUAeTaMeLgF
	 kV5vxjycsC1N9Uw3NNC+5+Gs8Caq8SpQ6S90CwA8DRbleGsh9tnSRjGClKJakFfHzM
	 U/YuA6VE/W7jg==
Message-ID: <sashiko-outbox-211057@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, arnd@arndb.de, linusw@kernel.org, enelsonmoore@gmail.com, aaro.koskinen@iki.fi, pengpeng@iscas.ac.cn, mathieu.dubois-briand@bootlin.com, gregkh@linuxfoundation.org, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <d0cc3945cf8ef204d920efbe776828477bfde469.1794391660.git.manikandan.m@microchip.com>
References: <cover.1794391660.git.manikandan.m@microchip.com>
 <d0cc3945cf8ef204d920efbe776828477bfde469.1794391660.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 11:57:24 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [High] mtd: spi-nor: sfdp: fallback to flash of_node when jedec,sfdp
  node is absent
- [Medium] mtd: spi-nor: sfdp: wrong DT node lookup in
  spi_nor_register_sfdp_nvmem()
- [Medium] mtd: spi-nor: sfdp: missing ignore_wp in
  spi_nor_register_sfdp_nvmem()
--

commit d6b1f5d68968819cd02f25dd18526725661f7542
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device

This commit exposes the cached SFDP table of a SPI NOR flash as a read-only
NVMEM device rooted at the flash's "jedec,sfdp" child node.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 90524c58602e1..a034dce7c839e 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

[ ... ]

> +static int spi_nor_register_sfdp_nvmem(struct spi_nor *nor)
> +{
> +	struct device *dev =3D nor->dev;
> +	struct nvmem_config config =3D { };
> +	struct nvmem_device *nvmem;
> +	struct device_node *np;
> +
> +	if (!nor->sfdp)
> +		return 0;
> +
> +	np =3D of_get_compatible_child(dev_of_node(dev), "jedec,sfdp");

[Severity: Medium]
Should this look up the child node under spi_nor_get_flash_node(nor) instead
of dev_of_node(dev)?

In SPI NOR controller drivers such as hisi-sfc and nxp-spifi, nor->dev is t=
he
controller device while the flash node is a child DT node stored via
spi_nor_set_flash_node().  Using dev_of_node(dev) searches the controller's
DT node and misses the flash's "jedec,sfdp" child node.

> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;

[Severity: High]
When the flash DT node has no "jedec,sfdp" child node, np is NULL, but
spi_nor_register_sfdp_nvmem() still registers the NVMEM device with
config.of_node =3D NULL and config.dev =3D dev.  In nvmem_register(), a NULL
config->of_node falls back to config->dev->of_node:

drivers/nvmem/core.c:nvmem_register() {
    ...
	if (config->of_node)
		nvmem->dev.of_node =3D of_node_get(config->of_node);
	else
		nvmem->dev.of_node =3D of_node_get(config->dev->of_node);
    ...
}

Because spi_nor_register_sfdp_nvmem() runs during spi_nor_scan() before
mtd_device_parse_register() registers the main MTD and OTP NVMEM devices, d=
oes
this bind the SFDP NVMEM device to the parent flash DT node first?

On any SPI NOR flash with SFDP whose DT node has no "jedec,sfdp" subnode, t=
he
SFDP NVMEM device claims any nvmem-layout on the flash node (setting
OF_POPULATED_BUS so mtd_nvmem_add() skips it) and shadows the flash MTD and
OTP NVMEM providers in of_nvmem_cell_get() and of_nvmem_device_get(), causi=
ng
cell lookups on the flash node to fail or return SFDP bytes instead of flash
data.

If registering without a "jedec,sfdp" subnode is intended, setting
config.no_of_node =3D !np prevents nvmem_register() from falling back to
dev->of_node.

> +	config.name =3D "sfdp";
> +	config.id =3D NVMEM_DEVID_AUTO;
> +	config.owner =3D THIS_MODULE;
> +	config.read_only =3D true;
> +	config.word_size =3D 1;
> +	config.stride =3D 1;
> +	config.size =3D (int)(nor->sfdp->num_dwords * sizeof(*nor->sfdp->dwords=
));
> +	config.reg_read =3D spi_nor_sfdp_reg_read;
> +	config.priv =3D nor;

[Severity: Medium]
Does config also need ignore_wp =3D true, like mtd_nvmem_add() and
mtd_otp_nvmem_register()?

When config.ignore_wp is false, nvmem_register() calls
gpiod_get_optional(config->dev, "wp", GPIOD_OUT_HIGH) even for read-only
providers.  Since the SFDP provider only reads from the cached
nor->sfdp->dwords buffer, leaving ignore_wp unset claims any wp-gpios
property on nor->dev and drives the write-protect line high, or fails probe
with -EBUSY if the GPIO is already claimed.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794391660.gi=
t.manikandan.m@microchip.com?part=3D4
