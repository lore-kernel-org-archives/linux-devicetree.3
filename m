Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E825396D29
	for <devicetree@vger.kernel.org>; Mon, 20 Jul 2026 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784542355; cv=none; b=n3TWvZ4phai4hZzNG2nfif2A6fY/W/0EN8HPxhvzU6xkYJNmLEgTXkAbW72/z+Ch2VP1figTMKEfmr+VS07FvmlLxPgnIaYYQ7WpNnZtZuFqz4uiaOHV/libPujUl6mSX7muBfr4VfNdWojpS7JaGLCugxui+7XFIqNqdDFD0/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784542355; c=relaxed/simple;
	bh=C01pmmIoV5PzimnP3eNzWL4f2vFLkmaLPz+hYbsGIVY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lsb1Lzyu2ehG8qGGjxLBjBSTF3KRvT0sxHfX5F/oo4/As8EV3uBsntguYvNrMOpeXUMHqO1tX7JAkIQA91K0c9U+96m8scSnSeU+O0JY3inicN13YLMh8alqWVaDfREI9GsFHl0nBfysT/6wsMlk3vm6/D8hMfLQBAgt2FmEmRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jv3lJ8hQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jv3lJ8hQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C8311F00A3D;
	Mon, 20 Jul 2026 10:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784542344;
	bh=o85wTzPx0cyE5RGqeI1iEDg/0aFxCZ726KDCbS6DoYw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jv3lJ8hQR0FPQLxueS3uHY/TlMMxBV38IfkRT7nHlkzcGABWPOopnHZREZJr9F+L1
	 we6afyeGGlX9/vMAwiadN33mCYUNy3PeRLH8l4T2xiQpDz6zw9HZLFobbBD+BQ6lle
	 mfAFAxrGkj3/TCAh0IE/UVFkJPCVH3k//WeAxlYL55hRD7F+Y3/LWxHdCmBxrXTeXL
	 SxMtTSHzkPH+SUqoraQ9/kNy7Rr/ceKGJlcvP0rWwcITkrJe+L6JB18K7GyKZRXoBK
	 SwJsDcKkocaNrS3hcuQXRTaN3bg8rAXQSC6fL8GqKr3QyC4VNCV0ljZrFzWdDCrRGP
	 VYCvoCrrTR2EA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/4] regulator: dt-bindings: Add fan53555 allowed
 modes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Victor Krawiec" <victor.krawiec@arturia.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260720100336.62004-2-victor.krawiec@arturia.com>
References: <20260720100336.62004-1-victor.krawiec@arturia.com>
 <20260720100336.62004-2-victor.krawiec@arturia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 10:12:23 +0000
Message-Id: <20260720101224.9C8311F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [High] The regulator driver lacks the `.of_map_mode` callback required to=
 parse the newly added `regulator-initial-mode` device tree property.
- [High] The patch is missing the board and script modifications explicitly=
 listed in the commit message, and includes raw `git status` output.
- [Medium] The schema fails to constrain the `regulator-allowed-modes` prop=
erty despite the commit explicitly claiming to add allowed modes.

Pre-existing issues:
- [High] The driver's `fan53555_set_mode()` function accidentally writes to=
 the voltage register (`vol_reg`) instead of the mode register (`mode_reg`)=
 when switching to `REGULATOR_MODE_NORMAL`.
--

--- Patch [1]: [PATCH v2 1/4] regulator: dt-bindings: Add fan53555 allowed =
modes ---
commit 6198556f842d1d3f4521256414c33ff637d763cb
Author: Victor Krawiec <victor.krawiec@arturia.com>

regulator: dt-bindings: Add fan53555 allowed modes

This commit adds device tree binding definitions for the FAN53555 regulator=
's
operational modes (Auto-PFM and Forced PWM). It introduces a new header file
with mode constants and updates the YAML schema to allow specifying an init=
ial
mode.

>     Documentation/devicetree/bindings/regulator/fcs,fan53555.yaml # new f=
ile:
>     include/dt-bindings/regulator/fcs,fan53555-regulator.h #
>     arch/arm64/boot/dts/rockchip/rk3399-drumfreak.dts #
>     arch/arm64/boot/simple-boot.img #       arch/arm64/boot/simple-kernel=
.img #
>     arch/arm64/configs/drumfreak_defconfig #
>     scripts/arturia_simple_boot_image.sh #

[Severity: High]
Are these files intentionally missing from the diff? The commit message lis=
ts
several board and script files, as well as driver implementation details, b=
ut
they are not included in the patch. It looks like accidental output from git
status was included in the commit message, and the patch submission might be
incomplete.

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

[Severity: Medium]
The commit message mentions adding allowed modes, but the schema only const=
rains
regulator-initial-mode. Should regulator-allowed-modes also be added to the
schema with constraints?=20

Without it, dt_binding_check will permit any values for regulator-allowed-m=
odes
since it falls back to the generic uint32-array schema.

> +    description:
> +      Defined in include/dt-bindings/regulator/fcs,fan53555-regulator.h

[ ... ]

While reviewing the proposed bindings, I noticed a couple of issues in the
corresponding driver implementation in drivers/regulator/fan53555.c.

drivers/regulator/fan53555.c:fan53555_regulator_register() {
        ...
        rdesc->ops =3D &fan53555_regulator_ops;
        rdesc->type =3D REGULATOR_VOLTAGE;
        ...
}

[Severity: High]
Does the driver need an .of_map_mode callback assigned to the regulator_des=
c?

Without this callback, the regulator core cannot parse regulator-initial-mo=
de
during probe, and will silently ignore the property with a warning.

This is a pre-existing issue, but while reviewing the mode switching logic
that these bindings interact with:

drivers/regulator/fan53555.c:fan53555_set_mode() {
        ...
        case REGULATOR_MODE_NORMAL:
                regmap_update_bits(rdev->regmap, di->vol_reg, di->mode_mask=
, 0);
                break;
        ...
}

[Severity: High]
Does this mistakenly write to di->vol_reg instead of di->mode_reg?

On variants like the TCS4525 where di->mode_mask is BIT(7) or BIT(6), clear=
ing
this bit in the voltage register clears VSEL_BUCK_EN. This would unexpected=
ly
turn off the regulator instead of changing its mode.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720100336.6200=
4-1-victor.krawiec@arturia.com?part=3D1
