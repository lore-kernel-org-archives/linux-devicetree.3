Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E77542A799
	for <devicetree@vger.kernel.org>; Fri, 17 Jul 2026 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299715; cv=none; b=uanSGRUtFSmJjajVOqnjFeD7vRTzthG6pPiSiWtpqtpZL+V/O81BVGNbBkSXAJVIZ7pN2SYuowri5YCjBT1RnUWEcnQAhJgkST4OZ/nOw2T56g7rznYa5NzycxZ61BLMWYpe9AYMDZxJPXmOgqf7zpAFJYDmKfLLPas9bEp7YF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299715; c=relaxed/simple;
	bh=wrafFrcFTm9QBboMoHdw8QAlB2tphvgd/n4sYy/VyQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E0c0ZYHAc6svkBEYBZtQpBtTLA0INyrJycwuY4C2WgmDt0VFZ4ufoPoAnaNJubozt9oC2ZVfGrfqFe1YVbf3pgYfRGOPVFqCjCnR5sfXjOhSTfR25cRnOeewEVyVGzTNWtHG80ZsQN+eT5usPZgguijqgtRWL5YucQND3X2kszI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lXUBh58j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lXUBh58j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D7F1F000E9;
	Fri, 17 Jul 2026 14:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784299711;
	bh=f87nexVRLrY34HkaH2mMkucfUGzuzxHzpGAkatkRLEk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lXUBh58jGMmUvF9OvvEvWOinrptCDHllqJluNaGeb1UoXryZMRz6j3JsFvnYxjMvF
	 TsE0a8FLa7Foj5FN58vfLZbacJRBXfeaBHIfUcW9azEzWJhXqwSIl0fnaqmkAOzn0C
	 /zJqmgH2pU/K/s3zldf4T6Xmenksyp3IIhwH18fxA2PAwHbKbLuJFEI51WgbOLwEsC
	 q++T2py1hufWw1NZH0cQaccTDxFpItIUEes4M06a+Kdow+ER+ttn5Rs84wGly0uI6h
	 SlrhQIn17eEuXenIkiGpdlDJRrbBqzHUBJfMmYOUEQck7VLjcu2cPZSA0BSYD6QNCs
	 1J+JoLARGk/9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/5] mfd: axp20x: Add support for AXP318W PMIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260717-axp318-regulator-v4-2-50aff97084dd@baylibre.com>
References: <20260717-axp318-regulator-v4-0-50aff97084dd@baylibre.com>
 <20260717-axp318-regulator-v4-2-50aff97084dd@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 17 Jul 2026 14:48:31 +0000
Message-Id: <20260717144831.83D7F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The system power-off handler `axp20x_power_off()` is missing a swi=
tch case for `AXP318_ID`, causing it to write the power-off command to a re=
gulator control register.
- [Medium] The newly added `axp318_cells` array uses a hardcoded cell ID in=
stead of `PLATFORM_DEVID_AUTO`, violating MFD subsystem guidelines.
--

--- Patch [2]: [PATCH v4 2/5] mfd: axp20x: Add support for AXP318W PMIC ---
commit ffbc50262db7d7fef4ebd802fb44cd11951bf0bc
Author: Andre Przywara <andre.przywara@arm.com>

mfd: axp20x: Add support for AXP318W PMIC

This commit adds MFD core support for the X-Powers AXP318W PMIC. It defines
the regmap configurations, IRQs, and child device cells for the regulator.

> diff --git a/drivers/mfd/axp20x.c b/drivers/mfd/axp20x.c
> index 679364189ea58..c8aeebd01bbcd 100644
> --- a/drivers/mfd/axp20x.c
> +++ b/drivers/mfd/axp20x.c
[ ... ]
> @@ -1061,6 +1129,10 @@ static struct mfd_cell axp313a_cells[] =3D {
>  	MFD_CELL_RES("axp313a-pek", axp313a_pek_resources),
>  };
> =20
> +static const struct mfd_cell axp318_cells[] =3D {
> +	MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),

[Severity: Medium]
Does this hardcoded cell ID of 1 violate the MFD subsystem guidelines?

If multiple AXP devices with hardcoded IDs of 1 (such as the AXP313a and
AXP318W) are instantiated on the same system, could they both attempt to
register a platform device named axp20x-regulator.1, resulting in a fatal
-EEXIST failure?

Should this use PLATFORM_DEVID_AUTO instead?

> +};
> +
>  static struct mfd_cell axp717_cells[] =3D {
>  	MFD_CELL_NAME("axp20x-regulator"),
[ ... ]
> @@ -1313,6 +1385,12 @@ int axp20x_match_device(struct axp20x_dev *axp20x)
>  		axp20x->regmap_cfg =3D &axp313a_regmap_config;
>  		axp20x->regmap_irq_chip =3D &axp313a_regmap_irq_chip;
>  		break;
> +	case AXP318_ID:
> +		axp20x->nr_cells =3D ARRAY_SIZE(axp318_cells);
> +		axp20x->cells =3D axp318_cells;
> +		axp20x->regmap_cfg =3D &axp318_regmap_config;
> +		axp20x->regmap_irq_chip =3D &axp318_regmap_irq_chip;
> +		break;

[Severity: High]
Is AXP318_ID missing from the switch statement in axp20x_power_off()?

When the system attempts to power off, axp20x_power_off() is called. If
AXP318_ID is not handled in the switch statement there, will it fall through
to the default case and select AXP20X_OFF_CTRL (0x32) instead of the correct
AXP318_SHUTDOWN_CTRL (0x52)?

Could this failure to shut down the PMIC corrupt the state of the CLDO4
regulator by writing the power-off command to AXP318_CLDO4_CONTROL (which
is also 0x32)?

>  	case AXP323_ID:
>  		axp20x->nr_cells =3D ARRAY_SIZE(axp313a_cells);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-axp318-reg=
ulator-v4-0-50aff97084dd@baylibre.com?part=3D2
