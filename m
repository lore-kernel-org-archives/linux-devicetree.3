Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5865443D51E
	for <devicetree@vger.kernel.org>; Wed, 16 Sep 2026 07:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789543059; cv=none; b=JPGaqBOJAicnkDbRo6jBWFp4RKRZ+VFeEWASGu80/d/fohMYmRdHkwbwb7iddI/+UOcB80zOOfEFhHhR+Skg1SjgETGzmTu4x24VCmOlyef+BOfg1iG4wZ4EuwNCoYgedRJ1MaPSxZu7V7c5DWKyB1/JCM9TkYtGVqop3BGeB/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789543059; c=relaxed/simple;
	bh=NmfTorG6JVpIJFzytaD6ZeQ9avNSPqXZwe308hn+vMs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NeHvIHSefINEidN4g2Vgti/hrweAMEPFrG/DU6AHMPEsc+zaTSSlkZiYNYbi3T2jXYwIJguL+up+Vg9FkJohlABNV3S0TPF7fqMrKxAPFz52uqXQMnwu2ZUtUvqEQRQ+Dj6LB9uHn5giyzsguPEWzyex+nIPrsQH/YjtsKVDTIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k7/Mm7dV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k7/Mm7dV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DE1E1F00893;
	Wed, 16 Sep 2026 07:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789543055;
	bh=hca6qlN0xG1kIjyBog37y2qFhd0a9XvurL53zkwuwi0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k7/Mm7dVt5zYYTPipOh999z1bV3kgJyZyr7dUj7JJY59Sw/QekkosBvVH2CICd5FW
	 NMBdpl6ws26ombciDhWU02rTrMEEGV8q+dK6SYvBTcVoHZEZXRswQm+MgqfCzJUoQF
	 xmL242H7I+KCzAZvgav6AyczM+NtOMtsvAGNX2ahIDki3RdZMu4ckayiAbIXklYmIV
	 XSlgYXFwOOItL/lJ9PiPQr0cijh3MqLEqhRNluOFnZP8h04NS8S6micmgYDoxRCQCY
	 WL0Uq6kLlJyZGZxvG/xigZjGAj5FkPE+10OWKZxZ7dLD++MS9Lw0XHtRltUXOkNOV8
	 2DOGl1vp9rRPQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v19 5/8] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: linux-i3c@lists.infradead.org, Frank.Li@kernel.org, "Alexandre Belloni" <alexandre.belloni@bootlin.com>, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260916070728.1088801-6-lakshay.piplani@nxp.com>
References: <20260916070728.1088801-1-lakshay.piplani@nxp.com>
 <20260916070728.1088801-6-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 16 Sep 2026 07:17:34 +0000
Message-Id: <20260916071734.8DE1E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] regulator: p3h2x4x: unused fields and dead code in driver data
- [Low] mfd: driver-specific header placed in global include/linux/mfd/ dir=
ectory
--

commit 24a75a3dc0fb9f5c1adccf0bcd6a9d774397dc1c
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

    regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c=
 hub

This commit adds a regulator driver for the on-die voltage regulators
integrated in the NXP P3H2x4x i3c hub family. It registers the regulators
via the MFD framework and standard regulator APIs.

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..244f2a4f70f38
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
> @@ -0,0 +1,289 @@
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
           ^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: Low]
Is this driver-specific header used only by the parent and its immediate
children?

The MFD subsystem guidelines state that driver-specific header files should=
 not
be placed in the global include/linux/mfd/ directory if they are only used
by the parent and its immediate children. Could this header be kept local to
drivers/mfd/ instead?

[ ... ]

> +#define P3H2X4X_VCCIO_LDO_CONF					0x16
> +#define P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK			GENMASK(1, 0)
> +#define P3H2X4X_CP0_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2X4X_CP0_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK			GENMASK(3, 2)
> +#define P3H2X4X_CP1_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2X4X_CP1_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK			GENMASK(5, 4)
> +#define P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2X4X_TP0145_VCCIO_LDO_VOLTAGE_MASK, x)
> +#define P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK			GENMASK(7, 6)
> +#define P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE(x)	\
> +		FIELD_PREP(P3H2X4X_TP2367_VCCIO_LDO_VOLTAGE_MASK, x)

[Severity: Low]
Are the P3H2X4X_*_VCCIO_LDO_VOLTAGE() macros used anywhere?

They appear to be defined using FIELD_PREP but never utilized in the driver
code, adding unnecessary complexity.

> +#define P3H2X4X_LDO_COUNT					4
> +#define P3H2X4X_LDO_ENABLE_TIME_US				5000
> +
> +struct p3h2x4x_regulator_dev {
> +	struct regulator_dev *rp3h2x4x_dev[P3H2X4X_LDO_COUNT];
> +	struct p3h2x4x *p3h2x4x;
> +	struct regmap *regmap;
> +};

[Severity: Low]
Are the rp3h2x4x_dev and regmap fields needed in this structure?

During p3h2x4x_regulator_probe(), these fields are populated but they don't=
 seem
to be read anywhere on any subsequent execution path. For example, regmap a=
ccess
uses rdev->regmap directly from the regulator core. Could they be removed to
reduce memory overhead and driver data payload complexity?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260916070728.1088=
801-1-lakshay.piplani@nxp.com?part=3D5
