Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A53472530
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 06:42:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792046528; cv=none; b=dL2aDDjmB2xJdZeP0/ltDwL4U7sPVtTBsM9MiYNi3eCjC2AocW70389yPTZnwEp9Z4+mnHECYXArBt6qoWC6elUnaX7u7nsNMQcZt2Uhbbk+i8mDIsGfmtLInrj5HP2FakLGeSm0IARzNXXLWneR6W9hNz8rDzxwLavYT/hIMYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792046528; c=relaxed/simple;
	bh=iu80kc94r3HRhaCZWdpz694X+k2mZ0lP4O1x35Oq/ms=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=YlLRvO3pDC0xVnYq92C8wXlFYOoPQfoqLdY0I4acWvP01cmPY8sanDiVFeff1+cRcKPN5w9WR56khfhBA1NVq5oAS8mHnjOxBhDMt0J1X1g4heA1NDaQ9Momhskd740VW54AaqGNt/GAFoFeSW0mXVnXQj7++40/hTOVdCpeihU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FAG7ZYXj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FAG7ZYXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F091F000C6;
	Thu, 15 Oct 2026 06:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792046527;
	bh=NYEVBgKDeROqh63PQl2UHyalIjAhl2tEcV/5iKRL+7A=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=FAG7ZYXjxXbQgl9l5+4v+xY6PMTwRy98dWWJtwHo2iimcIyxeZtWutx/EwDpGrfAm
	 wy/Ra52Wl81q3Q2fb2/BgHKeMj4qtVClRruSiZxGRw+oM8CxBy4DO/qYy5gDMEjH0c
	 xNbAqM2h+uCGFc00o4Hu3cqjv6tcRausfY6vYNJ3tWKuI/0nW4mOWfo1Wd3acZKqCI
	 iFHZQucshVJQjCWfKUJHZRgxJWismTzkDxOuZPbBfoLsuRMCFRTK96Y5PjMtd40Lim
	 2tBWjbHglqSCmibsEeJQzlp8eRWHfbAr8ibcW0VXn2UpH0VQuSTicV4OVUhhWCIoun
	 +pKpw7mLSyjWQ==
Message-ID: <sashiko-outbox-172353@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v8 5/8] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>, pratyush@kernel.org, mwalle@kernel.org, takahiro.kuwano@infineon.com, miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, srini@kernel.org, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev, linux@armlinux.org.uk, richardcochran@gmail.com, linusw@kernel.org, arnd@arndb.de, aaro.koskinen@iki.fi, gregkh@linuxfoundation.org, mathieu.dubois-briand@bootlin.com, michael@walle.cc, linux-mtd@lists.infradead.org, devicetree@vger.kernel.org
In-Reply-To: <89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
References: <cover.1790847519.git.manikandan.m@microchip.com>
 <89aa4ac1eee01e3c425c12367f1e036354787ce8.1790847519.git.manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 06:42:05 +0000
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] nvmem: use-after-free on layout driver module unload
--

commit 4e7e82e84f19ca0cc7f7eae9477c171b2bdab685
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

nvmem: layouts: add Microchip/SST SFDP EUI layout driver

This commit adds an NVMEM layout that exposes the factory-programmed
EUI-48 identifier from the Microchip/SST vendor SFDP parameter table
as a "mac-address" cell.

> diff --git a/drivers/nvmem/layouts/sst26vf-sfdp-eui.c b/drivers/nvmem/lay=
outs/sst26vf-sfdp-eui.c
> new file mode 100644
> index 0000000000000..641318d6f0af6
> --- /dev/null
> +++ b/drivers/nvmem/layouts/sst26vf-sfdp-eui.c

[ ... ]

> +	info.name =3D "mac-address";
> +	info.offset =3D base + SFDP_MCHP_EUI48_OFFSET;
> +	info.bytes =3D ETH_ALEN;
> +	info.np =3D of_get_child_by_name(layout_np, "mac-address");
> +	info.read_post_process =3D sfdp_eui_read_post_process;
> +
> +	ret =3D nvmem_add_one_cell(nvmem, &info);

[ ... ]

> +static void sfdp_eui_remove(struct nvmem_layout *layout)
> +{
> +	nvmem_layout_unregister(layout);
> +}

[Severity: High]
Does this leave a dangling pointer if the layout module is unloaded?

In sfdp_eui_add_cells(), the driver registers sfdp_eui_read_post_process() =
as
a callback via nvmem_add_one_cell(). However, the NVMEM core tracks the
provider device's module, not the layout driver module.=20

Furthermore, nvmem_layout_unregister() is an empty stub in the NVMEM core.
Because the core API does not remove the cells, the cell remains in the
NVMEM device's cell list with a dangling read_post_process function pointer.

If the layout module is unloaded and the cell is subsequently read (e.g.,
via sysfs), could this execute unmapped module memory and cause a use-after=
-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790847519.gi=
t.manikandan.m@microchip.com?part=3D5
