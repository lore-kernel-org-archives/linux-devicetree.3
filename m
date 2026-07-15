Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA08307AC6
	for <devicetree@vger.kernel.org>; Wed, 15 Jul 2026 16:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784131350; cv=none; b=s4vNvDPYCIliMNXfc4T9rwgHC0RAK86hMjgDSVqa6OCLaz19IunFo5c3Tp/fx4nuJ12XCs5aIOyttI/s/Nll9sNjVk3BH655pngfOVeK1bTnT7dnrjGOyxAvk+PQdsJLpb2/X9157dBamgGhDyikq1doCpbT6zQbimGyL/Zj8CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784131350; c=relaxed/simple;
	bh=ZUgbNWiNNeMiosWLP/8ehi5YN4SdFtZKtZBX471D13s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YSSmn7rU4Et+Jki1wjhlHSvOFHhVwX1xDe+Oo5PMYrNPBXP8uc1gtVCjKu2KBrogNiD4ycFsOVJSxmcCntGf+TMwThx6pXnZclhW3Wg7pnpOVqSqk8A+rurqKBdTC9Eo7bm2Vz2RDb9jr/nlSim9SoZ7lV/94uNx74UY9Hcogm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j5NrGUlD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j5NrGUlD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2FB01F000E9;
	Wed, 15 Jul 2026 16:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784131349;
	bh=uXMDOL2uWFWY3kJnX3bp2R7U0PNBSXdoSvHcWTiZZ60=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j5NrGUlDDmIUGodz0BA1iwMAjErc2k+DwSqRwVCRU5BUbtWpVGI0VZY6dEJuEmWIK
	 mGMgR6aG5tKLR1eJ8W7UqSZEeOSdSktR+kPODI06q2RNiCCEVl1Cw4lm6WjNBv78Yl
	 q9SbHyR9wGn/SL0FkqJ+t8QJV67PJ/qQVjdc6DTLyuk48rQDN2bhL0XpiybGVTJe9W
	 K6+XlRymBmI/KtdHtmp1D1INoVz/UA+MsYxEpVzLTnJ4lfqHeP5nMRemkvvpA2JKoW
	 4oNtIZ+ReLsMDYQ8i+vaMKQ4bNiXD84liHbpgTTEa5XDRJoa00CezKWFhQIC5TPiWT
	 6s+60XI84BINw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allowed
 modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260715155141.128601-2-victor.krawiec@arturia.com>
References: <20260715155141.128601-1-victor.krawiec@arturia.com>
 <20260715155141.128601-2-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 16:02:28 +0000
Message-Id: <20260715160228.F2FB01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] Missing of_map_mode callback in fan53555 driver renders DT mode =
constants non-functional.
- [Low] Brand name misspelled in the newly added header file comment.

Pre-existing issues:
- [High] fan53555_set_mode() corrupts the voltage or enable register instea=
d of changing the mode for multiple non-default variants.
--

--- Patch [1]: [PATCH 1/4] regulator: dt-bindings: Add Silergy SYR82X allow=
ed modes ---
commit 17c0df18a13c2c0dbee697655aab8c718df5c959
Author: Victor Krawiec <victor.krawiec@arturia.com>

regulator: dt-bindings: Add Silergy SYR82X allowed modes
   =20
Make the PWM mode configurable from devicetree. Some boards require forced
PWM mode to keep the supply ripple within acceptable limits under light
load conditions.

> diff --git a/include/dt-bindings/regulator/silergy,syr82x.h b/include/dt-=
bindings/regulator/silergy,syr82x.h
> new file mode 100644
> index 0000000000000..6d4aa86bb5c1d
> --- /dev/null
> +++ b/include/dt-bindings/regulator/silergy,syr82x.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Arturia - All rights reserved.
> + *
> + * Device Tree binding constants for the Sylergy SYR827 and SYR828 PMIC =
regulators

[Severity: Low]
This isn't a bug, but there is a typo here ("Sylergy" instead of "Silergy").

> + */
> +
> +#ifndef _DT_BINDINGS_REGULATOR_SYR82X_H
> +#define _DT_BINDINGS_REGULATOR_SYR82X_H
> +
> +/*
> + * Constants to specify regulator modes in device tree for SYR82X regula=
tors
> + * SYR82X_REGULATOR_MODE_FORCE_PWM:	Force fixed PWM mode
> + * SYR82X_REGULATOR_MODE_AUTO:		Allow auto-PFM mode during light load
> + */
> +
> +#define SYR82X_REGULATOR_MODE_FORCE_PWM	1
> +#define SYR82X_REGULATOR_MODE_AUTO	2

[Severity: Medium]
Will these constants actually be parsed by the regulator core?

Looking at the driver handling the SYR82x regulators, it appears to lack the
.of_map_mode callback:

drivers/regulator/fan53555.c:fan53555_regulator_register() {
	...
	rdesc->enable_time =3D di->enable_time;
	rdesc->owner =3D THIS_MODULE;

	rdev =3D devm_regulator_register(di->dev, &di->desc, config);
	...
}

Without an of_map_mode callback, won't the regulator core fail to translate
these device tree mode constants, leaving the forced PWM mode non-functiona=
l?

[Severity: High]
This is a pre-existing issue, but while reviewing the mode support for this
hardware I noticed that fan53555_set_mode() might be corrupting registers:

drivers/regulator/fan53555.c:fan53555_set_mode() {
	...
	case REGULATOR_MODE_NORMAL:
		regmap_update_bits(rdev->regmap, di->vol_reg, di->mode_mask, 0);
		break;
	...
}

Does this incorrectly clear the mode mask on di->vol_reg instead of
di->mode_reg?

For variants like FAN53526_VENDOR_TCS where these point to different
registers, could this drop the voltage or disable the regulator entirely
when changing to normal mode?

> +
> +#endif

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715155141.1286=
01-1-victor.krawiec@arturia.com?part=3D1
