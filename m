Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF5D2D73A6
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233625; cv=none; b=pHyTfVj4MR9rHF1E4C9m4P1ICX+CTcLSGw0kaQBKnbantzRXPxRnOEOBnTG9MQ/N0XFkgxA3koZgm6k+F/v18JaKv8ig+0BRllGzoE+lasrmKReBkI8/NHoeWE2hAWjlVkZ2psEe39jZFY7l3D1dZ+JvFSZUiyT1MAorrYmBU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233625; c=relaxed/simple;
	bh=n6xy7ZX8imPBwcNi8IL29DLD+W92O4jwkt4NVLUBiFo=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=iLkeeDfsIKNcyF6H/RB5Qo3s2gLNRDOd8YjH5Ung0i/BqRfz6xnm9gVHI9EQTkxPgmHzIlJTQJhhMABF1D7gm16HKRUlUfiFTrzzY97BWDv6Kj0Ni0dhq2RyMXZJzHIu0DyQsoCE+9og5vakhgDNTTE5rtn8C/lw8Zjzjc5g8js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aoOyrWdJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aoOyrWdJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BF261F000C4;
	Sat, 17 Oct 2026 10:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233623;
	bh=318XGSk7k3m8SB3ZUHCIBN+7ZAatLVpr/m6+KQ/qjEQ=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=aoOyrWdJAsPvHE0LuM27iNyt8kc3aYZTsUOvWs3G2SU95XkEsN3A8W8F5SeOI7yrh
	 mdIhGxy66A1wnQmx1av7XwKGvVKZlDQagdF0mIso5KmknCMR9TzgRp1n46qAv2xnbD
	 rufOPAeh0vLHSEgY9p+i729bb+363C7hD1wAYAYBD9Scg0DIOOGGHbGAD8+ak7wLdq
	 u8Xp21DhPvb3PjdhetYEywufuxQxcj0BIOcVjmx2Zx0RrJlVUwiixWF8zim3gGOBX/
	 dXO31J94SBgBkGIHc8tUGr0ZJ42PCBxw8zbuacjMPBZINMp9GkSAfCg6AII71UV5RV
	 /AvRkNrx62Ynw==
Message-ID: <sashiko-outbox-175470@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 4/8] mtd: spi-nor: sfdp: expose the SFDP as a
 read-only NVMEM device
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, pengpeng@iscas.ac.cn, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <889d6d5b7c608fd6553f38e4a34b050dcf70317f.1792145382.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 10:40:21 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] mtd: spi-nor: sfdp: steals parent's nvmem-layout when 'jedec,sfdp'=
 node is missing
--

commit e4111fea7a3c70b0bb1f5cd153a259e4fdb62c93
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

mtd: spi-nor: sfdp: expose the SFDP as a read-only NVMEM device

This commit exposes the cached SFDP table as a read-only NVMEM device,
rooted at the flash's SFDP child node if available. This allows generic
and vendor NVMEM cells to reference SFDP data.

> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index 8bc117b46e028..ed478e48ca116 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c

[ ... ]

> @@ -3001,6 +3002,72 @@ static void spi_nor_init_fixup_flags(struct spi_no=
r *nor)

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
> +
> +	config.dev =3D dev;
> +	config.of_node =3D np;

[Severity: High]
If the jedec,sfdp child node is missing from the device tree, np will
be NULL and assigned to config.of_node. Does this inadvertently trigger the
NVMEM core's fallback behavior?

Looking at nvmem_register() in drivers/nvmem/core.c, there is a fallback
mechanism for missing nodes:

    if (config->of_node)
            nvmem->dev.of_node =3D of_node_get(config->of_node);
    else
            nvmem->dev.of_node =3D of_node_get(config->dev->of_node);

If config.of_node is NULL, the SFDP NVMEM device will incorrectly inherit
the SPI NOR flash's main device node.

The NVMEM core then searches for an nvmem-layout child node and will
find the layout intended for the main flash memory, attaching all NVMEM
cells to the small SFDP NVMEM device and marking the layout node populated.

Later, when the MTD subsystem registers the primary NVMEM device for the
actual flash contents, it will skip the layout node because it is already
marked populated.=20

Could any consumer attempting to read an NVMEM cell then be misdirected=20
to the small SFDP NVMEM device's read callback instead of the main flash,=20
resulting in -EINVAL bounds check errors or corrupted data?

> +	config.name =3D "sfdp";
> +	config.id =3D NVMEM_DEVID_AUTO;
> +	config.owner =3D THIS_MODULE;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792145382.gi=
t.manikandan.m@microchip.com?part=3D4
