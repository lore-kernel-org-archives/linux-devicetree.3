Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5893417BDB
	for <devicetree@vger.kernel.org>; Thu, 13 Aug 2026 10:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786618337; cv=none; b=umz+Trfyl8itMx/9JAHKSbcQqC0NlHSMMSRuzzGSoFXzbzywniQ4QM9z205yjG9VyXIoMTIvrXQNWUOgt0zHhsg8KHsiOZj7GjURb88cRMMWlR96YThqguIwG7rrkJ1MHcLByjc6u8NhcycV84vH8DGY6JSY5sHIbe+l0YDGSwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786618337; c=relaxed/simple;
	bh=1Fgw6AUbW72z1yTKUThoWDQnaOdyLlEjLuEzxBcJ1+c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W7vIXhpRpUFMMA4wr/tmQgEGfLMWH/9u2DqYx70xYDNvygEFOLjj+lJELImcBcmbT+jtWdTu7hbvqYkk81eGNkmeVKuSc5TW7y9k5QadLPcgblQWbzuaFcOWCgQ0ez5fZ7CzN3T4VrnS7h8b9r639szXwTDQ7DUy96Pv2surIM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hYD21E2+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hYD21E2+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBE771F00A3A;
	Thu, 13 Aug 2026 10:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786618320;
	bh=2MbeAoKUBquMKOJuu0bDeTTq68UCJcB9ZaSgifTA9uo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hYD21E2+ZEVPBg9q+N8sd3jDcuPuSQJ/AdkbOY9nAxUkpXDkRd3x05rhSbvYctQXU
	 quDj28FA/YYiQRSSmd8UNPXjrUYLZerKyICUYR/L8+sYkh1p/hmQy/Ll3WYHdz7GhZ
	 In11u+1Kfz9h2lO8gNExBfXVOvq894WWYY0HPaiMZQXt/lxrOryNX4Krj6h3gAxeFv
	 IsceiQYQ4dExzfoTH0XGRq2h79T5u9P+iwNq7vqOEyAZlg3lI0Ur6nGCn/r7PiGvjH
	 gYtQdbXEitqSjkvkDibEbdLF7TDBHVv1u3buwaWwtghO7JethKtU9r0hQH53L2dD5b
	 j/FdXOJT60AYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 4/7] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: "Richard Weinberger" <richard@nod.at>, "Pratyush Yadav" <pratyush@kernel.org>, robh@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, conor+dt@kernel.org, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>
In-Reply-To: <20260812104955.485667-5-manikandan.m@microchip.com>
References: <20260812104955.485667-1-manikandan.m@microchip.com>
 <20260812104955.485667-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 10:51:59 +0000
Message-Id: <20260813105159.DBE771F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Unloading the `microchip-sst26vf-sfdp-eui` module leaves a danglin=
g `read_post_process` function pointer in the NVMEM core, leading to a kern=
el panic when the cell is subsequently read.
--

--- Patch [4]: [PATCH v7 4/7] nvmem: layouts: add Microchip/SST SFDP EUI la=
yout driver ---
commit ede7813294e82294452049f0c0c040524f47bb8e
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

nvmem: layouts: add Microchip/SST SFDP EUI layout driver

This commit adds an NVMEM layout driver for Microchip/SST SFDP flashes.
It locates the vendor-specific parameter table at runtime and exposes the
EUI-48 identifier as an NVMEM cell to be used as a MAC address.

> diff --git a/drivers/nvmem/layouts/sst26vf-sfdp-eui.c b/drivers/nvmem/lay=
outs/sst26vf-sfdp-eui.c
> new file mode 100644
> index 0000000000000..641318d6f0af6
> --- /dev/null
> +++ b/drivers/nvmem/layouts/sst26vf-sfdp-eui.c
[ ... ]
> +static int sfdp_eui_add_cells(struct nvmem_layout *layout)
> +{
[ ... ]
> +	info.name =3D "mac-address";
> +	info.offset =3D base + SFDP_MCHP_EUI48_OFFSET;
> +	info.bytes =3D ETH_ALEN;
> +	info.np =3D of_get_child_by_name(layout_np, "mac-address");
> +	info.read_post_process =3D sfdp_eui_read_post_process;
> +
> +	ret =3D nvmem_add_one_cell(nvmem, &info);

[Severity: High]
Does registering this read_post_process callback create a dangling pointer
when the module is unloaded?

[ ... ]
> +static void sfdp_eui_remove(struct nvmem_layout *layout)
> +{
> +	nvmem_layout_unregister(layout);
> +}

[Severity: High]
Can unloading this module lead to a kernel panic?

Because nvmem_layout_unregister() is an empty stub in the NVMEM core, the
cells added by this layout are never removed.

If the module is unloaded, the sysfs entry for the cell remains active.
A subsequent read of the sysfs file will invoke the read_post_process
callback, which now points to freed module memory, causing a panic.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812104955.4856=
67-1-manikandan.m@microchip.com?part=3D4
