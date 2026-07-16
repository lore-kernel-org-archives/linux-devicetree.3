Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDE83D79E9
	for <devicetree@vger.kernel.org>; Thu, 16 Jul 2026 22:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784240668; cv=none; b=jkxz9aRvpydfzzvPS13xkq6F/1mO3+0m+aLDh/G5j2Dqira+7cFBVYE1OEna0jnQl/yLTXfmO2I5TX3XmBm1u9A8EDWm4khOG+AU+x6vozIP/j2OIAFqQqRWe85VWO5JAEa9FrPaxZMGIVnT3RhhGsNSp/uFviVBPx3jqlCJzH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784240668; c=relaxed/simple;
	bh=VwVP6e+H8wS75xKPVzuhQd3ZCw+q4X3vpL2PH355EDE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=b7OAtF+xI10GC6eAA2ePWwOM8V2m0FkF4Sp/FFY/t6gK+bLpHM1y/V68CALlRa3J+PCkbynO2gzJzsZ6Jyci6kMbcyHyvjr1VmwSYZlN2Y1RLENycqgjMD86nc2XgAs1vBtoom2ymV/sIJ/7II9dV7FbhQ6Fi68EDF+Zf5SHggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0FDocIl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0FDocIl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8101F000E9;
	Thu, 16 Jul 2026 22:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784240666;
	bh=/+NvX2/Fb6xwHEeCJzTwLlDgbG9mrnv9yhPtueJEDmQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=M0FDocIli63vuwRG1TOlABKtZgKDxCoj2aMwEwbXbq81dBWaRLZZbrgyf88smeMTj
	 SO/PgiyheY+r13FxxkBrQXRqno6LepBLcMeoXydyL00rNU/oz/HIH6ApQNoqOOrrQS
	 BiwXi+6k0TOQxKSqe04tJB0BgaLqsBcziGWUJRhcWFvlRHBlew+CZ95XJ8B1PmeSO7
	 UdwaSFlU+QdJgQvYiYibRCVipL6zkU9jR+BWGi/XiJywceIDILat7kRDIuV9CQ9y2o
	 2EN4QVVxO/sBFBi3W9stuSLOGUxWA04yB/rRNVCgl7MX/wvMtIS+0OhTxzdb2jZihV
	 KWgW1YBnhv73A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 05/13] mfd: zx297520v3: Add a clock and reset MFD
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: olteanv@gmail.com, neil.armstrong@linaro.org, devicetree@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, conor+dt@kernel.org, vkoul@kernel.org
In-Reply-To: <20260717-zx29clk-v7-5-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-5-408411cfcf36@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Jul 2026 22:24:25 +0000
Message-Id: <20260716222426.5A8101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Complex platform data structures (`mfd_cell` arrays) are passed di=
rectly through the `.data` field of the `of_device_id` match table.
- [Medium] The MFD core driver is incorrectly located in `drivers/soc/zte/`=
 instead of `drivers/mfd/`.
- [Medium] The driver uses `PLATFORM_DEVID_NONE` instead of `PLATFORM_DEVID=
_AUTO` for subdevice indexing.
--

--- Patch [5]: [PATCH v7 05/13] mfd: zx297520v3: Add a clock and reset MFD =
driver ---
commit 040c43d18f894269b77d87091f84cd5ad6b9755d
Author: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

mfd: zx297520v3: Add a clock and reset MFD driver

This driver registers child devices for the zx297520v3 clock and reset
controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
the next patches will drive the respective functionalities.

> diff --git a/drivers/soc/zte/Makefile b/drivers/soc/zte/Makefile
> new file mode 100644
> index 0000000000000..090ba8aa06c1e
> --- /dev/null
> +++ b/drivers/soc/zte/Makefile
> @@ -0,0 +1,3 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +obj-$(CONFIG_ZTE_ZX297520V3_CRM) +=3D zx297520v3-crm.o

[Severity: Medium]
Since this driver utilizes the devm_mfd_add_devices() API and registers
multiple child devices, should it be located in drivers/mfd/ instead of
drivers/soc/zte/?

The MFD guidelines state that placing MFD core drivers outside of drivers/m=
fd/
violates subsystem layering and bypasses proper subsystem maintainer review.

[ ... ]

> diff --git a/drivers/soc/zte/zx297520v3-crm.c b/drivers/soc/zte/zx297520v=
3-crm.c
> new file mode 100644
> index 0000000000000..8b82ccba4e90d
> --- /dev/null
> +++ b/drivers/soc/zte/zx297520v3-crm.c

[ ... ]

> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	const struct zx297520v3_crm_data *data;
> +
> +	data =3D of_device_get_match_data(&pdev->dev);
> +	if (!data)
> +		return -ENODEV;
> +
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_NONE, data->cell=
s,

[Severity: Medium]
Is it intentional to use PLATFORM_DEVID_NONE here?

The MFD subsystem guidelines prefer using PLATFORM_DEVID_AUTO for subdevice
indexing to avoid sysfs device naming collisions and driver load failures.

> +				    data->num_cells, NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id of_match_zx297520v3_crm[] =3D {
> +	{ .compatible =3D "zte,zx297520v3-topcrm", .data =3D &zx297520v3_topcrm=
_data },

[Severity: High]
Does passing complex platform data structures (like the mfd_cell array insi=
de
zx297520v3_topcrm_data) directly through the .data field of the of_device_id
match table pose a memory safety hazard and lead to initialization ordering
races?

The MFD guidelines suggest storing an integer ID or enum in the match table=
's
.data field, and using a switch statement in zx297520v3_crm_probe() to sele=
ct
the correct static const mfd_cell array.

> +	{ .compatible =3D "zte,zx297520v3-matrixcrm", .data =3D &zx297520v3_mat=
rixcrm_data },
> +	{ .compatible =3D "zte,zx297520v3-lspcrm", .data =3D &zx297520v3_lspcrm=
_data },
> +	{ }
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-zx29clk-v7=
-0-408411cfcf36@gmail.com?part=3D5
