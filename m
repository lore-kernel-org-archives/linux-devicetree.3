Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2495C348453
	for <devicetree@vger.kernel.org>; Thu, 23 Jul 2026 09:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784800393; cv=none; b=VjcZhcGaTpsXIBkELNQRP2jihUd2VembX52y74D0XFusLmi7uPF7ZQqIRO4Yrw/IYpxxVgcK4ws5329fx3iU0nfAp1OfMHlzOgHRGC90xeFfH+4IOKfNV7/gUxAHIcCvj9Py0SY/6YifCF6tMSg+QFghAJirTIyuZpVGUqAo0HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784800393; c=relaxed/simple;
	bh=+xbgRbvfKHEtaQ6s2UOTt3oy67WdC/UhiZaz1VTCmmg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=plfPj0ezwpWABrkhwgPEqzpoaJekUjq+W8g6E1xRnWnJNt03gqo60KS6CzxI/uDEWq3n2oRfAvIqaaapJNxHm/zfZKk8f6Ugz4kFdyqQlYcOHW36LwgPQMAIRzglntWLqkRRF1jaIIh0u3dqozoOWXgvZLoj7ut9bLtnNYYYkf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=obE3qLIo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="obE3qLIo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6690C1F000E9;
	Thu, 23 Jul 2026 09:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784800391;
	bh=MtQwqZN5vmSbzHB+Dgygxxq1kxcqpIOLme0Y8Psie/s=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=obE3qLIoPK1pkGhBnr4IOvCB4NvkhU/eLFDN6/vn0TmKuY4+psmjWrgLQjE4/ZYBQ
	 ujEq8NKtYV9xhkEvJAR4yerFuyPbl3016Q8bfwbMIktFaF3BMMZbheT2faGnUnzIMW
	 nog4vs3yGSj/TYGT7af3sRIuexvjYkM1vUdQJg3RHCND6kmfhgOXg0BgsJVvaLwLc2
	 v7+8niMj0+8ffd6xsxFpR5fl72xsDr5t/lFjm2XjF0U3886bXbSd8WUOakmswkhgHf
	 bEgXQNXyu+4hpfPvEuhVpzCg/clPdNBwU3IXFLGWnLMLqN/ZqimgtpNYn1fKPz33qt
	 phNM+BggEfHFg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/4] regulator: dt-bindings: Add fan53555 allowed
 modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260723094001.120264-2-victor.krawiec@arturia.com>
References: <20260723094001.120264-1-victor.krawiec@arturia.com>
 <20260723094001.120264-2-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 09:53:09 +0000
Message-Id: <20260723095311.6690C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The device tree binding introduces the `regulator-initial-mode` =
property, but the corresponding driver lacks the `.of_map_mode` callback re=
quired to use it.
- [Low] The patch defines constraints for `regulator-initial-mode` but fail=
s to define constraints for `regulator-allowed-modes`.

Pre-existing issues:
- [High] A preexisting bug in `fan53555_set_mode()` corrupts the voltage re=
gister when setting `REGULATOR_MODE_NORMAL` on certain vendor variants like=
 RK8602.
--

--- Patch [1]: [PATCH v3 1/4] regulator: dt-bindings: Add fan53555 allowed =
modes ---
commit 23beca6378b28eed5bc10d3625b311119ecc5eb7
Author: Victor Krawiec <victor.krawiec@arturia.com>

regulator: dt-bindings: Add fan53555 allowed modes

This commit adds device tree binding constants and schema properties to
specify the initial operation mode (Auto-PFM or Forced PWM) for the
FAN53555 PMIC regulator.

> diff --git a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yam=
l b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
> index 69bae90fc4b28..9a18891f721e6 100644
> --- a/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
> +++ b/Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml
> @@ -48,6 +48,12 @@ properties:
>        VSEL0 register. When this pin is HIGH, VOUT is set by the VSEL1 re=
gister.
>      maxItems: 1
> =20
> +  regulator-initial-mode:
> +    enum:
> +      [ 1, 2 ]
> +    description:
> +      Defined in include/dt-bindings/regulator/fcs,fan53555-regulator.h
> +

[Severity: Low]
The commit message mentions adding allowed modes, but the schema only defin=
es
constraints for regulator-initial-mode. Does this leave
regulator-allowed-modes unconstrained, allowing device trees to pass
dt_binding_check even if they specify invalid integers like
regulator-allowed-modes =3D <99>?

[Severity: Medium]
Will the regulator core actually apply this initial mode?

The fan53555 driver currently lacks the .of_map_mode callback:

drivers/regulator/fan53555.c:fan53555_regulator_register() {
    ...
    rdesc->vsel_mask =3D BIT(fls(di->vsel_count - 1)) - 1;
    rdesc->owner =3D THIS_MODULE;

    rdev =3D devm_regulator_register(di->dev, &di->desc, config);
    ...
}

Without an .of_map_mode implementation to translate the DT integer into a
standard REGULATOR_MODE_* constant, won't the regulator core ignore this
property completely and fail to set the mode?

[ ... ]

> diff --git a/include/dt-bindings/regulator/fcs,fan53555-regulator.h b/inc=
lude/dt-bindings/regulator/fcs,fan53555-regulator.h
> new file mode 100644
> index 0000000000000..ce3d6c63a0f1f
> --- /dev/null
> +++ b/include/dt-bindings/regulator/fcs,fan53555-regulator.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Arturia - All rights reserved.
> + *
> + * Device Tree binding constants for the FAN53555 PMIC regulator
> + */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_FAN53555_H
> +#define _DT_BINDINGS_REGULATOR_FAN53555_H
> +
> +/*
> + * Constants to specify regulator modes in device tree for SYR82X regula=
tors
> + * FAN53555_REGULATOR_MODE_FORCE_PWM:	Force fixed PWM mode
> + * FAN53555_REGULATOR_MODE_AUTO:	Allow auto-PFM mode during light load
> + */
> +
> +#define FAN53555_REGULATOR_MODE_FORCE_PWM	1
> +#define FAN53555_REGULATOR_MODE_AUTO		2

[Severity: High]
This is a pre-existing issue, but I noticed a potential hardware register
corruption in the driver when setting modes.

In the fan53555 driver, when setting REGULATOR_MODE_NORMAL, does the code
mistakenly clear the mode mask from the voltage register instead of the mode
register?

drivers/regulator/fan53555.c:fan53555_set_mode() {
    ...
    case REGULATOR_MODE_NORMAL:
        regmap_update_bits(rdev->regmap, di->vol_reg, di->mode_mask, 0);
        break;
    ...
}

For variants like the RK8602 where mode_reg and vol_reg are distinct
hardware registers, clearing di->mode_mask (e.g. BIT(6)) in di->vol_reg
could silently drop the output voltage by 64 steps (400mV). Could this lead
to severe undervolting and system crashes if a consumer attempts to change
the mode?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723094001.1202=
64-1-victor.krawiec@arturia.com?part=3D1
