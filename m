Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416241DF748
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 05:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784698276; cv=none; b=BsT1ge8OOiyEflBWFRX+YGX2e6VXHevmMpmxO5gHwAjTiYUfpNN1/rIHhaHRdYJRCpcL3JYhdOEZAOHE7Yb44t/S0mKGBjcyIcU41Jeuh36L2Ij3NnR9mQyzRl9Zj+jPLbVoOW8Dv1xaDVhhsDwZZl6Uc60SHnHgVyyg5R7w8YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784698276; c=relaxed/simple;
	bh=/6WsLzfHDLnnmRpY30kPdwytvejx2tDB6d3k6dCU2OY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jeslnU4iy1hG+iPTq0zjkg47hZuIBfz++cUL1U7kQCqc28Aw8HbmWxAD9IPxxSvnCSWuq6MpvOna9DDks1CHVXZYxjyEV+vJIjpuxUSSMaF3+eXslUzrqRd5vsfS6iWlPKaTwAvR0afzI6nc0/UzyyAFh9QRO19zVit6AuXyv64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vqzi1Z8p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vqzi1Z8p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E63C1F000E9;
	Wed, 22 Jul 2026 05:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784698274;
	bh=0wicR5VB7AZDab1IGKZEwjEA94pdrgB8OujMzqEYvts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vqzi1Z8pZuDtnlhyQ1cmMBpPy1tYJf4KDcqi2+Vd0fPPaQNMzxhY+Hql1KFRe4UtE
	 wQTSM7kZylgg5uI0p/ZdzG32jmvG9l0PXll/4eNw62JGT24sKMOT7kJxzhLNatKKBu
	 DZDUXSD3REtq5WaKMOg/UIUV7umg5Rk1Zsh1jGul1PBTeKEtg4nDGiX/JPV4Pibv8E
	 duN24djjAK92xQbfW9jaEaNMX2K3bCxwvh2qbDgIiBEFG1l4AsgqrR4AjWD1j9BhXU
	 v8/LWAjQuPfqB+r9025vv4Bdm6uitQ0EeBLYVHYxYOI7AkNbLJj1PqWCl1kpC0dYYc
	 LqBFvDJyCt5FQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/7] nvmem: layouts: add Microchip/SST SFDP EUI
 layout driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manikandan Muralidharan" <manikandan.m@microchip.com>
Cc: robh@kernel.org, "Richard Weinberger" <richard@nod.at>, conor+dt@kernel.org, "Michael
 Walle" <mwalle@kernel.org>, devicetree@vger.kernel.org, "Vignesh
 Raghavendra" <vigneshr@ti.com>, "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush
 Yadav" <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>
In-Reply-To: <20260721052859.171341-5-manikandan.m@microchip.com>
References: <20260721052859.171341-1-manikandan.m@microchip.com>
 <20260721052859.171341-5-manikandan.m@microchip.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 05:31:13 +0000
Message-Id: <20260722053114.5E63C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unloading the `sst26vf-sfdp-eui` layout module leaves NVMEM cells =
registered with a dangling `.read_post_process` function pointer, leading t=
o a kernel panic when the cell is subsequently read.
--

--- Patch [4]: [PATCH v5 4/7] nvmem: layouts: add Microchip/SST SFDP EUI la=
yout driver ---
commit 65f89c6962065ffdea19b0eccf22497e1e9a5249
Author: Manikandan Muralidharan <manikandan.m@microchip.com>

nvmem: layouts: add Microchip/SST SFDP EUI layout driver

Add an NVMEM layout that exposes the factory-programmed EUI-48 identifier
from the Microchip/SST vendor SFDP parameter table as a "mac-address" cell.

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

[ ... ]

> +static void sfdp_eui_remove(struct nvmem_layout *layout)
> +{
> +	nvmem_layout_unregister(layout);

[Severity: High]
This isn't a bug introduced by this patch, but since nvmem_layout_unregiste=
r()
is currently an empty stub in the NVMEM core, unloading this module leaves =
the
NVMEM cells registered.

Because the registered cell includes a .read_post_process callback pointing
to sfdp_eui_read_post_process, does a sysfs read of the cell after the modu=
le
is unloaded trigger a use-after-free execution of the unloaded module text?

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721052859.1713=
41-1-manikandan.m@microchip.com?part=3D4
