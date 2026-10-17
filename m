Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5F72D73A6
	for <devicetree@vger.kernel.org>; Sat, 17 Oct 2026 10:40:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792233626; cv=none; b=NWI/CMiDpTCEYWp8k9wb7vWVnNdm7miOXKN7K+zH572MowZ63PyZeWputzUhGGn0v9kwrO6eQEAl5yYh7+7MkNpiFcGGpwqqqXT758OukEjGdLrE8oSypWi1cqRHe3Jq2E4fPYLH+EQtBuM0UHMjxBPMnYAgUNcY3hnbabHgPlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792233626; c=relaxed/simple;
	bh=OSrV3KJXqxV7s6ViyML6Sdh/IBNAzMg51UXCX9e9tTA=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=Ug2zldrFhpsjPkMTiU+jATivTCCl4SDIHZifjFAMDtFA4SRrK9GHQ6MBOcJawzNs6wS/BG6CobBl8/b2+dqRQD90/RMQOqUUDGAtAnQByh6xLsw9jnDfyG2fma6zeKFHjHGsC5FETubjE41iwKQDGiw0Oh1fZqI9ERxHR1WdfN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZntMhMgZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZntMhMgZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103531F000C5;
	Sat, 17 Oct 2026 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792233625;
	bh=syagm1z6iqEfYWovBTYwlVHaRWTMRBf7hz7aJ9XN2Rc=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=ZntMhMgZ/v5lwK5VyQVIPRw6T+3cReC0/PhY5YmbPeiKVGzWmySFONwV4XXaokDkZ
	 mVH31JjAGSsaFM2GDYBVpPhDydIYAha/NbxlWAFcEKLY8Zny8Pp7/GW+UugTmaIe+7
	 O2mlwF+n0csLwbBLw5z8RoBe0H6R++/hF7FVxmCelS5cSZ+TkjrjEREo8Cyd/jyV29
	 D7RmmNk1UNARN/RDEZI/Ymu7SEkUS3gHfh5LDR45lxaKD4pul12Emul03NrVybjEzz
	 R1FFPNnHeKBPqPBBBwy3h1l72yL+J48fHVNVeMLXAJpWQXVwicryKQfIKTw3lu28ah
	 7abVs3aK/cMWw==
Message-ID: <sashiko-outbox-175471@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v9 5/8] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, pengpeng@iscas.ac.cn, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <9d578cf2d4ded92eb0b78a5e131e86fa19022b34.1792145382.git.manikandan.m@microchip.com>
References: <cover.1792145382.git.manikandan.m@microchip.com>
 <9d578cf2d4ded92eb0b78a5e131e86fa19022b34.1792145382.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 17 Oct 2026 10:40:23 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] nvmem: Use-after-free on layout module unload via read_post_process
--

commit 38845f9d622725238fc32b8e1eac3c9b7dc8b3b7
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

nvmem: layouts: add Microchip/SST SFDP EUI layout driver

Add an NVMEM layout that exposes the factory-programmed EUI-48 identifier
from the Microchip/SST vendor SFDP parameter table (e.g. SST26VF064BEUI)
as a "mac-address" cell, for use as a network MAC address.

> diff --git a/drivers/nvmem/layouts/sst26vf-sfdp-eui.c b/drivers/nvmem/lay=
outs/sst26vf-sfdp-eui.c
> new file mode 100644
> index 0000000000000..f46a6d9d0e93a
> --- /dev/null
> +++ b/drivers/nvmem/layouts/sst26vf-sfdp-eui.c
[ ... ]
> +static int sfdp_eui_add_cells(struct nvmem_layout *layout)
> +{
> +	struct nvmem_device *nvmem =3D layout->nvmem;
[ ... ]
> +	info.name =3D "mac-address";
> +	info.offset =3D base + SFDP_MCHP_EUI48_OFFSET;
> +	info.bytes =3D ETH_ALEN;
> +	info.np =3D of_get_child_by_name(layout_np, "mac-address");
> +	info.read_post_process =3D sfdp_eui_read_post_process;
> +
> +	ret =3D nvmem_add_one_cell(nvmem, &info);
> +	if (ret)
> +		of_node_put(info.np);
> +
> +	of_node_put(layout_np);
> +
> +	return ret;
> +}
[ ... ]
> +static void sfdp_eui_remove(struct nvmem_layout *layout)
> +{
> +	nvmem_layout_unregister(layout);
> +}

[Severity: High]
Does this code leave the module vulnerable to a use-after-free panic on
module unload?

The core nvmem function nvmem_layout_unregister() is an empty stub that does
not remove the registered cells:

drivers/nvmem/core.c:nvmem_layout_unregister() {
	/* Keep the API even with an empty stub in case we need it later */
}

When this layout driver is unloaded, sfdp_eui_remove() calls
nvmem_layout_unregister(layout) but the cells and sysfs attributes are left
dangling.

Because the cell was configured with a read_post_process callback pointing =
to
sfdp_eui_read_post_process in this module's text segment, a subsequent read=
 of
the sysfs cell file after the module is unloaded will call the dangling
function pointer:

drivers/nvmem/core.c:__nvmem_cell_read() {
    ...
		rc =3D cell->read_post_process(cell->priv, id, index,
					     cell->offset, buf, cell->raw_len);
    ...
}

Will this cause a kernel panic by executing freed module memory?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792145382.gi=
t.manikandan.m@microchip.com?part=3D5
