Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E111DF74F
	for <devicetree@vger.kernel.org>; Thu, 18 Jun 2026 22:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781823362; cv=none; b=cTzRab16TXHkRX62EBg4NqjbWkiOqK7cYUPtuvyQhfvBGP/irmamlzg0O9VJ5pzpS9smVhcI5ZQ1/Dngg5bukZxq60OCyrxsR/qz3gxrnVnxgO/ePxIG2tkQXn9VLEHMbNPumkkmgVBrnvYVWPVWHnsoOOXEwZ++Cqi7C6q/vsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781823362; c=relaxed/simple;
	bh=6gkZ1I8xNdk9iceT5byejwOM6484oH1ttQ5Gt7nxL+Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=khsaVmMVHDQPsFM9NVX2IKORhnb4efE+8c2PcQJOEY78BalxbVJHmbs1E88HWGnQmFcjF1HZ0dbYz5OAD8TNFXI7Zuh4Ds6zeeDrDWkt/ak6DUJDlv1M5+6hDc/N9QasJqJNVeJgVXYT3PCCv3wfqC+zMNPjtc9/a1KqFxQBmX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3Ztkemn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3Ztkemn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F407F1F000E9;
	Thu, 18 Jun 2026 22:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781823361;
	bh=NBne0h5nzSTokm+9qSA9iWn4Y4FDs1jVA5qkFLsgb0A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=k3Ztkemnsz7EXvywzr1XZIzCyOX87DyMX2NQ2kMmucj5oO7XGY3yil0AEaKfqurks
	 +SfVMGSf2oZ5QlgjsSrmRajkgPaAJ6RcmyeW+yYJCjndRuVPVRBYq0LqzfAg9znLw9
	 /rv9jiJHTwEBDqXqBoJd/Bu9tCHCHkRww1tGLsC6giI6VsIDI1y1gZz8HqtJuwVvND
	 n7vQPj+I5aycIPZCPbO+y2FdsIPWjvRut+hhc03rfxUysOG4k+mRpCJhAKKmDf19iH
	 3eLIyH5Qg3MZwZikjjw7FtQtCkYXIBeSVbK9AxdGKoU6Qhf+UclLStFz8SqBPgC/mV
	 PfjDSLeoaAAog==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] leds: ltc3208: Add driver for LTC3208
 Multidisplay LED Driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Jan Carlo Roleda" <jancarlo.roleda@analog.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260619-upstream-ltc3208-v5-2-075d18060606@analog.com>
References: <20260619-upstream-ltc3208-v5-0-075d18060606@analog.com>
 <20260619-upstream-ltc3208-v5-2-075d18060606@analog.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 22:56:00 +0000
Message-Id: <20260618225600.F407F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Duplicate `reg` property values in the device tree cause global `l=
eds_list` corruption due to registering the exact same `led_classdev` objec=
t multiple times.
- [Medium] The `aux_channels` stack array can be left uninitialized if devi=
ce tree properties fail to match due to errors other than `-EINVAL` (e.g., =
`-ENOENT` or `-ENODATA`), leading to uninitialized memory being used to con=
figure the register.
- [Medium] Falsely successful probe and premature loop abortion when an inv=
alid LED ID is encountered because `ret` is strictly 0.
--

commit b568fbfe98ac0a2fda2a035cd233d75353b8718c
Author: Jan Carlo Roleda <jancarlo.roleda@analog.com>
Subject: leds: ltc3208: Add driver for LTC3208 Multidisplay LED Driver

Kernel driver implementation for LTC3208 Multidisplay LED Driver.
The LTC3208 is a Multi-display LED driver, designed to control up to
7 distinct LED channels.

> diff --git a/drivers/leds/leds-ltc3208.c b/drivers/leds/leds-ltc3208.c
> new file mode 100644
> index 0000000000000..fa2b6c6acc713
> --- /dev/null
> +++ b/drivers/leds/leds-ltc3208.c

[ ... ]

> +	/* Initialize aux channel configurations */
> +	for (int i =3D 0; i < LTC3208_NUM_AUX_LEDS; i++) {
> +		ret =3D device_property_match_property_string(
> +			&client->dev, ltc3208_dt_aux_channels[i],
> +			ltc3208_aux_opt, LTC3208_NUM_AUX_OPT);
> +		/* Fallback to default value (AUX) if not found */
> +		if (ret =3D=3D -EINVAL)
> +			aux_channels[i] =3D LTC3208_AUX_CHAN_AUX;
> +		else if (ret >=3D 0)
> +			aux_channels[i] =3D ret;
> +	}
> +
> +	reg_val =3D FIELD_PREP(LTC3208_AUX1_MASK, aux_channels[0]) |
> +		  FIELD_PREP(LTC3208_AUX2_MASK, aux_channels[1]) |
> +		  FIELD_PREP(LTC3208_AUX3_MASK, aux_channels[2]) |
> +		  FIELD_PREP(LTC3208_AUX4_MASK, aux_channels[3]);

[Severity: Medium]
What happens to aux_channels[i] if device_property_match_property_string()
returns an error code other than -EINVAL, such as -ENODATA?

It appears aux_channels[i] would remain uninitialized on the stack, and
this uninitialized memory would then be passed to FIELD_PREP() and
written to the LTC3208_REG_E_AUX_SELECT register.

Would it be safer to have a default catch-all else branch, or to fully
initialize the aux_channels array when it is declared?

[ ... ]

> +	device_for_each_child_node_scoped(&client->dev, child) {
> +		struct ltc3208_led *led;
> +		struct led_init_data init_data =3D {};
> +		u32 chan;
> +
> +		ret =3D fwnode_property_read_u32(child, "reg", &chan);
> +		if (ret)
> +			return dev_err_probe(&client->dev, ret,
> +					    "Failed to get reg value of LED\n");
> +		else if (chan >=3D LTC3208_NUM_LED_GRPS)
> +			return dev_err_probe(&client->dev, ret,
> +					     "%d is an invalid LED ID\n", chan);

[Severity: Medium]
Does this return a success code of 0 instead of an error?

Because the preceding fwnode_property_read_u32() call succeeded, ret is
exactly 0 in this else if branch.

Calling dev_err_probe() with a 0 return code will cause the probe function
to abort iterating through the children but return a success status to the
driver core, masking the probe failure.

Should this return an explicit error like -EINVAL instead?

> +
> +		led =3D &ddata->leds[chan];
> +
> +		led->rfield =3D
> +			devm_regmap_field_alloc(&client->dev, ddata->regmap,
> +						ltc3208_led_reg_field[chan]);

[ ... ]

> +		ret =3D devm_led_classdev_register_ext(&client->dev, &led->cdev,
> +						     &init_data);

[Severity: High]
Can duplicate reg properties in the device tree corrupt the led_classdev
list?

If a malformed device tree provides multiple children with the same reg
value, the driver will reuse the exact same struct ltc3208_led object
from the ddata->leds array without checking if it is already in use.

Calling devm_led_classdev_register_ext() multiple times with the identical
&led->cdev pointer would cause the LED core to add the same node to the
global leds_list twice, corrupting the doubly-linked list.

Could we add a check to verify if the channel has already been populated
before proceeding with registration?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260619-upstream-l=
tc3208-v5-0-075d18060606@analog.com?part=3D2
