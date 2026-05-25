Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78F13E558E
	for <devicetree@vger.kernel.org>; Mon, 25 May 2026 09:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779700012; cv=none; b=HGK387vUcRS85vO3+fb/FZkjKslNPMdnxAJ3OUVrM8hAEcn4cOTAg89MTyK7BQX3JqMPv9T4fhz3EPamiSYbLgqkX4Xa7DZq+BVRk//nwIfNJBSZmfuWb8rxtrSb+o/pboYXrzKflUiQ4zL3kqCu913iayVTnk/It9ze9+f7tTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779700012; c=relaxed/simple;
	bh=0NbCr9ayqXyVbPcpj2JAYOhekLerj8YrpBPIkEgQzYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jKgLw9IAZUUMLDjrRNWTSkkCuoyMTj0HhSFLCA9XUW5vuYRFP0+E4hpThJmmte3SlQoC9q8SdSvM8sDgUskg9hRaLxGNLpkV2ExOOk5FjJIr4Uud9qjEG6HkKmqXDVxetaGfQ8VgppDR5xdLTlIt6hrOM9Ca0B/zrJkbGshXRxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnHtIyRj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnHtIyRj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DA4B1F000E9;
	Mon, 25 May 2026 09:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779700010;
	bh=swdWm/0iTnVS2k9BLL7JZNN87vf5uKigIcWeJkFhvfU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnHtIyRjdwpHiDKPAGF8OaoEK5y0DeoZMbmjdkNRHYZRvQ0Filzbjj43Brp3DOUTM
	 f1Qu8X/DLuYiKWc/fQRPEuv6+3CdORYicqk0qqd7i5R3BAofWcI2e1mt1Esvq4Qaq3
	 Cv6O46FpWkuqcDvk+GUxIMsYsHgaY3LVJWRBzoUzxQoOkAJowtOXcvSN/d4ZnJcs5k
	 d8AQ9/7TCOw++rt+kgR/0m+ihf0XBtaLF38GVVMp4NAMy25qyceexwLbKlL0jo0Nu+
	 KitbOv2zIW4sMOqmeot0Vpsh2bJjogUsMxvvoi0Cg4zkVeyeiU/rHgli34vvGaDy8n
	 5+mllF607GTTw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/9] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lakshay Piplani" <lakshay.piplani@nxp.com>
Cc: conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260525064209.2263045-7-lakshay.piplani@nxp.com>
References: <20260525064209.2263045-7-lakshay.piplani@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 09:06:49 +0000
Message-Id: <20260525090650.3DA4B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Race condition in hardware unlock/lock sequence across regulators
- [Medium] Silent hardware state mismatch due to unhandled errors in lock g=
uard
- [Medium] Missing MODULE_ALIAS prevents automatic module loading
- [Low] Incorrect use of of_match_ptr() on string literals
--

commit 4a0c2a87632650e322585272d36928a08ab2888d
Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>

regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c hub

This commit adds a platform driver for the on-die voltage regulators of the
NXP P3H2x4x multi-function I3C Hub device, registering them through the
regulator framework via MFD.

[ ... ]

> diff --git a/drivers/regulator/p3h2840_i3c_hub_regulator.c b/drivers/regu=
lator/p3h2840_i3c_hub_regulator.c
> new file mode 100644
> index 0000000000000..4f2514d4d928e
> --- /dev/null
> +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c

[ ... ]

> +static void p3h2x4x_reg_guard_enter(struct regulator_dev *rdev,
> +				    struct p3h2x4x_reg_state *state)
> +{
> +	state->restore =3D false;
> +
> +	if (regmap_read(rdev->regmap,
> +			P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			&state->orig))
> +		return;
> +
> +	if (state->orig !=3D P3H2X4X_REGISTERS_UNLOCK_CODE) {
> +		regmap_write(rdev->regmap,
> +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			     P3H2X4X_REGISTERS_UNLOCK_CODE);

[Severity: Medium]
Does this silently ignore hardware I/O errors?

If the I3C/I2C write to unlock the hardware fails, the hardware remains
locked. Because guard constructors cannot propagate errors, the caller will
proceed to modify the regulator configuration. The regmap_update_bits() call
will succeed in software but fail in hardware, causing the kernel's tracking
of the regulator's state to diverge from the physical hardware.

> +		state->restore =3D true;
> +	}
> +}
> +
> +static void p3h2x4x_reg_guard_exit(struct regulator_dev *rdev,
> +				   struct p3h2x4x_reg_state *state)
> +{
> +	if (state->restore)
> +		regmap_write(rdev->regmap,
> +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> +			     state->orig);
> +}
> +
> +DEFINE_LOCK_GUARD_1(p3h2x4x_reg, struct regulator_dev,
> +		    p3h2x4x_reg_guard_enter(_T->lock, &_T->state),
> +		    p3h2x4x_reg_guard_exit(_T->lock, &_T->state),
> +		    struct p3h2x4x_reg_state state);

[Severity: High]
Can this cause a race condition between different regulators on the same ch=
ip?

The p3h2x4x_reg guard is instantiated per-regulator, and the regulator
subsystem only holds a per-regulator lock. If Thread A unlocks the hardware
for ldo-cp0, and Thread B concurrently reads the protection register for
ldo-cp1, Thread B may observe the hardware as already unlocked and skip its
own unlock/restore sequence.

When Thread A completes, it relocks the device. Thread B's subsequent
register update will then be written to a locked hardware state, causing
the write to be discarded and leading to silent state mismatch. Should a
shared lock from the MFD parent be used to ensure atomicity?

> +
> +static int p3h2x4x_regulator_enable(struct regulator_dev *rdev)
> +{
> +	guard(p3h2x4x_reg)(rdev);
> +	return regulator_enable_regmap(rdev);
> +}

[ ... ]

> +static struct regulator_desc p3h2x4x_regulators[] =3D {
> +	{
> +		.name =3D "ldo-cp0",
> +		.of_match =3D of_match_ptr("ldo-cp0"),
> +		.regulators_node =3D of_match_ptr("regulators"),

[Severity: Low]
Is it safe to use of_match_ptr() on string literals here?

On non-OF builds, of_match_ptr() evaluates to NULL. This breaks regulator
matching for systems that use non-OF firmware interfaces (like ACPI PRP0001
or swnodes) which still rely on these strings to be present. Applying it
to string literals doesn't save any memory since the strings are already
compiled in for the name field.

> +		.volt_table =3D p3h2x4x_voltage_table,
> +		.n_voltages =3D ARRAY_SIZE(p3h2x4x_voltage_table),
> +		.ops =3D &p3h2x4x_ldo_ops,

[ ... ]

> +static struct platform_driver p3h2x4x_regulator_driver =3D {
> +	.driver =3D {
> +		.name =3D "p3h2x4x-regulator",
> +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> +	},
> +	.probe =3D p3h2x4x_regulator_probe,
> +};
> +module_platform_driver(p3h2x4x_regulator_driver);
> +
> +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB Regulator driver");
> +MODULE_LICENSE("GPL");

[Severity: Medium]
Does this prevent automatic module loading?

The driver registers as an MFD child device using a platform driver named
"p3h2x4x-regulator". Because it relies on the platform bus matching by name
and does not provide an id_table or of_match_table, the MFD core will emit
a uevent with MODALIAS=3Dplatform:p3h2x4x-regulator. Without a corresponding
MODULE_ALIAS declaration, udev cannot map the uevent to the kernel module.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525064209.2263=
045-1-lakshay.piplani@nxp.com?part=3D6
