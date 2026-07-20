Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8CC3F8223
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 11:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784547661; cv=none; b=Osv0uk2ZrO7SMzbxrFYw/MsRZoLEmwBURhfa49HDGranGkuIZQjoZXJLKGDSo+HguULTdfz+qcfExYWubpc5Qlb0V88dStpZznsa6sSOYUG/wKqV5hMYfpKVv7YASmuPsKZbI6xxx46fst8yHWdKdk0JwGfh9LE7rksUrVkosME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784547661; c=relaxed/simple;
	bh=WIsExSunSU5HpQ+t/i2zPWF/diMGNOUgEX9IwvBoV44=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FPZ++RHA87Ze3B3HBGLoUclZsW9p+pVvkYLMsPR5w2HI9NP1fetKLLAbcAXPb6FgX/N/bk3FzeobWggNEwu78HItvw/6Wry263sHjMg/PHkyPrAYws/1umM4xXd+K3aole0UH7nJ+fGcmSJ0z8v6nK+2NX/+YdGs3M+UVzT654M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bFKkYoly; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bFKkYoly"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4929E1F00A3A;
	Mon, 20 Jul 2026 11:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784547659;
	bh=z3HO+KooX10b9GMJI/eG63mFen4CM8ySUsfhMBKAVho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bFKkYolyUOw6HtzOxyEY4LAHSigJZ7Zaj/5Aj639HUSwmL1jCCmVrfJXE2s5UkwBK
	 8EyBMBCT9z4SDCQhNL/Emx7jeS0e2PQAc8uGn7zUseuPtXK1DqSuIQGkXt1wC2F8jN
	 vy2cyGGJ2xheV/W0rlNXdA+CLa+qIt/sbiI1yu4+ZNhuvjFO/ePL6d1oeDQl9kzxeo
	 AxwJsVxtBc0H2VRMN6vr3iqlDkQL5DoE2FFrs/5xSSuxJgF8U0OG4SiUEKZjODBTeO
	 w3nDV8fUDiJdC2cGmUIyZhBZBkASnN4ufmdGUiOaL1asPJg/Ot2luiH9CXGKiblkwz
	 KQoXel54LUFLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: mfd: x-powers,axp152: Document
 AXP318W
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260720-axp318-regulator-v5-3-a1afa7ee24f9@baylibre.com>
References: <20260720-axp318-regulator-v5-0-a1afa7ee24f9@baylibre.com>
 <20260720-axp318-regulator-v5-3-a1afa7ee24f9@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 11:40:58 +0000
Message-Id: <20260720114059.4929E1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The driver statically assigns hard-coded `.id` values inside its `=
mfd_cell` arrays and bypasses automatic ID allocation by passing `PLATFORM_=
DEVID_NONE` to `mfd_add_devices()`, violating the MFD subsystem guidelines.
--

--- Patch [3]: [PATCH v5 3/5] dt-bindings: mfd: x-powers,axp152: Document A=
XP318W ---
commit 0c5a5d45e78382d3cb52bdfeed22ad1c54a031fd
Author: Andre Przywara <andre.przywara@arm.com>

dt-bindings: mfd: x-powers,axp152: Document AXP318W

The X-Powers AXP318W is a PMIC used on some newer Allwinner devices.
Among a large number of both DCDC and LDO regulators it features the usual
ADC/IRQ/power key parts. Like other recent PMICs, it lacks the DC/DC conver=
ter
PWM frequency control register, that rate is fixed here.

> diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b=
/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> index 45f015d63df16..38556c32417b3 100644
> --- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
> +++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml

[ ... ]

> @@ -277,7 +303,7 @@ properties:
>            Defines the work frequency of DC-DC in kHz.
> =20
>      patternProperties:
> -      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)=
ldo|cpusldo|drivevbus|dc5ldo|boost)$":
> +      "^(([a-f])?ldo[0-9]|dcdc[0-9a-e]|ldo(_|-)io(0|1)|(dc1)?sw|swout[1-=
2]|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
>          $ref: /schemas/regulator/regulator.yaml#
>          type: object
>          unevaluatedProperties: false

[Severity: High]
This is a pre-existing issue, but while reviewing these changes, I noticed
a potential problem with how the driver handles cell IDs in
drivers/mfd/axp20x.c.

The mfd_cell array explicitly hardcodes the subdevice cell ID to 1:

drivers/mfd/axp20x.c:axp313a_cells[] {
    ...
    MFD_CELL_BASIC("axp20x-regulator", NULL, NULL, 0, 1),
    ...
}

The driver then forces the platform bus to consume these hard-coded cell IDs
rather than generating safe dynamic IDs:

drivers/mfd/axp20x.c:axp20x_device_probe() {
    ...
    ret =3D mfd_add_devices(axp20x->dev, PLATFORM_DEVID_NONE, axp20x->cells,
                          axp20x->nr_cells, NULL, 0, NULL);
    ...
}

Could this lead to device naming collisions in sysfs and driver load failur=
es
if multiple MFD instances of the same type are instantiated?

If multiple PMICs sharing the same cell definitions are present, they might
attempt to register subdevices with the same hardcoded name and ID.

This would result in a fatal probe failure for the colliding subdevices.

Should this code use PLATFORM_DEVID_AUTO instead of PLATFORM_DEVID_NONE to
ensure automatic cell indexing?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720-axp318-reg=
ulator-v5-0-a1afa7ee24f9@baylibre.com?part=3D3
