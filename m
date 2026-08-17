Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FCD33F44E4
	for <devicetree@vger.kernel.org>; Mon, 17 Aug 2026 10:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786963921; cv=none; b=uy+x0hKYKZNbYSsY3BCD60uwtnIjIDQb+9awEnKvqZGejZSxQbX/vLSDtTuReHxC7+4zoei6zSG3CSlpV6N98rbqafXb0RP7Xb5NobaWm2x4HwtxHnUkIOWU0ASiOQGn2Fkio+w5hOdTMFtgWXAsn9hqj+NjcT3UYLJs2nH8Wrk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786963921; c=relaxed/simple;
	bh=m3Qhzdq1zDNu3kVp9g7TEbwdfG3+C4EWAbD3R+2b1Lk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ceQBO6Dmi5QhpSFeow4s1rE4PKSHDYuvrKGIPyuiwHQ1/DFTqp2hPmxso/uXNjOfkTIlPIrtkNhW/t0KzU//MUmvyEF/No2FpVcqV1TqKHgWntgJ7LiLSJIYr/r/5Pl/znzZ5MZFYcjJKsyW145FM7VIIZqM6PCFIhIHKhQIqxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jDBMFoqb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jDBMFoqb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 694101F000E9;
	Mon, 17 Aug 2026 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786963917;
	bh=cwTZWVep+3N+gGDg3SnldGUgkZb3fUelXvWMx/uE0z0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jDBMFoqb/eaV2Z6ayEkz7YR1r6bN/C6+m4xOvK7xIb1GZsuISvLdmFq34+FHf4Xd+
	 vpBIsdFBE8bHX0EwE/07KAaUN611IjjIqcFgK/PZLImH5cvJnyGZqLwgjov6+iLRI1
	 m5JzlTEhNtAZKEj4px0AnEnYMolQQddnylPJH72+x+gsXl4uV437SXQe3EB19jf68Q
	 xsJ2zYdERM03Odh1Bcq54XJ8UJ81nU+P/RiZrdOLkjpPQB4iYDNNjf3+KVSF4cfoYo
	 TeXxU1Or/NhOhi7g1w5GpG4+XMFDt0hAJBQFRWTb8VSFZaSYxHSZDUHC5F9H9LD1Cv
	 UwVGAvfznm/ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v15 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, linux-i3c@lists.infradead.org, "Alexandre
 Belloni" <alexandre.belloni@bootlin.com>, Frank.Li@kernel.org
In-Reply-To: <20260817103844.2142802-6-lakshay.piplani@nxp.com>
References: <20260817103844.2142802-1-lakshay.piplani@nxp.com>
 <20260817103844.2142802-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 10:51:57 +0000
Message-Id: <20260817105157.694101F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] MFD subsystem guide violation: driver-specific header in global =
include directory and use of bespoke parent context structure.
- [Low] The `p3h2x4x_regulators` array of regulator descriptors is not mark=
ed `const`.
--

--- Patch [5]: [PATCH v15 5/8] regulator: p3h2x4x: Add driver for on-die re=
gulators in NXP P3H2x4x i3c hub ---
commit 6bd5ced43bd70804c772227fde0c55395341c77d
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

This patch introduces a new regulator driver for the NXP P3H2x4x I3C hub. It
registers the LDOs using the MFD framework and exposes them via the regulat=
or
subsystem.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..645d46ad7c2f2
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> @@ -0,0 +1,284 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2025-2026 NXP
> + * NXP P3H2X4X regulator driver file contain functions for enable/disabl=
e regulator
> + * and voltage set/get.
> + */
> +#include <linux/bitfield.h>
> +#include <linux/cleanup.h>
> +#include <linux/mfd/p3h2840.h>

[Severity: Medium]
Should this header be kept local to drivers/mfd/ instead of placing it in t=
he
global include/linux/mfd/ directory? The MFD subsystem guidelines recommend
against placing driver-specific header files in the global include directory
if they are only used by the parent and its immediate children.

> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/driver.h>

[ ... ]

> +static const unsigned int p3h2x4x_voltage_table[] =3D {
> +	1000000,
> +	1100000,
> +	1200000,
> +	1800000,
> +};
> +
> +static struct regulator_desc p3h2x4x_regulators[] =3D {

[Severity: Low]
Could this array be marked const? Because devm_regulator_register() accepts=
 a
const struct regulator_desc pointer, making this array const would move it =
to
the read-only .rodata section.

> +	{
> +		.name =3D "ldo-cp0",
> +		.of_match =3D of_match_ptr("ldo-cp0"),
> +		.regulators_node =3D of_match_ptr("regulators"),

[ ... ]

> +	{
> +		.name =3D "ldo-tpg1",
> +		.of_match =3D of_match_ptr("ldo-tpg1"),
> +		.regulators_node =3D of_match_ptr("regulators"),
> +		.volt_table =3D p3h2x4x_voltage_table,
> +		.n_voltages =3D ARRAY_SIZE(p3h2x4x_voltage_table),
> +		.ops =3D &p3h2x4x_ldo_ops,
> +		.type =3D REGULATOR_VOLTAGE,
> +		.owner =3D THIS_MODULE,
> +		.enable_reg =3D P3H2X4X_LDO_AND_PULLUP_CONF,
> +		.enable_mask =3D P3H2X4X_TP2367_EN_LDO,
> +		.vsel_reg =3D P3H2X4X_VCCIO_LDO_CONF,
> +		.vsel_mask =3D P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK,
> +	},
> +};
> +
> +static int p3h2x4x_regulator_probe(struct platform_device *pdev)
> +{
> +	struct p3h2x4x *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);

[Severity: Medium]
Is it possible to use standard APIs to access the required state rather than
exposing the bespoke parent struct p3h2x4x to the child drivers?=20

The MFD subsystem guidelines discourage exposing bespoke parent structures =
for
parent-child data sharing to maintain proper layering.

> +	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
> +	struct regulator_config rcfg =3D { };
> +	struct device *dev =3D &pdev->dev;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817103844.2142=
802-1-lakshay.piplani@nxp.com?part=3D5
